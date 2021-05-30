function [X,Y,Z] = UPVRobotGeometricCoords(app)
% This function generates the coordinates of different geometric shapes:
% - circumference
% - circle (multiple circumferences)
% - rectangle
% - polygon
% - sphere (equal surface sphere)
%
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

type = app.ExtVar.UPVRobot.GeometricCoords.Shape;
plane = app.ExtVar.UPVRobot.GeometricCoords.Plane;

% General parameter

% Robot parameter
XLen = app.ExtVar.UPVRobot.XLen;
YLen = app.ExtVar.UPVRobot.YLen;
ZLen = app.ExtVar.UPVRobot.ZLen;


switch lower(type)
    
    case 'circumference'
        % =======================================================================
        
        % Parameters
        x0 = app.ExtVar.UPVRobot.GeometricCoords.CircumCenterX;
        y0 = app.ExtVar.UPVRobot.GeometricCoords.CircumCenterY;
        z0 = app.ExtVar.UPVRobot.GeometricCoords.CircumCenterZ;
        radius = app.ExtVar.UPVRobot.GeometricCoords.CircumRadius;
        circres = app.ExtVar.UPVRobot.GeometricCoords.CircumRes;
        
        % Generate circumference
        theta = linspace(0, 2*pi, circres+1); % Angles
        theta(end) = []; % Remove repeated (0 and 2*pi is the same point)
        X = radius * cos(theta'); % Circumference coords
        Y = radius * sin(theta');
        
        % Coords
        X = X(:);
        Y = Y(:);
        
    case 'circle'
        % =======================================================================
        
        % Parameters
        x0 = app.ExtVar.UPVRobot.GeometricCoords.CircleCenterX;
        y0 = app.ExtVar.UPVRobot.GeometricCoords.CircleCenterY;
        z0 = app.ExtVar.UPVRobot.GeometricCoords.CircleCenterZ;
        circles = app.ExtVar.UPVRobot.GeometricCoords.CircleNum;
        radius = app.ExtVar.UPVRobot.GeometricCoords.CircleMaxRadius;
        circres = app.ExtVar.UPVRobot.GeometricCoords.CircleRes;
        radius = linspace(0,radius,circles);
        
        % First coordinate
        X = 0;
        Y = 0;
        
        % Generate circles
        for i=2:numel(radius)
            theta = linspace(0, 2*pi, 10*radius(i)*circres); % Angles for circle 'i'
            x = radius(i) * cos(theta'); % Circle coords for circle 'i'
            y = radius(i) * sin(theta');
            x(1) = []; % Remove first element (is equal of end value)
            y(1) = [];
            X = [X;x]; %#ok<*AGROW>
            Y = [Y;y];
        end
        
        % Coords
        X = X(:);
        Y = Y(:);
        
    case 'rectangle'
        % =======================================================================
        
        % Parameters
        x0 = app.ExtVar.UPVRobot.GeometricCoords.RectangleOriginX;
        y0 = app.ExtVar.UPVRobot.GeometricCoords.RectangleOriginY;
        z0 = app.ExtVar.UPVRobot.GeometricCoords.RectangleOriginZ;
        resH = app.ExtVar.UPVRobot.GeometricCoords.RectangleResH;
        resV = app.ExtVar.UPVRobot.GeometricCoords.RectangleResV;
        sideH = app.ExtVar.UPVRobot.GeometricCoords.RectangleLenH;
        sideV = app.ExtVar.UPVRobot.GeometricCoords.RectangleLenV;
        
        % Sides array
        sH = linspace(0,sideH,resH)';
        sV = linspace(0,sideV,resV)';
        
        % Coords
        X = [
            sH(2:end-1);            % Base
            ones(resV-1,1)*sideH;   % Right side
            flipud(sH(2:end));      % Top
            zeros(resV,1)     % Left side
            ];
        Y = [
            zeros(resH-1,1);  % Base
            sV(2:end-1);            % Rigth side
            ones(resH-1,1)*sideV;   % Top
            flipud(sV(1:end))       % Left side
            ];
        
        % Coords
        X = X(:);
        Y = Y(:);
        
        
    case 'polygon'
        % =======================================================================
        
        % Parameters
        x0 = app.ExtVar.UPVRobot.GeometricCoords.PolyCenterX;
        y0 = app.ExtVar.UPVRobot.GeometricCoords.PolyCenterY;
        z0 = app.ExtVar.UPVRobot.GeometricCoords.PolyCenterZ;
        sides = app.ExtVar.UPVRobot.GeometricCoords.PolySides;
        len = app.ExtVar.UPVRobot.GeometricCoords.PolyLenSide;
        restheta = app.ExtVar.UPVRobot.GeometricCoords.PolyRes;
        
        % Generate polygon
        pol = nsidedpoly(sides,'SideLength',len,'Center',[0,0]);
        % Vertex of polygon
        vertex = pol.Vertices;
        
        % Generate resolution
        X = [];
        Y = [];
        for i = 2:size(vertex,1)
            X = [X,linspace(vertex(i-1,1),vertex(i,1),restheta)];
            Y = [Y,linspace(vertex(i-1,2),vertex(i,2),restheta)];
            X(end) = [];
            Y(end) = [];
        end
        X = [X,linspace(vertex(end,1),vertex(1,1),restheta)];
        Y = [Y,linspace(vertex(end,2),vertex(1,2),restheta)];
        X(end) = [];
        Y(end) = [];
        
        % Coords
        X = X(:);
        Y = Y(:);
        
        
    case 'sphere'
        % =======================================================================
        
        % Parameters
        x0 = app.ExtVar.UPVRobot.GeometricCoords.SphereCenterX;
        y0 = app.ExtVar.UPVRobot.GeometricCoords.SphereCenterY;
        z0 = app.ExtVar.UPVRobot.GeometricCoords.SphereCenterZ;
        r = app.ExtVar.UPVRobot.GeometricCoords.SphereRadius;
        restheta = app.ExtVar.UPVRobot.GeometricCoords.SphereThetaRes;
        resphi = app.ExtVar.UPVRobot.GeometricCoords.SpherePhiRes-1;
        
        % Angles to equal surface sphere
        theta = linspace(0,2*pi,restheta+1);
        delta_theta = 2*pi/(restheta);
        delta_S = delta_theta / (resphi/2);
        phi = 1 - (0:1:resphi) * delta_S / (delta_theta);
        phi = acos(phi);
        
        % Matriz de angulares
        [T,P] = ndgrid(theta,phi);
        
        % Sphere coords
        X = r * cos(T) .* sin(P);
        Y = r * sin(T) .* sin(P);
        Z = r * cos(P);
        
        % Round to 0.1 mm
        X = round(X,4);
        Y = round(Y,4);
        Z = round(Z,4);
        
        % Reshape for order in one direction in uniqueCoords
        % Vertical: Through Z axis (from -Z to Z). Without ' for
        % horizontal mode
        Xr = reshape(X',[],1);
        Yr = reshape(Y',[],1);
        Zr = reshape(Z',[],1);
        
        
        % Single coords (not repeated)
        uniqueCoords = unique([Xr(:),Yr(:),Zr(:)],'rows','stable');
        
        % Coords
        X = uniqueCoords(:,1);
        Y = uniqueCoords(:,2);
        Z = uniqueCoords(:,3);

        % Coords
        X = X(:);
        Y = Y(:);
        Z = Z(:);
        
end

switch plane
    
    case 'XY'
        X = X+x0;
        Y = Y+y0;
        Z = ones(numel(X),1)*z0;
    case 'XZ'
        X = X+x0;
        Z = Y+z0;
        Y = ones(numel(X),1)*y0;
    case 'YZ'
        Y = Y+y0;
        Z = X+z0;
        X = ones(numel(X),1)*x0;
    otherwise % 3D
        X = X+x0;
        Y = Y+y0;
        Z = Z+z0;
end

% =======================================================================
% Remove clipping coords

idx = find(X>XLen | X<0);
idx = [idx;find(Y>YLen | Y<0)];
idx = [idx;find(Z>ZLen | Z<0)];

X(idx) = [];
Y(idx) = [];
Z(idx) = [];
