function UPVRobotPauseStop(app,s,options)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Stop check
if app.ExtVar.UPVRobot.Stop == 1
    
    % Retry 20 times if not triggered before continue
    retry = 20;
    while retry > 0 && ~UPVRobotEmergency(app,1) % Robot full stop
    UPVRobotEmergency(app,1); % Robot full stop
    retry = retry - 1;
    end
    app.ExtUI.UPVRobotRunningPanel.Title = 'Stoped';
    app.ExtUI.StartmeasureButton.Enable = 'on';
    app.ExtUI.StartmeasureButton.Text = 'Resume measure';
    drawnow
    
    % Robot rearmy
    % Retry 20 times if not triggered before continue
    retry = 20;
    while retry > 0 && UPVRobotEmergency(app,0) % Robot full stop
    UPVRobotEmergency(app,0); % Robot full stop
    retry = retry - 1;
    end
    
    % Show in app
    %UPVRobotCheckConnection(app);
    
    % Enable UI panels
    UPVRobotUIDisableMeasuring(app,1)
    
    % Error display for stop matlab execution
    ms.message=sprintf('\n************************\n EMERGENCY STOP PRESSED \n************************');
    ms.stack.file = ' ';
    ms.stack.name = sprintf(['\n#########################################################\n',...
        ' This is NOT a error, it''s just a stop of the execution.',...
        '\n#########################################################']);
    ms.stack.line = 0;
    error(ms);
end

% Pause check
if app.ExtVar.UPVRobot.Pause == 1
    app.ExtUI.UPVRobotRunningPanel.Title = 'Paused';
    app.ExtUI.UPVRobotPauseButton.Text = 'Continue';
    drawnow
    
    % Retry 20 times if not triggered before continue
    retry = 20;
    while retry > 0 && ~UPVRobotEmergency(app,1) % Robot full stop
    UPVRobotEmergency(app,1); % Robot full stop
    retry = retry - 1;
    end
    
    % Wait for continue
    while app.ExtVar.UPVRobot.Pause
        pause(1)
    end
    
    % Robot rearmy
    % Retry 20 times if not triggered before continue
    retry = 20;
    while retry > 0 && UPVRobotEmergency(app,0) % Robot full stop
    UPVRobotEmergency(app,0); % Robot full stop
    retry = retry - 1;
    end
    
    % If the pause comes from UPVRobotMoveXYZ, resend coordinates
    if ~isempty(s) && ~isempty(options)
        % Resend command
        UPVRobotSendCommand(app,jsonencode(s),options);
    end
    app.ExtUI.UPVRobotRunningPanel.Title = 'Running...';
    app.ExtUI.UPVRobotPauseButton.Text = 'Pause';
    drawnow
end