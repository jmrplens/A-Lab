function UPVRobotPostProcessPlotFreq2D(app)


% Slice type
slice = app.ExtVar.UPVRobotPostProcess.Slice2DType;

% Load data
coords = app.ExtVar.UPVRobotPostProcess.Coords;

% Get slice
switch slice
    case 'XY'
        a = coords(:,1);
        b = coords(:,2);
        c = coords(:,3);
        d = app.ExtVar.UPVRobotPostProcess.SliceXY_Zvalue;
    case 'XZ'
        a = coords(:,1);
        b = coords(:,3);
        c = coords(:,2);
        d = app.ExtVar.UPVRobotPostProcess.SliceXZ_Yvalue;
    case 'YZ'
        a = coords(:,2);
        b = coords(:,3);
        c = coords(:,1);
        d = app.ExtVar.UPVRobotPostProcess.SliceYZ_Xvalue;
end
% Filter data to slice 'd' value
idx = find(c==d);
a = a(idx);
b = b(idx);
d = ones(size(a)) * d;
% x = coords(:,1);
% y = coords(:,2);
% z = coords(:,3);

ua = unique(a);
ub = unique(b);
ud = unique(d);


[A,B,D] = meshgrid(ua, ub, ud);

% Get boundary
k = boundary(a,b,0.8);


% Load data
f = app.ExtVar.UPVRobotPostProcess.FreqVec;
H = app.ExtVar.UPVRobotPostProcess.FreqResp;

% View parameters
FreqView = app.ExtVar.UPVRobotPostProcess.FreqView;
FreqColorAuto = app.ExtVar.UPVRobotPostProcess.FreqColorAuto;
FreqMinRange = app.ExtVar.UPVRobotPostProcess.FreqMinRange;
FreqMaxRange = app.ExtVar.UPVRobotPostProcess.FreqMaxRange;

% Locate selected frequency
idx = find(f>=FreqView,1,'first');

freqResp = H(idx,:);
FL = scatteredInterpolant(a(:),b(:),freqResp(:),'natural','none');
Zb = FL(A,B);


% Axes
ax = app.ExtUI.UPVRobotPostProcessUIAxesFreq2D;
cla(ax,'reset')

% Plot surface
surf(ax,A,B,D,20*log10(abs(Zb)/2e-5))
hold(ax,'on')

% Plot measurement points
if app.ExtVar.UPVRobotPostProcess.ViewPoints
    scatter3(ax,a,b,d,'k.','linewidth',1)
end

% Plot boundary
if app.ExtVar.UPVRobotPostProcess.ViewBoundary
    plot3(ax,a(k),b(k),d(k),'k','linewidth',1)
end

% Axes settings
shading(ax,'interp')
view(ax,[0,-90])
axis(ax,'equal')
h = colorbar(ax);
ylabel(h, 'SPL (dB)')
if ~FreqColorAuto
    caxis(ax,[FreqMinRange,FreqMaxRange])
end
colormap(ax,jet(1000))
xlim(ax,app.ExtVar.UPVRobotPostProcess.XLim)
ylim(ax,app.ExtVar.UPVRobotPostProcess.YLim)
zlim(ax,app.ExtVar.UPVRobotPostProcess.ZLim)
xlabel(ax,'Lx (m)')
ylabel(ax,'Ly (m)')
zlabel(ax,'Lz (m)')
title(ax,sprintf('Frequency: %.0f Hz',f(idx)))