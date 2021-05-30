function UPVRobotCreateRectanglePanel(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Create UPVRobotGeometricRectanPanel
app.ExtUI.UPVRobotGeometricRectanPanel = uipanel(app.ExtUI.UPVRobotLeftPanelMeasurementGeometricGrid);
app.ExtUI.UPVRobotGeometricRectanPanel.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotGeometricRectanPanel.Layout.Row = 2;
app.ExtUI.UPVRobotGeometricRectanPanel.Layout.Column = [1 2];

% Create UPVRobotGeometricRectanGrid
app.ExtUI.UPVRobotGeometricRectanGrid = uigridlayout(app.ExtUI.UPVRobotGeometricRectanPanel);
app.ExtUI.UPVRobotGeometricRectanGrid.ColumnWidth = {'fit', '1x', '1x', '1x'};
app.ExtUI.UPVRobotGeometricRectanGrid.RowHeight = {'fit', 1, 'fit', 'fit', 1, 'fit', 'fit'};
app.ExtUI.UPVRobotGeometricRectanGrid.BackgroundColor = [1 1 1];

% Create UPVRobotGeometricRectanPlaneDropDownLabel
app.ExtUI.UPVRobotGeometricRectanPlaneDropDownLabel = uilabel(app.ExtUI.UPVRobotGeometricRectanGrid);
app.ExtUI.UPVRobotGeometricRectanPlaneDropDownLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotGeometricRectanPlaneDropDownLabel.Layout.Row = 1;
app.ExtUI.UPVRobotGeometricRectanPlaneDropDownLabel.Layout.Column = [1 2];
app.ExtUI.UPVRobotGeometricRectanPlaneDropDownLabel.Text = 'Plane';

% Create UPVRobotGeometricRectanPlaneDropDown
app.ExtUI.UPVRobotGeometricRectanPlaneDropDown = uidropdown(app.ExtUI.UPVRobotGeometricRectanGrid);
app.ExtUI.UPVRobotGeometricRectanPlaneDropDown.ValueChangedFcn = {@UPVRobotParameterGeometricRectanChanged,app};
app.ExtUI.UPVRobotGeometricRectanPlaneDropDown.Items = {'XY', 'XZ', 'YZ'};
app.ExtUI.UPVRobotGeometricRectanPlaneDropDown.Layout.Row = 1;
app.ExtUI.UPVRobotGeometricRectanPlaneDropDown.Layout.Column = [3 4];
app.ExtUI.UPVRobotGeometricRectanPlaneDropDown.Value = 'XY';
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.Plane) && ~strcmp(app.ExtVar.UPVRobot.GeometricCoords.Plane,'3D')
    app.ExtUI.UPVRobotGeometricRectanPlaneDropDown.Value = app.ExtVar.UPVRobot.GeometricCoords.Plane;
else
    app.ExtVar.UPVRobot.GeometricCoords.Plane = app.ExtUI.UPVRobotGeometricRectanPlaneDropDown.Value;
end

% Create UPVRobotGeometricRectanSeparator
app.ExtUI.UPVRobotGeometricRectanSeparator = uilabel(app.ExtUI.UPVRobotGeometricRectanGrid);
app.ExtUI.UPVRobotGeometricRectanSeparator.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotGeometricRectanSeparator.Layout.Row = 2;
app.ExtUI.UPVRobotGeometricRectanSeparator.Layout.Column = [1 4];
app.ExtUI.UPVRobotGeometricRectanSeparator.Text = '';

% Create UPVRobotGeometricRectanXEditFieldLabel
app.ExtUI.UPVRobotGeometricRectanXEditFieldLabel = uilabel(app.ExtUI.UPVRobotGeometricRectanGrid);
app.ExtUI.UPVRobotGeometricRectanXEditFieldLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricRectanXEditFieldLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotGeometricRectanXEditFieldLabel.Layout.Row = 3;
app.ExtUI.UPVRobotGeometricRectanXEditFieldLabel.Layout.Column = 2;
app.ExtUI.UPVRobotGeometricRectanXEditFieldLabel.Text = 'X';

% Create UPVRobotGeometricRectanXEditField
app.ExtUI.UPVRobotGeometricRectanXEditField = uieditfield(app.ExtUI.UPVRobotGeometricRectanGrid, 'numeric');
app.ExtUI.UPVRobotGeometricRectanXEditField.ValueChangedFcn = {@UPVRobotParameterGeometricRectanChanged,app};
app.ExtUI.UPVRobotGeometricRectanXEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricRectanXEditField.Layout.Row = 4;
app.ExtUI.UPVRobotGeometricRectanXEditField.Layout.Column = 2;
app.ExtUI.UPVRobotGeometricRectanXEditField.Value = 0.5;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.RectangleOriginX)
    app.ExtUI.UPVRobotGeometricRectanXEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.RectangleOriginX;
else
    app.ExtVar.UPVRobot.GeometricCoords.RectangleOriginX = app.ExtUI.UPVRobotGeometricRectanXEditField.Value;
end

% Create UPVRobotGeometricRectanYEditFieldLabel
app.ExtUI.UPVRobotGeometricRectanYEditFieldLabel = uilabel(app.ExtUI.UPVRobotGeometricRectanGrid);
app.ExtUI.UPVRobotGeometricRectanYEditFieldLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricRectanYEditFieldLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotGeometricRectanYEditFieldLabel.Layout.Row = 3;
app.ExtUI.UPVRobotGeometricRectanYEditFieldLabel.Layout.Column = 3;
app.ExtUI.UPVRobotGeometricRectanYEditFieldLabel.Text = 'Y';

% Create UPVRobotGeometricRectanYEditField
app.ExtUI.UPVRobotGeometricRectanYEditField = uieditfield(app.ExtUI.UPVRobotGeometricRectanGrid, 'numeric');
app.ExtUI.UPVRobotGeometricRectanYEditField.ValueChangedFcn = {@UPVRobotParameterGeometricRectanChanged,app};
app.ExtUI.UPVRobotGeometricRectanYEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricRectanYEditField.Layout.Row = 4;
app.ExtUI.UPVRobotGeometricRectanYEditField.Layout.Column = 3;
app.ExtUI.UPVRobotGeometricRectanYEditField.Value = 0.5;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.RectangleOriginY)
    app.ExtUI.UPVRobotGeometricRectanYEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.RectangleOriginY;
else
    app.ExtVar.UPVRobot.GeometricCoords.RectangleOriginY = app.ExtUI.UPVRobotGeometricRectanYEditField.Value;
end

% Create UPVRobotGeometricRectanZEditFieldLabel
app.ExtUI.UPVRobotGeometricRectanZEditFieldLabel = uilabel(app.ExtUI.UPVRobotGeometricRectanGrid);
app.ExtUI.UPVRobotGeometricRectanZEditFieldLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricRectanZEditFieldLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotGeometricRectanZEditFieldLabel.Layout.Row = 3;
app.ExtUI.UPVRobotGeometricRectanZEditFieldLabel.Layout.Column = 4;
app.ExtUI.UPVRobotGeometricRectanZEditFieldLabel.Text = 'Z';

% Create UPVRobotGeometricRectanZEditField
app.ExtUI.UPVRobotGeometricRectanZEditField = uieditfield(app.ExtUI.UPVRobotGeometricRectanGrid, 'numeric');
app.ExtUI.UPVRobotGeometricRectanZEditField.ValueChangedFcn = {@UPVRobotParameterGeometricRectanChanged,app};
app.ExtUI.UPVRobotGeometricRectanZEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricRectanZEditField.Layout.Row = 4;
app.ExtUI.UPVRobotGeometricRectanZEditField.Layout.Column = 4;
app.ExtUI.UPVRobotGeometricRectanZEditField.Value = 0;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.RectangleOriginZ)
    app.ExtUI.UPVRobotGeometricRectanZEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.RectangleOriginZ;
else
    app.ExtVar.UPVRobot.GeometricCoords.RectangleOriginZ = app.ExtUI.UPVRobotGeometricRectanZEditField.Value;
end


% Create UPVRobotGeometricRectanCentermLabel
app.ExtUI.UPVRobotGeometricRectanCentermLabel = uilabel(app.ExtUI.UPVRobotGeometricRectanGrid);
app.ExtUI.UPVRobotGeometricRectanCentermLabel.Layout.Row = 4;
app.ExtUI.UPVRobotGeometricRectanCentermLabel.Layout.Column = 1;
app.ExtUI.UPVRobotGeometricRectanCentermLabel.Text = 'Origin (m)';

% Create UPVRobotGeometricRectanSeparator2
app.ExtUI.UPVRobotGeometricRectanSeparator2 = uilabel(app.ExtUI.UPVRobotGeometricRectanGrid);
app.ExtUI.UPVRobotGeometricRectanSeparator2.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotGeometricRectanSeparator2.Layout.Row = 5;
app.ExtUI.UPVRobotGeometricRectanSeparator2.Layout.Column = [1 4];
app.ExtUI.UPVRobotGeometricRectanSeparator2.Text = '';

% Create UPVRobotGeometricRectanSubGrid
app.ExtUI.UPVRobotGeometricRectanSubGrid = uigridlayout(app.ExtUI.UPVRobotGeometricRectanGrid);
app.ExtUI.UPVRobotGeometricRectanSubGrid.ColumnWidth = {'fit', '1x', 1, 'fit', '1x'};
app.ExtUI.UPVRobotGeometricRectanSubGrid.Padding = [0 0 0 0];
app.ExtUI.UPVRobotGeometricRectanSubGrid.Layout.Row = [6 7];
app.ExtUI.UPVRobotGeometricRectanSubGrid.Layout.Column = [1 4];
app.ExtUI.UPVRobotGeometricRectanSubGrid.BackgroundColor = [1 1 1];

% Create UPVRobotGeometricRectanHoriLengthEditFieldLabel
app.ExtUI.UPVRobotGeometricRectanHoriLengthEditFieldLabel = uilabel(app.ExtUI.UPVRobotGeometricRectanSubGrid);
app.ExtUI.UPVRobotGeometricRectanHoriLengthEditFieldLabel.Layout.Row = 1;
app.ExtUI.UPVRobotGeometricRectanHoriLengthEditFieldLabel.Layout.Column = 1;
app.ExtUI.UPVRobotGeometricRectanHoriLengthEditFieldLabel.Text = 'H length (m)';

% Create UPVRobotGeometricRectanHoriLengthEditField
app.ExtUI.UPVRobotGeometricRectanHoriLengthEditField = uieditfield(app.ExtUI.UPVRobotGeometricRectanSubGrid, 'numeric');
app.ExtUI.UPVRobotGeometricRectanHoriLengthEditField.ValueChangedFcn = {@UPVRobotParameterGeometricRectanChanged,app};
app.ExtUI.UPVRobotGeometricRectanHoriLengthEditField.LowerLimitInclusive = 'off';
app.ExtUI.UPVRobotGeometricRectanHoriLengthEditField.Limits = [0 Inf];
app.ExtUI.UPVRobotGeometricRectanHoriLengthEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricRectanHoriLengthEditField.Layout.Row = 1;
app.ExtUI.UPVRobotGeometricRectanHoriLengthEditField.Layout.Column = 2;
app.ExtUI.UPVRobotGeometricRectanHoriLengthEditField.Value = 2;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.RectangleLenH)
    app.ExtUI.UPVRobotGeometricRectanHoriLengthEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.RectangleLenH;
else
    app.ExtVar.UPVRobot.GeometricCoords.RectangleLenH = app.ExtUI.UPVRobotGeometricRectanHoriLengthEditField.Value;
end

% Create UPVRobotGeometricRectanHoriResEditFieldLabel
app.ExtUI.UPVRobotGeometricRectanHoriResEditFieldLabel = uilabel(app.ExtUI.UPVRobotGeometricRectanSubGrid);
app.ExtUI.UPVRobotGeometricRectanHoriResEditFieldLabel.Layout.Row = 2;
app.ExtUI.UPVRobotGeometricRectanHoriResEditFieldLabel.Layout.Column = 1;
app.ExtUI.UPVRobotGeometricRectanHoriResEditFieldLabel.Text = 'H res';

% Create UPVRobotGeometricRectanHoriResEditField
app.ExtUI.UPVRobotGeometricRectanHoriResEditField = uieditfield(app.ExtUI.UPVRobotGeometricRectanSubGrid, 'numeric');
app.ExtUI.UPVRobotGeometricRectanHoriResEditField.ValueChangedFcn = {@UPVRobotParameterGeometricRectanChanged,app};
app.ExtUI.UPVRobotGeometricRectanHoriResEditField.Limits = [1 Inf];
app.ExtUI.UPVRobotGeometricRectanHoriResEditField.RoundFractionalValues = 'on';
app.ExtUI.UPVRobotGeometricRectanHoriResEditField.ValueDisplayFormat = '%.0f';
app.ExtUI.UPVRobotGeometricRectanHoriResEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricRectanHoriResEditField.Layout.Row = 2;
app.ExtUI.UPVRobotGeometricRectanHoriResEditField.Layout.Column = 2;
app.ExtUI.UPVRobotGeometricRectanHoriResEditField.Value = 10;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.RectangleResH)
    app.ExtUI.UPVRobotGeometricRectanHoriResEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.RectangleResH;
else
    app.ExtVar.UPVRobot.GeometricCoords.RectangleResH = app.ExtUI.UPVRobotGeometricRectanHoriResEditField.Value;
end

% Create UPVRobotGeometricRectanSeparator3
app.ExtUI.UPVRobotGeometricRectanSeparator3 = uilabel(app.ExtUI.UPVRobotGeometricRectanSubGrid);
app.ExtUI.UPVRobotGeometricRectanSeparator3.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotGeometricRectanSeparator3.Layout.Row = [1 2];
app.ExtUI.UPVRobotGeometricRectanSeparator3.Layout.Column = 3;
app.ExtUI.UPVRobotGeometricRectanSeparator3.Text = '';

% Create UPVRobotGeometricRectanVertLengthEditFieldLabel
app.ExtUI.UPVRobotGeometricRectanVertLengthEditFieldLabel = uilabel(app.ExtUI.UPVRobotGeometricRectanSubGrid);
app.ExtUI.UPVRobotGeometricRectanVertLengthEditFieldLabel.Layout.Row = 1;
app.ExtUI.UPVRobotGeometricRectanVertLengthEditFieldLabel.Layout.Column = 4;
app.ExtUI.UPVRobotGeometricRectanVertLengthEditFieldLabel.Text = 'V length (m)';

% Create UPVRobotGeometricRectanVertLengthEditField
app.ExtUI.UPVRobotGeometricRectanVertLengthEditField = uieditfield(app.ExtUI.UPVRobotGeometricRectanSubGrid, 'numeric');
app.ExtUI.UPVRobotGeometricRectanVertLengthEditField.ValueChangedFcn = {@UPVRobotParameterGeometricRectanChanged,app};
app.ExtUI.UPVRobotGeometricRectanVertLengthEditField.LowerLimitInclusive = 'off';
app.ExtUI.UPVRobotGeometricRectanVertLengthEditField.Limits = [0 Inf];
app.ExtUI.UPVRobotGeometricRectanVertLengthEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricRectanVertLengthEditField.Layout.Row = 1;
app.ExtUI.UPVRobotGeometricRectanVertLengthEditField.Layout.Column = 5;
app.ExtUI.UPVRobotGeometricRectanVertLengthEditField.Value = 1.5;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.RectangleLenV)
    app.ExtUI.UPVRobotGeometricRectanVertLengthEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.RectangleLenV;
else
    app.ExtVar.UPVRobot.GeometricCoords.RectangleLenV = app.ExtUI.UPVRobotGeometricRectanVertLengthEditField.Value;
end

% Create UPVRobotGeometricRectanVertResEditFieldLabel
app.ExtUI.UPVRobotGeometricRectanVertResEditFieldLabel = uilabel(app.ExtUI.UPVRobotGeometricRectanSubGrid);
app.ExtUI.UPVRobotGeometricRectanVertResEditFieldLabel.Layout.Row = 2;
app.ExtUI.UPVRobotGeometricRectanVertResEditFieldLabel.Layout.Column = 4;
app.ExtUI.UPVRobotGeometricRectanVertResEditFieldLabel.Text = 'V res';

% Create UPVRobotGeometricRectanVertResEditField
app.ExtUI.UPVRobotGeometricRectanVertResEditField = uieditfield(app.ExtUI.UPVRobotGeometricRectanSubGrid, 'numeric');
app.ExtUI.UPVRobotGeometricRectanVertResEditField.ValueChangedFcn = {@UPVRobotParameterGeometricRectanChanged,app};
app.ExtUI.UPVRobotGeometricRectanVertResEditField.Limits = [1 Inf];
app.ExtUI.UPVRobotGeometricRectanVertResEditField.RoundFractionalValues = 'on';
app.ExtUI.UPVRobotGeometricRectanVertResEditField.ValueDisplayFormat = '%.0f';
app.ExtUI.UPVRobotGeometricRectanVertResEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotGeometricRectanVertResEditField.Layout.Row = 2;
app.ExtUI.UPVRobotGeometricRectanVertResEditField.Layout.Column = 5;
app.ExtUI.UPVRobotGeometricRectanVertResEditField.Value = 5;
if ~isempty(app.ExtVar.UPVRobot.GeometricCoords.RectangleResV)
    app.ExtUI.UPVRobotGeometricRectanVertResEditField.Value = app.ExtVar.UPVRobot.GeometricCoords.RectangleResV;
else
    app.ExtVar.UPVRobot.GeometricCoords.RectangleResV = app.ExtUI.UPVRobotGeometricRectanVertResEditField.Value;
end

function UPVRobotParameterGeometricRectanChanged(~,~,app)
app.ExtVar.UPVRobot.GeometricCoords.Plane = app.ExtUI.UPVRobotGeometricRectanPlaneDropDown.Value;
app.ExtVar.UPVRobot.GeometricCoords.RectangleOriginX = app.ExtUI.UPVRobotGeometricRectanXEditField.Value;
app.ExtVar.UPVRobot.GeometricCoords.RectangleOriginY = app.ExtUI.UPVRobotGeometricRectanYEditField.Value;
app.ExtVar.UPVRobot.GeometricCoords.RectangleOriginZ = app.ExtUI.UPVRobotGeometricRectanZEditField.Value;
app.ExtVar.UPVRobot.GeometricCoords.RectangleLenH = app.ExtUI.UPVRobotGeometricRectanHoriLengthEditField.Value;
app.ExtVar.UPVRobot.GeometricCoords.RectangleResH = app.ExtUI.UPVRobotGeometricRectanHoriResEditField.Value;
app.ExtVar.UPVRobot.GeometricCoords.RectangleLenV = app.ExtUI.UPVRobotGeometricRectanVertLengthEditField.Value;
app.ExtVar.UPVRobot.GeometricCoords.RectangleResV = app.ExtUI.UPVRobotGeometricRectanVertResEditField.Value;
UPVRobotGenerateMeasurementPoints(app)