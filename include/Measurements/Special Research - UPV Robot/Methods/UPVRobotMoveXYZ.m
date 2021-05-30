function response = UPVRobotMoveXYZ(app,varargin)
% Function to move the robot
%
% Examples
% UPVRobotMoveXYZ(app,'X',15,'Y',20,'Z',60) % Move all axis
% UPVRobotMoveXYZ(app,'X',15,'Y',20) % Move X and Y
% UPVRobotMoveXYZ(app,'X',15) % Only move X
% UPVRobotMoveXYZ(app,'Z',15) % Only move Z
%
% Or
%
% UPVRobotMoveXYZ(app,15,20,,60) % Move all axis
% UPVRobotMoveXYZ(app,15,20) % Move X and Y
% UPVRobotMoveXYZ(app,15) % Only move X
% UPVRobotMoveXYZ(app,[],[],15) % Only move Z
%
% Set Speed and acel (in mm/s^2)
% UPVRobotMoveXYZ(app,'X',15,'Xspeed',100,'XAcel',500) % Same for other axis
%
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% =================================================
% CHECK PAUSE/STOP
UPVRobotPauseStop(app,[],[])

% =================================================
% Check problems
UPVRobotCheckConnection(app);

% =================================================
% Inputs
p = inputParser;
addRequired(p,'app');
addOptional(p,'X',[],...
    @(x) isnumeric(x) && isscalar(x) && x>=0 || isempty(x));
addOptional(p,'Y',[],...
    @(x) isnumeric(x) && isscalar(x) && x>=0 || isempty(x));
addOptional(p,'Z',[],...
    @(x) isnumeric(x) && isscalar(x) && x>=0 || isempty(x));
addOptional(p,'XSpeed',[],...
    @(x) isnumeric(x) && isscalar(x) && x>0 || isempty(x));
addOptional(p,'XAcel',[],...
    @(x) isnumeric(x) && isscalar(x) && x>0 || isempty(x));
addOptional(p,'YSpeed',[],...
    @(x) isnumeric(x) && isscalar(x) && x>0 || isempty(x));
addOptional(p,'YAcel',[],...
    @(x) isnumeric(x) && isscalar(x) && x>0 || isempty(x));
addOptional(p,'ZSpeed',[],...
    @(x) isnumeric(x) && isscalar(x) && x>0 || isempty(x));
addOptional(p,'ZAcel',[],...
    @(x) isnumeric(x) && isscalar(x) && x>0 || isempty(x));

parse(p,app,varargin{:});

% Unpacking
X = p.Results.X;
Y = p.Results.Y;
Z = p.Results.Z;

XSpeed = p.Results.XSpeed;
XAcel = p.Results.XAcel;
YSpeed = p.Results.YSpeed;
YAcel = p.Results.YAcel;
ZSpeed = p.Results.ZSpeed;
ZAcel = p.Results.ZAcel;

% =================================================
% No coords, no move
if isempty(X) && isempty(Y) && isempty(Z)
    return;
end

% =================================================
% Struct for command parameters

s = struct();

% Parameters for X axis
if ~isempty(X)
    if isempty(XSpeed)
        XSpeed = app.ExtVar.UPVRobot.XYSpeed;
    elseif XSpeed > app.ExtVar.UPVRobot.MaxXYSpeed
        XSpeed = app.ExtVar.UPVRobot.MaxXYSpeed;
    end
    if isempty(XAcel)
        XAcel = app.ExtVar.UPVRobot.XYAcel;
    elseif XAcel > app.ExtVar.UPVRobot.MaxXYAcel
        XAcel = app.ExtVar.UPVRobot.MaxXYAcel;
    end
    
    % Set
    s.axis.X.TARGET = X;
    s.axis.X.CUSTOM_SPEED = XSpeed;
    s.axis.X.CUSTOM_ACCELERATION = XAcel;
end

% Parameters for Y axis
if ~isempty(Y)
    if isempty(YSpeed)
        YSpeed = app.ExtVar.UPVRobot.XYSpeed;
    elseif YSpeed > app.ExtVar.UPVRobot.MaxXYSpeed
        YSpeed = app.ExtVar.UPVRobot.MaxXYSpeed;
    end
    if isempty(YAcel)
        YAcel = app.ExtVar.UPVRobot.XYAcel;
    elseif YAcel > app.ExtVar.UPVRobot.MaxXYAcel
        YAcel = app.ExtVar.UPVRobot.MaxXYAcel;
    end
    
    % Set
    s.axis.Y.TARGET = Y;
    s.axis.Y.CUSTOM_SPEED = YSpeed;
    s.axis.Y.CUSTOM_ACCELERATION = YAcel;
end

% Parameters for Z axis
if ~isempty(Z)
    if isempty(ZSpeed)
        ZSpeed = app.ExtVar.UPVRobot.ZSpeed;
    elseif ZSpeed > app.ExtVar.UPVRobot.MaxZSpeed
        ZSpeed = app.ExtVar.UPVRobot.MaxZSpeed;
    end
    if isempty(ZAcel)
        ZAcel = app.ExtVar.UPVRobot.ZAcel;
    elseif ZAcel > app.ExtVar.UPVRobot.MaxZAcel
        ZAcel = app.ExtVar.UPVRobot.MaxZAcel;
    end
    
    % Set
    s.axis.Z.TARGET = Z;
    s.axis.Z.CUSTOM_SPEED = ZSpeed;
    s.axis.Z.CUSTOM_ACCELERATION = ZAcel;
end

if ~isempty(X) || ~isempty(Y) || ~isempty(Z)
    % Set extra time for lock robot (ms)
    s.axis.EXTRA_CONNECTED_DELAY = 10000;
end

% =================================================
% Structure to JSON
json = jsonencode(s);

% =================================================
% Options for web response
options = weboptions("Timeout",20,'ContentType','json');

% =================================================
% Send command and check status
while true
    
    % Send commands
    response = UPVRobotSendCommand(app,json,options);
    
    % If in the status the target is stored correctly, loop exit
    if ~isempty(X)
        Xcheck = abs(response.STATUS.X.TARGET-X) < 0.1;
    else
        Xcheck = 1;
    end
    if ~isempty(Y)
        Ycheck = abs(response.STATUS.Y.TARGET-Y) < 0.1;
    else
        Ycheck = 1;
    end
    if ~isempty(Z)
        Zcheck = abs(response.STATUS.Z.TARGET-Z) < 0.1;
    else
        Zcheck = 1;
    end
    if Xcheck && Ycheck && Zcheck
        break;
    end
end


% =================================================
% Wait until the movement stop
while true
    
    % CHECK PAUSE/STOP
    UPVRobotPauseStop(app,s,options)
    
    % Get response and position
    [x,y,z,response] = UPVRobotGetPos(app);
    
    % Print position
    if ~isempty(response)
        % If the movement are complete, loop exit
        if (response.STATUS.X.COMPLETE && response.STATUS.Y.COMPLETE && response.STATUS.Z.COMPLETE)
            % Print position
            app.ExtUI.UPVRobotStatusLocation.Text = sprintf('[%.3f, %.3f, %.3f]',x*1e-3,y*1e-3,z*1e-3);
            set(app.ExtVar.UPVRobot.RobotPlot,'XData',x*1e-3,'YData',y*1e-3,'ZData',z*1e-3)
            set(app.ExtVar.UPVRobot.RobotPlotGuides(1),'XData',[1,1]*x*1e-3,'ZData',[1,1]*z*1e-3)
            set(app.ExtVar.UPVRobot.RobotPlotGuides(2),'YData',[1,1]*y*1e-3,'ZData',[1,1]*z*1e-3)
            set(app.ExtVar.UPVRobot.RobotPlotGuides(3),'XData',[1,1]*x*1e-3,'YData',[1,1]*y*1e-3)
            drawnow
            % Exit
            break;
        else
            app.ExtUI.UPVRobotStatusLocation.Text = sprintf('[%.3f, %.3f, %.3f]',x*1e-3,y*1e-3,z*1e-3);
            set(app.ExtVar.UPVRobot.RobotPlot,'XData',x*1e-3,'YData',y*1e-3,'ZData',z*1e-3)
            set(app.ExtVar.UPVRobot.RobotPlotGuides(1),'XData',[1,1]*x*1e-3,'ZData',[1,1]*z*1e-3)
            set(app.ExtVar.UPVRobot.RobotPlotGuides(2),'YData',[1,1]*y*1e-3,'ZData',[1,1]*z*1e-3)
            set(app.ExtVar.UPVRobot.RobotPlotGuides(3),'XData',[1,1]*x*1e-3,'YData',[1,1]*y*1e-3)
            drawnow
        end
    end
    pause(0.02)
end