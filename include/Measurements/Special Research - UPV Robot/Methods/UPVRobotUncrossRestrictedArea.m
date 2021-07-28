function  UPVRobotUncrossRestrictedArea(app,iter)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

if ~app.ExtVar.UPVRobot.Restricted
    return;
end

% Destination coord
coord = app.ExtVar.UPVRobot.MeasurePoints(iter,:);
xdes = round(coord(1),5);
ydes = round(coord(2),5);
zdes = round(coord(3),5);

% SizeRobot
XLen = app.ExtVar.UPVRobot.XLen;
YLen = app.ExtVar.UPVRobot.YLen;
ZLen = app.ExtVar.UPVRobot.ZLen;

% Gap
gap = 0.005;
% Restricted area
XNaNOri = app.ExtVar.UPVRobot.XNaNOri-gap;
XNaNEnd = app.ExtVar.UPVRobot.XNaNEnd+gap;
YNaNOri = app.ExtVar.UPVRobot.YNaNOri-gap;
YNaNEnd = app.ExtVar.UPVRobot.YNaNEnd+gap;
ZNaNOri = app.ExtVar.UPVRobot.ZNaNOri-gap;

% XY shape of restricted area
XY = polyshape([XNaNOri;XNaNOri;XNaNEnd;XNaNEnd],[YNaNOri;YNaNEnd;YNaNEnd;YNaNOri]);
% Origin Z of restricted area
Zori = ZNaNOri;

% Corners inside limits (0,0,0) and (XLen,YLen,ZLen)
corners = XY.Vertices;
% Remove corners outside origin
idx = corners(:,1)<=0; % Wit X = 0
corners(idx,:) = [];
idx = corners(:,2)<=0; % Wit Y = 0
corners(idx,:) = [];
idx = corners(:,1)>=XLen; % Wit X = XLen
corners(idx,:) = [];
idx = corners(:,2)>=YLen; % Wit Y = YLen
corners(idx,:) = [];

% Get actual Robot position
[xrob,yrob,zrob,~] = UPVRobotGetPos(app);
xrob = round(xrob*1e-3,4);
yrob = round(yrob*1e-3,4);
zrob = round(zrob*1e-3,4);

% Check if path intersect with restricted area
lineseg = [xrob yrob; xdes ydes];
[in,~] = intersect(XY,lineseg);


while ~isempty(in) % If path cross restricted area on XY Plane and Zori move to corner of restricted area
    
    
    % If is posible travel under rectricted area, down Z axis to zdes
    if Zori > 0 && zdes < Zori && zrob > Zori
        % Move
        UPVRobotMoveXYZ(app,xrob*1e3,yrob*1e3,zdes*1e3);
        break;
    end
    
    % If Traveling under restricted area, continue
    if zrob < Zori && zdes < Zori; break; end
    
    for kk = 1:size(corners,1)
        
        % Remove not viable corners in first movement
        idxFirst = [];
        for ii = 1:size(corners,1)
            lineseg = [xrob yrob; corners(ii,1) corners(ii,2)];
            [in,~] = intersect(XY,lineseg);
            if isequal(lineseg,in); in = []; end
            dist = sqrt( (xrob-corners(ii,1))^2 + (yrob-corners(ii,2))^2);
            if isempty(in) && dist>0; idxFirst = [idxFirst,ii]; end
        end
        cornersFirst = corners(idxFirst,:);
        
        % Check better corner (minimize travel)
        % Distances betwen des and corners
        p = [xdes,ydes];
        DistCornerToDes = round(sqrt(sum((p-cornersFirst).^2,2)),4);
        [~,idx] = min(DistCornerToDes);
        
        % Travel to better corner
        XYtravel = cornersFirst(idx,:);
        % Move to nearest corner
        UPVRobotMoveXYZ(app,XYtravel(1)*1e3,XYtravel(2)*1e3,zrob*1e3);
        
        % Update actual path
        % Get actual Robot position
        [xrob,yrob,zrob,~] = UPVRobotGetPos(app);
        xrob = round(xrob*1e-3,4);
        yrob = round(yrob*1e-3,4);
        zrob = round(zrob*1e-3,4);
        
        % Check if path intersect with restricted area
        lineseg = [xrob yrob; xdes ydes];
        [in,~] = intersect(XY,lineseg);
        if isequal(lineseg,in); in = []; end
        if isempty(in); return; end
    end
    
end









