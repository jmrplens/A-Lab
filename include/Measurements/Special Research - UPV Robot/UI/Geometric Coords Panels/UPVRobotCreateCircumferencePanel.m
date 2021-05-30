function UPVRobotCreateCircumferencePanel(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% =======================================================================
% Circumference


% Create UPVRobotGeometricCircumferencePanel
app.ExtUI.UPVRobotGeometricCircumferencePanel = uipanel(app.ExtUI.UPVRobotLeftPanelMeasurementGeometricGrid);
app.ExtUI.UPVRobotGeometricCircumferencePanel.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotGeometricCircumferencePanel.Layout.Row = 2;
app.ExtUI.UPVRobotGeometricCircumferencePanel.Layout.Column = [1 2];

% Create UPVRobotGeometricCircumferenceGrid
app.ExtUI.UPVRobotGeometricCircumferenceGrid = uigridlayout(app.ExtUI.UPVRobotGeometricCircumferencePanel);
app.ExtUI.UPVRobotGeometricCircumferenceGrid.ColumnWidth = {'fit', '1x', '1x', '1x'};
app.ExtUI.UPVRobotGeometricCircumferenceGrid.RowHeight = {'fit', 1, 'fit', 'fit', 1, 'fit', 'fit'};
app.ExtUI.UPVRobotGeometricCircumferenceGrid.BackgroundColor = [1 1 1];

% Create PlaneDropDownLabel
app.ExtUI.UPVRobotGeomCircumPlaneDropDownLabel = uilabel(app.ExtUI.UPVRobotGeometricCircumferenceGrid);
app.ExtUI.UPVRobotGeomCircumPlaneDropDownLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotGeomCircumPlaneDropDownLabel.Layout.Row = 1;
app.ExtUI.UPVRobotGeomCircumPlaneDropDownLabel.Layout.Column = [1 2];
app.ExtUI.UPVRobotGeomCircumPlaneDropDownLabel.Text = 'Plane';

% Create UPVRobotGeomCircumPlaneDropDown
app.ExtUI.UPVRobotGeomCircumPlaneDropDown = uidropdown(app.ExtUI.UPVRobotGeometricCircumferenceGrid);
app.ExtUI.UPVRobotGeomCircumPlaneDropDown.ValueChangedFcn = {@UPVRobotParameterGeometricCircumChanged,app};
app.ExtUI.UPVRobotGeomCircumPlaneDropDown.Items = {'XY', 'XZ', 'YZ'};
app.ExtUI.UPVRobotGeomCircumPlaneDropDown.Layout.Row = 1;
app.ExtUI.UPVRobotGeomCircumPlaneDropDown.Layout.Column = [3 4];
app.ExtUI.UPVRobotGeomCircumPlaneDropDown.Value = 'XY';
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.Plane) && ~strcmp(app.ExtVar.UPVRobot.GeometricCoords.Plane,'3D')
    app.ExtUI.UPVRobotGeomCircumPlaneDropDown.Value = app.ExtVar.UPVRobot.GeometricCoords.Plane;
else
    app.ExtVar.UPVRobot.GeometricCoords.Plane = app.ExtUI.UPVRobotGeomCircumPlaneDropDown.Value;
end

% Create UPVRobotGeometricCircumferenceSeparator
app.ExtUI.UPVRobotGeometricCircumferenceSeparator = uilabel(app.ExtUI.UPVRobotGeometricCircumferenceGrid);
app.ExtUI.UPVRobotGeometricCircumferenceSeparator.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotGeometricCircumferenceSeparator.Layout.Row = 2;
app.ExtUI.UPVRobotGeometricCircumferenceSeparator.Layout.Column = [1 4];
app.ExtUI.UPVRobotGeometricCircumferenceSeparator.Text = '';


% Create UPVRobotGeomCircumXEditFieldLabel
app.ExtUI.UPVRobotGeomCircumXEditFieldLabel = uilabel(app.ExtUI.UPVRobotGeometricCircumferenceGrid);
app.ExtUI.UPVRobotGeomCircumXEditFieldLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeomCircumXEditFieldLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotGeomCircumXEditFieldLabel.Layout.Row = 3;
app.ExtUI.UPVRobotGeomCircumXEditFieldLabel.Layout.Column = 2;
app.ExtUI.UPVRobotGeomCircumXEditFieldLabel.Text = 'X';

% Create UPVRobotGeomCircumXEditField
app.ExtUI.UPVRobotGeomCircumXEditField = uieditfield(app.ExtUI.UPVRobotGeometricCircumferenceGrid, 'numeric');
app.ExtUI.UPVRobotGeomCircumXEditField.ValueChangedFcn = {@UPVRobotParameterGeometricCircumChanged,app};
app.ExtUI.UPVRobotGeomCircumXEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeomCircumXEditField.Layout.Row = 4;
app.ExtUI.UPVRobotGeomCircumXEditField.Layout.Column = 2;
app.ExtUI.UPVRobotGeomCircumXEditField.Value = 1.5;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.CircumCenterX)
    app.ExtUI.UPVRobotGeomCircumXEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.CircumCenterX;
else
    app.ExtVar.UPVRobot.GeometricCoords.CircumCenterX = app.ExtUI.UPVRobotGeomCircumXEditField.Value;
end

% Create UPVRobotGeomCircumYEditFieldLabel
app.ExtUI.UPVRobotGeomCircumYEditFieldLabel = uilabel(app.ExtUI.UPVRobotGeometricCircumferenceGrid);
app.ExtUI.UPVRobotGeomCircumYEditFieldLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeomCircumYEditFieldLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotGeomCircumYEditFieldLabel.Layout.Row = 3;
app.ExtUI.UPVRobotGeomCircumYEditFieldLabel.Layout.Column = 3;
app.ExtUI.UPVRobotGeomCircumYEditFieldLabel.Text = 'Y';

% Create UPVRobotGeomCircumYEditField
app.ExtUI.UPVRobotGeomCircumYEditField = uieditfield(app.ExtUI.UPVRobotGeometricCircumferenceGrid, 'numeric');
app.ExtUI.UPVRobotGeomCircumYEditField.ValueChangedFcn = {@UPVRobotParameterGeometricCircumChanged,app};
app.ExtUI.UPVRobotGeomCircumYEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeomCircumYEditField.Layout.Row = 4;
app.ExtUI.UPVRobotGeomCircumYEditField.Layout.Column = 3;
app.ExtUI.UPVRobotGeomCircumYEditField.Value = 1.5;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.CircumCenterY)
    app.ExtUI.UPVRobotGeomCircumYEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.CircumCenterY;
else
    app.ExtVar.UPVRobot.GeometricCoords.CircumCenterY = app.ExtUI.UPVRobotGeomCircumYEditField.Value;
end

% Create UPVRobotGeomCircumZEditFieldLabel
app.ExtUI.UPVRobotGeomCircumZEditFieldLabel = uilabel(app.ExtUI.UPVRobotGeometricCircumferenceGrid);
app.ExtUI.UPVRobotGeomCircumZEditFieldLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeomCircumZEditFieldLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotGeomCircumZEditFieldLabel.Layout.Row = 3;
app.ExtUI.UPVRobotGeomCircumZEditFieldLabel.Layout.Column = 4;
app.ExtUI.UPVRobotGeomCircumZEditFieldLabel.Text = 'Z';

% Create UPVRobotGeomCircumZEditField
app.ExtUI.UPVRobotGeomCircumZEditField = uieditfield(app.ExtUI.UPVRobotGeometricCircumferenceGrid, 'numeric');
app.ExtUI.UPVRobotGeomCircumZEditField.ValueChangedFcn = {@UPVRobotParameterGeometricCircumChanged,app};
app.ExtUI.UPVRobotGeomCircumZEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeomCircumZEditField.Layout.Row = 4;
app.ExtUI.UPVRobotGeomCircumZEditField.Layout.Column = 4;
app.ExtUI.UPVRobotGeomCircumZEditField.Value = 0;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.CircumCenterZ)
    app.ExtUI.UPVRobotGeomCircumZEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.CircumCenterZ;
else
    app.ExtVar.UPVRobot.GeometricCoords.CircumCenterZ = app.ExtUI.UPVRobotGeomCircumZEditField.Value;
end


% Create UPVRobotGeomCircumCentermLabel
app.ExtUI.UPVRobotGeomCircumCentermLabel = uilabel(app.ExtUI.UPVRobotGeometricCircumferenceGrid);
app.ExtUI.UPVRobotGeomCircumCentermLabel.Layout.Row = 4;
app.ExtUI.UPVRobotGeomCircumCentermLabel.Layout.Column = 1;
app.ExtUI.UPVRobotGeomCircumCentermLabel.Text = 'Center (m)';

% Create UPVRobotGeometricCircumferenceSeparator2
app.ExtUI.UPVRobotGeometricCircumferenceSeparator2 = uilabel(app.ExtUI.UPVRobotGeometricCircumferenceGrid);
app.ExtUI.UPVRobotGeometricCircumferenceSeparator2.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotGeometricCircumferenceSeparator2.Layout.Row = 5;
app.ExtUI.UPVRobotGeometricCircumferenceSeparator2.Layout.Column = [1 4];
app.ExtUI.UPVRobotGeometricCircumferenceSeparator2.Text = '';

% Create RadiusmEditFieldLabel
app.ExtUI.RadiusmEditFieldLabel = uilabel(app.ExtUI.UPVRobotGeometricCircumferenceGrid);
app.ExtUI.RadiusmEditFieldLabel.Layout.Row = 6;
app.ExtUI.RadiusmEditFieldLabel.Layout.Column = 1;
app.ExtUI.RadiusmEditFieldLabel.Text = 'Radius (m)';

% Create UPVRobotGeomCircumRadiusmEditField
app.ExtUI.UPVRobotGeomCircumRadiusmEditField = uieditfield(app.ExtUI.UPVRobotGeometricCircumferenceGrid, 'numeric');
app.ExtUI.UPVRobotGeomCircumRadiusmEditField.ValueChangedFcn = {@UPVRobotParameterGeometricCircumChanged,app};
app.ExtUI.UPVRobotGeomCircumRadiusmEditField.LowerLimitInclusive = 'off';
app.ExtUI.UPVRobotGeomCircumRadiusmEditField.Limits = [0 Inf];
app.ExtUI.UPVRobotGeomCircumRadiusmEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeomCircumRadiusmEditField.Layout.Row = 6;
app.ExtUI.UPVRobotGeomCircumRadiusmEditField.Layout.Column = 2;
app.ExtUI.UPVRobotGeomCircumRadiusmEditField.Value = 1;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.CircumRadius)
    app.ExtUI.UPVRobotGeomCircumRadiusmEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.CircumRadius;
else
    app.ExtVar.UPVRobot.GeometricCoords.CircumRadius = app.ExtUI.UPVRobotGeomCircumRadiusmEditField.Value;
end

% Create ResolutionEditFieldLabel
app.ExtUI.ResolutionEditFieldLabel = uilabel(app.ExtUI.UPVRobotGeometricCircumferenceGrid);
app.ExtUI.ResolutionEditFieldLabel.Layout.Row = 7;
app.ExtUI.ResolutionEditFieldLabel.Layout.Column = 1;
app.ExtUI.ResolutionEditFieldLabel.Text = 'Res (angles)';

% Create UPVRobotGeomCircumResolutionEditField
app.ExtUI.UPVRobotGeomCircumResolutionEditField = uieditfield(app.ExtUI.UPVRobotGeometricCircumferenceGrid, 'numeric');
app.ExtUI.UPVRobotGeomCircumResolutionEditField.ValueChangedFcn = {@UPVRobotParameterGeometricCircumChanged,app};
app.ExtUI.UPVRobotGeomCircumResolutionEditField.Limits = [1 Inf];
app.ExtUI.UPVRobotGeomCircumResolutionEditField.RoundFractionalValues = 'on';
app.ExtUI.UPVRobotGeomCircumResolutionEditField.ValueDisplayFormat = '%.0f';
app.ExtUI.UPVRobotGeomCircumResolutionEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeomCircumResolutionEditField.Layout.Row = 7;
app.ExtUI.UPVRobotGeomCircumResolutionEditField.Layout.Column = 2;
app.ExtUI.UPVRobotGeomCircumResolutionEditField.Value = 50;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.CircumRes)
    app.ExtUI.UPVRobotGeomCircumResolutionEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.CircumRes;
else
    app.ExtVar.UPVRobot.GeometricCoords.CircumRes = app.ExtUI.UPVRobotGeomCircumResolutionEditField.Value;
end

function UPVRobotParameterGeometricCircumChanged(~,~,app)
app.ExtVar.UPVRobot.GeometricCoords.CircumCenterX = app.ExtUI.UPVRobotGeomCircumXEditField.Value;
app.ExtVar.UPVRobot.GeometricCoords.CircumCenterY = app.ExtUI.UPVRobotGeomCircumYEditField.Value;
app.ExtVar.UPVRobot.GeometricCoords.CircumCenterZ = app.ExtUI.UPVRobotGeomCircumZEditField.Value;
app.ExtVar.UPVRobot.GeometricCoords.CircumRes = app.ExtUI.UPVRobotGeomCircumResolutionEditField.Value;
app.ExtVar.UPVRobot.GeometricCoords.CircumRadius = app.ExtUI.UPVRobotGeomCircumRadiusmEditField.Value;
app.ExtVar.UPVRobot.GeometricCoords.Plane = app.ExtUI.UPVRobotGeomCircumPlaneDropDown.Value;
UPVRobotGenerateMeasurementPoints(app)