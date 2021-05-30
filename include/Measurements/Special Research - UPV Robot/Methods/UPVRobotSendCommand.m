function response = UPVRobotSendCommand(app,json,options)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% =================================================
% URL Robot
URLmove = app.ExtVar.UPVRobot.RobotURLmove;
URLpos = app.ExtVar.UPVRobot.RobotURLpos;
URLstatus = app.ExtVar.UPVRobot.RobotURLstatus;

% =================================================
% Try 5 times before stop/return error
for retry = 1:5
    
    % ===============================================
    try
        % Send commands
        response = webread(strcat(URLmove,'?json=',json),options);
        
        break; % Done, exit retry loop
        
        % ===============================================
    catch ME
        
        if retry == 5 % Max attempts reached
            response = [];
            if strcmp(ME.identifier,'MATLAB:webservices:Timeout')
                % Show in info panel
                app.ExtUI.UPVRobotWarningsAndErrors.Text = ['The robot cannot be found.',...
                    ' Check that you are connected to the "Robot_Anecoica" WiFi network.',...
                    ' If you can''t find the network, check that the robot is on.'];
            else
                % Show in info panel
                app.ExtUI.UPVRobotWarningsAndErrors.Text = 'Unexpected error.';
            end
            
            % Button for reconnect
            app.ExtUI.UPVRobotButtonPanelInfo.Text = 'Retry connection with robot';
            app.ExtUI.UPVRobotButtonPanelInfo.Visible = 'on';
            % Other
            app.ExtUI.UPVRobotWarningsAndErrors.BackgroundColor = [1 0 0];
            app.ExtUI.UPVRobotWarningsAndErrors.FontColor = [1 1 1];
            app.ExtUI.UPVRobotRunningPanel.Visible = 'off';
            drawnow
            
            % Stop execution
            % Error display for stop matlab execution
            ms.identifier = 'ROBOT:error';
            ms.message = app.ExtUI.UPVRobotWarningsAndErrors.Text;
            ms.stack.file = ' ';
            ms.stack.name = '|| ROBOT ||';
            ms.stack.line = 0;
            error(ms);
        end
        
        % ======================================
        % While max attempts not reached:
        % Delay
        pause(1)
        
    end
end