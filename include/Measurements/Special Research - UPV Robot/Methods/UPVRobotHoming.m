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
responseM5X = webread(app.ExtVar.UPVRobot.M5StackURLX,options);
responseM5Y1 = webread(app.ExtVar.UPVRobot.M5StackURLY1,options);
responseM5Y2 = webread(app.ExtVar.UPVRobot.M5StackURLY2,options);

% Robot Homed?
if response.STATUS.X.HOMING_PENDENT || abs(response.STATUS.X.POS - responseM5X.ENCODER.ENCODER_POS) > 2
    s.axis.X.HOMING = 1;
    X = 0;
else
    X = [];
end
if response.STATUS.Y.HOMING_PENDENT ...
        || abs(response.STATUS.Y.POS1 - responseM5Y1.ENCODER.ENCODER_POS) > 2 ...
        || abs(response.STATUS.Y.POS2 - responseM5Y2.ENCODER.ENCODER_POS) > 2
    s.axis.Y.HOMING = 1;
    Y = 0;
else
    Y = [];
end
if response.STATUS.Z.HOMING_PENDENT
    s.axis.Z.HOMING = 1;
    Z = 0;
else
    Z = [];
end

% Do homing?
if ~isempty(X) || ~isempty(Y) || ~isempty(Z)
    
    % Ask to do homming
    msg = 'Homing is needed, Do you want to do it?';
    title = 'Homing';
    selection = uiconfirm(app.ALabUIFigure,msg,title,...
        'Options',{'Yes','No'},...
        'DefaultOption',2,'CancelOption',2);
    
    % If cancel, return
    if strcmp(selection,'No')
        
        % Stop execution
        % Error display for stop matlab execution
        ms.identifier = 'HOMING:cancelled';
        ms.message=sprintf('\n************************\n HOMING CANCELLED \n************************');
        ms.stack.file = ' ';
        ms.stack.name = sprintf(['\n#########################################################\n',...
            ' This is NOT a error, it''s just a stop of the execution.',...
            '\n#########################################################']);
        ms.stack.line = 0;
        error(ms);
    end
    
    UPVRobotSendCommand(app,jsonencode(s),options);
end

% M5Stack Homed?
responseM5 = webread(app.ExtVar.UPVRobot.M5StackURLX,options);
if ~responseM5.ENCODER.HOMMED
    X5HomPendent = 1;
else
    X5HomPendent = 0;
end

responseM5 = webread(app.ExtVar.UPVRobot.M5StackURLY1,options);
if ~responseM5.ENCODER.HOMMED
    Y15HomPendent = 1;
else
    Y15HomPendent = 0;
end

responseM5 = webread(app.ExtVar.UPVRobot.M5StackURLY2,options);
if ~responseM5.ENCODER.HOMMED
    Y25HomPendent = 1;
else
    Y25HomPendent = 0;
end

if ~isempty(X) || ~isempty(Y) || ~isempty(Z)
    
    % Set extra time for lock robot (ms)
    s.axis.EXTRA_CONNECTED_DELAY = 10000;
    UPVRobotSendCommand(app,jsonencode(s),options);
    % Wait Homing
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
    
    % To 0
    if ~isempty(X) && ~isempty(Y) && ~isempty(Z)
        UPVRobotMoveXYZ(app,'X',X,'Y',Y,'Z',Z);
    elseif ~isempty(X) && ~isempty(Y) && isempty(Z)
        UPVRobotMoveXYZ(app,'X',X,'Y',Y);
    elseif ~isempty(X) && isempty(Y) && ~isempty(Z)
        UPVRobotMoveXYZ(app,'X',X,'Z',Z);
    elseif isempty(X) && ~isempty(Y) && ~isempty(Z)
        UPVRobotMoveXYZ(app,'Z',Z,'Y',Y);
    elseif ~isempty(X) && isempty(Y) && isempty(Z)
        UPVRobotMoveXYZ(app,'X',X);
    elseif isempty(X) && ~isempty(Y) && isempty(Z)
        UPVRobotMoveXYZ(app,'Y',Y);
    elseif isempty(X) && isempty(Y) && ~isempty(Z)
        UPVRobotMoveXYZ(app,'Z',Z);
    end
    
else
    
    % Get response and position
    [~,~,~,response] = UPVRobotGetPos(app);
    
    % Set Position to M5Stack if no hommed and do hommed
    if X5HomPendent == 1
        % X M5Stack
        s.ENCODER.NAME = 'EJEX-ANECOICA';
        s.ENCODER.ENCODER_POS = response.STATUS.X.POS;
        s.ENCODER.HOMMED = 1;
        SS=jsonencode(s);
        webread([app.ExtVar.UPVRobot.M5StackURLX,'setposition','?json=',SS],options);
    end
    
    if Y15HomPendent == 1
        % Y1 M5Stack
        s.ENCODER.NAME = 'EJEY1-ANECOICA';
        s.ENCODER.ENCODER_POS = response.STATUS.Y.POS1;
        s.ENCODER.HOMMED = 1;
        SS=jsonencode(s);
        webread([app.ExtVar.UPVRobot.M5StackURLY1,'setposition','?json=',SS],options);
    end
    
    if Y25HomPendent == 1
        % Y2 M5Stack
        s.ENCODER.NAME = 'EJEY2-ANECOICA';
        s.ENCODER.ENCODER_POS = response.STATUS.Y.POS2;
        s.ENCODER.HOMMED = 1;
        SS=jsonencode(s);
        webread([app.ExtVar.UPVRobot.M5StackURLY2,'setposition','?json=',SS],options);
    end
    
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
            s.ENCODER.HOMMED = 1;
            SS=jsonencode(s);
            webread([app.ExtVar.UPVRobot.M5StackURLX,'setposition','?json=',SS],options);
            % Y1 M5Stack
            s.ENCODER.NAME = 'EJEY1-ANECOICA';
            s.ENCODER.ENCODER_POS = response.STATUS.Y.POS1;
            s.ENCODER.HOMMED = 1;
            SS=jsonencode(s);
            webread([app.ExtVar.UPVRobot.M5StackURLY1,'setposition','?json=',SS],options);
            % Y2 M5Stack
            s.ENCODER.NAME = 'EJEY2-ANECOICA';
            s.ENCODER.ENCODER_POS = response.STATUS.Y.POS2;
            s.ENCODER.HOMMED = 1;
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
            app.ExtUI.UPVRobotButtonPanelInfo.Text = 'Retry connection';
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
            ms.identifier = 'M5STACK:error';
            ms.message = app.ExtUI.UPVRobotWarningsAndErrors.Text;
            ms.stack.file = ' ';
            ms.stack.name = '|| ROBOT ||';
            ms.stack.line = 0;
            error(ms);
            
        end
    end
    
    pause(0.01)
    
end