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
        break;
    end
end

% First move Z to 0 without move X,Y,  if X or Y will do homing
if (~isempty(X) && X == 0) || (~isempty(Y) && Y == 0)
    app.ExtUI.UPVRobotStatusLocation.Text = sprintf('Ready! Go to [0,0,0]');
    drawnow
    pause(1);
    UPVRobotMoveXYZ(app,'X',response.STATUS.X.POS,'Y',response.STATUS.Y.POS,'Z',0);
end
% Then, X and Y to 0 if will do homing, if not do nothing
UPVRobotMoveXYZ(app,'X',X,'Y',Y,'Z',Z);