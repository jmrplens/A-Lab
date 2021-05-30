function UPVRobotPostProcessPlotTime2D(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% ===========================================
% % Loading info
% d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
%     'Indeterminate','on');

% ===========================================
% Coords
coords = app.ExtVar.UPVRobotPostProcess.Coords;
x = coords(:,1);
y = coords(:,2);
z = coords(:,3);

X = app.ExtVar.UPVRobotPostProcess.Mesh.Xmatrix;
Y = app.ExtVar.UPVRobotPostProcess.Mesh.Ymatrix;
Z = app.ExtVar.UPVRobotPostProcess.Mesh.Zmatrix;

% ===========================================
% Get slice data for plot
sliceType = 'XY';%app.ExtVar.UPVRobotPostProcess.Slice2DType;
switch sliceType
    case 'XY'
        % Slice value
        sv = 0.5;%app.ExtVar.UPVRobotPostProcess.SliceXY_Zvalue;
        % Coords for points and boundary
        % Find nearest value from c of d and set
        [~,idxS]=min(abs(z-sv));
        svp = z(idxS(1));
        % Filter data to slice 'd' value
        idxS = find(z==svp);
        % Points
        xp = x(idxS);
        yp = y(idxS);
        zp = ones(size(xp)) * svp;
        % Get boundary
        k = boundary([xp,yp],0.8);
        % Generate mesh for slice
        xpm = unique(xp);
        ypm = unique(yp);
        [X,Y] = meshgrid(xpm,ypm);
        Z = ones(size(X))*svp;
    case 'XZ'
        % Slice value
        sv = app.ExtVar.UPVRobotPostProcess.SliceXZ_Yvalue;
        % Coords for points and boundary
        % Find nearest value from c of d and set
        [~,idxS]=min(abs(y-sv));
        svp = y(idxS(1));
        % Filter data to slice 'd' value
        idxS = find(y==svp);
        % Points
        xp = x(idxS);
        zp = z(idxS);
        yp = ones(size(xp)) * svp;
        % Get boundary
        k = boundary([xp,zp],0.8);
        % Generate mesh for slice
        xpm = unique(xp);
        zpm = unique(zp);
        [X,Z] = meshgrid(xpm,zpm);
        Y = ones(size(X))*svp;
    case 'YZ'
        % Slice value
        sv = app.ExtVar.UPVRobotPostProcess.SliceYZ_Xvalue;
        % Coords for points and boundary
        % Find nearest value from c of d and set
        [~,idxS]=min(abs(x-sv));
        svp = x(idxS(1));
        % Filter data to slice 'd' value
        idxS = find(x==svp);
        % Points
        yp = y(idxS);
        zp = z(idxS);
        xp = ones(size(yp)) * svp;
        % Get boundary
        k = boundary([yp,zp],0.8);
        % Generate mesh for slice
        ypm = unique(yp);
        zpm = unique(zp);
        [Y,Z] = meshgrid(ypm,zpm);
        X = ones(size(Y))*svp;
end

% ===========================================
% MAT files
% Data .mat in time
mat = app.ExtVar.UPVRobotPostProcess.IRResp;
matT = app.ExtVar.UPVRobotPostProcess.IRtime;

% ===========================================
% Extract data from actual points
datat = zeros(size(matT.Data,1),numel(idxS));
switch app.ExtVar.UPVRobotPostProcess.Multicore
    case 0 % Single core
        for i = 1:numel(idxS)
            datat(:,i) = mat.Data(:,idxS(i));
        end
    case 1 % multicore
        parfor i = 1:numel(idxS)
            datat(:,i) = mat.Data(:,idxS(i)); %#ok<PFBNS>
        end
end

% ===========================================
% Plot

% Axes
axes = app.ExtUI.UPVRobotPostProcessUIAxesTime2D;
cla(axes,'reset')

maxx = max(abs(datat(:)));
minn = min(datat(:));
C = griddata(x(idxS),y(idxS),datat(2,:),X,Y);
ss = surf(axes,X,Y,Z,C);
shading(axes,'interp')
 view(axes,0,90)

axis(axes,'equal') 
 
colormap(axes,bone)
    caxis(axes,[minn,maxx])

for i=100:40:2500
   % C = griddata(x(idxS),y(idxS),datat(i,:),X,Y);
    FL = scatteredInterpolant(x(idxS),y(idxS),datat(i,:)','natural','none');
C = FL(X,Y);
    set(ss,'CData',C)
    drawnow
    pause(0.05)
    
end














%close(d)