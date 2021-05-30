function UPVRobotCreateSpherePanel(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Plane
app.ExtVar.UPVRobot.GeometricCoords.Plane = '3D';

% Create UPVRobotGeometricSpherePanel
app.ExtUI.UPVRobotGeometricSpherePanel = uipanel(app.ExtUI.UPVRobotLeftPanelMeasurementGeometricGrid);
app.ExtUI.UPVRobotGeometricSpherePanel.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotGeometricSpherePanel.Layout.Row = 2;
app.ExtUI.UPVRobotGeometricSpherePanel.Layout.Column = [1 2];

% Create UPVRobotGeometricSphereGrid
app.ExtUI.UPVRobotGeometricSphereGrid = uigridlayout(app.ExtUI.UPVRobotGeometricSpherePanel);
app.ExtUI.UPVRobotGeometricSphereGrid.ColumnWidth = {'fit', '1x', '1x', '1x'};
app.ExtUI.UPVRobotGeometricSphereGrid.RowHeight = {'fit', 'fit', 1, 'fit', 'fit'};
app.ExtUI.UPVRobotGeometricSphereGrid.BackgroundColor = [1 1 1];

% Create UPVRobotGeometricSphereXEditFieldLabel
app.ExtUI.UPVRobotGeometricSphereXEditFieldLabel = uilabel(app.ExtUI.UPVRobotGeometricSphereGrid);
app.ExtUI.UPVRobotGeometricSphereXEditFieldLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricSphereXEditFieldLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotGeometricSphereXEditFieldLabel.Layout.Row = 1;
app.ExtUI.UPVRobotGeometricSphereXEditFieldLabel.Layout.Column = 2;
app.ExtUI.UPVRobotGeometricSphereXEditFieldLabel.Text = 'X';

% Create UPVRobotGeometricSphereXEditField
app.ExtUI.UPVRobotGeometricSphereXEditField = uieditfield(app.ExtUI.UPVRobotGeometricSphereGrid, 'numeric');
app.ExtUI.UPVRobotGeometricSphereXEditField.ValueChangedFcn = {@UPVRobotParameterGeometricSphereChanged,app};
app.ExtUI.UPVRobotGeometricSphereXEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricSphereXEditField.Layout.Row = 2;
app.ExtUI.UPVRobotGeometricSphereXEditField.Layout.Column = 2;
app.ExtUI.UPVRobotGeometricSphereXEditField.Value = 1.5;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.SphereCenterX)
    app.ExtUI.UPVRobotGeometricSphereXEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.SphereCenterX;
else
    app.ExtVar.UPVRobot.GeometricCoords.SphereCenterX = app.ExtUI.UPVRobotGeometricSphereXEditField.Value;
end

% Create UPVRobotGeometricSphereYEditFieldLabel
app.ExtUI.UPVRobotGeometricSphereYEditFieldLabel = uilabel(app.ExtUI.UPVRobotGeometricSphereGrid);
app.ExtUI.UPVRobotGeometricSphereYEditFieldLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricSphereYEditFieldLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotGeometricSphereYEditFieldLabel.Layout.Row = 1;
app.ExtUI.UPVRobotGeometricSphereYEditFieldLabel.Layout.Column = 3;
app.ExtUI.UPVRobotGeometricSphereYEditFieldLabel.Text = 'Y';

% Create UPVRobotGeometricSphereYEditField
app.ExtUI.UPVRobotGeometricSphereYEditField = uieditfield(app.ExtUI.UPVRobotGeometricSphereGrid, 'numeric');
app.ExtUI.UPVRobotGeometricSphereYEditField.ValueChangedFcn = {@UPVRobotParameterGeometricSphereChanged,app};
app.ExtUI.UPVRobotGeometricSphereYEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricSphereYEditField.Layout.Row = 2;
app.ExtUI.UPVRobotGeometricSphereYEditField.Layout.Column = 3;
app.ExtUI.UPVRobotGeometricSphereYEditField.Value = 1.5;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.SphereCenterY)
    app.ExtUI.UPVRobotGeometricSphereYEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.SphereCenterY;
else
    app.ExtVar.UPVRobot.GeometricCoords.SphereCenterY = app.ExtUI.UPVRobotGeometricSphereYEditField.Value;
end

% Create UPVRobotGeometricSphereZEditFieldLabel
app.ExtUI.UPVRobotGeometricSphereZEditFieldLabel = uilabel(app.ExtUI.UPVRobotGeometricSphereGrid);
app.ExtUI.UPVRobotGeometricSphereZEditFieldLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricSphereZEditFieldLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotGeometricSphereZEditFieldLabel.Layout.Row = 1;
app.ExtUI.UPVRobotGeometricSphereZEditFieldLabel.Layout.Column = 4;
app.ExtUI.UPVRobotGeometricSphereZEditFieldLabel.Text = 'Z';

% Create UPVRobotGeometricSphereZEditField
app.ExtUI.UPVRobotGeometricSphereZEditField = uieditfield(app.ExtUI.UPVRobotGeometricSphereGrid, 'numeric');
app.ExtUI.UPVRobotGeometricSphereZEditField.ValueChangedFcn = {@UPVRobotParameterGeometricSphereChanged,app};
app.ExtUI.UPVRobotGeometricSphereZEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricSphereZEditField.Layout.Row = 2;
app.ExtUI.UPVRobotGeometricSphereZEditField.Layout.Column = 4;
app.ExtUI.UPVRobotGeometricSphereZEditField.Value = 0.5;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.SphereCenterZ)
    app.ExtUI.UPVRobotGeometricSphereZEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.SphereCenterZ;
else
    app.ExtVar.UPVRobot.GeometricCoords.SphereCenterZ = app.ExtUI.UPVRobotGeometricSphereZEditField.Value;
end

% Create UPVRobotGeometricSphereCentermLabel
app.ExtUI.UPVRobotGeometricSphereCentermLabel = uilabel(app.ExtUI.UPVRobotGeometricSphereGrid);
app.ExtUI.UPVRobotGeometricSphereCentermLabel.Layout.Row = 2;
app.ExtUI.UPVRobotGeometricSphereCentermLabel.Layout.Column = 1;
app.ExtUI.UPVRobotGeometricSphereCentermLabel.Text = 'Center (m)';

% Create UPVRobotGeometricSphereSeparator2
app.ExtUI.UPVRobotGeometricSphereSeparator2 = uilabel(app.ExtUI.UPVRobotGeometricSphereGrid);
app.ExtUI.UPVRobotGeometricSphereSeparator2.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotGeometricSphereSeparator2.Layout.Row = 3;
app.ExtUI.UPVRobotGeometricSphereSeparator2.Layout.Column = [1 4];
app.ExtUI.UPVRobotGeometricSphereSeparator2.Text = '';

% Create UPVRobotGeometricSphereSubGrid
app.ExtUI.UPVRobotGeometricSphereSubGrid = uigridlayout(app.ExtUI.UPVRobotGeometricSphereGrid);
app.ExtUI.UPVRobotGeometricSphereSubGrid.ColumnWidth = {'fit', '1x', 1, 'fit', '1x'};
app.ExtUI.UPVRobotGeometricSphereSubGrid.Padding = [0 0 0 0];
app.ExtUI.UPVRobotGeometricSphereSubGrid.Layout.Row = [4 5];
app.ExtUI.UPVRobotGeometricSphereSubGrid.Layout.Column = [1 4];
app.ExtUI.UPVRobotGeometricSphereSubGrid.BackgroundColor = [1 1 1];

% Create ResthetaLabel
app.ExtUI.ResthetaLabel = uilabel(app.ExtUI.UPVRobotGeometricSphereSubGrid);
app.ExtUI.ResthetaLabel.Layout.Row = 1;
app.ExtUI.ResthetaLabel.Layout.Column = 4;
app.ExtUI.ResthetaLabel.Text = 'Res (theta)';

% Create UPVRobotGeometricSphereResThetaEditField
app.ExtUI.UPVRobotGeometricSphereResThetaEditField = uieditfield(app.ExtUI.UPVRobotGeometricSphereSubGrid, 'numeric');
app.ExtUI.UPVRobotGeometricSphereResThetaEditField.ValueChangedFcn = {@UPVRobotParameterGeometricSphereChanged,app};
app.ExtUI.UPVRobotGeometricSphereResThetaEditField.Limits = [1 Inf];
app.ExtUI.UPVRobotGeometricSphereResThetaEditField.RoundFractionalValues = 'on';
app.ExtUI.UPVRobotGeometricSphereResThetaEditField.ValueDisplayFormat = '%.0f';
app.ExtUI.UPVRobotGeometricSphereResThetaEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricSphereResThetaEditField.Layout.Row = 1;
app.ExtUI.UPVRobotGeometricSphereResThetaEditField.Layout.Column = 5;
app.ExtUI.UPVRobotGeometricSphereResThetaEditField.Value = 10;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.SphereThetaRes)
    app.ExtUI.UPVRobotGeometricSphereResThetaEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.SphereThetaRes;
else
    app.ExtVar.UPVRobot.GeometricCoords.SphereThetaRes = app.ExtUI.UPVRobotGeometricSphereResThetaEditField.Value;
end

% Create RadiusmEditFieldLabel_3
app.ExtUI.RadiusmEditFieldLabel_3 = uilabel(app.ExtUI.UPVRobotGeometricSphereSubGrid);
app.ExtUI.RadiusmEditFieldLabel_3.HorizontalAlignment = 'right';
app.ExtUI.RadiusmEditFieldLabel_3.Layout.Row = 1;
app.ExtUI.RadiusmEditFieldLabel_3.Layout.Column = 1;
app.ExtUI.RadiusmEditFieldLabel_3.Text = 'Radius (m)';

% Create UPVRobotGeometricSphereRadiusmEditField
app.ExtUI.UPVRobotGeometricSphereRadiusmEditField = uieditfield(app.ExtUI.UPVRobotGeometricSphereSubGrid, 'numeric');
app.ExtUI.UPVRobotGeometricSphereRadiusmEditField.ValueChangedFcn = {@UPVRobotParameterGeometricSphereChanged,app};
app.ExtUI.UPVRobotGeometricSphereRadiusmEditField.LowerLimitInclusive = 'off';
app.ExtUI.UPVRobotGeometricSphereRadiusmEditField.Limits = [0 Inf];
app.ExtUI.UPVRobotGeometricSphereRadiusmEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricSphereRadiusmEditField.Layout.Row = 1;
app.ExtUI.UPVRobotGeometricSphereRadiusmEditField.Layout.Column = 2;
app.ExtUI.UPVRobotGeometricSphereRadiusmEditField.Value = 0.5;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.SphereRadius)
    app.ExtUI.UPVRobotGeometricSphereRadiusmEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.SphereRadius;
else
    app.ExtVar.UPVRobot.GeometricCoords.SphereRadius = app.ExtUI.UPVRobotGeometricSphereRadiusmEditField.Value;
end

% Create UPVRobotGeometricSphereSeparator3
app.ExtUI.UPVRobotGeometricSphereSeparator3 = uilabel(app.ExtUI.UPVRobotGeometricSphereSubGrid);
app.ExtUI.UPVRobotGeometricSphereSeparator3.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotGeometricSphereSeparator3.Layout.Row = [1 2];
app.ExtUI.UPVRobotGeometricSphereSeparator3.Layout.Column = 3;
app.ExtUI.UPVRobotGeometricSphereSeparator3.Text = '';

% Create ResphiLabel
app.ExtUI.ResphiLabel = uilabel(app.ExtUI.UPVRobotGeometricSphereSubGrid);
app.ExtUI.ResphiLabel.Layout.Row = 2;
app.ExtUI.ResphiLabel.Layout.Column = 4;
app.ExtUI.ResphiLabel.Text = 'Res (phi)';

% Create UPVRobotGeometricSphereResPhiEditField
app.ExtUI.UPVRobotGeometricSphereResPhiEditField = uieditfield(app.ExtUI.UPVRobotGeometricSphereSubGrid, 'numeric');
app.ExtUI.UPVRobotGeometricSphereResPhiEditField.ValueChangedFcn = {@UPVRobotParameterGeometricSphereChanged,app};
app.ExtUI.UPVRobotGeometricSphereResPhiEditField.Limits = [1 Inf];
app.ExtUI.UPVRobotGeometricSphereResPhiEditField.RoundFractionalValues = 'on';
app.ExtUI.UPVRobotGeometricSphereResPhiEditField.ValueDisplayFormat = '%.0f';
app.ExtUI.UPVRobotGeometricSphereResPhiEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricSphereResPhiEditField.Layout.Row = 2;
app.ExtUI.UPVRobotGeometricSphereResPhiEditField.Layout.Column = 5;
app.ExtUI.UPVRobotGeometricSphereResPhiEditField.Value = 10;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.SpherePhiRes)
    app.ExtUI.UPVRobotGeometricSphereResPhiEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.SpherePhiRes;
else
    app.ExtVar.UPVRobot.GeometricCoords.SpherePhiRes = app.ExtUI.UPVRobotGeometricSphereResPhiEditField.Value;
end

function UPVRobotParameterGeometricSphereChanged(~,~,app)
app.ExtVar.UPVRobot.GeometricCoords.SphereCenterX = app.ExtUI.UPVRobotGeometricSphereXEditField.Value;
app.ExtVar.UPVRobot.GeometricCoords.SphereCenterY = app.ExtUI.UPVRobotGeometricSphereYEditField.Value;
app.ExtVar.UPVRobot.GeometricCoords.SphereCenterZ = app.ExtUI.UPVRobotGeometricSphereZEditField.Value;
app.ExtVar.UPVRobot.GeometricCoords.SphereThetaRes = app.ExtUI.UPVRobotGeometricSphereResThetaEditField.Value;
app.ExtVar.UPVRobot.GeometricCoords.SpherePhiRes = app.ExtUI.UPVRobotGeometricSphereResPhiEditField.Value;
app.ExtVar.UPVRobot.GeometricCoords.SphereRadius = app.ExtUI.UPVRobotGeometricSphereRadiusmEditField.Value;
app.ExtVar.UPVRobot.GeometricCoords.Plane = '3D';
UPVRobotGenerateMeasurementPoints(app)