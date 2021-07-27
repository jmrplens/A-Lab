function UPVRobotHoming_Standalone()
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% =================================================
% Robot parameters

% URL to connect with robot
URL = 'http://172.18.224.210/movexyz';

% M5Stack URL to check position
M5StackURLX = 'http://172.18.224.211/';
M5StackURLY1 = 'http://172.18.224.212/';
M5StackURLY2 = 'http://172.18.224.213/';

% =================================================
% Check problems
done = UPVRobotCheckConnection_Standalone;
if ~done
    return;
end

% =================================================
% Options for web response
options = weboptions("Timeout",10,'ContentType','json');

% =================================================
% Get response and status
response = webread(strcat(URL,'?json=',[]),options);


if 1 %response.STATUS.X.HOMING_PENDENT
    s.axis.X.HOMING = 1;
    response = webread(strcat(URL,'?json=',jsonencode(s)),options);
end
if 1 %response.STATUS.Y.HOMING_PENDENT
    s.axis.Y.HOMING = 1;
    response = webread(strcat(URL,'?json=',jsonencode(s)),options);
end
if 1%response.STATUS.Z.HOMING_PENDENT
    s.axis.Z.HOMING = 1;
    response = webread(strcat(URL,'?json=',jsonencode(s)),options);
end

% Set extra time for lock robot (ms)
s.axis.EXTRA_CONNECTED_DELAY = 10000;
webread(strcat(URL,'?json=',jsonencode(s)),options);

% =================================================
% Wait until the movement stop
% Print status
disp('Homing...');
while true
    
    % Get response and status
    response = webread(strcat(URL,'?json=',[]),options);
    
    % If the movement are complete, loop exit
    if (response.STATUS.X.COMPLETE && response.STATUS.Y.COMPLETE && response.STATUS.Z.COMPLETE)
        % Print status
        disp('Robot Ready!');
        % X M5Stack
        s.ENCODER.NAME = 'EJEX-ANECOICA';
        s.ENCODER.ENCODER_POS = response.STATUS.X.POS;
        SS=jsonencode(s);
        webread([M5StackURLX,'setposition','?json=',SS]);
        % Y1 M5Stack
        s.ENCODER.NAME = 'EJEY1-ANECOICA';
        s.ENCODER.ENCODER_POS = response.STATUS.Y.POS1;
        SS=jsonencode(s);
        webread([M5StackURLY1,'setposition','?json=',SS]);
        % Y2 M5Stack
        s.ENCODER.NAME = 'EJEY2-ANECOICA';
        s.ENCODER.ENCODER_POS = response.STATUS.Y.POS2;
        SS=jsonencode(s);
        webread([M5StackURLY2,'setposition','?json=',SS]);
        break;
    end
    
    pause(0.01)
end