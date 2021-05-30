function done = UPVRobotCheckProblems(response)
% This function check the possible problems
% This function is only called from UPVRobotCheckConnection function
%
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

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