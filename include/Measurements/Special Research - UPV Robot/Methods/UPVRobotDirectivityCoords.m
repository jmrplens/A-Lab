function [X,Y,Z] = UPVRobotDirectivityCoords(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Type (Hor/Ver or Hemisphere)
type = app.ExtVar.UPVRobot.DirectivityType;


%  Main params
r = app.ExtVar.UPVRobot.dirR;
position = app.ExtVar.UPVRobot.DirPosition;
ori = app.ExtVar.UPVRobot.DirOri;

switch type
    case 'Hor/Ver'
        
        % Angle parameters
        incPhi   = round(app.ExtVar.UPVRobot.incPhi,2);
        incTheta = round(app.ExtVar.UPVRobot.incTheta,2);
        
        % Check to ensure get 0 to 180 (inclusive) values and with a single value on 90 
        if incPhi > 0; incPhi = stableInc(incPhi); end
        if incTheta > 0; incTheta = stableInc(incTheta); end
        % Update
        app.ExtVar.UPVRobot.incPhi = incPhi;
        app.ExtUI.UPVRobotDirectivityHorVerIncPhi.Value = incPhi;
        app.ExtVar.UPVRobot.incTheta = incTheta;
        app.ExtUI.UPVRobotDirectivityHorVerIncTheta.Value = incTheta;
        
        % Mod for FrontBack or Front measure
        direction = app.ExtVar.UPVRobot.DirDirection;
        switch direction
            case 'Front/Back'
                rot = -90;
            case 'Front'
                rot = 0;
        end
        
        % Initial angles
        degphi = -90:incPhi:90;
        degtheta = 0:incTheta:180;
        
        % Initialize angle array
        phi = []; theta = [];
        
        % Horizontal
        if incPhi > 0
            % Angles
            phi = [phi,degphi];
            theta = [theta,ones(size(degphi))*90];
            % Position theta
            switch position
                case 'North'; phi = phi - 90;
                case 'West';  phi = phi - 180;
                case 'South';  phi = phi + 90;
                case 'East' % Nothing
            end
        end
        
        % Vertical
        if incTheta > 0
        theta = [theta,degtheta];
            % Position phi
            switch position
                case 'North'; phi = [phi,zeros(size(degtheta)) - 90 + rot];
                case 'West';  phi = [phi,zeros(size(degtheta)) - 180 + rot];
                case 'South'; phi = [phi,zeros(size(degtheta)) + 90 + rot];
                case 'East';  phi = [phi,zeros(size(degtheta)) + rot];
            end
        end
        
        % Points
        [x,y,z] = sph2cartPattern(phi, theta, r);
        
        
        % Remove duplicates
        [uni,idx] = unique([round(x(:),8),round(y(:),8),round(z(:),8)],'row','stable');
        X = uni(:,1);
        Y = uni(:,2);
        Z = uni(:,3);
        
        % Store standard angles (phi -90 to 90, theta 0 to 180)
        phiST = []; thetaST = [];
        if incPhi > 0
            phiST = [phiST,degphi];
            thetaST = [thetaST,ones(size(degphi))*90];
        end
        if incTheta > 0
            phiST = [phiST,zeros(size(degtheta))+rot];
            thetaST = [thetaST,degtheta];
        end
        thetaST = thetaST(idx);
        phiST = phiST(idx);
        
        
        
    case 'Hemisphere'
       
        
        incPhi   = round(app.ExtVar.UPVRobot.incPhiHemi,2);
        incTheta = round(app.ExtVar.UPVRobot.incThetaHemi,2);
        
        % Check to ensure get 0 to 180 (inclusive) values and with a single value on 90
        if incPhi > 0; incPhi = stableInc(incPhi); end
        if incTheta > 0; incTheta = stableInc(incTheta); end
        % Update
        app.ExtVar.UPVRobot.incPhiHemi = incPhi;
        app.ExtUI.UPVRobotDirectivityHemisphereIncPhi.Value = incPhi;
        app.ExtVar.UPVRobot.incThetaHemi = incTheta;
        app.ExtUI.UPVRobotDirectivityHemisphereIncTheta.Value = incTheta;
        
        
        % Initial angles
        phi = -90:incPhi:90;
        theta = 0:incTheta:180;
        
        [phi,theta]=meshgrid(phi,theta);

        % Scan route format through Z axis (Up&Down)
        for i = 2:size(theta,2)
            if mod(i,2) == 0
            theta(:,i) = flipud(theta(:,i));
            end
        end
        
        % Standard angles (phi -90 to 90, theta 0 to 180)
        phiST = phi;
        thetaST = theta;
        
        % Position phi
        switch position
            case 'North'; phi = phi - 90;
            case 'West'; phi = phi - 180;
            case 'South'; phi = phi + 90;  
            case 'East' % Nothing
        end
        
        % Points
        [x,y,z] = sph2cartPattern(phi, theta, r);
        
        % Remove duplicates
        [uni,idx] = unique([round(x(:),8),round(y(:),8),round(z(:),8)],'row','stable');
        X = uni(:,1);
        Y = uni(:,2);
        Z = uni(:,3);
        
        % Store standard angles  (phi -90 to 90, theta 0 to 180)
        thetaST = thetaST(idx);
        phiST = phiST(idx);
        
end

% Add origin
X = X + ori(1);
Y = Y + ori(2);
Z = Z + ori(3);

app.ExtVar.UPVRobot.DirThetaCoords = thetaST(:);
app.ExtVar.UPVRobot.DirPhiCoords = phiST(:);


% Remove outliers if needed
XLen = app.ExtVar.UPVRobot.XLen;
YLen = app.ExtVar.UPVRobot.YLen;
ZLen = app.ExtVar.UPVRobot.ZLen;
idx = X>XLen | Y>YLen | Z>ZLen | X<0 | Y<0 | Z<0;
X(idx) = [];
Y(idx) = [];
Z(idx) = [];
app.ExtVar.UPVRobot.DirThetaCoords(idx) = [];
app.ExtVar.UPVRobot.DirPhiCoords(idx) = [];

function ang = stableInc(ang)
if mod(180,ang) ~=0 || isempty(find(0:ang:180==90, 1))
    aux = ang;
    while mod(180,aux)~=0 || isempty(find(0:aux:180==90, 1))
        aux = round(aux + 0.01,2);
        if aux>90
            aux = 5;
            break;
        end
    end
    ang = aux;
end