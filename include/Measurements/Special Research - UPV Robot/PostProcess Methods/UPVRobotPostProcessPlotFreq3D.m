function UPVRobotPostProcessPlotFreq3D(app)
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

% ===========================================
% Load data
f = app.ExtVar.UPVRobotPostProcess.FreqVec.Data;

% ===========================================
% View parameters
FreqView = app.ExtVar.UPVRobotPostProcess.FreqView;
FreqColorAuto = app.ExtVar.UPVRobotPostProcess.FreqColorAuto;
FreqMinRange = app.ExtVar.UPVRobotPostProcess.FreqMinRange;
FreqMaxRange = app.ExtVar.UPVRobotPostProcess.FreqMaxRange;

% ===========================================
% Locate selected frequency
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
FL = scatteredInterpolant(x(:),y(:),z(:),app.ExtVar.UPVRobotPostProcess.PointsSPL_SingleFreq(:),'natural','none');
Zb = FL(X,Y,Z);


% ===========================================
% Axes
ax = app.ExtUI.UPVRobotPostProcessUIAxesFreq3D;
if isempty(ax.Children)
    Viewpre = [20,20];
else
    Viewpre = ax.View;
end
cla(ax,'reset')


% ===========================================
% Main plot
data = 20*log10(abs(Zb)/2e-5);
mindata = round(min(data(:)),1);
maxdata = round(max(data(:)),1);
switch lower(app.ExtVar.UPVRobotPostProcess.ViewType3D)
    case '3 slice'
        % Plot surface with 3 slice
        zslice = app.ExtVar.UPVRobotPostProcess.XYsliderValue;
        yslice = app.ExtVar.UPVRobotPostProcess.XZsliderValue;
        xslice = app.ExtVar.UPVRobotPostProcess.YZsliderValue;
        app.ExtVar.UPVRobotPostProcess.SlicesPlot = slice(ax,X,Y,Z,data,xslice,yslice,zslice,'linear');
    case 'multi'
        zslices = app.ExtVar.UPVRobotPostProcess.XYslicesValues;
        yslices = app.ExtVar.UPVRobotPostProcess.XZslicesValues;
        xslices = app.ExtVar.UPVRobotPostProcess.YZslicesValues;
        app.ExtVar.UPVRobotPostProcess.SlicesPlot = slice(ax,X,Y,Z,data,xslices,yslices,zslices,'linear');
    case 'iso'
        % Check if the valueof ISO is above or below the data and correct
        if app.ExtVar.UPVRobotPostProcess.FISOvalue < mindata
            app.ExtVar.UPVRobotPostProcess.FISOvalue = mindata;
            app.ExtUI.UPVRobotPostProcessFreq3DIsoSPLdBEditField.Value = app.ExtVar.UPVRobotPostProcess.FISOvalue;
        end
        if app.ExtVar.UPVRobotPostProcess.FISOvalue > maxdata
            app.ExtVar.UPVRobotPostProcess.FISOvalue = maxdata;
            app.ExtUI.UPVRobotPostProcessFreq3DIsoSPLdBEditField.Value = app.ExtVar.UPVRobotPostProcess.FISOvalue;
        end
        
        ISOValue = app.ExtVar.UPVRobotPostProcess.FISOvalue;
        % Round values to 1 decimal
        data = round(data,1);
        
        % Smooth data
        dataq = []; Xq = [];
        if app.ExtVar.UPVRobotPostProcess.FISOSmooth
            switch app.ExtVar.UPVRobotPostProcess.Multicore
                case 0 % Single core
                    dataq = interp3(data,3,'cubic');
                    Xq = interp3(X,3,'cubic');
                    Yq = interp3(Y,3,'cubic');
                    Zq = interp3(Z,3,'cubic');
                case 1 % multicore
                    pardat = struct();
                    parfor ii = 1:4
                        switch ii
                            case 1
                                pardat(ii).dataq = interp3(data,3,'cubic');
                            case 2 
                                pardat(ii).Xq = interp3(X,3,'cubic');
                            case 3
                                pardat(ii).Yq = interp3(Y,3,'cubic');
                            case 4
                                pardat(ii).Zq = interp3(Z,3,'cubic');
                        end
                    end
                    Xq = pardat(2).Xq; Yq = pardat(3).Yq; Zq = pardat(4).Zq; dataq = pardat(1).dataq;
            end
        else
            Xq = X; Yq = Y; Zq = Z; dataq = data;
        end
        
        % ISO Surface
        app.ExtVar.UPVRobotPostProcess.ISOsurf = patch(ax,isosurface(Xq,Yq,Zq,dataq,ISOValue,dataq));
        isonormals(X,Y,Z,data,app.ExtVar.UPVRobotPostProcess.ISOsurf)
        
        % Upper values
        if app.ExtVar.UPVRobotPostProcess.FISOUpper
            patch(ax,isocaps(X,Y,Z,data,ISOValue,'enclose','above'));
        end
        
        % Lower values
        if app.ExtVar.UPVRobotPostProcess.FISOLower
            patch(ax,isocaps(X,Y,Z,data,ISOValue,'enclose','below'));
        end
        
end

% ===========================================
% Lighting
camlight(ax,'headlight','local');
switch lower(app.ExtVar.UPVRobotPostProcess.ViewType3D)
    case {'3 slice','multi'}
        if app.ExtVar.UPVRobotPostProcess.ViewLight
            for i=1:numel(app.ExtVar.UPVRobotPostProcess.SlicesPlot)
                app.ExtVar.UPVRobotPostProcess.SlicesPlot(i).AmbientStrength = 0.95;
                app.ExtVar.UPVRobotPostProcess.SlicesPlot(i).SpecularStrength = 0.2;
                app.ExtVar.UPVRobotPostProcess.SlicesPlot(i).SpecularColorReflectance = 0;
                app.ExtVar.UPVRobotPostProcess.SlicesPlot(i).SpecularExponent = 5;
                app.ExtVar.UPVRobotPostProcess.SlicesPlot(i).BackFaceLighting = 'reverselit';
                app.ExtVar.UPVRobotPostProcess.SlicesPlot(i).FaceLighting = 'flat';
                app.ExtVar.UPVRobotPostProcess.SlicesPlot(i).DiffuseStrength = 0.3;
            end
        else
            for i=1:numel(app.ExtVar.UPVRobotPostProcess.SlicesPlot)
                app.ExtVar.UPVRobotPostProcess.SlicesPlot(i).FaceLighting = 'none';
            end
        end
    case 'iso'
        if app.ExtVar.UPVRobotPostProcess.ViewLight
            app.ExtVar.UPVRobotPostProcess.ISOsurf.FaceLighting = 'gouraud';
            app.ExtVar.UPVRobotPostProcess.ISOsurf.SpecularExponent = 10;
            app.ExtVar.UPVRobotPostProcess.ISOsurf.SpecularStrength = 0.1;
            app.ExtVar.UPVRobotPostProcess.ISOsurf.SpecularColorReflectance = 1;
            app.ExtVar.UPVRobotPostProcess.ISOsurf.BackFaceLighting = 'reverselit';
            app.ExtVar.UPVRobotPostProcess.ISOsurf.DiffuseStrength = 0.2;
            app.ExtVar.UPVRobotPostProcess.ISOsurf.AmbientStrength = 0.8;
        else
            app.ExtVar.UPVRobotPostProcess.ISOsurf.FaceLighting = 'flat';
        end
        
end

hold(ax,'on')
% ===========================================
% Plot measurement points
if app.ExtVar.UPVRobotPostProcess.ViewPoints
    scatter3(ax,x,y,z,'k.','linewidth',1)
end

% ===========================================
% Boundary
if app.ExtVar.UPVRobotPostProcess.ViewBoundary
    
    switch lower(app.ExtVar.UPVRobotPostProcess.ViewType3D)
        case {'3 slice','multi'}
            
            for i=1:numel(app.ExtVar.UPVRobotPostProcess.SlicesPlot)
                xx = app.ExtVar.UPVRobotPostProcess.SlicesPlot(i).XData;
                yy = app.ExtVar.UPVRobotPostProcess.SlicesPlot(i).YData;
                zz = app.ExtVar.UPVRobotPostProcess.SlicesPlot(i).ZData;
                if numel(unique(xx)) == 1 % YZ slice
                    k = boundary([yy(:),zz(:)],0.8);
                    app.ExtVar.UPVRobotPostProcess.SlicesBoundary{1} = ...
                        plot3(ax,xx(k),yy(k),zz(k),'Color',[0,0,0,0.5],'linewidth',1);
                elseif numel(unique(yy)) == 1 % XZ slice
                    k = boundary([xx(:),zz(:)],0.8);
                    app.ExtVar.UPVRobotPostProcess.SlicesBoundary{2} = ...
                        plot3(ax,xx(k),yy(k),zz(k),'Color',[0,0,0,0.5],'linewidth',1);
                elseif numel(unique(zz)) == 1 % XY slice
                    k = boundary([xx(:),yy(:)],0.8);
                    app.ExtVar.UPVRobotPostProcess.SlicesBoundary{3} = ...
                        plot3(ax,xx(k),yy(k),zz(k),'Color',[0,0,0,0.5],'linewidth',1);
                end
            end
            
        case 'iso'
            % Nothing
    end
end

hold(ax,'off')

% ===========================================
% Axes settings
shading(ax,'interp')
axis(ax,'equal')
colormap(ax,jet(500))
h = colorbar(ax);
ylabel(h, 'SPL [dB] (ref. 20\muPa)')
if FreqColorAuto
    caxis(ax,[mindata,maxdata])
else
    caxis(ax,[FreqMinRange,FreqMaxRange])
end
xlim(ax,app.ExtVar.UPVRobotPostProcess.XLim)
ylim(ax,app.ExtVar.UPVRobotPostProcess.YLim)
zlim(ax,app.ExtVar.UPVRobotPostProcess.ZLim)
xlabel(ax,'Lx [m]')
ylabel(ax,'Ly [m]')
zlabel(ax,'Lz [m]')
title(ax,sprintf('Frequency: %.0f Hz',f(idxF)))


set(ax, 'Ydir', 'reverse')
view(ax,Viewpre)

% ===========================================
% Close Loading info
close(d)