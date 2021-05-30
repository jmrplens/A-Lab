function UPVRobotCreateCirclePanel(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% =======================================================================
% Circle


% Create UPVRobotGeometricCirclePanel
app.ExtUI.UPVRobotGeometricCirclePanel = uipanel(app.ExtUI.UPVRobotLeftPanelMeasurementGeometricGrid);
app.ExtUI.UPVRobotGeometricCirclePanel.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotGeometricCirclePanel.Layout.Row = 2;
app.ExtUI.UPVRobotGeometricCirclePanel.Layout.Column = [1 2];

% Create UPVRobotGeometricCircleGrid
app.ExtUI.UPVRobotGeometricCircleGrid = uigridlayout(app.ExtUI.UPVRobotGeometricCirclePanel);
app.ExtUI.UPVRobotGeometricCircleGrid.ColumnWidth = {'fit', '1x', '1x', '1x'};
app.ExtUI.UPVRobotGeometricCircleGrid.RowHeight = {'fit', 1, 'fit', 'fit', 1, 'fit', 'fit'};
app.ExtUI.UPVRobotGeometricCircleGrid.BackgroundColor = [1 1 1];

% Create UPVRobotGeometricCirclePlaneDropDownLabel
app.ExtUI.UPVRobotGeometricCirclePlaneDropDownLabel = uilabel(app.ExtUI.UPVRobotGeometricCircleGrid);
app.ExtUI.UPVRobotGeometricCirclePlaneDropDownLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotGeometricCirclePlaneDropDownLabel.Layout.Row = 1;
app.ExtUI.UPVRobotGeometricCirclePlaneDropDownLabel.Layout.Column = [1 2];
app.ExtUI.UPVRobotGeometricCirclePlaneDropDownLabel.Text = 'Plane';

% Create UPVRobotGeometricCirclePlaneDropDown
app.ExtUI.UPVRobotGeometricCirclePlaneDropDown = uidropdown(app.ExtUI.UPVRobotGeometricCircleGrid);
app.ExtUI.UPVRobotGeometricCirclePlaneDropDown.ValueChangedFcn = {@UPVRobotParameterGeometricCircleChanged,app};
app.ExtUI.UPVRobotGeometricCirclePlaneDropDown.Items = {'XY', 'XZ', 'YZ'};
app.ExtUI.UPVRobotGeometricCirclePlaneDropDown.Layout.Row = 1;
app.ExtUI.UPVRobotGeometricCirclePlaneDropDown.Layout.Column = [3 4];
app.ExtUI.UPVRobotGeometricCirclePlaneDropDown.Value = 'XY';
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.Plane) && ~strcmp(app.ExtVar.UPVRobot.GeometricCoords.Plane,'3D')
    app.ExtUI.UPVRobotGeometricCirclePlaneDropDown.Value = app.ExtVar.UPVRobot.GeometricCoords.Plane;
else
    app.ExtVar.UPVRobot.GeometricCoords.Plane = app.ExtUI.UPVRobotGeometricCirclePlaneDropDown.Value;
end

% Create UPVRobotGeometricCircleSeparator
app.ExtUI.UPVRobotGeometricCircleSeparator = uilabel(app.ExtUI.UPVRobotGeometricCircleGrid);
app.ExtUI.UPVRobotGeometricCircleSeparator.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotGeometricCircleSeparator.Layout.Row = 2;
app.ExtUI.UPVRobotGeometricCircleSeparator.Layout.Column = [1 4];
app.ExtUI.UPVRobotGeometricCircleSeparator.Text = '';

% Create UPVRobotGeometricCircleXEditFieldLabel
app.ExtUI.UPVRobotGeometricCircleXEditFieldLabel = uilabel(app.ExtUI.UPVRobotGeometricCircleGrid);
app.ExtUI.UPVRobotGeometricCircleXEditFieldLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricCircleXEditFieldLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotGeometricCircleXEditFieldLabel.Layout.Row = 3;
app.ExtUI.UPVRobotGeometricCircleXEditFieldLabel.Layout.Column = 2;
app.ExtUI.UPVRobotGeometricCircleXEditFieldLabel.Text = 'X';

% Create UPVRobotGeometricCircleXEditField
app.ExtUI.UPVRobotGeometricCircleXEditField = uieditfield(app.ExtUI.UPVRobotGeometricCircleGrid, 'numeric');
app.ExtUI.UPVRobotGeometricCircleXEditField.ValueChangedFcn = {@UPVRobotParameterGeometricCircleChanged,app};
app.ExtUI.UPVRobotGeometricCircleXEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricCircleXEditField.Layout.Row = 4;
app.ExtUI.UPVRobotGeometricCircleXEditField.Layout.Column = 2;
app.ExtUI.UPVRobotGeometricCircleXEditField.Value = 1.5;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.CircleCenterX)
    app.ExtUI.UPVRobotGeometricCircleXEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.CircleCenterX;
else
    app.ExtVar.UPVRobot.GeometricCoords.CircleCenterX = app.ExtUI.UPVRobotGeometricCircleXEditField.Value;
end

% Create YEditFieldLabel_2
app.ExtUI.YEditFieldLabel_2 = uilabel(app.ExtUI.UPVRobotGeometricCircleGrid);
app.ExtUI.YEditFieldLabel_2.HorizontalAlignment = 'center';
app.ExtUI.YEditFieldLabel_2.FontWeight = 'bold';
app.ExtUI.YEditFieldLabel_2.Layout.Row = 3;
app.ExtUI.YEditFieldLabel_2.Layout.Column = 3;
app.ExtUI.YEditFieldLabel_2.Text = 'Y';

% Create UPVRobotGeometricCircleYEditField
app.ExtUI.UPVRobotGeometricCircleYEditField = uieditfield(app.ExtUI.UPVRobotGeometricCircleGrid, 'numeric');
app.ExtUI.UPVRobotGeometricCircleYEditField.ValueChangedFcn = {@UPVRobotParameterGeometricCircleChanged,app};
app.ExtUI.UPVRobotGeometricCircleYEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricCircleYEditField.Layout.Row = 4;
app.ExtUI.UPVRobotGeometricCircleYEditField.Layout.Column = 3;
app.ExtUI.UPVRobotGeometricCircleYEditField.Value = 1.5;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.CircleCenterY)
    app.ExtUI.UPVRobotGeometricCircleYEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.CircleCenterY;
else
    app.ExtVar.UPVRobot.GeometricCoords.CircleCenterY = app.ExtUI.UPVRobotGeometricCircleYEditField.Value;
end

% Create ZEditFieldLabel_2
app.ExtUI.ZEditFieldLabel_2 = uilabel(app.ExtUI.UPVRobotGeometricCircleGrid);
app.ExtUI.ZEditFieldLabel_2.HorizontalAlignment = 'center';
app.ExtUI.ZEditFieldLabel_2.FontWeight = 'bold';
app.ExtUI.ZEditFieldLabel_2.Layout.Row = 3;
app.ExtUI.ZEditFieldLabel_2.Layout.Column = 4;
app.ExtUI.ZEditFieldLabel_2.Text = 'Z';

% Create UPVRobotGeometricCircleZEditField
app.ExtUI.UPVRobotGeometricCircleZEditField = uieditfield(app.ExtUI.UPVRobotGeometricCircleGrid, 'numeric');
app.ExtUI.UPVRobotGeometricCircleZEditField.ValueChangedFcn = {@UPVRobotParameterGeometricCircleChanged,app};
app.ExtUI.UPVRobotGeometricCircleZEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricCircleZEditField.Layout.Row = 4;
app.ExtUI.UPVRobotGeometricCircleZEditField.Layout.Column = 4;
app.ExtUI.UPVRobotGeometricCircleZEditField.Value = 0;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.CircleCenterZ)
    app.ExtUI.UPVRobotGeometricCircleZEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.CircleCenterZ;
else
    app.ExtVar.UPVRobot.GeometricCoords.CircleCenterZ = app.ExtUI.UPVRobotGeometricCircleZEditField.Value;
end

% Create UPVRobotGeometricCircleCentermLabel
app.ExtUI.UPVRobotGeometricCircleCentermLabel = uilabel(app.ExtUI.UPVRobotGeometricCircleGrid);
app.ExtUI.UPVRobotGeometricCircleCentermLabel.Layout.Row = 4;
app.ExtUI.UPVRobotGeometricCircleCentermLabel.Layout.Column = 1;
app.ExtUI.UPVRobotGeometricCircleCentermLabel.Text = 'Center (m)';

% Create UPVRobotGeometricCircleSeparator2
app.ExtUI.UPVRobotGeometricCircleSeparator2 = uilabel(app.ExtUI.UPVRobotGeometricCircleGrid);
app.ExtUI.UPVRobotGeometricCircleSeparator2.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotGeometricCircleSeparator2.Layout.Row = 5;
app.ExtUI.UPVRobotGeometricCircleSeparator2.Layout.Column = [1 4];
app.ExtUI.UPVRobotGeometricCircleSeparator2.Text = '';

% Create UPVRobotGeometricCircleSubGrid
app.ExtUI.UPVRobotGeometricCircleSubGrid = uigridlayout(app.ExtUI.UPVRobotGeometricCircleGrid);
app.ExtUI.UPVRobotGeometricCircleSubGrid.ColumnWidth = {'fit', '1x', 1, 'fit', '1x'};
app.ExtUI.UPVRobotGeometricCircleSubGrid.Padding = [0 0 0 0];
app.ExtUI.UPVRobotGeometricCircleSubGrid.Layout.Row = [6 7];
app.ExtUI.UPVRobotGeometricCircleSubGrid.Layout.Column = [1 4];
app.ExtUI.UPVRobotGeometricCircleSubGrid.BackgroundColor = [1 1 1];

% Create UPVRobotGeometricCircleRadiusmEditFieldLabel
app.ExtUI.UPVRobotGeometricCircleRadiusmEditFieldLabel = uilabel(app.ExtUI.UPVRobotGeometricCircleSubGrid);
app.ExtUI.UPVRobotGeometricCircleRadiusmEditFieldLabel.Layout.Row = 1;
app.ExtUI.UPVRobotGeometricCircleRadiusmEditFieldLabel.Layout.Column = 1;
app.ExtUI.UPVRobotGeometricCircleRadiusmEditFieldLabel.Text = 'Max radius (m)';

% Create UPVRobotGeometricCircleRadiusmEditField
app.ExtUI.UPVRobotGeometricCircleRadiusmEditField = uieditfield(app.ExtUI.UPVRobotGeometricCircleSubGrid, 'numeric');
app.ExtUI.UPVRobotGeometricCircleRadiusmEditField.ValueChangedFcn = {@UPVRobotParameterGeometricCircleChanged,app};
app.ExtUI.UPVRobotGeometricCircleRadiusmEditField.LowerLimitInclusive = 'off';
app.ExtUI.UPVRobotGeometricCircleRadiusmEditField.Limits = [0 Inf];
app.ExtUI.UPVRobotGeometricCircleRadiusmEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricCircleRadiusmEditField.Layout.Row = 1;
app.ExtUI.UPVRobotGeometricCircleRadiusmEditField.Layout.Column = 2;
app.ExtUI.UPVRobotGeometricCircleRadiusmEditField.Value = 1;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.CircleMaxRadius)
    app.ExtUI.UPVRobotGeometricCircleRadiusmEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.CircleMaxRadius;
else
    app.ExtVar.UPVRobot.GeometricCoords.CircleMaxRadius = app.ExtUI.UPVRobotGeometricCircleRadiusmEditField.Value;
end

% Create UPVRobotGeometricCircleResolutionEditFieldLabel
app.ExtUI.UPVRobotGeometricCircleResolutionEditFieldLabel = uilabel(app.ExtUI.UPVRobotGeometricCircleSubGrid);
app.ExtUI.UPVRobotGeometricCircleResolutionEditFieldLabel.Layout.Row = 2;
app.ExtUI.UPVRobotGeometricCircleResolutionEditFieldLabel.Layout.Column = 1;
app.ExtUI.UPVRobotGeometricCircleResolutionEditFieldLabel.Text = 'Resolution';

% Create UPVRobotGeometricCircleResolutionEditField
app.ExtUI.UPVRobotGeometricCircleResolutionEditField = uieditfield(app.ExtUI.UPVRobotGeometricCircleSubGrid, 'numeric');
app.ExtUI.UPVRobotGeometricCircleResolutionEditField.ValueChangedFcn = {@UPVRobotParameterGeometricCircleChanged,app};
app.ExtUI.UPVRobotGeometricCircleResolutionEditField.Limits = [1 Inf];
app.ExtUI.UPVRobotGeometricCircleResolutionEditField.RoundFractionalValues = 'on';
app.ExtUI.UPVRobotGeometricCircleResolutionEditField.ValueDisplayFormat = '%.0f';
app.ExtUI.UPVRobotGeometricCircleResolutionEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricCircleResolutionEditField.Layout.Row = 2;
app.ExtUI.UPVRobotGeometricCircleResolutionEditField.Layout.Column = 2;
app.ExtUI.UPVRobotGeometricCircleResolutionEditField.Value = 10;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.CircleRes)
    app.ExtUI.UPVRobotGeometricCircleResolutionEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.CircleRes;
else
    app.ExtVar.UPVRobot.GeometricCoords.CircleRes = app.ExtUI.UPVRobotGeometricCircleResolutionEditField.Value;
end

% Create UPVRobotGeometricCircleSeparator3
app.ExtUI.UPVRobotGeometricCircleSeparator3 = uilabel(app.ExtUI.UPVRobotGeometricCircleSubGrid);
app.ExtUI.UPVRobotGeometricCircleSeparator3.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotGeometricCircleSeparator3.Layout.Row = [1 2];
app.ExtUI.UPVRobotGeometricCircleSeparator3.Layout.Column = 3;
app.ExtUI.UPVRobotGeometricCircleSeparator3.Text = '';

% Create UPVRobotGeometricCircleCirclesEditFieldLabel
app.ExtUI.UPVRobotGeometricCircleCirclesEditFieldLabel = uilabel(app.ExtUI.UPVRobotGeometricCircleSubGrid);
app.ExtUI.UPVRobotGeometricCircleCirclesEditFieldLabel.Layout.Row = 1;
app.ExtUI.UPVRobotGeometricCircleCirclesEditFieldLabel.Layout.Column = 4;
app.ExtUI.UPVRobotGeometricCircleCirclesEditFieldLabel.Text = 'Circles';

% Create UPVRobotGeometricCircleCirclesEditField
app.ExtUI.UPVRobotGeometricCircleCirclesEditField = uieditfield(app.ExtUI.UPVRobotGeometricCircleSubGrid, 'numeric');
app.ExtUI.UPVRobotGeometricCircleCirclesEditField.ValueChangedFcn = {@UPVRobotParameterGeometricCircleChanged,app};
app.ExtUI.UPVRobotGeometricCircleCirclesEditField.Limits = [1 Inf];
app.ExtUI.UPVRobotGeometricCircleCirclesEditField.RoundFractionalValues = 'on';
app.ExtUI.UPVRobotGeometricCircleCirclesEditField.ValueDisplayFormat = '%.0f';
app.ExtUI.UPVRobotGeometricCircleCirclesEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricCircleCirclesEditField.Layout.Row = 1;
app.ExtUI.UPVRobotGeometricCircleCirclesEditField.Layout.Column = 5;
app.ExtUI.UPVRobotGeometricCircleCirclesEditField.Value = 10;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.CircleNum)
    app.ExtUI.UPVRobotGeometricCircleCirclesEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.CircleNum;
else
    app.ExtVar.UPVRobot.GeometricCoords.CircleNum = app.ExtUI.UPVRobotGeometricCircleCirclesEditField.Value;
end

function UPVRobotParameterGeometricCircleChanged(~,~,app)
app.ExtVar.UPVRobot.GeometricCoords.Plane = app.ExtUI.UPVRobotGeometricCirclePlaneDropDown.Value;
app.ExtVar.UPVRobot.GeometricCoords.CircleCenterX = app.ExtUI.UPVRobotGeometricCircleXEditField.Value;
app.ExtVar.UPVRobot.GeometricCoords.CircleCenterY = app.ExtUI.UPVRobotGeometricCircleYEditField.Value;
app.ExtVar.UPVRobot.GeometricCoords.CircleCenterZ = app.ExtUI.UPVRobotGeometricCircleZEditField.Value;
app.ExtVar.UPVRobot.GeometricCoords.CircleMaxRadius = app.ExtUI.UPVRobotGeometricCircleRadiusmEditField.Value;
app.ExtVar.UPVRobot.GeometricCoords.CircleRes = app.ExtUI.UPVRobotGeometricCircleResolutionEditField.Value;
app.ExtVar.UPVRobot.GeometricCoords.CircleNum = app.ExtUI.UPVRobotGeometricCircleCirclesEditField.Value;
UPVRobotGenerateMeasurementPoints(app)