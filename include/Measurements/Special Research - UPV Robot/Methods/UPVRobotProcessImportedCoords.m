function [X,Y,Z] = UPVRobotProcessImportedCoords(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

if isempty(app.ExtVar.UPVRobot.CustomCoordsPath)
    UPVRobotCleanImportPanel(app)
    return;
end

try
    coords = load(app.ExtVar.UPVRobot.CustomCoordsPath);
    app.ExtUI.UPVRobotImportCheckErrorInfo.Text = '';
catch
    try
        coords = readtable(app.ExtVar.UPVRobot.CustomCoordsPath);
        coords = table2array(coords);
        app.ExtUI.UPVRobotImportCheckErrorInfo.Text = '';
    catch
        app.ExtUI.UPVRobotImportFileNameLabel.Text = 'ERROR';
        app.ExtUI.UPVRobotImportCheckErrorInfo.Text = 'The file is not in the correct format, please check it and try again when it is corrected.';
        app.ExtUI.UPVRobotImportCheckErrorInfo.FontColor = [0.6,0,0];
    end
end

% To import coords generated with ALab remove coord index
if size(coords,2) == 4
    coords(:,1) = [];
end
    
if size(coords,2)>3 || isempty(coords)
    app.ExtUI.UPVRobotImportFileNameLabel.Text = 'ERROR';
    app.ExtUI.UPVRobotImportCheckErrorInfo.Text = 'The file is not in the correct format, please check it and try again when it is corrected.';
    app.ExtUI.UPVRobotImportCheckErrorInfo.FontColor = [0.6,0,0];
    return;
end

% Clean duplicates
coords = unique(coords, 'rows','stable');

% To meters
switch app.ExtUI.UPVRobotImportUnitsDropDown.Value
    case 'm'
        % nothing
    case 'dm'
        coords = coords/10;
    case 'cm'
        coords = coords/100;
    case 'mm'
        coords = coords/1000;
end


% Decompose
X = coords(:,1);
Y = coords(:,2);
if size(coords,2)==3
    Z = coords(:,3);
else
    Z = zeros(size(coords,1),1);
end

% Add offset
X = X + app.ExtUI.UPVRobotImportXOffset.Value;
Y = Y + app.ExtUI.UPVRobotImportYOffset.Value;
Z = Z + app.ExtUI.UPVRobotImportZOffset.Value;

% Points in each axes
mx = numel(unique(X));
my = numel(unique(Y));
mz = numel(unique(Z));

% Min values
xmin = min(X);
ymin = min(Y);
zmin = min(Z);
app.ExtUI.UPVRobotImportXmin.Value = xmin;
app.ExtUI.UPVRobotImportYmin.Value = ymin;
app.ExtUI.UPVRobotImportZmin.Value = zmin;

% Max values
xmax = max(X);
ymax = max(Y);
zmax = max(Z);
app.ExtUI.UPVRobotImportXmax.Value = xmax;
app.ExtUI.UPVRobotImportYmax.Value = ymax;
app.ExtUI.UPVRobotImportZmax.Value = zmax;

% SizeRobot
XLen = app.ExtVar.UPVRobot.XLen;
YLen = app.ExtVar.UPVRobot.YLen;
ZLen = app.ExtVar.UPVRobot.ZLen;

% Check out of range (min)
Xoutd = xmin < 0;
Youtd = ymin < 0;
Zoutd = zmin < 0;

% Check out of range (max)
Xoutu = xmax > XLen;
Youtu = ymax > YLen;
Zoutu = zmax > ZLen;   

% Remove outliers
idx = X>XLen | Y>YLen | Z>ZLen | X<0 | Y<0 | Z<0;
X(idx) = [];
Y(idx) = [];
Z(idx) = [];

msg = {};
aux = 1;
if Xoutd || Youtd || Zoutd
    msg{aux} = 'Out of range, there cannot be values less than 0. Problem in: ';
    if Xoutd; msg{aux} = [msg{aux},'X axis. ']; end
    if Youtd; msg{aux} = [msg{aux},'Y axis. ']; end
    if Zoutd; msg{aux} = [msg{aux},'Z axis. ']; end
    aux = 2;
end
if Xoutu || Youtu || Zoutu
    msg{aux} = 'Out of range, there cannot be values greater than robot total length. Problem in: ';
    if Xoutu; msg{aux} = [msg{aux},'X axis. ']; end
    if Youtu; msg{aux} = [msg{aux},'Y axis. ']; end
    if Zoutu; msg{aux} = [msg{aux},'Z axis. ']; end
end

if (Xoutd || Youtd || Zoutd) || (Xoutu || Youtu || Zoutu)
    app.ExtUI.UPVRobotImportCheckErrorInfo.Text = msg;
    app.ExtUI.UPVRobotImportCheckErrorInfo.FontColor = [1 0.35 0];
end


% =======================================================================
% Store general data
% Resolution
% app.ExtVar.UPVRobot.XRes = mx;
% app.ExtVar.UPVRobot.YRes = my;
% app.ExtVar.UPVRobot.ZRes = mz;