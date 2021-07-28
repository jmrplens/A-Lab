function UPVRobotHoming(app)
% Copyright (C) Jose M. Requena Plens
% joreple@upv.es - jmrplens.github.io

% =================================================
% CHECK PAUSE/STOP
UPVRobotPauseStop(app,[],[])

% =================================================
% Check problems
done = UPVRobotCheckConnection(app);
if ~done
    return;
end

% =================================================
% Options for web response
options = weboptions("Timeout",5,'ContentType','json');

% =================================================
% Get response and status
response = UPVRobotSendCommand(app,[],options);

% ToDo: Check M5 homing

if response.STATUS.X.HOMING_PENDENT
    s.axis.X.HOMING = 1;
    UPVRobotSendCommand(app,jsonencode(s),options);
    X = 0;
else
    X = [];
end
if response.STATUS.Y.HOMING_PENDENT
    s.axis.Y.HOMING = 1;
    UPVRobotSendCommand(app,jsonencode(s),options);
    Y = 0;
else
    Y = [];
end
if response.STATUS.Z.HOMING_PENDENT
    s.axis.Z.HOMING = 1;
    UPVRobotSendCommand(app,jsonencode(s),options);
    Z = 0;
else
    Z = [];
end

if ~isempty(X) || ~isempty(Y) || ~isempty(Z)
    % Set extra time for lock robot (ms)
    s.axis.EXTRA_CONNECTED_DELAY = 10000;
    UPVRobotSendCommand(app,jsonencode(s),options);
    while true
        
        % CHECK PAUSE/STOP
        UPVRobotPauseStop(app,s,options)
        
        % Get response and position
        [~,~,~,response] = UPVRobotGetPos(app);
        
        % Print position
        if ~isempty(response)
            % If the movement are complete, loop exit
            if (response.STATUS.X.COMPLETE && response.STATUS.Y.COMPLETE && response.STATUS.Z.COMPLETE)
                break;
            end
        end
    end
    
    % To 0,0,0
    UPVRobotMoveXYZ(app,'X',0,'Y',0,'Z',0);
else
    return;
end

% =================================================
% Wait until the movement stop
% Print status
app.ExtUI.UPVRobotStatusLocation.Text = sprintf('Homing...');
drawnow
while true
    
    % CHECK PAUSE/STOP
    UPVRobotPauseStop(app,[],[])
    
    % Get response and status
    response = UPVRobotSendCommand(app,[],options);
    
    % If the movement are complete, loop exit
    if (response.STATUS.X.COMPLETE && response.STATUS.Y.COMPLETE && response.STATUS.Z.COMPLETE)
        
        % Print status
        app.ExtUI.UPVRobotStatusLocation.Text = sprintf('Ready!');
        drawnow
        
        try
            % X M5Stack
            s.ENCODER.NAME = 'EJEX-ANECOICA';
            s.ENCODER.ENCODER_POS = response.STATUS.X.POS;
            SS=jsonencode(s);
            webread([app.ExtVar.UPVRobot.M5StackURLX,'setposition','?json=',SS],options);
            % Y1 M5Stack
            s.ENCODER.NAME = 'EJEY1-ANECOICA';
            s.ENCODER.ENCODER_POS = response.STATUS.Y.POS1;
            SS=jsonencode(s);
            webread([app.ExtVar.UPVRobot.M5StackURLY1,'setposition','?json=',SS],options);
            % Y2 M5Stack
            s.ENCODER.NAME = 'EJEY2-ANECOICA';
            s.ENCODER.ENCODER_POS = response.STATUS.Y.POS2;
            SS=jsonencode(s);
            webread([app.ExtVar.UPVRobot.M5StackURLY2,'setposition','?json=',SS],options);
            
            % Reset attempts
            app.ExtVar.UPVRobot.M5StackXAttempt = 0;
            app.ExtVar.UPVRobot.M5StackY1Attempt = 0;
            app.ExtVar.UPVRobot.M5StackY2Attempt = 0;
            break;
            
        catch
            
            app.ExtUI.UPVRobotWarningsAndErrors.Text = 'M5Stack Error.';
            
            % Button for reconnect
            app.ExtUI.UPVRobotButtonPanelInfo.Text = 'Retry connection with robot';
            app.ExtUI.UPVRobotButtonPanelInfo.Visible = 'on';
            % Other
            app.ExtUI.UPVRobotWarningsAndErrors.BackgroundColor = [1 0 0];
            app.ExtUI.UPVRobotWarningsAndErrors.FontColor = [1 1 1];
            % Disable measure button
            app.ExtUI.StartmeasureButton.Enable = 'off';
            app.ExtUI.UPVRobotRunningPanel.Visible = 'off';
            drawnow
            
            % Show alert
            msg = app.ExtUI.UPVRobotWarningsAndErrors.Text;
            uialert(app.ALabUIFigure,msg,'M5Stack Error');
            
            % Robot reboot
            options = weboptions("Timeout",10);
            webread(app.ExtVar.UPVRobot.RobotURLreboot,options);
            
            %
            % Stop execution
            % Error display for stop matlab execution
            ms.identifier = 'ROBOT:error';
            ms.message = app.ExtUI.UPVRobotWarningsAndErrors.Text;
            ms.stack.file = ' ';
            ms.stack.name = '|| ROBOT ||';
            ms.stack.line = 0;
            error(ms);
            
        end
    end
    
    pause(0.01)
    
end