function response = UPVRobotMoveXYZ_Standalone(varargin)
% Function to move the robot
%
% X, Y and Z in meters
%
% Examples
% UPVRobotMoveXYZ('X',15,'Y',20,'Z',60) % Move all axis
% UPVRobotMoveXYZ('X',15,'Y',20) % Move X and Y
% UPVRobotMoveXYZ('X',15) % Only move X
% UPVRobotMoveXYZ('Z',15) % Only move Z
%
% Or
%
% UPVRobotMoveXYZ(15,20,,60) % Move all axis
% UPVRobotMoveXYZ(15,20) % Move X and Y
% UPVRobotMoveXYZ(15) % Only move X
% UPVRobotMoveXYZ([],[],15) % Only move Z
%
% Set Speed and acel (in mm/s^2)
% UPVRobotMoveXYZ('X',15,'Xspeed',100,'XAcel',500) % Same for other axis
%
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% =================================================
% Check problems
% done = UPVRobotCheckConnection_Standalone;
% if ~done
%     return;
% end


% =================================================
% Robot parameters

% URL to connect with robot
URLmove = 'http://192.168.4.1/movexyz';
URLpos = 'http://192.168.4.1/position';
URLstatus = 'http://192.168.4.1/status';

% Size - each axis (mm)
XLen = 3000;
YLen = 3000;
ZLen = 1000;

% Speed - each axis (mm/s)
XYSpeed = 100;
ZSpeedd = 100;
MaxXYSpeed = 500;
MaxZSpeed = 500;

% Aceleration - each axis (mm/s^2)
XYAcel = 25;
ZAceld = 25;
MaxXYAcel = 500;
MaxZAcel = 500;

% =================================================
% Inputs
p = inputParser;
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

parse(p,varargin{:});

% Unpacking
X = p.Results.X*1e3;
Y = p.Results.Y*1e3;
Z = p.Results.Z*1e3;

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
        XSpeed = XYSpeed;
    elseif XSpeed > MaxXYSpeed
        XSpeed = MaxXYSpeed;
    end
    if isempty(XAcel)
        XAcel = XYAcel;
    elseif XAcel > MaxXYAcel
        XAcel = MaxXYAcel;
    end
    
    if X > XLen
        X = XLen;
    end
    if X < 0
        X = 0;
    end
    
    % Set
    s.axis.X.TARGET = X;
    s.axis.X.CUSTOM_SPEED = XSpeed;
    s.axis.X.CUSTOM_ACCELERATION = XAcel;
end

% Parameters for Y axis
if ~isempty(Y)
    if isempty(YSpeed)
        YSpeed = XYSpeed;
    elseif YSpeed > MaxXYSpeed
        YSpeed = MaxXYSpeed;
    end
    if isempty(YAcel)
        YAcel = XYAcel;
    elseif YAcel > MaxXYAcel
        YAcel = MaxXYAcel;
    end
    
    if Y > YLen
        Y = YLen;
    end
    if Y < 0
        Y = 0;
    end
    
    % Set
    s.axis.Y.TARGET = Y;
    s.axis.Y.CUSTOM_SPEED = YSpeed;
    s.axis.Y.CUSTOM_ACCELERATION = YAcel;
end

% Parameters for Z axis
if ~isempty(Z)
    if isempty(ZSpeed)
        ZSpeed = ZSpeedd;
    elseif ZSpeed > MaxZSpeed
        ZSpeed = MaxZSpeed;
    end
    if isempty(ZAcel)
        ZAcel = ZAceld;
    elseif ZAcel > MaxZAcel
        ZAcel = MaxZAcel;
    end
    
    if Z > ZLen
        Z = ZLen;
    end
    if Z < 0
        Z = 0;
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

% UnLock
%s.axis.UNLOCK = true;

% =================================================
% Structure to JSON
json = jsonencode(s);

% =================================================
% Options for web response
options = weboptions("Timeout",5,'ContentType','json');

% =================================================
% Homing (if needed)
% Send commands
response = webread(URLstatus,options);
if response.STATUS.X.HOMING_PENDENT || response.STATUS.Y.HOMING_PENDENT || response.STATUS.Z.HOMING_PENDENT
    UPVRobotHoming_Standalone;
end

% =================================================
% Send command and check status
while true
    
    % Send commands
    response = webread(strcat(URLmove,'?json=',json),options);
    
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
len = 0;
while true
    
    % Get response and status
    response = webread(URLpos,options);
    
    % Print position
    if ~isempty(response)
        x = response.STATUS.X.POS*1e-3;
        y = response.STATUS.Y.POS*1e-3;
        z = response.STATUS.Z.POS*1e-3;
        
        if len>0; fprintf(repmat('\b',1,len)); end % Remove text for update
        len = fprintf('Position in meters: [X %.3f, Y %.3f, Z %.3f]' ,[x,y,z]);
        
        % If the movement are complete, loop exit
        if (response.STATUS.X.COMPLETE && response.STATUS.Y.COMPLETE && response.STATUS.Z.COMPLETE)
            % Get response and status
            response = webread(URLpos,options);
            x = response.STATUS.X.POS*1e-3;
            y = response.STATUS.Y.POS*1e-3;
            z = response.STATUS.Z.POS*1e-3;
            if len>0; fprintf(repmat('\b',1,len)); end % Remove text for update
            fprintf('<strong>Position in meters:</strong> [X %.3f, Y %.3f, Z %.3f]\r\n' ,[x,y,z]);
            
            break;
        end
        pause(0.02) % 20 Hz
    end
end
fprintf('<strong>Movement complete!</strong>')