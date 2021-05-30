function UPVRobotCreatePolygonPanel(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Create UPVRobotGeometricPolyPanel
app.ExtUI.UPVRobotGeometricPolyPanel = uipanel(app.ExtUI.UPVRobotLeftPanelMeasurementGeometricGrid);
app.ExtUI.UPVRobotGeometricPolyPanel.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotGeometricPolyPanel.Layout.Row = 2;
app.ExtUI.UPVRobotGeometricPolyPanel.Layout.Column = [1 2];

% Create UPVRobotGeometricPolyGrid
app.ExtUI.UPVRobotGeometricPolyGrid = uigridlayout(app.ExtUI.UPVRobotGeometricPolyPanel);
app.ExtUI.UPVRobotGeometricPolyGrid.ColumnWidth = {'fit', '1x', '1x', '1x'};
app.ExtUI.UPVRobotGeometricPolyGrid.RowHeight = {'fit', 1, 'fit', 'fit', 1, 'fit', 'fit'};
app.ExtUI.UPVRobotGeometricPolyGrid.BackgroundColor = [1 1 1];

% Create UPVRobotGeometricPolyPlaneDropDown
app.ExtUI.UPVRobotGeometricPolyPlaneDropDown = uidropdown(app.ExtUI.UPVRobotGeometricPolyGrid);
app.ExtUI.UPVRobotGeometricPolyPlaneDropDown.ValueChangedFcn = {@UPVRobotParameterGeometricPolyChanged,app};
app.ExtUI.UPVRobotGeometricPolyPlaneDropDown.Items = {'XY', 'XZ', 'YZ'};
app.ExtUI.UPVRobotGeometricPolyPlaneDropDown.Layout.Row = 1;
app.ExtUI.UPVRobotGeometricPolyPlaneDropDown.Layout.Column = [3 4];
app.ExtUI.UPVRobotGeometricPolyPlaneDropDown.Value = 'XY';
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.Plane) && ~strcmp(app.ExtVar.UPVRobot.GeometricCoords.Plane,'3D')
    app.ExtUI.UPVRobotGeometricPolyPlaneDropDown.Value = app.ExtVar.UPVRobot.GeometricCoords.Plane;
else
    app.ExtVar.UPVRobot.GeometricCoords.Plane = app.ExtUI.UPVRobotGeometricPolyPlaneDropDown.Value;
end

% Create UPVRobotGeometricPolySeparator
app.ExtUI.UPVRobotGeometricPolySeparator = uilabel(app.ExtUI.UPVRobotGeometricPolyGrid);
app.ExtUI.UPVRobotGeometricPolySeparator.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotGeometricPolySeparator.Layout.Row = 2;
app.ExtUI.UPVRobotGeometricPolySeparator.Layout.Column = [1 4];
app.ExtUI.UPVRobotGeometricPolySeparator.Text = '';

% Create UPVRobotGeometricPolyXEditFieldLabel
app.ExtUI.UPVRobotGeometricPolyXEditFieldLabel = uilabel(app.ExtUI.UPVRobotGeometricPolyGrid);
app.ExtUI.UPVRobotGeometricPolyXEditFieldLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricPolyXEditFieldLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotGeometricPolyXEditFieldLabel.Layout.Row = 3;
app.ExtUI.UPVRobotGeometricPolyXEditFieldLabel.Layout.Column = 2;
app.ExtUI.UPVRobotGeometricPolyXEditFieldLabel.Text = 'X';

% Create UPVRobotGeometricPolyXEditField
app.ExtUI.UPVRobotGeometricPolyXEditField = uieditfield(app.ExtUI.UPVRobotGeometricPolyGrid, 'numeric');
app.ExtUI.UPVRobotGeometricPolyXEditField.ValueChangedFcn = {@UPVRobotParameterGeometricPolyChanged,app};
app.ExtUI.UPVRobotGeometricPolyXEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricPolyXEditField.Layout.Row = 4;
app.ExtUI.UPVRobotGeometricPolyXEditField.Layout.Column = 2;
app.ExtUI.UPVRobotGeometricPolyXEditField.Value = 1.5;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.PolyCenterX)
    app.ExtUI.UPVRobotGeometricPolyXEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.PolyCenterX;
else
    app.ExtVar.UPVRobot.GeometricCoords.PolyCenterX = app.ExtUI.UPVRobotGeometricPolyXEditField.Value;
end

% Create UPVRobotGeometricPolyYEditFieldLabel
app.ExtUI.UPVRobotGeometricPolyYEditFieldLabel = uilabel(app.ExtUI.UPVRobotGeometricPolyGrid);
app.ExtUI.UPVRobotGeometricPolyYEditFieldLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricPolyYEditFieldLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotGeometricPolyYEditFieldLabel.Layout.Row = 3;
app.ExtUI.UPVRobotGeometricPolyYEditFieldLabel.Layout.Column = 3;
app.ExtUI.UPVRobotGeometricPolyYEditFieldLabel.Text = 'Y';

% Create UPVRobotGeometricPolyYEditField
app.ExtUI.UPVRobotGeometricPolyYEditField = uieditfield(app.ExtUI.UPVRobotGeometricPolyGrid, 'numeric');
app.ExtUI.UPVRobotGeometricPolyYEditField.ValueChangedFcn = {@UPVRobotParameterGeometricPolyChanged,app};
app.ExtUI.UPVRobotGeometricPolyYEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricPolyYEditField.Layout.Row = 4;
app.ExtUI.UPVRobotGeometricPolyYEditField.Layout.Column = 3;
app.ExtUI.UPVRobotGeometricPolyYEditField.Value = 1.5;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.PolyCenterY)
    app.ExtUI.UPVRobotGeometricPolyYEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.PolyCenterY;
else
    app.ExtVar.UPVRobot.GeometricCoords.PolyCenterY = app.ExtUI.UPVRobotGeometricPolyYEditField.Value;
end

% Create UPVRobotGeometricPolyZEditFieldLabel
app.ExtUI.UPVRobotGeometricPolyZEditFieldLabel = uilabel(app.ExtUI.UPVRobotGeometricPolyGrid);
app.ExtUI.UPVRobotGeometricPolyZEditFieldLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricPolyZEditFieldLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotGeometricPolyZEditFieldLabel.Layout.Row = 3;
app.ExtUI.UPVRobotGeometricPolyZEditFieldLabel.Layout.Column = 4;
app.ExtUI.UPVRobotGeometricPolyZEditFieldLabel.Text = 'Z';

% Create UPVRobotGeometricPolyZEditField
app.ExtUI.UPVRobotGeometricPolyZEditField = uieditfield(app.ExtUI.UPVRobotGeometricPolyGrid, 'numeric');
app.ExtUI.UPVRobotGeometricPolyZEditField.ValueChangedFcn = {@UPVRobotParameterGeometricPolyChanged,app};
app.ExtUI.UPVRobotGeometricPolyZEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricPolyZEditField.Layout.Row = 4;
app.ExtUI.UPVRobotGeometricPolyZEditField.Layout.Column = 4;
app.ExtUI.UPVRobotGeometricPolyZEditField.Value = 0;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.PolyCenterZ)
    app.ExtUI.UPVRobotGeometricPolyZEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.PolyCenterZ;
else
    app.ExtVar.UPVRobot.GeometricCoords.PolyCenterZ = app.ExtUI.UPVRobotGeometricPolyZEditField.Value;
end

% Create UPVRobotGeometricPolyCentermLabel
app.ExtUI.UPVRobotGeometricPolyCentermLabel = uilabel(app.ExtUI.UPVRobotGeometricPolyGrid);
app.ExtUI.UPVRobotGeometricPolyCentermLabel.Layout.Row = 4;
app.ExtUI.UPVRobotGeometricPolyCentermLabel.Layout.Column = 1;
app.ExtUI.UPVRobotGeometricPolyCentermLabel.Text = 'Center (m)';

% Create UPVRobotGeometricPolySeparator2
app.ExtUI.UPVRobotGeometricPolySeparator2 = uilabel(app.ExtUI.UPVRobotGeometricPolyGrid);
app.ExtUI.UPVRobotGeometricPolySeparator2.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotGeometricPolySeparator2.Layout.Row = 5;
app.ExtUI.UPVRobotGeometricPolySeparator2.Layout.Column = [1 4];
app.ExtUI.UPVRobotGeometricPolySeparator2.Text = '';

% Create UPVRobotGeometricPolyPlaneDropDownLabel
app.ExtUI.UPVRobotGeometricPolyPlaneDropDownLabel = uilabel(app.ExtUI.UPVRobotGeometricPolyGrid);
app.ExtUI.UPVRobotGeometricPolyPlaneDropDownLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotGeometricPolyPlaneDropDownLabel.Layout.Row = 1;
app.ExtUI.UPVRobotGeometricPolyPlaneDropDownLabel.Layout.Column = [1 2];
app.ExtUI.UPVRobotGeometricPolyPlaneDropDownLabel.Text = 'Plane';

% Create UPVRobotGeometricPolySubGrid
app.ExtUI.UPVRobotGeometricPolySubGrid = uigridlayout(app.ExtUI.UPVRobotGeometricPolyGrid);
app.ExtUI.UPVRobotGeometricPolySubGrid.ColumnWidth = {'fit', '1x', 1, 'fit', '1x'};
app.ExtUI.UPVRobotGeometricPolySubGrid.Padding = [0 0 0 0];
app.ExtUI.UPVRobotGeometricPolySubGrid.Layout.Row = [6 7];
app.ExtUI.UPVRobotGeometricPolySubGrid.Layout.Column = [1 4];
app.ExtUI.UPVRobotGeometricPolySubGrid.BackgroundColor = [1 1 1];

% Create UPVRobotGeometricPolySideLenEditFieldLabel
app.ExtUI.UPVRobotGeometricPolySideLenEditFieldLabel = uilabel(app.ExtUI.UPVRobotGeometricPolySubGrid);
app.ExtUI.UPVRobotGeometricPolySideLenEditFieldLabel.Layout.Row = 1;
app.ExtUI.UPVRobotGeometricPolySideLenEditFieldLabel.Layout.Column = 1;
app.ExtUI.UPVRobotGeometricPolySideLenEditFieldLabel.Text = 'Side (m)';

% Create UPVRobotGeometricPolySideLenEditField
app.ExtUI.UPVRobotGeometricPolySideLenEditField = uieditfield(app.ExtUI.UPVRobotGeometricPolySubGrid, 'numeric');
app.ExtUI.UPVRobotGeometricPolySideLenEditField.ValueChangedFcn = {@UPVRobotParameterGeometricPolyChanged,app};
app.ExtUI.UPVRobotGeometricPolySideLenEditField.LowerLimitInclusive = 'off';
app.ExtUI.UPVRobotGeometricPolySideLenEditField.Limits = [0 Inf];
app.ExtUI.UPVRobotGeometricPolySideLenEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricPolySideLenEditField.Layout.Row = 1;
app.ExtUI.UPVRobotGeometricPolySideLenEditField.Layout.Column = 2;
app.ExtUI.UPVRobotGeometricPolySideLenEditField.Value = 0.5;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.PolyLenSide)
    app.ExtUI.UPVRobotGeometricPolySideLenEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.PolyLenSide;
else
    app.ExtVar.UPVRobot.GeometricCoords.PolyLenSide = app.ExtUI.UPVRobotGeometricPolySideLenEditField.Value;
end

% Create UPVRobotGeometricPolyResolutionEditFieldLabel
app.ExtUI.UPVRobotGeometricPolyResolutionEditFieldLabel = uilabel(app.ExtUI.UPVRobotGeometricPolySubGrid);
app.ExtUI.UPVRobotGeometricPolyResolutionEditFieldLabel.Layout.Row = 2;
app.ExtUI.UPVRobotGeometricPolyResolutionEditFieldLabel.Layout.Column = 1;
app.ExtUI.UPVRobotGeometricPolyResolutionEditFieldLabel.Text = 'Resolution';

% Create UPVRobotGeometricPolyResolutionEditField
app.ExtUI.UPVRobotGeometricPolyResolutionEditField = uieditfield(app.ExtUI.UPVRobotGeometricPolySubGrid, 'numeric');
app.ExtUI.UPVRobotGeometricPolyResolutionEditField.ValueChangedFcn = {@UPVRobotParameterGeometricPolyChanged,app};
app.ExtUI.UPVRobotGeometricPolyResolutionEditField.Limits = [1 Inf];
app.ExtUI.UPVRobotGeometricPolyResolutionEditField.RoundFractionalValues = 'on';
app.ExtUI.UPVRobotGeometricPolyResolutionEditField.ValueDisplayFormat = '%.0f';
app.ExtUI.UPVRobotGeometricPolyResolutionEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricPolyResolutionEditField.Layout.Row = 2;
app.ExtUI.UPVRobotGeometricPolyResolutionEditField.Layout.Column = 2;
app.ExtUI.UPVRobotGeometricPolyResolutionEditField.Value = 10;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.PolyRes)
    app.ExtUI.UPVRobotGeometricPolyResolutionEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.PolyRes;
else
    app.ExtVar.UPVRobot.GeometricCoords.PolyRes = app.ExtUI.UPVRobotGeometricPolyResolutionEditField.Value;
end

% Create UPVRobotGeometricPolySeparator3
app.ExtUI.UPVRobotGeometricPolySeparator3 = uilabel(app.ExtUI.UPVRobotGeometricPolySubGrid);
app.ExtUI.UPVRobotGeometricPolySeparator3.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotGeometricPolySeparator3.Layout.Row = [1 2];
app.ExtUI.UPVRobotGeometricPolySeparator3.Layout.Column = 3;
app.ExtUI.UPVRobotGeometricPolySeparator3.Text = '';

% Create UPVRobotGeometricPolySidesEditFieldLabel
app.ExtUI.UPVRobotGeometricPolySidesEditFieldLabel = uilabel(app.ExtUI.UPVRobotGeometricPolySubGrid);
app.ExtUI.UPVRobotGeometricPolySidesEditFieldLabel.Layout.Row = 1;
app.ExtUI.UPVRobotGeometricPolySidesEditFieldLabel.Layout.Column = 4;
app.ExtUI.UPVRobotGeometricPolySidesEditFieldLabel.Text = 'Sides';

% Create UPVRobotGeometricPolySidesEditField
app.ExtUI.UPVRobotGeometricPolySidesEditField = uieditfield(app.ExtUI.UPVRobotGeometricPolySubGrid, 'numeric');
app.ExtUI.UPVRobotGeometricPolySidesEditField.ValueChangedFcn = {@UPVRobotParameterGeometricPolyChanged,app};
app.ExtUI.UPVRobotGeometricPolySidesEditField.Limits = [1 Inf];
app.ExtUI.UPVRobotGeometricPolySidesEditField.RoundFractionalValues = 'on';
app.ExtUI.UPVRobotGeometricPolySidesEditField.ValueDisplayFormat = '%.0f';
app.ExtUI.UPVRobotGeometricPolySidesEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricPolySidesEditField.Layout.Row = 1;
app.ExtUI.UPVRobotGeometricPolySidesEditField.Layout.Column = 5;
app.ExtUI.UPVRobotGeometricPolySidesEditField.Value = 3;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.PolySides)
    app.ExtUI.UPVRobotGeometricPolySidesEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.PolySides;
else
    app.ExtVar.UPVRobot.GeometricCoords.PolySides = app.ExtUI.UPVRobotGeometricPolySidesEditField.Value;
end

function UPVRobotParameterGeometricPolyChanged(~,~,app)
app.ExtVar.UPVRobot.GeometricCoords.Plane = app.ExtUI.UPVRobotGeometricPolyPlaneDropDown.Value;
app.ExtVar.UPVRobot.GeometricCoords.PolyCenterX = app.ExtUI.UPVRobotGeometricPolyXEditField.Value;
app.ExtVar.UPVRobot.GeometricCoords.PolyCenterY = app.ExtUI.UPVRobotGeometricPolyYEditField.Value;
app.ExtVar.UPVRobot.GeometricCoords.PolyCenterZ = app.ExtUI.UPVRobotGeometricPolyZEditField.Value;
app.ExtVar.UPVRobot.GeometricCoords.PolyLenSide = app.ExtUI.UPVRobotGeometricPolySideLenEditField.Value;
app.ExtVar.UPVRobot.GeometricCoords.PolyRes = app.ExtUI.UPVRobotGeometricPolyResolutionEditField.Value;
app.ExtVar.UPVRobot.GeometricCoords.PolySides = app.ExtUI.UPVRobotGeometricPolySidesEditField.Value;
UPVRobotGenerateMeasurementPoints(app)