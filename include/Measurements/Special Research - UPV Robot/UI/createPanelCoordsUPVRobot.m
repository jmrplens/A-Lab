function createPanelCoordsUPVRobot(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Create UPVRobotLeftPanelMeasurementPoints
app.ExtUI.UPVRobotLeftPanelMeasurementPoints = uipanel(app.ExtUI.GridUPVRobotLeftPanel);
app.ExtUI.UPVRobotLeftPanelMeasurementPoints.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotLeftPanelMeasurementPoints.BorderType = 'none';
app.ExtUI.UPVRobotLeftPanelMeasurementPoints.Title = 'Measurement Points';
app.ExtUI.UPVRobotLeftPanelMeasurementPoints.BackgroundColor = [1 0.4118 0.1608];
app.ExtUI.UPVRobotLeftPanelMeasurementPoints.Layout.Row = 4;
app.ExtUI.UPVRobotLeftPanelMeasurementPoints.Layout.Column = 1;
app.ExtUI.UPVRobotLeftPanelMeasurementPoints.FontAngle = 'italic';
app.ExtUI.UPVRobotLeftPanelMeasurementPoints.FontWeight = 'bold';

% Create GridUPVRobotLeftPanelMeasurementPoints
app.ExtUI.GridUPVRobotLeftPanelMeasurementPoints = uigridlayout(app.ExtUI.UPVRobotLeftPanelMeasurementPoints);
app.ExtUI.GridUPVRobotLeftPanelMeasurementPoints.ColumnWidth = {'1x'};
app.ExtUI.GridUPVRobotLeftPanelMeasurementPoints.RowHeight = {'1x'};
app.ExtUI.GridUPVRobotLeftPanelMeasurementPoints.Padding = [0 0 0 0];
app.ExtUI.GridUPVRobotLeftPanelMeasurementPoints.BackgroundColor = [1 1 1];

% Create TabUPVRobotLeftPanelMeasurementPoints
app.ExtUI.TabUPVRobotLeftPanelMeasurementPoints = uitabgroup(app.ExtUI.GridUPVRobotLeftPanelMeasurementPoints);
app.ExtUI.TabUPVRobotLeftPanelMeasurementPoints.SelectionChangedFcn = {@UPVRobotTabChanged,app};
app.ExtUI.TabUPVRobotLeftPanelMeasurementPoints.Layout.Row = 1;
app.ExtUI.TabUPVRobotLeftPanelMeasurementPoints.Layout.Column = 1;

% =======================================================================
% Create tabs

% Automatic coords
createTabAutomaticCoordsUPVRobot(app);
% Import coords
createTabImportCoordsUPVRobot(app)
% Directivity Coords
createTabDirectivityCoordsUPVRobot(app)
% Manual coords
createTabManualCoordsUPVRobot(app)
% Geometric coords
createTabGeometricCoordsUPVRobot(app)


% Selected tab logic
if ~isempty(app.ExtVar.UPVRobot.CoordsType)
    idx = find(strcmp({app.ExtUI.TabUPVRobotLeftPanelMeasurementPoints.Children.Title},app.ExtVar.UPVRobot.CoordsType), 1);
    if ~isempty(idx)
        app.ExtUI.TabUPVRobotLeftPanelMeasurementPoints.SelectedTab = app.ExtUI.TabUPVRobotLeftPanelMeasurementPoints.Children(idx);
    else
        app.ExtVar.UPVRobot.CoordsType = app.ExtUI.TabUPVRobotLeftPanelMeasurementPoints.SelectedTab.Title;
    end
else
    app.ExtVar.UPVRobot.CoordsType = app.ExtUI.TabUPVRobotLeftPanelMeasurementPoints.SelectedTab.Title;
end


function UPVRobotTabChanged(~,~,app)
app.ExtVar.UPVRobot.RouteOptimized = 0;
app.ExtVar.UPVRobot.Resumed = 0;
app.ExtVar.UPVRobot.CoordsType = app.ExtUI.TabUPVRobotLeftPanelMeasurementPoints.SelectedTab.Title;
UPVRobotGenerateMeasurementPoints(app)

