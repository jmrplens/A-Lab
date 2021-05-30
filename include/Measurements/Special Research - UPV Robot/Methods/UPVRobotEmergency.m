function status = UPVRobotEmergency(app,state)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% =================================================
% URL Robot
URLmove = app.ExtVar.UPVRobot.RobotURLmove;
URLpos = app.ExtVar.UPVRobot.RobotURLpos;
URLstatus = app.ExtVar.UPVRobot.RobotURLstatus;

% =================================================
% Option for response
options = weboptions("Timeout",5,'ContentType','json');


% =================================================
% Data structure
s = struct();
s.axis.EMERGENCY_STOP_SW = state;

% =================================================
% Structure to JSON
json = jsonencode(s);

% =================================================
% Send command and response
try
    response = webread(strcat(URLmove,'?json=',json),options);
catch ME
    if strcmp(ME.identifier,'MATLAB:webservices:Timeout')
        % Show in info panel
        app.ExtUI.UPVRobotWarningsAndErrors.Text = ['The robot cannot be found.',...
            ' Check that you are connected to the "anecoica" WiFi network.',...
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
    % Disable measure button
    app.ExtUI.StartmeasureButton.Enable = 'off';
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

% =================================================
% If Physical Emergency button pressed, show error
if response.STATUS.EMERGENCY_STOP_HW == 1
    % Error display for stop matlab execution
    ms.message=sprintf('\n************************\n PHYSICAL EMERGENCY STOP PRESSED \n************************');
    ms.stack.file = ' ';
    ms.stack.name = sprintf(['\n#########################################################\n',...
        ' Please, release the button located at the entrance.',...
        '\n#########################################################']);
    ms.stack.line = 0;
    error(ms);
end

% =================================================
% Status
status = response.STATUS.EMERGENCY_STOP;