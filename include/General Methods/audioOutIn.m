function [Outs,Ins] = audioOutIn(app,SignalOut,OutCh,InCh,Calibration)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Refresh hardware
audiodevreset;

% Hardware
Device = app.Device;
SamplesPerFrame = app.SamplesPerFrame;
SampleRate = app.SampleRate;
BitDepth = app.BitDepth;
inputsChannels = InCh;
outputsChannels = OutCh;

% Signal
signal = SignalOut;

% Info audio status
app.ExtUI.InfoAudioError.Text = '';
app.ExtUI.InfoAudioErrorLabel.Text = '';
app.ExtUI.InfoAudioError.BackgroundColor = 'none';
app.ExtUI.InfoAudioErrorLabel.BackgroundColor = 'none';
app.ExtUI.InfoAudioError.FontColor = [0 0 0];
app.ExtUI.InfoAudioErrorLabel.FontColor = [0 0 0];
drawnow

% =============================================================================================
% Try audio out/in 5 times before stop/return error
for retry = 1:6

    % ===============================================
    try
        
        % Buffers to read and write blocks (frames) of input and output samples,
        % respectively
        toOutBuffer = dsp.AsyncBuffer(length(signal));
        toInBuffer = dsp.AsyncBuffer(length(signal));
        write(toOutBuffer,signal);
        
        % Sound card interface for synchronous playback and recording
        aPR = audioPlayerRecorder('Device',Device,...
            'SampleRate',SampleRate,...
            'BitDepth',BitDepth,...
            'PlayerChannelMapping',outputsChannels,...
            'RecorderChannelMapping',inputsChannels);
        
        % Streaming playback and acquisition
        % Loop ensures internal queues are never saturated
        nUnderruns = 0;
        nOverruns = 0;
        while toOutBuffer.NumUnreadSamples >= SamplesPerFrame
            % Get a block of input samples
            frameOut = read(toOutBuffer,SamplesPerFrame);
            
            % Playback and record
            [frameIn,nUnderrunsaux,nOverrunsaux] = aPR(frameOut);
            
            % Store a block of output samples
            write(toInBuffer,frameIn);
            
            % Check no blocks were dropped in either direction
            if nUnderrunsaux > 0
                nUnderruns = nUnderruns + nUnderrunsaux;
            end
            if nOverrunsaux > 0
                nOverruns = nOverruns + nOverrunsaux;
            end
        end
        release(aPR)
        reset(aPR)
        
        % Print dropped samples if occurs
        if nUnderruns > 0 || nOverruns > 0
            app.ExtUI.InfoAudioErrorLabel.Text = 'DROPPED SAMPLES:';
            if nUnderruns > 0
                app.ExtUI.InfoAudioError.Text = sprintf('Underrun: %d', nUnderruns);
            elseif nOverruns > 0
                app.ExtUI.InfoAudioError.Text = sprintf('Overrun: %d', nOverruns);
            else
                app.ExtUI.InfoAudioError.Text = sprintf('[Underrun: %d | Overrun: %d]',nUnderruns,nOverruns);
            end
            app.ExtUI.InfoAudioErrorLabel.FontColor = [1 0 0];
            app.ExtUI.InfoAudioError.FontColor = [1 0 0];
        else
            app.ExtUI.InfoAudioErrorLabel.Text = '';
            app.ExtUI.InfoAudioError.Text = '';
            app.ExtUI.InfoAudioErrorLabel.FontColor = [0 0 0];
            app.ExtUI.InfoAudioError.FontColor = [0 0 0];
        end
        
        % Re-align full input and output sequences
        Ins = read(toInBuffer,toInBuffer.NumUnreadSamples);
        Outs = signal(1:size(Ins,1),:);
        
        % Calibrate input signal if exist calibration and if selected
        if Calibration
            for ii = 1:length(InCh)
                channel = InCh(ii);
                if app.SensitivityIsMeasured(channel)
                    Ins(:,ii) = Ins(:,ii) ./  app.Sensitivity(channel);
                end
            end
            % Correct latency only if it has been measured
            if app.LatencyIsMeasured
                samples = floor(app.Latency*app.SampleRate);
                for ii = 1:size(Ins,2)
                    Ins(:,ii) = [Ins(samples+1:end,ii);zeros(samples,1)];
                end
            end
        end
       break; % Done, exit retry loop 
       
       % ===============================================
    catch ME

        if retry == 6 % Max attempts reached
            app.ExtUI.InfoAudioErrorLabel.Text = 'AUDIO ERROR:';
            
            if strcmp(ME.identifier,'MATLAB:set:RecorderChannelMapping:expectedVector') || ...
                    strcmp(ME.identifier,'MATLAB:set:RecorderChannelMapping:expectedNonempty')
                app.ExtUI.InfoAudioError.Text = 'Select input channel.';
                
            elseif strcmp(ME.identifier,'MATLAB:set:Capacity:expectedPositive')
                app.ExtUI.InfoAudioError.Text = 'The signal must not be empty.';
                
            elseif strcmp(ME.identifier,'dsp:system:nonUniqueEntriesChannelMap')
                app.ExtUI.InfoAudioError.Text = 'Channels must be unique.';
                
            elseif strcmp(ME.identifier,'MATLAB:system:StringSet:InvalidValue')
                app.ExtUI.InfoAudioError.Text = 'Audio device is not available.'; % Max message length
                
            elseif strcmp(ME.message,'Expected SampleRate to be positive.')
                app.ExtUI.InfoAudioError.Text = 'Increase sample rate.';
                
            elseif strcmp(ME.message,'Expected input to be nonempty.')
                app.ExtUI.InfoAudioError.Text = 'Increase samples per frame.';
            else
                app.ExtUI.InfoAudioError.Text = 'Unexpected error.';
            end
            
            app.ExtUI.InfoAudioError.BackgroundColor = [1 0 0];
            app.ExtUI.InfoAudioError.FontColor = [1 1 1];
            app.ExtUI.InfoAudioErrorLabel.BackgroundColor = [1 0 0];
            app.ExtUI.InfoAudioErrorLabel.FontColor = [1 1 1];
            drawnow
            
            % Error display for stop matlab execution
            ms.identifier = 'AUDIO:error';
            ms.message = [app.ExtUI.InfoAudioErrorLabel.Text,' ',app.ExtUI.InfoAudioError.Text];
            ms.stack.file = [fileparts(mfilename('fullpath')),filesep,'audioOutIn.m'];
            ms.stack.name = 'audioOutIn';
            ms.stack.line = max(0,ME.stack(2).line);
            error(ms);
        else
            app.ExtUI.InfoAudioError.BackgroundColor = [1 0 0];
            app.ExtUI.InfoAudioError.FontColor = [1 1 1];
            app.ExtUI.InfoAudioErrorLabel.BackgroundColor = [1 0 0];
            app.ExtUI.InfoAudioErrorLabel.FontColor = [1 1 1];
            app.ExtUI.InfoAudioErrorLabel.Text = 'AUDIO ERROR:';
            app.ExtUI.InfoAudioError.Text = sprintf('Retrying: %d/5',retry);
            drawnow
        end
        
        % ======================================
        % While max attempts not reached:
        % Delay
        pause(0.5)
        % Refresh hardware
        audiodevreset;
        % Delay
        pause(0.5)
    end
end