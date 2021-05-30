function [signal,time] = signalGenerator(app)
% SIGNAL GENERATOR
%
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

fs = app.SampleRate;
switch lower(app.TypeSignal)
    case 'mls'
        duration = app.SignalParameter.MLS.Dur;
        nseq = app.SignalParameter.MLS.nseq;
        
        rng default % Reset random number generator
        signal = mls(fs*duration+1);
        signal = repmat(signal,nseq,1);
        signal = [signal;zeros(round(fs*duration+1),1)];
        
    case 'sweep'
        duration = app.SignalParameter.Sweep.swDur;
        dur_sil = app.SignalParameter.Sweep.silDur;
        fini= app.SignalParameter.Sweep.init;
        fend = app.SignalParameter.Sweep.end;
        
        rng default % Reset random number generator
        signal = sweeptone(duration,dur_sil,fs,'SweepFrequencyRange',[fini,fend]);
        
    case 'white noise'
        duration = app.SignalParameter.WhiteNoise.Dur;
        
        rng default % Reset random number generator
        signal = randn(round(duration*fs),1);
        
    case 'pink noise'
        duration = app.SignalParameter.PinkNoise.Dur;
        
        rng default % Reset random number generator
        signal = pinknoise(round(duration*fs));
        
    case 'pure tone'
        duration = app.SignalParameter.Tone.Dur;
        freq = app.SignalParameter.Tone.freq;
        
        signal = cos(2*pi*freq*(0:1/fs:duration))';
        
    case 'custom signal'
        try
            signal = load(app.SignalParameter.Custom.Path);
            signal = signal(:,1);
        catch
            try
                signal = readtable(app.SignalParameter.Custom.Path);
                signal = signal{:,1};
            catch
                app.ExtUI.CustomSignalPathLabel.Text = 'ERROR';
            end
        end
        
end

% Normalize to +-0.5
signal = (signal/max(abs(signal)))*0.5;

time = (length(signal)+1)/fs;