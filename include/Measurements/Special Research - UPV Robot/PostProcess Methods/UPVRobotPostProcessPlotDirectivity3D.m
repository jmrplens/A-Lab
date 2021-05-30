function UPVRobotPostProcessPlotDirectivity3D(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% ===========================================
% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
    'Indeterminate','on');

% ===========================================
% Coords
coords = app.ExtVar.UPVRobotPostProcess.Coords;

% ===========================================
% Frequencies selected
freq = app.ExtVar.UPVRobotPostProcess.DirFreq3D;
% Locate selected frequency
f = app.ExtVar.UPVRobotPostProcess.FreqVec.Data;

% ===========================================
% Frequency response (FFT or 3rd octave)
switch app.ExtVar.UPVRobotPostProcess.DirDataType
    
    case 'FFT'
        % Locate frequency
        idxF = find(f>=freq,1,'first');
        % Get data
        data = app.ExtVar.UPVRobotPostProcess.FreqResp.Data(idxF,:);
    case '3rd Octave'
        % Get data
        mat = app.ExtVar.UPVRobotPostProcess.FreqResp;
        points = size(coords,1);
        data = zeros(numel(freq),points);
        switch app.ExtVar.UPVRobotPostProcess.Multicore
            case 0 % Single core
                for ii = 1:points
                    datatemp = mat.Data(:,ii);
                    [data(:,ii),~,~,~] = FFT2octave(f,abs(datatemp),3,'',false,[],freq);
                end
            case 1 % Multicore
                parfor ii = 1:points
                    datatemp = mat.Data(:,ii); %#ok<PFBNS>
                    [data(:,ii),~,~,~] = FFT2octave(f,abs(datatemp),3,'',false,[],freq);
                end
        end
end

% ===========================================
% Reference
switch app.ExtVar.UPVRobotPostProcess.DirReference
    case '20µPa'
        Pmax = 2e-5;
    case 'Relative'
        % Relative reference
        Pmax = max(abs(data),[],2);
end

% ===========================================
% Calc
switch app.ExtVar.UPVRobotPostProcess.DirUnits
    case 'dB'
        data = 20*log10(abs(data ./ Pmax));
    case 'Pa'
        data = abs(data);
end


% ======================================================================================
% Plot 3D from Hor/Ver coords or Hemisphere

% ===========================================
% Axes
ax = app.ExtUI.Directivity3DAxes;
try
    warning off
    cla(ax,'reset')
    warning on
catch
end

switch app.ExtVar.UPVRobotPostProcess.DirectivityType
    case 'Hor/Ver' % Process data Hor/Ver to get 3D Polar Plot (based on matlab function 'patternFromSlices')
        
        % ===========================================
        % Find point for horizontal plane and vertical plane
        idxH = find(app.ExtVar.UPVRobotPostProcess.DirThetaCoords==90);
        switch app.ExtVar.UPVRobotPostProcess.DirDirection
            case 'Front/Back'
                idxV = find(app.ExtVar.UPVRobotPostProcess.DirPhiCoords==-90);
            case 'Front'
                idxV = find(app.ExtVar.UPVRobotPostProcess.DirPhiCoords==0);
        end
        
        % ===========================================
        % Angles
        theta = unique(app.ExtVar.UPVRobotPostProcess.DirThetaCoords);
        phi   = unique(app.ExtVar.UPVRobotPostProcess.DirPhiCoords);
        
        % ===========================================
        % If only Horizontal or only vertical, repeat data with 21 points
        % resolution
        if numel(idxV) == 1 % Horizontal
            idxV = repmat(idxV,21,1);
            theta = linspace(0,180,21);
        end
        if numel(idxH) == 1 % Vertical
            idxH = repmat(idxH,21,1);
            phi = linspace(-90,90,21);
        end
        
        % ===========================================
        % Data
        vertSlice  = data(idxV);
        horizSlice = data(idxH);
        % Sort data
        [theta,idx] = sort(theta);
        vertSlice = vertSlice(idx);
        [phi,idx] = sort(phi);
        horizSlice = horizSlice(idx);
        
        % ===========================================
        % Format data
        
        switch app.ExtVar.UPVRobotPostProcess.DirUnits
            case 'dB'
                % Normalize before sum
                maxDirectivity = max(max(vertSlice),max(horizSlice));
                vertSliceNorm  = vertSlice - maxDirectivity;
                horizSliceNorm = horizSlice - maxDirectivity;
                % Mesh data
                [vertMeshLog,horizMeshLog] = meshgrid(vertSliceNorm,horizSliceNorm);
                % Combine Vertical and Horizontal data
                data = vertMeshLog + horizMeshLog;
                % Rescale magnitude
                Mag  = data + maxDirectivity;
            case 'Pa'
                % Normalize before sum
                maxDirectivity = max(max(vertSlice),max(horizSlice));
                vertSliceNorm  = vertSlice / maxDirectivity;
                horizSliceNorm = horizSlice / maxDirectivity;
                % Mesh data
                [vertMeshLog,horizMeshLog] = meshgrid(vertSliceNorm,horizSliceNorm);
                % Combine Vertical and Horizontal data
                data = vertMeshLog + horizMeshLog;
                % Rescale magnitude
                Mag  = data * maxDirectivity;
        end
        
        % Get radius with normalized values of Mag
        minval = min(min(Mag));
        r = Mag - minval;
        r = reshape(r,[length(phi),length(theta)]);
        r = r./max(max(r)); % Normalize
        
        % Reshape data
        Mag = reshape(Mag,length(phi),length(theta));
        
        % Mesh angles
        [theta,phi] = meshgrid(theta, phi);
        
    case 'Hemisphere' % Process data Hemisphere to get 3D Polar Plot (based on matlab function 'patternCustom')
        
        % ===========================================
        % Angles column vector
        theta = app.ExtVar.UPVRobotPostProcess.DirThetaCoords(:);
        phi   = app.ExtVar.UPVRobotPostProcess.DirPhiCoords(:);
        
        % ===========================================
        % Format data
        
        % Search and copy data (single points on top and bottom) for
        % decompose polar to cartesian.
        % This is necessary because in theta=0 and theta=180, there is only one measurement point 
        % when there should be as many as phi values
        tn = numel(unique(theta))-1;
        pn = numel(unique(phi))-1;
        % Top point
        idx1 = find(phi==-90 & theta==0);
        % Bottom point
        idx2 = find(phi==-90 & theta==180);
        % Copy data
        if tn == pn
            theta = [theta;ones(tn,1)*theta(idx1);ones(pn,1)*theta(idx2)];
            phi = [phi;ones(tn,1)*phi(idx1);ones(pn,1)*phi(idx2)];
            data = [data,ones(1,tn)*data(idx1),ones(1,pn)*data(idx2)];
        elseif pn > tn
            theta = [theta;ones(tn*2,1)*theta(idx1);ones(pn,1)*theta(idx2)];
            phi = [phi;ones(tn*2,1)*phi(idx1);ones(pn,1)*phi(idx2)];
            data = [data,ones(1,tn*2)*data(idx1),ones(1,pn)*data(idx2)];
        else
%             theta = [theta;ones(tn,1)*theta(idx1);ones(tn,1)*theta(idx1);ones(pn,1)*theta(idx2)];
%             phi = [phi;ones(tn,1)*phi(idx1);ones(tn,1)*phi(idx1);ones(pn,1)*phi(idx2)];
%             data = [data,ones(1,tn)*data(idx1),ones(1,tn)*data(idx1),ones(1,pn)*data(idx2)];
        end
        
        % Unique values for theta and phi and length
        thetaplot = unique(theta,'sorted');
        phiplot = unique(phi,'sorted');
        Ltheta = length(thetaplot);
        Lphi = length(phiplot);
        
        % Sort data
        phithetacomb = [phi, theta];
        [~,idx] = sortrows(phithetacomb,2);
        Magtmp  = data(idx);
        Mag = reshape(Magtmp,[Lphi, Ltheta]);
        
        % Get radius with normalized values of Mag
        minval = min(min(Mag));
        r = Mag - minval;
        r           = reshape(r,[Lphi,Ltheta]);
        r           = r./max(max(r)); % Normalize
        
        % Mesh angles for surf plot
        [theta,phi] = meshgrid(thetaplot, phiplot);
        
end

% ===========================================
% If Force 360, Theta angle max = 360, Phi max = 180
if app.ExtVar.UPVRobotPostProcess.Dir360
    phi = [flipud(-phi(2:end,:)+min(phi));(phi-min(phi))];
    theta = [flipud(theta(2:end,:));(theta)];
    Mag = [flipud(Mag(2:end,:));Mag];
    r = [flipud(r(2:end,:));r];
end

% ===========================================
% Smooth
if app.ExtVar.UPVRobotPostProcess.DirSmooth
    
    % Level
    lev = app.ExtVar.UPVRobotPostProcess.DirSmoothLev;
    % Size
    ny = min(size(theta));
    nx = min(size(phi));
    n = min([nx,ny]);
    sz = round(lev/100 * n);
    % Filter
    Mag = conv2(Mag, ones(sz)/(sz^2), 'same');
    r = conv2(r, ones(sz)/(sz^2), 'same');
    r = r./max(max(r)); % Normalize
end

% ===========================================
% To cart
[X,Y,Z] = sph2cartPattern(phi, theta, r);

% ===========================================
% Plot
hold(ax,'on');

% Surf / 3D data
ss = surf(ax,X,Y,Z,Mag, 'FaceColor','interp'); % Facecolor for prevent error
shading(ax,'interp')

% Rotate
rotate(ss,[0 0 1],app.ExtVar.UPVRobotPostProcess.DirRotateHor,[0,0,0])
rotate(ss,[0 -1 0],app.ExtVar.UPVRobotPostProcess.DirRotateVer,[0,0,0])

% Axes
if app.ExtVar.UPVRobotPostProcess.Dir3DAxisCart
    drawCartAxes(ax)    % Axes X, Y, Z
end
if app.ExtVar.UPVRobotPostProcess.Dir3DAxisArrows
    drawPolarAxes(ax)   % Axes Elevation azimuth information
end
% Circles
if app.ExtVar.UPVRobotPostProcess.Dir3DAxisPolar
draw_circle(90, 1:1:360, ax,'b'); % Circle in the x-y plane
draw_circle(1:1:360, 0, ax, 'g'); % Circle in the x-z plane
draw_circle(1:1:360,90, ax, 'r'); % Circle in the y-z plane
end
% Axis settings
axis(ax,'vis3d')
axis(ax,[-1.2 1.2 -1.2 1.2 -1.2 1.2]);
axis(ax,'off')
axis(ax,'equal')
colormap(ax,jet(256));
view(ax,135,20);
hold(ax,'off');
% z = zoom(ax);
% z.setAxes3DPanAndZoomStyle(ax,'camera');

% Colorbar
c = colorbar(ax);
a =  c.Position;
set(c,'Position',[a(1) a(2) a(3) a(4)*0.95])% To change size
switch app.ExtVar.UPVRobotPostProcess.DirUnits
    
    case 'dB'
        switch app.ExtVar.UPVRobotPostProcess.DirReference
            case '20µPa'
                ylabel(c, 'SPL [dB] (ref. 20\muPa)');
                
            case 'Relative'
                ylabel(c, 'SPL [dB] (dBFS)');
        end
        
    case 'Pa'
        ylabel(c, 'Pressure [Pa]');
end
if app.ExtVar.UPVRobotPostProcess.DirRangeAuto
    app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMinField.Value = round(c.Limits(1),1);
    app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMaxField.Value = round(c.Limits(2),1);
else
    Min = app.ExtVar.UPVRobotPostProcess.DirMinRange;
    Max = app.ExtVar.UPVRobotPostProcess.DirMaxRange;
    caxis(ax,[Min,Max])
end
rotate3d(ax,'on')
set(ax,'CameraViewAngleMode','Manual')
ax.CameraPosition = [15.05,15.05,7.75];
ax.CameraTarget = [0,0,0];
ax.CameraViewAngle = 6.6086;
ax.Clipping = 'off';
hold(ax,'off');

% ===========================================
% % Close Loading info
drawnow
pause(0.5)
close(d)


function draw_circle (theta, phi, ax, color)
[theta,phi] = meshgrid(theta, phi);
[X,Y,Z] = sph2cartPattern(phi, theta, 1.1);
p = plot3(ax,X,Y,Z,color,'LineWidth',2);
p.Color(4) = 1; % Alpha

function drawCartAxes(ax)
%   Copyright 2015-2020 The MathWorks, Inc.
rax      = 1.2;
plot3( ax, [0,rax],[0,0],[0,0],'r','LineWidth',1.5 );
text(ax,1.1*rax,0,0, 'x');
plot3( ax, [0,0],[0,rax],[0,0],'g','LineWidth',1.5 );
text(ax,0,1.05*rax,0, 'y');
plot3( ax, [0,0],[0,0],[0,rax],'b','LineWidth',1.5 );
text(ax,0,0,1.05*rax, 'z');

function drawPolarAxes(ax)
%   Copyright 2015-2020 The MathWorks, Inc.
XPos = 1.15;
draw_arrow(ax,[XPos 0],[XPos 0.2],1.5, 0, 'xy');
text(ax,1.2,0.22,0.0, texlabel('az'));
draw_arrow(ax,[XPos 0],[XPos 0.2],1.5,  0, 'xz');
text(ax,1.2,-0.025,0.25, texlabel('el'));

function draw_arrow(ax,startpoint,endpoint,headsize, offset, plane)
%   Copyright 2015-2020 The MathWorks, Inc.
v1 = headsize*(startpoint-endpoint)/2.5;
theta      = 22.5*pi/180;
theta1     = -1*22.5*pi/180;
rotMatrix  = [cos(theta) -sin(theta) ; sin(theta) cos(theta)];
rotMatrix1 = [cos(theta1) -sin(theta1) ; sin(theta1) cos(theta1)];
v2 = v1*rotMatrix;
v3 = v1*rotMatrix1;
x1 = endpoint;
x2 = x1 + v2;
x3 = x1 + v3;
if strcmpi(plane, 'xy')
    fill3(ax,[x1(1) x2(1) x3(1)],[x1(2) x2(2) x3(2)],[offset offset offset],'k');
    plot3(ax,[startpoint(1) endpoint(1)],[startpoint(2) endpoint(2)],      ...
        [offset offset],'linewidth',1.5,'color','k');
elseif strcmpi(plane,'xz')
    fill3(ax,[x1(1) x2(1) x3(1)],[offset offset offset],[x1(2) x2(2) x3(2)],'k');
    plot3(ax,[startpoint(1) endpoint(1)],[offset offset],                  ...
        [startpoint(2) endpoint(2)],'linewidth',1.5,'color','k');
elseif strcmpi(plane,'yz')
    fill3(ax,[offset offset offset],[x1(1) x2(1) x3(1)],[x1(2) x2(2) x3(2)],'k');
    plot3(ax,[offset offset],[startpoint(1) endpoint(1)],                  ...
        [startpoint(2) endpoint(2)],'linewidth',1.5,'color','k');
end