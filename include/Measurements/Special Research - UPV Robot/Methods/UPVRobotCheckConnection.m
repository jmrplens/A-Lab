function done = UPVRobotCheckConnection(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% =================================================
% URL Robot
URLmove = app.ExtVar.UPVRobot.RobotURLmove;

% URL M5Stacks
M5StackURLX = app.ExtVar.UPVRobot.M5StackURLX;
M5StackURLY1 = app.ExtVar.UPVRobot.M5StackURLY1;
M5StackURLY2 = app.ExtVar.UPVRobot.M5StackURLY2;

% =================================================
% Options for web response
options = weboptions("Timeout",3,'ContentType','json');

% =================================================
% ROBOT: Try 5 times before stop/return error
for retry = 1:6
    
    % ===============================================
    try
        % Send commands
        response = webread(strcat(URLmove,'?json={}'),options);
        
        % Check problems
        done = UPVRobotCheckProblems(response); % If not get problems return true
        
        if done
            % Show in info panel
            app.ExtUI.UPVRobotWarningsAndErrors.Text = 'Without errors.';
            app.ExtUI.UPVRobotWarningsAndErrors.BackgroundColor = 'none';
            app.ExtUI.UPVRobotWarningsAndErrors.FontColor = [0.4667 0.6745 0.1882];
            
            % Hide button for reconnect
            app.ExtUI.UPVRobotButtonPanelInfo.Visible = 'off';
        else
            % Disable measure button
            app.ExtUI.StartmeasureButton.Enable = 'off';
        end
        drawnow;
        
        break; % Done, exit retry loop 
        
        % ===============================================
    catch ME
        
        
        if retry == 6 || strcmp(ME.identifier,'ROBOT:emergency') % Max attempts reached or emergency 
            done = false;
            if strcmp(ME.identifier,'MATLAB:webservices:Timeout') ...
                    || strcmp(ME.identifier,'MATLAB:webservices:ConnectionRefused') ...
                    || strcmp(ME.identifier,'MATLAB:webservices:HTTP502StatusCodeError')
                % Show in info panel
                app.ExtUI.UPVRobotWarningsAndErrors.Text = ['The robot cannot be found.',...
                    ' Check that you are connected to the "anecoica" WiFi network.',...
                    ' If you can''t find the network, check that the robot is on.'];
                
            elseif strcmp(ME.identifier,'ROBOT:emergency')
                % Show in info panel
                app.ExtUI.UPVRobotWarningsAndErrors.Text = ['The emergency stop button has been pressed,',...
                    ' try to reconnect. If the problem persists, release the physical emergency button'];
                % Deactivate software emergency
                %UPVRobotEmergency(app,0);
                
            elseif strcmp(ME.identifier,'ROBOT:locked')
                % Show in info panel
                app.ExtUI.UPVRobotWarningsAndErrors.Text = ['The robot is being used by another device,',...
                    ' disconnect the other device and reconnect with the robot.'];
                
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
            % Disable measure button
            app.ExtUI.StartmeasureButton.Enable = 'off';
            app.ExtUI.UPVRobotRunningPanel.Visible = 'off';
            drawnow
            
            % Show alert
            msg = app.ExtUI.UPVRobotWarningsAndErrors.Text;
            uialert(app.ALabUIFigure,msg,'Robot error');
            
            % Stop execution
            % Error display for stop matlab execution
            ms.identifier = 'ROBOT:error';
            ms.message = app.ExtUI.UPVRobotWarningsAndErrors.Text;
            ms.stack.file = ' ';
            ms.stack.name = '|| ROBOT ||';
            ms.stack.line = 0;
            error(ms);
        else
            app.ExtUI.UPVRobotWarningsAndErrors.BackgroundColor = [1 0 0];
            app.ExtUI.UPVRobotWarningsAndErrors.FontColor = [1 1 1];
            app.ExtUI.UPVRobotWarningsAndErrors.Text = sprintf('There are problems with the connection to the robot. Retrying: %d/5',retry);
            drawnow
        end
        % ======================================
        % While max attempts not reached:
        % Delay
        pause(2)
        
    end
end

% =================================================
% M5Stacks: Try 5 times before stop/return error
for retry = 1:6
    
    % ===============================================
    try
        % Send commands
        responseX = webread(M5StackURLX,options);
        responseY1 = webread(M5StackURLY1,options);
        responseY2 = webread(M5StackURLY2,options);
        
        break; % Done, exit retry loop 
        
        % ===============================================
    catch ME
        
        
        if retry == 6 || strcmp(ME.identifier,'ROBOT:emergency') % Max attempts reached or emergency 
            done = false;
            if strcmp(ME.identifier,'MATLAB:webservices:Timeout') ...
                    || strcmp(ME.identifier,'MATLAB:webservices:ConnectionRefused') ...
                    || strcmp(ME.identifier,'MATLAB:webservices:HTTP502StatusCodeError')
                % Show in info panel
                app.ExtUI.UPVRobotWarningsAndErrors.Text = ['The M5Stacks cannot be found.',...
                    ' Check that you are connected to the "anecoica" WiFi network.',...
                    ' If you can''t find the network, check that the robot is on.'];
                
            elseif strcmp(ME.identifier,'ROBOT:emergency')
                % Show in info panel
                app.ExtUI.UPVRobotWarningsAndErrors.Text = ['The emergency stop button has been pressed,',...
                    ' try to reconnect. If the problem persists, release the physical emergency button'];
                % Deactivate software emergency
                %UPVRobotEmergency(app,0);
                
            elseif strcmp(ME.identifier,'ROBOT:locked')
                % Show in info panel
                app.ExtUI.UPVRobotWarningsAndErrors.Text = ['The robot is being used by another device,',...
                    ' disconnect the other device and reconnect with the robot.'];
                
            else
                % Show in info panel
                app.ExtUI.UPVRobotWarningsAndErrors.Text = 'M%Stack - Unexpected error.';
            end
            
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
            uialert(app.ALabUIFigure,msg,'M5Stack error');
            
            % Stop execution
            % Error display for stop matlab execution
            ms.identifier = 'M5Stack:error';
            ms.message = app.ExtUI.UPVRobotWarningsAndErrors.Text;
            ms.stack.file = ' ';
            ms.stack.name = '|| ROBOT ||';
            ms.stack.line = 0;
            error(ms);
        else
            app.ExtUI.UPVRobotWarningsAndErrors.BackgroundColor = [1 0 0];
            app.ExtUI.UPVRobotWarningsAndErrors.FontColor = [1 1 1];
            app.ExtUI.UPVRobotWarningsAndErrors.Text = sprintf('There are problems with the connection to the M5Stacks. Retrying: %d/5',retry);
            drawnow
        end
        % ======================================
        % While max attempts not reached:
        % Delay
        pause(2)
        
    end
end