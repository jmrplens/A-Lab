function createTabGeometricCoordsUPVRobot(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Initialize if no exist
if isempty(app.ExtVar.UPVRobot.GeometricCoords)
    app.ExtVar.UPVRobot.GeometricCoords = struct('Shape',[],'Plane',[],...
        'CircumCenterX',[],'CircumCenterY',[],'CircumCenterZ',[],'CircumRadius',[],...% Circumference
        'CircumRes',[],... 
        'CircleCenterX',[],'CircleCenterY',[],'CircleCenterZ',[],'CircleMaxRadius',[],... % Circle
        'CircleRes',[],'CircleNum',[],...
        'RectangleOriginX',[],'RectangleOriginY',[],'RectangleOriginZ',[],'RectangleLenH',[],... % Rectangle
        'RectangleLenV',[],'RectangleResH',[],'RectangleResV',[],...
        'PolyCenterX',[],'PolyCenterY',[],'PolyCenterZ',[],'PolySides',[],'PolyLenSide',[],... % Polygon
        'PolyRes',[],...
        'SphereCenterX',[],'SphereCenterY',[],'SphereCenterZ',[],'SphereRadius',[],...% Sphere
        'SphereThetaRes',[],'SpherePhiRes',[]... 
        );
end


% Create TabUPVRobotLeftPanelMeasurementGeometric
app.ExtUI.TabUPVRobotLeftPanelMeasurementGeometric = uitab(app.ExtUI.TabUPVRobotLeftPanelMeasurementPoints);
app.ExtUI.TabUPVRobotLeftPanelMeasurementGeometric.Title = 'Geom';

% Create UPVRobotLeftPanelMeasurementGeometricGrid
app.ExtUI.UPVRobotLeftPanelMeasurementGeometricGrid = uigridlayout(app.ExtUI.TabUPVRobotLeftPanelMeasurementGeometric);
app.ExtUI.UPVRobotLeftPanelMeasurementGeometricGrid.ColumnWidth = {'0.5x', '1.5x'};
app.ExtUI.UPVRobotLeftPanelMeasurementGeometricGrid.RowHeight = {'fit', 'fit'};
app.ExtUI.UPVRobotLeftPanelMeasurementGeometricGrid.BackgroundColor = [1 1 1];

% Create ShapeDropDownLabel
app.ExtUI.ShapeDropDownLabel = uilabel(app.ExtUI.UPVRobotLeftPanelMeasurementGeometricGrid);
app.ExtUI.ShapeDropDownLabel.HorizontalAlignment = 'right';
app.ExtUI.ShapeDropDownLabel.Layout.Row = 1;
app.ExtUI.ShapeDropDownLabel.Layout.Column = 1;
app.ExtUI.ShapeDropDownLabel.Text = 'Shape';

% Create UPVRobotGeometricShapeDropDown
app.ExtUI.UPVRobotGeometricShapeDropDown = uidropdown(app.ExtUI.UPVRobotLeftPanelMeasurementGeometricGrid);
app.ExtUI.UPVRobotGeometricShapeDropDown.Items = {'Circumference', 'Circle', 'Rectangle', 'Polygon', 'Sphere'};
app.ExtUI.UPVRobotGeometricShapeDropDown.ValueChangedFcn = {@UPVRobotParameterGeometricChanged,app};
app.ExtUI.UPVRobotGeometricShapeDropDown.Layout.Row = 1;
app.ExtUI.UPVRobotGeometricShapeDropDown.Layout.Column = 2;
app.ExtUI.UPVRobotGeometricShapeDropDown.Value = 'Circumference';
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.Shape)
    app.ExtUI.UPVRobotGeometricShapeDropDown.Value = app.ExtVar.UPVRobot.GeometricCoords.Shape;
else
    app.ExtVar.UPVRobot.GeometricCoords.Shape = app.ExtUI.UPVRobotGeometricShapeDropDown.Value;
end
switch lower(app.ExtVar.UPVRobot.GeometricCoords.Shape)
    case 'circumference'
        UPVRobotCreateCircumferencePanel(app);
    case 'circle'
        UPVRobotCreateCirclePanel(app);
    case 'rectangle'
        UPVRobotCreateRectanglePanel(app)
    case 'polygon'
        UPVRobotCreatePolygonPanel(app)
    case 'sphere'
        UPVRobotCreateSpherePanel(app)
end





function UPVRobotParameterGeometricChanged(~,~,app)
app.ExtVar.UPVRobot.RouteOptimized = 0;
app.ExtVar.UPVRobot.GeometricCoords.Shape = app.ExtUI.UPVRobotGeometricShapeDropDown.Value;
switch lower(app.ExtVar.UPVRobot.GeometricCoords.Shape)
    case 'circumference'
        UPVRobotCreateCircumferencePanel(app);
    case 'circle'
        UPVRobotCreateCirclePanel(app);
    case 'rectangle'
        UPVRobotCreateRectanglePanel(app)
    case 'polygon'
        UPVRobotCreatePolygonPanel(app)
    case 'sphere'
        UPVRobotCreateSpherePanel(app)
end
UPVRobotGenerateMeasurementPoints(app)



