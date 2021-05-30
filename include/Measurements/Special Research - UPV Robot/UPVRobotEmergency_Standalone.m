function status = UPVRobotEmergency_Standalone(state)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% =================================================
% Robot parameters

% URL to connect with robot
URL = 'http://192.168.4.1/movexyz';

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
    response = webread(strcat(URL,'?json=',json),options);
catch ME
    if strcmp(ME.identifier,'MATLAB:webservices:Timeout')
        % Show in info panel
        Text = ['The robot cannot be found.',...
            ' Check that you are connected to the "anecoica" WiFi network.',...
            ' If you can''t find the network, check that the robot is on.'];
    else
        % Show in info panel
        Text = 'Unexpected error.';
    end
    
    % Stop execution
    % Error display for stop matlab execution
    ms.identifier = 'ROBOT:error';
    ms.message = Text;
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