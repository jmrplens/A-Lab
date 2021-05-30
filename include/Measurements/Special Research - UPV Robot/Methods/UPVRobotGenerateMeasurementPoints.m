function UPVRobotGenerateMeasurementPoints(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Check if posible generate points
if strcmp(app.ExtUI.UPVRobotGeneratemeasurementpointsButton.Enable,'off')
    return;
end

% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
    'Indeterminate','on');

% ====================================================
% Parameters

% SizeRobot
XLen = app.ExtVar.UPVRobot.XLen;
YLen = app.ExtVar.UPVRobot.YLen;
ZLen = app.ExtVar.UPVRobot.ZLen;

switch app.ExtVar.UPVRobot.CoordsType
    
    case 'Auto'
        % =======================================================================
        
        % Resolution
        XRes = app.ExtVar.UPVRobot.XRes;
        YRes = app.ExtVar.UPVRobot.YRes;
        ZRes = app.ExtVar.UPVRobot.ZRes;
        
        % Origin-End
        XOri = app.ExtVar.UPVRobot.XOri;
        XEnd = app.ExtVar.UPVRobot.XEnd;
        YOri = app.ExtVar.UPVRobot.YOri;
        YEnd = app.ExtVar.UPVRobot.YEnd;
        ZOri = app.ExtVar.UPVRobot.ZOri;
        ZEnd = app.ExtVar.UPVRobot.ZEnd;
        
        
        % ====================================================
        % Array points
        % X
        if XEnd==0 || XRes==0
            arrX = 0;
        else
            arrX = linspace(XOri,XEnd,XRes);
        end
        % Y
        if YEnd==0 || YRes==0
            arrY = 0;
        else
            arrY = linspace(YOri,YEnd,YRes);
        end
        % Z
        if ZEnd==0 || ZRes==0
            arrZ = 0;
        else
            arrZ = linspace(ZOri,ZEnd,ZRes);
        end
        
        % ====================================================
        % Coordinates matrix
        % Scan-style order
        
        coord = zeros(XRes*YRes*ZRes,3);
        aux = 0;
        if YRes >= XRes && (XEnd-XOri) >= (YEnd-YOri)
        for ii = 1:XRes
            for jj = 1:YRes
                for kk = 1:ZRes
                    aux = aux+1;
                    coord(aux,:) = [arrX(ii),arrY(jj),arrZ(kk)];
                end
            end
            arrY = fliplr(arrY);
        end
        else %if XRes > YRes
            for ii = 1:YRes
                for jj = 1:XRes
                    for kk = 1:ZRes
                        aux = aux+1;
                        coord(aux,:) = [arrX(jj),arrY(ii),arrZ(kk)];
                    end
                end
                arrX = fliplr(arrX);
            end
        end
        X = coord(:,1);
        Y = coord(:,2);
        Z = coord(:,3);
        
    case 'Import'
        % =======================================================================
        
        if isempty(app.ExtVar.UPVRobot.CustomCoordsPath)
            UPVRobotCleanImportPanel(app)
            return;
        end
        
        % Import from file
        [X,Y,Z] = UPVRobotProcessImportedCoords(app);
        
        if isempty(X)
            return;
        end
        
    case 'Directivity'
        
        [X,Y,Z] = UPVRobotDirectivityCoords(app);
        
        
    case 'Manual'
        % =======================================================================
        
        if isempty(app.ExtVar.UPVRobot.ManualCoords)
            return;
        end
        
        % Decompose
        X = app.ExtVar.UPVRobot.ManualCoords(:,1);
        Y = app.ExtVar.UPVRobot.ManualCoords(:,2);
        Z = app.ExtVar.UPVRobot.ManualCoords(:,3);
        
    case 'Geom'
        
        % Create Coords
        [X,Y,Z] = UPVRobotGeometricCoords(app);
        
    otherwise
        return;
        
end

% Remove outliers if needed
idx = X>XLen | Y>YLen | Z>ZLen | X<0 | Y<0 | Z<0;
X(idx) = [];
Y(idx) = [];
Z(idx) = [];

% If route optimized before, load last coords
if app.ExtVar.UPVRobot.RouteOptimized
    X = app.ExtVar.UPVRobot.MeasurePoints(:,1);
   Y = app.ExtVar.UPVRobot.MeasurePoints(:,2);
    Z = app.ExtVar.UPVRobot.MeasurePoints(:,3);
end

% ====================================================
% Apply restrictions
if app.ExtVar.UPVRobot.Restricted
    XNaNOri = app.ExtVar.UPVRobot.XNaNOri;
    XNaNEnd = app.ExtVar.UPVRobot.XNaNEnd;
    YNaNOri = app.ExtVar.UPVRobot.YNaNOri;
    YNaNEnd = app.ExtVar.UPVRobot.YNaNEnd;
    ZNaNOri = app.ExtVar.UPVRobot.ZNaNOri;
    %ZNaNEnd = app.ExtVar.UPVRobot.ZNaNEnd;
    % Limitation of UPV Robot: It is impossible to measure points in Z located above the restricted area
    ZNaNEnd = app.ExtVar.UPVRobot.ZLen;
    
    idx = X>=XNaNOri & X<=XNaNEnd & Y>=YNaNOri & Y<=YNaNEnd & Z>=ZNaNOri & Z<=ZNaNEnd;
    X(idx) = [];
    Y(idx) = [];
    Z(idx) = [];
end

% Total coordinates
Totalcoor = numel(X);

% ====================================================
% Store points
app.ExtVar.UPVRobot.MeasurePoints = [X,Y,Z];

% ====================================================
% Axes and buttons
ax = app.ExtUI.UPVRobotUIAxes;
ax.Visible = 'on';
app.ExtUI.UPVRobotXYButton.Visible = 'on';
app.ExtUI.UPVRobotXZButton.Visible = 'on';
app.ExtUI.UPVRobotYZButton.Visible = 'on';
app.ExtUI.UPVRobotButton3D.Visible = 'on';
app.ExtUI.UPVRobotViewrobotrouteButton.Visible = 'on';
app.ExtUI.UPVRobotOptimizerouteButton.Visible = 'on';
% Reset axes
cla(ax,'reset')
% Hide route axis
axroute = app.ExtUI.UPVRobotUIAxesRoute;
cla(axroute,'reset')
axroute.Visible = 'off';
% ====================================================
% Plot
UPVRobotPlotMeasurementPoints(app,ax)

% ====================================================
% Activate measure button
app.ExtUI.StartmeasureButton.Enable = 'on';

% ====================================================
% Activate restriction panel
app.ExtUI.UPVRobotRestrictCheckBox.Enable = 'on';

% ====================================================
% Refresh information
% Next point info
app.ExtUI.UPVRobotStatusNextPoint.Text = '~';
app.ExtUI.UPVRobotStatusElapsed.Text = '~';

% Show in panel title
app.ExtUI.CenterMainPanelUPVRobot.Title = ['Map of measurement points (Total: ',num2str(Totalcoor),')'];
% Show in info panel
app.ExtUI.UPVRobotStatusCompleted.Text = ['0 of ',num2str(Totalcoor)];
% Remove title in execute button action panel
app.ExtUI.UPVRobotRunningPanel.Title = ' ';
app.ExtUI.UPVRobotRunningPanel.Visible = 'off';

% ====================================================
% Calculate time travel
[Time,TimeEach] = UPVRobotTimeTravel(app);
app.ExtUI.UPVRobotMeasureTimeEachInfo.Text = ['~ ',num2str(TimeEach,'%.1f'),' seconds'];
app.ExtUI.UPVRobotMeasureTimeTotalInfo.Text = ['~ ',sec2str(Time)];
app.ExtUI.UPVRobotStatusRemaining.Text = sec2str(Time);

% ====================================================
% if resumed measure
if app.ExtVar.UPVRobot.Resumed
    pathIter = [app.ExtVar.UPVRobot.FolderPath,filesep,'iter.bak'];
    iter = load(pathIter,'-mat');
    idx = iter.ii;
    elap = iter.elap;
    coords = app.ExtVar.UPVRobot.MeasurePoints;
    
    % Delete red point
    set(app.ExtVar.UPVRobot.ScatterRedPlot,'XData',coords(idx:end,1),'YData',coords(idx:end,2),'ZData',coords(idx:end,3))
    % Plot green point
    set(app.ExtVar.UPVRobot.ScatterGreenPlot,'XData',coords(1:idx-1,1),'YData',coords(1:idx-1,2),'ZData',coords(1:idx-1,3))
    
    app.ExtUI.UPVRobotStatusNextPoint.Text = sprintf('[%.3f, %.3f, %.3f]',...
        coords(idx+1,1),coords(idx+1,2),coords(idx+1,3));
    % Measures completed
    app.ExtUI.UPVRobotStatusCompleted.Text = sprintf('%d of %d',idx,size(coords,1));
    % Time info
    
    Timeaux = Time - elap;
    app.ExtUI.UPVRobotStatusElapsed.Text = sec2str(elap);
    if abs(Timeaux) > 20 && elap < Time
        app.ExtUI.UPVRobotStatusRemaining.Text = sec2str(Timeaux);
    else
        app.ExtUI.UPVRobotStatusRemaining.Text = 'A few seconds';
    end
    
else
   app.ExtUI.StartmeasureButton.Text = 'Start measure'; 
end

% Disable optimize button for 3D coords
coords = app.ExtVar.UPVRobot.MeasurePoints;
if numel(unique(coords(:,1))) == 1 || numel(unique(coords(:,2))) == 1 || numel(unique(coords(:,3))) == 1
app.ExtUI.UPVRobotOptimizerouteButton.Enable = 'on';
else    
app.ExtUI.UPVRobotOptimizerouteButton.Enable = 'off';
end

drawnow
pause(0.5)
close(d)