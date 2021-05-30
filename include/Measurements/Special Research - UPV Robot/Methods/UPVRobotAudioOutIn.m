function UPVRobotAudioOutIn(app,ii)
% This function is called from 'measureUPVRobot(app)'
% This function performs the measurement and store signal in a text file
%
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% ====================================================
% Channels
OutCh = app.ExtVar.UPVRobot.OutCh;
InCh = app.ExtVar.UPVRobot.InCh;

% ====================================================
% Signal
Signal = app.ExtVar.UPVRobot.Output;

% ====================================================
% Measure
num = app.Averages;
Ins = [];
retry = 0;
while sum(Ins(:)) == 0 && retry <= 5 % To ensure that a signal has been received. Max retries: 5
    
    if retry >= 1 % If retrying
        app.ExtUI.UPVRobotWarningsAndErrors.BackgroundColor = [1 0 0];
        app.ExtUI.UPVRobotWarningsAndErrors.FontColor = [1 1 1];
        app.ExtUI.UPVRobotWarningsAndErrors.Text = sprintf('No signal received. Retrying: %d/5',retry);
        drawnow
        pause(1)
    end
    
    for m=1:num
        [Outs,Ins(:,m)] = audioOutIn(app,Signal,OutCh,InCh,1); %#ok<AGROW>
    end
    Ins = mean(Ins,2);
    
    retry = retry + 1;
end
if sum(Ins(:)) ~= 0 % Reset info message
    app.ExtUI.UPVRobotWarningsAndErrors.Text = 'Without errors.';
    app.ExtUI.UPVRobotWarningsAndErrors.BackgroundColor = 'none';
    app.ExtUI.UPVRobotWarningsAndErrors.FontColor = [0.4667 0.6745 0.1882];
    drawnow
else % Error
    % Stop execution
    app.ExtUI.UPVRobotWarningsAndErrors.Text = {'No signal received. Measure interrupted. ';
        'Click on ''Retry measure'' and then click on ''Resume measure''.'};
    % Button for reconnect
    app.ExtUI.UPVRobotButtonPanelInfo.Text = 'Retry measure';
    app.ExtUI.UPVRobotButtonPanelInfo.Visible = 'on';
    % Other
    app.ExtUI.UPVRobotWarningsAndErrors.BackgroundColor = [1 0 0];
    app.ExtUI.UPVRobotWarningsAndErrors.FontColor = [1 1 1];
    % Disable measure button
    app.ExtUI.StartmeasureButton.Enable = 'off';
    app.ExtUI.UPVRobotRunningPanel.Visible = 'off';
    drawnow
    % Error display for stop matlab execution
    ms.identifier = 'ROBOT:AudioError';
    a = app.ExtUI.UPVRobotWarningsAndErrors.Text;
    ms.message = cat(2,a{1},a{2});
    ms.stack.file = ' ';
    ms.stack.name = '|| ROBOT ||';
    ms.stack.line = 0;
    error(ms);
end

% Max available value
if isfield(app.Sensitivity,sprintf('In%d',InCh))
    eval(sprintf('Val = 1 /  app.Sensitivity.In%d;',InCh)) % 1 / sens
else
    Val = 1;
end

% Index where audio clipping
idxclip = find(round(abs(Ins),20)>=Val); % Find values (rounded with 20 decimals) are equal to max available value
% If there are more than 5% of values equal to max, the signal has clipping
if numel(idxclip) > app.SampleRate*0.05
    app.ExtUI.UPVRobotWarningsAndErrors.Text = 'WARNING: The input signal is clipping.';
    app.ExtUI.UPVRobotWarningsAndErrors.BackgroundColor = 'none';
    app.ExtUI.UPVRobotWarningsAndErrors.FontColor = [0.6,0,0];
    drawnow
    pause(1)
end

% ====================================================
% Signal in
fileID = fopen([app.ExtVar.UPVRobot.FolderPath,filesep,num2str(ii),'.txt'],'wt');
% Save measure to text with precision related with BitDepth
switch app.BitDepth
    case '16-bit integer' % Resolution 2^16 levels
        fprintf(fileID,'%.7f\n',Ins(:)');
    case '24-bit integer' % Resolution 2^24 levels
        fprintf(fileID,'%.10f\n',Ins(:)');
    case '32-bit float' % Resolution 2^32 (-1,1) levels
        fprintf(fileID,'%.12f\n',Ins(:)');
end
fclose(fileID);

% ====================================================
% Store out only one time
if ~isfile([app.ExtVar.UPVRobot.FolderPath,filesep,'Signal_source.txt'])
    fileID = fopen([app.ExtVar.UPVRobot.FolderPath,filesep,'Signal_source.txt'],'wt');
    % Time vector
    t = (0:length(Outs)-1)/app.SampleRate;
    % Save signal to text with precision related with BitDepth
    % The time column takes the maximum possible resolution (fs=192kHz)
    switch app.BitDepth
        case '16-bit integer' % Resolution 2^16 levels
            fprintf(fileID,'%.10f\t%.7f\n',[t(:)';Outs(:)']);
        case '24-bit integer' % Resolution 2^24 levels
            fprintf(fileID,'%.10f\t%.10f\n',[t(:)';Outs(:)']);
        case '32-bit float' % Resolution 2^32 (-1,1) levels
            fprintf(fileID,'%.10f\t%.12f\n',[t(:)';Outs(:)']);
    end
    fclose(fileID);
end