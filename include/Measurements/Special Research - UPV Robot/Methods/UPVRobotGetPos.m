function [x,y,z,response] = UPVRobotGetPos(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% =================================================
% Options for web response
options = weboptions("Timeout",20,'ContentType','json');

URLpos = app.ExtVar.UPVRobot.RobotURLpos;

% =================================================
% Send commands
%response = UPVRobotSendCommand(app,[],options);
response = webread(URLpos,options);

% =================================================
% Position
x = response.STATUS.X.POS;
y = response.STATUS.Y.POS;
z = response.STATUS.Z.POS;