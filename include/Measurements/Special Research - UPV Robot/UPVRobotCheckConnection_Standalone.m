function done = UPVRobotCheckConnection_Standalone()
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% =================================================
% Robot parameters

% URL to connect with robot
URL = 'http://172.18.224.210/movexyz';

% =================================================
% Options for web response
options = weboptions("Timeout",20,'ContentType','json');

% =================================================
% Send command and check status
try
    % Send commands
    response = webread(URL,options);
    
    if response.STATUS.EMERGENCY_STOP == 1 % Check if the emergency stop is active
        % Error display for stop matlab execution
        ms.identifier = 'ROBOT:emergency';
        ms.message=sprintf('\n************************\n EMERGENCY STOP PRESSED \n************************');
        ms.stack.file = ' ';
        ms.stack.name = sprintf(['\n#########################################################\n',...
            ' Please, deactivate the emergency stop before move.',...
            '\n#########################################################']);
        ms.stack.line = 0;
        error(ms);
        
    elseif response.STATUS.LOCKED % Check if the system is locked by another IP
        % Data
        IP = response.STATUS.LOCKED_IP;
        MS = response.STATUS.LOCKED_MS;
        PORT = response.STATUS.LOCKED_PORT;
        
        % Error display for stop matlab execution
        ms.identifier = 'ROBOT:locked';
        ms.stack.name = sprintf(['\n********************************\n',...
            'ROBOT LOCKED BY IP: %s ',...
            '\n********************************'],IP);
        ms.stack.file = ' ';
        
        % If the system is locked via HTTP
        if PORT == -1
            ms.message = sprintf(['\n#################################\n',...
                ' Locked via HTTP. Ends in %s ms',...
                '\n#################################'],MS);
        else
            ms.message = sprintf(['\n#############################################\n',...
                ' Locked via WEBSOCK. Port: %d. Ends in %d ms',...
                '\n#############################################'],PORT,MS);
        end
        ms.stack.line = 0;
        error(ms);
        
    else
        done = true;
    end
    
catch ME
    done = false;
    if strcmp(ME.identifier,'MATLAB:webservices:Timeout') || strcmp(ME.identifier,'MATLAB:webservices:ConnectionRefused')
        % Show in info panel
        Text = ['The robot cannot be found.',...
            ' Check that you are connected to the "anecoica" WiFi network.',...
            ' If you can''t find the network, check that the robot is on.'];
        
    elseif strcmp(ME.identifier,'ROBOT:emergency')
        % Show in info panel
        Text = ['The emergency stop button has been pressed,',...
            ' try to reconnect. If the problem persists, release the physical emergency button'];
        
    elseif strcmp(ME.identifier,'ROBOT:locked')
        % Show in info panel
        Text = ['The robot is being used by another device,',...
            ' disconnect the other device and reconnect with the robot.'];
        
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