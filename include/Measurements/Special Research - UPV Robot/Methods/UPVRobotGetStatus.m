function status = UPVRobotGetStatus(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

URL = app.ExtVar.UPVRobot.RobotURLstatus;

% =================================================
% Options for web response
options = weboptions("Timeout",3,'ContentType','json');

% Send commands
response = webread(URL,options);

status = response.STATUS;