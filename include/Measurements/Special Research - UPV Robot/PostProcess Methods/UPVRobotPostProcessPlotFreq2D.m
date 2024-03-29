function UPVRobotPostProcessPlotFreq2D(app)
% Copyright (C) Jose M. Requena Plens
% joreple@upv.es - jmrplens.github.io

% ===========================================
% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
    'Indeterminate','on');

% ===========================================
% Coords
coords = app.ExtVar.UPVRobotPostProcess.Coords;
x = coords(:,1);
y = coords(:,2);
z = coords(:,3);

X = app.ExtVar.UPVRobotPostProcess.Mesh.Xmatrix;
Y = app.ExtVar.UPVRobotPostProcess.Mesh.Ymatrix;
Z = app.ExtVar.UPVRobotPostProcess.Mesh.Zmatrix;

% Remove dimension equal to one. Example: 10x1x10 -> 10x10
X = squeeze(X);
Y = squeeze(Y);
Z = squeeze(Z);

% ===========================================
% View parameters
FreqView = app.ExtVar.UPVRobotPostProcess.FreqView;
FreqColorAuto = app.ExtVar.UPVRobotPostProcess.FreqColorAuto;
FreqMinRange = app.ExtVar.UPVRobotPostProcess.FreqMinRange;
FreqMaxRange = app.ExtVar.UPVRobotPostProcess.FreqMaxRange;

% ===========================================
% Locate selected frequency
f = app.ExtVar.UPVRobotPostProcess.FreqVec.Data;
idxF = find(f>=FreqView,1,'first');
% Load from .mat if selected new frequency, else work with data in workspace
if  isempty(app.ExtVar.UPVRobotPostProcess.Single_FreqIndex)
    app.ExtVar.UPVRobotPostProcess.Single_FreqIndex = idxF;
end
if idxF ~= app.ExtVar.UPVRobotPostProcess.Single_FreqIndex || isempty(app.ExtVar.UPVRobotPostProcess.PointsSPL_SingleFreq)
    app.ExtVar.UPVRobotPostProcess.Single_FreqIndex = idxF;
    app.ExtVar.UPVRobotPostProcess.PointsSPL_SingleFreq = app.ExtVar.UPVRobotPostProcess.FreqResp.Data(idxF,:);
end
% ===========================================
% Get response for selected frequency
if numel(unique(Z)) == 1 % XY
    FL = scatteredInterpolant(x(:),y(:),app.ExtVar.UPVRobotPostProcess.PointsSPL_SingleFreq(:),'natural','none');
    Zb = FL(X,Y);
elseif numel(unique(X)) == 1 % YZ
    FL = scatteredInterpolant(y(:),z(:),app.ExtVar.UPVRobotPostProcess.PointsSPL_SingleFreq(:),'natural','none');
    Zb = FL(Y,Z);
elseif numel(unique(Y)) == 1 % XZ
    FL = scatteredInterpolant(x(:),z(:),app.ExtVar.UPVRobotPostProcess.PointsSPL_SingleFreq(:),'natural','none');
    Zb = FL(X,Z);
else
    FL = scatteredInterpolant(x(:),y(:),z(:),app.ExtVar.UPVRobotPostProcess.PointsSPL_SingleFreq(:),'natural','none');
    Zb = FL(X,Y,Z);
    
end

% ===========================================
% Axes
ax = app.ExtUI.UPVRobotPostProcessUIAxesFreq2D;
cla(ax,'reset')

% ===========================================
% Plot surface/slice
data = 20*log10(abs(Zb)/2e-5);
sliceType = app.ExtVar.UPVRobotPostProcess.Slice2DType;


% If volumetric measure
if numel(size(data)) == 3
    switch sliceType
        case 'XY'
            % Slice value
            sv = app.ExtVar.UPVRobotPostProcess.SliceXY_Zvalue;
            app.ExtVar.UPVRobotPostProcess.SurfacePlot = slice(ax,X,Y,Z,data,[],[],sv,'linear'); hold(ax,'on')
        case 'XZ'
            % Slice value
            sv = app.ExtVar.UPVRobotPostProcess.SliceXZ_Yvalue;
            app.ExtVar.UPVRobotPostProcess.SurfacePlot = slice(ax,X,Y,Z,data,[],sv,[],'linear'); hold(ax,'on')
        case 'YZ'
            % Slice value
            sv = app.ExtVar.UPVRobotPostProcess.SliceYZ_Xvalue;
            app.ExtVar.UPVRobotPostProcess.SurfacePlot = slice(ax,X,Y,Z,data,sv,[],[],'linear'); hold(ax,'on')
    end
    
    % ===========================================
    % Plot measurement points
    if app.ExtVar.UPVRobotPostProcess.ViewPoints
        scatter3(ax,x,y,z,'k.','linewidth',1)
    end
    
    % ===========================================
    % Boundary
    if app.ExtVar.UPVRobotPostProcess.ViewBoundary
        
        xx = app.ExtVar.UPVRobotPostProcess.SurfacePlot.XData;
        yy = app.ExtVar.UPVRobotPostProcess.SurfacePlot.YData;
        zz = app.ExtVar.UPVRobotPostProcess.SurfacePlot.ZData;
        switch sliceType
            case 'XY'
                k = boundary([xx(:),yy(:)],0.8);
                plot3(ax,xx(k),yy(k),zz(k),'Color',[0,0,0,1],'linewidth',1);
            case 'XZ'
                k = boundary([xx(:),zz(:)],0.8);
                plot3(ax,xx(k),yy(k),zz(k),'Color',[0,0,0,1],'linewidth',1);
            case 'YZ'
                k = boundary([yy(:),zz(:)],0.8);
                plot3(ax,xx(k),yy(k),zz(k),'Color',[0,0,0,1],'linewidth',1);
        end
    end
    
    xlabel(ax,'Lx [m]')
    ylabel(ax,'Ly [m]')
    zlabel(ax,'Lz [m]')
    
    % Limits
    axis(ax,'equal')
    xlim(ax,app.ExtVar.UPVRobotPostProcess.XLim)
    ylim(ax,app.ExtVar.UPVRobotPostProcess.YLim)
    zlim(ax,app.ExtVar.UPVRobotPostProcess.ZLim)
    
    switch sliceType
        case 'XY'
            view(ax,0,90)
            set(ax, 'Ydir', 'reverse')
        case 'XZ'
            view(ax,0,0)
        case 'YZ'
            view(ax,90,0)
    end
    
else
    app.ExtVar.UPVRobotPostProcess.SurfacePlot = surf(ax,X,Y,Z,data);
    switch sliceType
        case 'XY'
            % Slice value
            app.ExtVar.UPVRobotPostProcess.SurfacePlot = pcolor(ax,X,Y,data); hold(ax,'on')
            % Plot measurement points
            if app.ExtVar.UPVRobotPostProcess.ViewPoints
                scatter(ax,x,y,'k.','linewidth',1)
            end
             % Boundary
            if app.ExtVar.UPVRobotPostProcess.ViewBoundary
                xx = app.ExtVar.UPVRobotPostProcess.SurfacePlot.XData;
                yy = app.ExtVar.UPVRobotPostProcess.SurfacePlot.YData;
                k = boundary([xx(:),yy(:)],0.8);
                plot(ax,xx(k),yy(k),'Color',[0,0,0,1],'linewidth',1);
            end
            % Limits
            axis(ax,'equal')
            xlim(ax,app.ExtVar.UPVRobotPostProcess.XLim)
            ylim(ax,app.ExtVar.UPVRobotPostProcess.YLim)
            % Labels
            xlabel(ax,'Lx [m]')
            ylabel(ax,'Ly [m]')
            set(ax, 'Ydir', 'reverse')
        case 'XZ'
            % Slice value
            app.ExtVar.UPVRobotPostProcess.SurfacePlot = pcolor(ax,X,Z,data); hold(ax,'on')
            % Plot measurement points
            if app.ExtVar.UPVRobotPostProcess.ViewPoints
                scatter(ax,x,z,'k.','linewidth',1)
            end
             % Boundary
            if app.ExtVar.UPVRobotPostProcess.ViewBoundary
                xx = app.ExtVar.UPVRobotPostProcess.SurfacePlot.XData;
                zz = app.ExtVar.UPVRobotPostProcess.SurfacePlot.YData;
                k = boundary([xx(:),zz(:)],0.8);
                plot(ax,xx(k),zz(k),'Color',[0,0,0,1],'linewidth',1);
            end
            % Limits
            axis(ax,'equal')
            xlim(ax,app.ExtVar.UPVRobotPostProcess.XLim)
            ylim(ax,app.ExtVar.UPVRobotPostProcess.ZLim)
            % Labels
            xlabel(ax,'Lx [m]')
            ylabel(ax,'Lz [m]')
            
        case 'YZ'
            % Slice value
            app.ExtVar.UPVRobotPostProcess.SurfacePlot = pcolor(ax,Y,Z,data); hold(ax,'on')
            % Plot measurement points
            if app.ExtVar.UPVRobotPostProcess.ViewPoints
                scatter(ax,y,z,'k.','linewidth',1)
            end
            % Boundary
            if app.ExtVar.UPVRobotPostProcess.ViewBoundary
                yy = app.ExtVar.UPVRobotPostProcess.SurfacePlot.XData;
                zz = app.ExtVar.UPVRobotPostProcess.SurfacePlot.YData;
                k = boundary([yy(:),zz(:)],0.8);
                plot(ax,yy(k),zz(k),'Color',[0,0,0,1],'linewidth',1);
            end
            % Limits
            axis(ax,'equal')
            xlim(ax,app.ExtVar.UPVRobotPostProcess.YLim)
            ylim(ax,app.ExtVar.UPVRobotPostProcess.ZLim)
            % Labels
            xlabel(ax,'Ly [m]')
            ylabel(ax,'Lz [m]')
    end
    
end

% ===========================================
% Axes settings
shading(ax,'interp')
h = colorbar(ax);
ylabel(h, 'SPL [dB] (ref. 20\muPa)')
if ~FreqColorAuto
    caxis(ax,[FreqMinRange,FreqMaxRange])
end
colormap(ax,jet(500))
title(ax,sprintf('Frequency: %.0f Hz',f(idxF)))

% ===========================================
% % Close Loading info
drawnow
pause(0.5)
close(d)