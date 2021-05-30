function createTabDirectivityCoordsUPVRobot(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Create TabUPVRobotLeftPanelMeasurementPointsDirectivity
app.ExtUI.TabUPVRobotLeftPanelMeasurementPointsDirectivity = uitab(app.ExtUI.TabUPVRobotLeftPanelMeasurementPoints);
app.ExtUI.TabUPVRobotLeftPanelMeasurementPointsDirectivity.Title = 'Directivity';

% Create UPVRobotDirectivityGrid
app.ExtUI.UPVRobotDirectivityGrid = uigridlayout(app.ExtUI.TabUPVRobotLeftPanelMeasurementPointsDirectivity);
app.ExtUI.UPVRobotDirectivityGrid.ColumnWidth = {'1x'};
app.ExtUI.UPVRobotDirectivityGrid.RowHeight = {'1x'};
app.ExtUI.UPVRobotDirectivityGrid.Padding = [5 5 5 5];
app.ExtUI.UPVRobotDirectivityGrid.BackgroundColor = [1 1 1];

% Create UPVRobotDirectivityTypeTab
app.ExtUI.UPVRobotDirectivityTypeTab = uitabgroup(app.ExtUI.UPVRobotDirectivityGrid);
app.ExtUI.UPVRobotDirectivityTypeTab.Layout.Row = 1;
app.ExtUI.UPVRobotDirectivityTypeTab.Layout.Column = 1;
app.ExtUI.UPVRobotDirectivityTypeTab.SelectionChangedFcn = {@UPVRobotDirTabChanged,app};

% Create UPVRobotDirectivityHorVerTab
app.ExtUI.UPVRobotDirectivityHorVerTab = uitab(app.ExtUI.UPVRobotDirectivityTypeTab);
app.ExtUI.UPVRobotDirectivityHorVerTab.Title = 'Hor/Ver';

% Create UPVRobotDirectivityHorVerGrid
app.ExtUI.UPVRobotDirectivityHorVerGrid = uigridlayout(app.ExtUI.UPVRobotDirectivityHorVerTab);
app.ExtUI.UPVRobotDirectivityHorVerGrid.ColumnWidth = {'1x', '0.5x', '1x', '1x'};
app.ExtUI.UPVRobotDirectivityHorVerGrid.RowHeight = {'fit', 10, 'fit', 'fit', 10, 'fit','fit'};
app.ExtUI.UPVRobotDirectivityHorVerGrid.ColumnSpacing = 5;
app.ExtUI.UPVRobotDirectivityHorVerGrid.RowSpacing = 5;
app.ExtUI.UPVRobotDirectivityHorVerGrid.Padding = [5 5 5 5];
app.ExtUI.UPVRobotDirectivityHorVerGrid.BackgroundColor = [1 1 1];

% Create UPVRobotDirectivityHorVerIncThetaLabel
app.ExtUI.UPVRobotDirectivityHorVerIncThetaLabel = uilabel(app.ExtUI.UPVRobotDirectivityHorVerGrid);
app.ExtUI.UPVRobotDirectivityHorVerIncThetaLabel.Interpreter = 'latex';
app.ExtUI.UPVRobotDirectivityHorVerIncThetaLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotDirectivityHorVerIncThetaLabel.Layout.Row = 4;
app.ExtUI.UPVRobotDirectivityHorVerIncThetaLabel.Layout.Column = 1;
app.ExtUI.UPVRobotDirectivityHorVerIncThetaLabel.Text = '$\Delta\Theta$ (deg)';

% Create UPVRobotDirectivityHorVerIncTheta
app.ExtUI.UPVRobotDirectivityHorVerIncTheta = uieditfield(app.ExtUI.UPVRobotDirectivityHorVerGrid, 'numeric');
app.ExtUI.UPVRobotDirectivityHorVerIncTheta.Limits = [0 180];
app.ExtUI.UPVRobotDirectivityHorVerIncTheta.Layout.Row = 4;
app.ExtUI.UPVRobotDirectivityHorVerIncTheta.Layout.Column = 2;
app.ExtUI.UPVRobotDirectivityHorVerIncTheta.Value = 0;
app.ExtUI.UPVRobotDirectivityHorVerIncTheta.ValueChangedFcn = {@UPVRobotParameterDirectivityChanged,app};
if ~isempty(app.ExtVar.UPVRobot.incTheta)
    app.ExtUI.UPVRobotDirectivityHorVerIncTheta.Value = app.ExtVar.UPVRobot.incTheta;
else
    app.ExtVar.UPVRobot.incTheta = app.ExtUI.UPVRobotDirectivityHorVerIncTheta.Value;
end

% Create UPVRobotDirectivityHorVerIncPhiLabel
app.ExtUI.UPVRobotDirectivityHorVerIncPhiLabel = uilabel(app.ExtUI.UPVRobotDirectivityHorVerGrid);
app.ExtUI.UPVRobotDirectivityHorVerIncPhiLabel.Interpreter = 'latex';
app.ExtUI.UPVRobotDirectivityHorVerIncPhiLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotDirectivityHorVerIncPhiLabel.Layout.Row = 3;
app.ExtUI.UPVRobotDirectivityHorVerIncPhiLabel.Layout.Column = 1;
app.ExtUI.UPVRobotDirectivityHorVerIncPhiLabel.Text = '$\Delta\Phi$ (deg)';

% Create UPVRobotDirectivityHorVerIncPhi
app.ExtUI.UPVRobotDirectivityHorVerIncPhi = uieditfield(app.ExtUI.UPVRobotDirectivityHorVerGrid, 'numeric');
app.ExtUI.UPVRobotDirectivityHorVerIncPhi.Limits = [0 180];
app.ExtUI.UPVRobotDirectivityHorVerIncPhi.Layout.Row = 3;
app.ExtUI.UPVRobotDirectivityHorVerIncPhi.Layout.Column = 2;
app.ExtUI.UPVRobotDirectivityHorVerIncPhi.Value = 5;
app.ExtUI.UPVRobotDirectivityHorVerIncPhi.ValueChangedFcn = {@UPVRobotParameterDirectivityChanged,app};
if ~isempty(app.ExtVar.UPVRobot.incPhi)
    app.ExtUI.UPVRobotDirectivityHorVerIncPhi.Value = app.ExtVar.UPVRobot.incPhi;
else
    app.ExtVar.UPVRobot.incPhi = app.ExtUI.UPVRobotDirectivityHorVerIncPhi.Value;
end

% Create UPVRobotDirectivityHorVerTypeDropDownLabel
app.ExtUI.UPVRobotDirectivityHorVerTypeDropDownLabel = uilabel(app.ExtUI.UPVRobotDirectivityHorVerGrid);
app.ExtUI.UPVRobotDirectivityHorVerTypeDropDownLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotDirectivityHorVerTypeDropDownLabel.Layout.Row = 6;
app.ExtUI.UPVRobotDirectivityHorVerTypeDropDownLabel.Layout.Column = [1 2];
app.ExtUI.UPVRobotDirectivityHorVerTypeDropDownLabel.Text = 'Type';

% Create UPVRobotDirectivityHorVerTypeDropDown
app.ExtUI.UPVRobotDirectivityHorVerTypeDropDown = uidropdown(app.ExtUI.UPVRobotDirectivityHorVerGrid);
app.ExtUI.UPVRobotDirectivityHorVerTypeDropDown.Items = {'Front/Back', 'Front'};
app.ExtUI.UPVRobotDirectivityHorVerTypeDropDown.Layout.Row = 6;
app.ExtUI.UPVRobotDirectivityHorVerTypeDropDown.Layout.Column = [3 4];
app.ExtUI.UPVRobotDirectivityHorVerTypeDropDown.Value = 'Front/Back';
app.ExtUI.UPVRobotDirectivityHorVerTypeDropDown.ValueChangedFcn = {@UPVRobotParameterDirectivityChanged,app};
if ~isempty(app.ExtVar.UPVRobot.DirDirection)
    app.ExtUI.UPVRobotDirectivityHorVerTypeDropDown.Value = app.ExtVar.UPVRobot.DirDirection;
else
    app.ExtVar.UPVRobot.DirDirection = app.ExtUI.UPVRobotDirectivityHorVerTypeDropDown.Value;
end

% Create UPVRobotDirectivityHorVerInfo
app.ExtUI.UPVRobotDirectivityHorVerInfo = uilabel(app.ExtUI.UPVRobotDirectivityHorVerGrid);
app.ExtUI.UPVRobotDirectivityHorVerInfo.WordWrap = 'on';
app.ExtUI.UPVRobotDirectivityHorVerInfo.FontSize = 11;
app.ExtUI.UPVRobotDirectivityHorVerInfo.Layout.Row = 1;
app.ExtUI.UPVRobotDirectivityHorVerInfo.Layout.Column = [1 4];
app.ExtUI.UPVRobotDirectivityHorVerInfo.Text = 'If you don''t want to make a vertical or horizontal trajectory, set the increment equal to 0.';

% Create UPVRobotDirectivityHorVerRLabel
app.ExtUI.UPVRobotDirectivityHorVerRLabel = uilabel(app.ExtUI.UPVRobotDirectivityHorVerGrid);
app.ExtUI.UPVRobotDirectivityHorVerRLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotDirectivityHorVerRLabel.Layout.Row = 3;
app.ExtUI.UPVRobotDirectivityHorVerRLabel.Layout.Column = 3;
app.ExtUI.UPVRobotDirectivityHorVerRLabel.Text = 'r (m)';

% Create UPVRobotDirectivityHorVerR
app.ExtUI.UPVRobotDirectivityHorVerR = uieditfield(app.ExtUI.UPVRobotDirectivityHorVerGrid, 'numeric');
app.ExtUI.UPVRobotDirectivityHorVerR.LowerLimitInclusive = 'off';
app.ExtUI.UPVRobotDirectivityHorVerR.Limits = [0 Inf];
app.ExtUI.UPVRobotDirectivityHorVerR.Layout.Row = 3;
app.ExtUI.UPVRobotDirectivityHorVerR.Layout.Column = 4;
app.ExtUI.UPVRobotDirectivityHorVerR.Value = 1;
app.ExtUI.UPVRobotDirectivityHorVerR.ValueChangedFcn = {@UPVRobotParameterDirectivityChanged,app};
if ~isempty(app.ExtVar.UPVRobot.dirR)
    app.ExtUI.UPVRobotDirectivityHorVerR.Value = app.ExtVar.UPVRobot.dirR;
else
    app.ExtVar.UPVRobot.dirR = app.ExtUI.UPVRobotDirectivityHorVerR.Value;
end

% Create UPVRobotDirectivityHorVerPositionDropDownLabel
app.ExtUI.UPVRobotDirectivityHorVerPositionDropDownLabel = uilabel(app.ExtUI.UPVRobotDirectivityHorVerGrid);
app.ExtUI.UPVRobotDirectivityHorVerPositionDropDownLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotDirectivityHorVerPositionDropDownLabel.Layout.Row = 4;
app.ExtUI.UPVRobotDirectivityHorVerPositionDropDownLabel.Layout.Column = 3;
app.ExtUI.UPVRobotDirectivityHorVerPositionDropDownLabel.Text = 'Position';

% Create UPVRobotDirectivityHorVerPositionDropDown
app.ExtUI.UPVRobotDirectivityHorVerPositionDropDown = uidropdown(app.ExtUI.UPVRobotDirectivityHorVerGrid);
app.ExtUI.UPVRobotDirectivityHorVerPositionDropDown.Items = {'North', 'West', 'South', 'East'};
app.ExtUI.UPVRobotDirectivityHorVerPositionDropDown.Layout.Row = 4;
app.ExtUI.UPVRobotDirectivityHorVerPositionDropDown.Layout.Column = 4;
app.ExtUI.UPVRobotDirectivityHorVerPositionDropDown.Value = 'North';
app.ExtUI.UPVRobotDirectivityHorVerPositionDropDown.ValueChangedFcn = {@UPVRobotParameterDirectivityChanged,app};
if ~isempty(app.ExtVar.UPVRobot.DirPosition)
    app.ExtUI.UPVRobotDirectivityHorVerPositionDropDown.Value = app.ExtVar.UPVRobot.DirPosition;
else
    app.ExtVar.UPVRobot.DirPosition = app.ExtUI.UPVRobotDirectivityHorVerPositionDropDown.Value;
end

% Create UPVRobotDirectivityHorVerGridOrigin
app.ExtUI.UPVRobotDirectivityHorVerGridOrigin = uigridlayout(app.ExtUI.UPVRobotDirectivityHorVerGrid);
app.ExtUI.UPVRobotDirectivityHorVerGridOrigin.ColumnWidth = {'1x', '1x', '1x', '1x'};
app.ExtUI.UPVRobotDirectivityHorVerGridOrigin.RowHeight = {'fit', 'fit'};
app.ExtUI.UPVRobotDirectivityHorVerGridOrigin.ColumnSpacing = 5;
app.ExtUI.UPVRobotDirectivityHorVerGridOrigin.RowSpacing = 5;
app.ExtUI.UPVRobotDirectivityHorVerGridOrigin.Padding = [0 0 0 5];
app.ExtUI.UPVRobotDirectivityHorVerGridOrigin.Layout.Row = 7;
app.ExtUI.UPVRobotDirectivityHorVerGridOrigin.Layout.Column = [1 4];
app.ExtUI.UPVRobotDirectivityHorVerGridOrigin.BackgroundColor = [1 1 1];



% Create UPVRobotDirectivityHorVerOriginmLabel
app.ExtUI.UPVRobotDirectivityHorVerOriginmLabel = uilabel(app.ExtUI.UPVRobotDirectivityHorVerGridOrigin);
app.ExtUI.UPVRobotDirectivityHorVerOriginmLabel.Layout.Row = 2;
app.ExtUI.UPVRobotDirectivityHorVerOriginmLabel.Layout.Column = 1;
app.ExtUI.UPVRobotDirectivityHorVerOriginmLabel.Text = 'Origin (m)';



% Create UPVRobotDirectivityHorVerOriXLabel
app.ExtUI.UPVRobotDirectivityHorVerOriXLabel = uilabel(app.ExtUI.UPVRobotDirectivityHorVerGridOrigin);
app.ExtUI.UPVRobotDirectivityHorVerOriXLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotDirectivityHorVerOriXLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotDirectivityHorVerOriXLabel.Layout.Row = 1;
app.ExtUI.UPVRobotDirectivityHorVerOriXLabel.Layout.Column = 2;
app.ExtUI.UPVRobotDirectivityHorVerOriXLabel.Text = 'X';

% Create UPVRobotDirectivityHorVerOriX
app.ExtUI.UPVRobotDirectivityHorVerOriX = uieditfield(app.ExtUI.UPVRobotDirectivityHorVerGridOrigin, 'numeric');
app.ExtUI.UPVRobotDirectivityHorVerOriX.Layout.Row = 2;
app.ExtUI.UPVRobotDirectivityHorVerOriX.Layout.Column = 2;
app.ExtUI.UPVRobotDirectivityHorVerOriX.Value = 1.5;
app.ExtUI.UPVRobotDirectivityHorVerOriX.ValueChangedFcn = {@UPVRobotParameterDirectivityChanged,app};

% Create UPVRobotDirectivityHorVerOriYLabel
app.ExtUI.UPVRobotDirectivityHorVerOriYLabel = uilabel(app.ExtUI.UPVRobotDirectivityHorVerGridOrigin);
app.ExtUI.UPVRobotDirectivityHorVerOriYLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotDirectivityHorVerOriYLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotDirectivityHorVerOriYLabel.Layout.Row = 1;
app.ExtUI.UPVRobotDirectivityHorVerOriYLabel.Layout.Column = 3;
app.ExtUI.UPVRobotDirectivityHorVerOriYLabel.Text = 'Y';

% Create UPVRobotDirectivityHorVerOriY
app.ExtUI.UPVRobotDirectivityHorVerOriY = uieditfield(app.ExtUI.UPVRobotDirectivityHorVerGridOrigin, 'numeric');
app.ExtUI.UPVRobotDirectivityHorVerOriY.Layout.Row = 2;
app.ExtUI.UPVRobotDirectivityHorVerOriY.Layout.Column = 3;
app.ExtUI.UPVRobotDirectivityHorVerOriY.Value = 1.5;
app.ExtUI.UPVRobotDirectivityHorVerOriY.ValueChangedFcn = {@UPVRobotParameterDirectivityChanged,app};

% Create UPVRobotDirectivityHorVerOriZLabel
app.ExtUI.UPVRobotDirectivityHorVerOriZLabel = uilabel(app.ExtUI.UPVRobotDirectivityHorVerGridOrigin);
app.ExtUI.UPVRobotDirectivityHorVerOriZLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotDirectivityHorVerOriZLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotDirectivityHorVerOriZLabel.Layout.Row = 1;
app.ExtUI.UPVRobotDirectivityHorVerOriZLabel.Layout.Column = 4;
app.ExtUI.UPVRobotDirectivityHorVerOriZLabel.Text = 'Z';

% Create UPVRobotDirectivityHorVerOriZ
app.ExtUI.UPVRobotDirectivityHorVerOriZ = uieditfield(app.ExtUI.UPVRobotDirectivityHorVerGridOrigin, 'numeric');
app.ExtUI.UPVRobotDirectivityHorVerOriZ.Layout.Row = 2;
app.ExtUI.UPVRobotDirectivityHorVerOriZ.Layout.Column = 4;
app.ExtUI.UPVRobotDirectivityHorVerOriZ.Value = 0;
app.ExtUI.UPVRobotDirectivityHorVerOriZ.ValueChangedFcn = {@UPVRobotParameterDirectivityChanged,app};

if ~isempty(app.ExtVar.UPVRobot.DirOri)
    app.ExtUI.UPVRobotDirectivityHorVerOriX.Value = app.ExtVar.UPVRobot.DirOri(1);
    app.ExtUI.UPVRobotDirectivityHorVerOriY.Value = app.ExtVar.UPVRobot.DirOri(2);
    app.ExtUI.UPVRobotDirectivityHorVerOriZ.Value = app.ExtVar.UPVRobot.DirOri(3);
else
     app.ExtVar.UPVRobot.DirOri = [...
         app.ExtUI.UPVRobotDirectivityHorVerOriX.Value,...
         app.ExtUI.UPVRobotDirectivityHorVerOriY.Value,...
         app.ExtUI.UPVRobotDirectivityHorVerOriZ.Value];
end


% Create UPVRobotDirectivityHemisphereTab
app.ExtUI.UPVRobotDirectivityHemisphereTab = uitab(app.ExtUI.UPVRobotDirectivityTypeTab);
app.ExtUI.UPVRobotDirectivityHemisphereTab.Title = 'Hemisphere';

% Create UPVRobotDirectivityHemisphereGrid
app.ExtUI.UPVRobotDirectivityHemisphereGrid = uigridlayout(app.ExtUI.UPVRobotDirectivityHemisphereTab);
app.ExtUI.UPVRobotDirectivityHemisphereGrid.ColumnWidth = {'1x', '0.5x', '1x', '1x'};
app.ExtUI.UPVRobotDirectivityHemisphereGrid.RowHeight = {'fit', 'fit', 5, 'fit', 5, 'fit'};
app.ExtUI.UPVRobotDirectivityHemisphereGrid.ColumnSpacing = 5;
app.ExtUI.UPVRobotDirectivityHemisphereGrid.RowSpacing = 5;
app.ExtUI.UPVRobotDirectivityHemisphereGrid.Padding = [5 5 5 5];
app.ExtUI.UPVRobotDirectivityHemisphereGrid.BackgroundColor = [1 1 1];

% Create UPVRobotDirectivityHemisphereIncThetaLabel
app.ExtUI.UPVRobotDirectivityHemisphereIncThetaLabel = uilabel(app.ExtUI.UPVRobotDirectivityHemisphereGrid);
app.ExtUI.UPVRobotDirectivityHemisphereIncThetaLabel.Interpreter = 'latex';
app.ExtUI.UPVRobotDirectivityHemisphereIncThetaLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotDirectivityHemisphereIncThetaLabel.Layout.Row = 2;
app.ExtUI.UPVRobotDirectivityHemisphereIncThetaLabel.Layout.Column = 1;
app.ExtUI.UPVRobotDirectivityHemisphereIncThetaLabel.Text = '$\Delta\Theta$ (deg)';

% Create UPVRobotDirectivityHemisphereIncTheta
app.ExtUI.UPVRobotDirectivityHemisphereIncTheta = uieditfield(app.ExtUI.UPVRobotDirectivityHemisphereGrid, 'numeric');
app.ExtUI.UPVRobotDirectivityHemisphereIncTheta.LowerLimitInclusive = 'off';
app.ExtUI.UPVRobotDirectivityHemisphereIncTheta.Limits = [0 180];
app.ExtUI.UPVRobotDirectivityHemisphereIncTheta.Layout.Row = 2;
app.ExtUI.UPVRobotDirectivityHemisphereIncTheta.Layout.Column = 2;
app.ExtUI.UPVRobotDirectivityHemisphereIncTheta.Value = 5;
app.ExtUI.UPVRobotDirectivityHemisphereIncTheta.ValueChangedFcn = {@UPVRobotParameterDirectivityHemisphereChanged,app};
if ~isempty(app.ExtVar.UPVRobot.incThetaHemi)
    app.ExtUI.UPVRobotDirectivityHemisphereIncTheta.Value = app.ExtVar.UPVRobot.incThetaHemi;
else
    app.ExtVar.UPVRobot.incThetaHemi = app.ExtUI.UPVRobotDirectivityHemisphereIncTheta.Value;
end

% Create UPVRobotDirectivityHemisphereIncPhiLabel
app.ExtUI.UPVRobotDirectivityHemisphereIncPhiLabel = uilabel(app.ExtUI.UPVRobotDirectivityHemisphereGrid);
app.ExtUI.UPVRobotDirectivityHemisphereIncPhiLabel.Interpreter = 'latex';
app.ExtUI.UPVRobotDirectivityHemisphereIncPhiLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotDirectivityHemisphereIncPhiLabel.Layout.Row = 1;
app.ExtUI.UPVRobotDirectivityHemisphereIncPhiLabel.Layout.Column = 1;
app.ExtUI.UPVRobotDirectivityHemisphereIncPhiLabel.Text = '$\Delta\Phi$ (deg)';

% Create UPVRobotDirectivityHemisphereIncPhi
app.ExtUI.UPVRobotDirectivityHemisphereIncPhi = uieditfield(app.ExtUI.UPVRobotDirectivityHemisphereGrid, 'numeric');
app.ExtUI.UPVRobotDirectivityHemisphereIncPhi.LowerLimitInclusive = 'off';
app.ExtUI.UPVRobotDirectivityHemisphereIncPhi.Limits = [0 180];
app.ExtUI.UPVRobotDirectivityHemisphereIncPhi.Layout.Row = 1;
app.ExtUI.UPVRobotDirectivityHemisphereIncPhi.Layout.Column = 2;
app.ExtUI.UPVRobotDirectivityHemisphereIncPhi.Value = 5;
app.ExtUI.UPVRobotDirectivityHemisphereIncPhi.ValueChangedFcn = {@UPVRobotParameterDirectivityHemisphereChanged,app};
if ~isempty(app.ExtVar.UPVRobot.incPhiHemi)
    app.ExtUI.UPVRobotDirectivityHemisphereIncPhi.Value = app.ExtVar.UPVRobot.incPhiHemi;
else
    app.ExtVar.UPVRobot.incPhiHemi = app.ExtUI.UPVRobotDirectivityHemisphereIncPhi.Value;
end

% Create UPVRobotDirectivityHemisphereRLabel
app.ExtUI.UPVRobotDirectivityHemisphereRLabel = uilabel(app.ExtUI.UPVRobotDirectivityHemisphereGrid);
app.ExtUI.UPVRobotDirectivityHemisphereRLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotDirectivityHemisphereRLabel.Layout.Row = 1;
app.ExtUI.UPVRobotDirectivityHemisphereRLabel.Layout.Column = 3;
app.ExtUI.UPVRobotDirectivityHemisphereRLabel.Text = 'r (m)';

% Create UPVRobotDirectivityHemisphereR
app.ExtUI.UPVRobotDirectivityHemisphereR = uieditfield(app.ExtUI.UPVRobotDirectivityHemisphereGrid, 'numeric');
app.ExtUI.UPVRobotDirectivityHemisphereR.LowerLimitInclusive = 'off';
app.ExtUI.UPVRobotDirectivityHemisphereR.Limits = [0 Inf];
app.ExtUI.UPVRobotDirectivityHemisphereR.Layout.Row = 1;
app.ExtUI.UPVRobotDirectivityHemisphereR.Layout.Column = 4;
app.ExtUI.UPVRobotDirectivityHemisphereR.Value = 1;
app.ExtUI.UPVRobotDirectivityHemisphereR.ValueChangedFcn = {@UPVRobotParameterDirectivityHemisphereChanged,app};
if ~isempty(app.ExtVar.UPVRobot.dirR)
    app.ExtUI.UPVRobotDirectivityHemisphereR.Value = app.ExtVar.UPVRobot.dirR;
else
    app.ExtVar.UPVRobot.dirR = app.ExtUI.UPVRobotDirectivityHemisphereR.Value;
end

% Create UPVRobotDirectivityHemispherePositionDropDownLabel
app.ExtUI.UPVRobotDirectivityHemispherePositionDropDownLabel = uilabel(app.ExtUI.UPVRobotDirectivityHemisphereGrid);
app.ExtUI.UPVRobotDirectivityHemispherePositionDropDownLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotDirectivityHemispherePositionDropDownLabel.Layout.Row = 2;
app.ExtUI.UPVRobotDirectivityHemispherePositionDropDownLabel.Layout.Column = 3;
app.ExtUI.UPVRobotDirectivityHemispherePositionDropDownLabel.Text = 'Position';

% Create UPVRobotDirectivityHemispherePositionDropDown
app.ExtUI.UPVRobotDirectivityHemispherePositionDropDown = uidropdown(app.ExtUI.UPVRobotDirectivityHemisphereGrid);
app.ExtUI.UPVRobotDirectivityHemispherePositionDropDown.Items = {'North', 'West', 'South', 'East'};
app.ExtUI.UPVRobotDirectivityHemispherePositionDropDown.Layout.Row = 2;
app.ExtUI.UPVRobotDirectivityHemispherePositionDropDown.Layout.Column = 4;
app.ExtUI.UPVRobotDirectivityHemispherePositionDropDown.Value = 'North';
app.ExtUI.UPVRobotDirectivityHemispherePositionDropDown.ValueChangedFcn = {@UPVRobotParameterDirectivityHemisphereChanged,app};
if ~isempty(app.ExtVar.UPVRobot.DirPosition)
    app.ExtUI.UPVRobotDirectivityHemispherePositionDropDown.Value = app.ExtVar.UPVRobot.DirPosition;
else
    app.ExtVar.UPVRobot.DirPosition = app.ExtUI.UPVRobotDirectivityHemispherePositionDropDown.Value;
end

% Create UPVRobotDirectivityHemiTypeDropDownLabel
app.ExtUI.UPVRobotDirectivityHemiTypeDropDownLabel = uilabel(app.ExtUI.UPVRobotDirectivityHemisphereGrid);
app.ExtUI.UPVRobotDirectivityHemiTypeDropDownLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotDirectivityHemiTypeDropDownLabel.Layout.Row = 4;
app.ExtUI.UPVRobotDirectivityHemiTypeDropDownLabel.Layout.Column = [1 2];
app.ExtUI.UPVRobotDirectivityHemiTypeDropDownLabel.Text = 'Type';

% Create UPVRobotDirectivityHemiTypeDropDown
app.ExtUI.UPVRobotDirectivityHemiTypeDropDown = uidropdown(app.ExtUI.UPVRobotDirectivityHemisphereGrid);
app.ExtUI.UPVRobotDirectivityHemiTypeDropDown.Items = {'Front/Back', 'Front'};
app.ExtUI.UPVRobotDirectivityHemiTypeDropDown.Layout.Row = 4;
app.ExtUI.UPVRobotDirectivityHemiTypeDropDown.Layout.Column = [3 4];
app.ExtUI.UPVRobotDirectivityHemiTypeDropDown.Value = 'Front/Back';
app.ExtUI.UPVRobotDirectivityHemiTypeDropDown.ValueChangedFcn = {@UPVRobotParameterDirectivityChanged,app};
if ~isempty(app.ExtVar.UPVRobot.DirDirection)
    app.ExtUI.UPVRobotDirectivityHemiTypeDropDown.Value = app.ExtVar.UPVRobot.DirDirection;
else
    app.ExtVar.UPVRobot.DirDirection = app.ExtUI.UPVRobotDirectivityHemiTypeDropDown.Value;
end

% Create UPVRobotDirectivityHemisphereGridOrigin
app.ExtUI.UPVRobotDirectivityHemisphereGridOrigin = uigridlayout(app.ExtUI.UPVRobotDirectivityHemisphereGrid);
app.ExtUI.UPVRobotDirectivityHemisphereGridOrigin.ColumnWidth = {'1x', '1x', '1x', '1x'};
app.ExtUI.UPVRobotDirectivityHemisphereGridOrigin.RowHeight = {'fit', 'fit'};
app.ExtUI.UPVRobotDirectivityHemisphereGridOrigin.ColumnSpacing = 5;
app.ExtUI.UPVRobotDirectivityHemisphereGridOrigin.RowSpacing = 5;
app.ExtUI.UPVRobotDirectivityHemisphereGridOrigin.Padding = [0 0 0 5];
app.ExtUI.UPVRobotDirectivityHemisphereGridOrigin.Layout.Row = 6;
app.ExtUI.UPVRobotDirectivityHemisphereGridOrigin.Layout.Column = [1 4];
app.ExtUI.UPVRobotDirectivityHemisphereGridOrigin.BackgroundColor = [1 1 1];

% Create UPVRobotDirectivityHemisphereOriXLabel
app.ExtUI.UPVRobotDirectivityHemisphereOriXLabel = uilabel(app.ExtUI.UPVRobotDirectivityHemisphereGridOrigin);
app.ExtUI.UPVRobotDirectivityHemisphereOriXLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotDirectivityHemisphereOriXLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotDirectivityHemisphereOriXLabel.Layout.Row = 1;
app.ExtUI.UPVRobotDirectivityHemisphereOriXLabel.Layout.Column = 2;
app.ExtUI.UPVRobotDirectivityHemisphereOriXLabel.Text = 'X';

% Create UPVRobotDirectivityHemisphereOriX
app.ExtUI.UPVRobotDirectivityHemisphereOriX = uieditfield(app.ExtUI.UPVRobotDirectivityHemisphereGridOrigin, 'numeric');
app.ExtUI.UPVRobotDirectivityHemisphereOriX.Layout.Row = 2;
app.ExtUI.UPVRobotDirectivityHemisphereOriX.Layout.Column = 2;
app.ExtUI.UPVRobotDirectivityHemisphereOriX.Value = 1.5;
app.ExtUI.UPVRobotDirectivityHemisphereOriX.ValueChangedFcn = {@UPVRobotParameterDirectivityHemisphereChanged,app};

% Create UPVRobotDirectivityHemisphereOriYLabel
app.ExtUI.UPVRobotDirectivityHemisphereOriYLabel = uilabel(app.ExtUI.UPVRobotDirectivityHemisphereGridOrigin);
app.ExtUI.UPVRobotDirectivityHemisphereOriYLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotDirectivityHemisphereOriYLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotDirectivityHemisphereOriYLabel.Layout.Row = 1;
app.ExtUI.UPVRobotDirectivityHemisphereOriYLabel.Layout.Column = 3;
app.ExtUI.UPVRobotDirectivityHemisphereOriYLabel.Text = 'Y';

% Create UPVRobotDirectivityHemisphereOriY
app.ExtUI.UPVRobotDirectivityHemisphereOriY = uieditfield(app.ExtUI.UPVRobotDirectivityHemisphereGridOrigin, 'numeric');
app.ExtUI.UPVRobotDirectivityHemisphereOriY.Layout.Row = 2;
app.ExtUI.UPVRobotDirectivityHemisphereOriY.Layout.Column = 3;
app.ExtUI.UPVRobotDirectivityHemisphereOriY.Value = 1.5;
app.ExtUI.UPVRobotDirectivityHemisphereOriY.ValueChangedFcn = {@UPVRobotParameterDirectivityHemisphereChanged,app};

% Create UPVRobotDirectivityHemisphereOriZLabel
app.ExtUI.UPVRobotDirectivityHemisphereOriZLabel = uilabel(app.ExtUI.UPVRobotDirectivityHemisphereGridOrigin);
app.ExtUI.UPVRobotDirectivityHemisphereOriZLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotDirectivityHemisphereOriZLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotDirectivityHemisphereOriZLabel.Layout.Row = 1;
app.ExtUI.UPVRobotDirectivityHemisphereOriZLabel.Layout.Column = 4;
app.ExtUI.UPVRobotDirectivityHemisphereOriZLabel.Text = 'Z';

% Create UPVRobotDirectivityHemisphereOriZ
app.ExtUI.UPVRobotDirectivityHemisphereOriZ = uieditfield(app.ExtUI.UPVRobotDirectivityHemisphereGridOrigin, 'numeric');
app.ExtUI.UPVRobotDirectivityHemisphereOriZ.Layout.Row = 2;
app.ExtUI.UPVRobotDirectivityHemisphereOriZ.Layout.Column = 4;
app.ExtUI.UPVRobotDirectivityHemisphereOriZ.Value = 0;
app.ExtUI.UPVRobotDirectivityHemisphereOriZ.ValueChangedFcn = {@UPVRobotParameterDirectivityHemisphereChanged,app};

% Create UPVRobotDirectivityHemisphereOriginmLabel
app.ExtUI.UPVRobotDirectivityHemisphereOriginmLabel = uilabel(app.ExtUI.UPVRobotDirectivityHemisphereGridOrigin);
app.ExtUI.UPVRobotDirectivityHemisphereOriginmLabel.Layout.Row = 2;
app.ExtUI.UPVRobotDirectivityHemisphereOriginmLabel.Layout.Column = 1;
app.ExtUI.UPVRobotDirectivityHemisphereOriginmLabel.Text = 'Origin (m)';

if ~isempty(app.ExtVar.UPVRobot.DirOri)
    app.ExtUI.UPVRobotDirectivityHemisphereOriX.Value = app.ExtVar.UPVRobot.DirOri(1);
    app.ExtUI.UPVRobotDirectivityHemisphereOriY.Value = app.ExtVar.UPVRobot.DirOri(2);
    app.ExtUI.UPVRobotDirectivityHemisphereOriZ.Value = app.ExtVar.UPVRobot.DirOri(3);
else
     app.ExtVar.UPVRobot.DirOri = [...
         app.ExtUI.UPVRobotDirectivityHemisphereOriX.Value,...
         app.ExtUI.UPVRobotDirectivityHemisphereOriY.Value,...
         app.ExtUI.UPVRobotDirectivityHemisphereOriZ.Value];
end

% Selected tab logic
if ~isempty(app.ExtVar.UPVRobot.DirectivityType)
    idx = find(strcmp({app.ExtUI.UPVRobotDirectivityTypeTab.Children.Title},app.ExtVar.UPVRobot.DirectivityType), 1);
    if ~isempty(idx)
        app.ExtUI.UPVRobotDirectivityTypeTab.SelectedTab = app.ExtUI.UPVRobotDirectivityTypeTab.Children(idx);
    else
        app.ExtVar.UPVRobot.DirectivityType = app.ExtUI.UPVRobotDirectivityTypeTab.SelectedTab.Title;
    end
else
    app.ExtVar.UPVRobot.DirectivityType = app.ExtUI.UPVRobotDirectivityTypeTab.SelectedTab.Title;
end

function UPVRobotDirTabChanged(~,~,app)
app.ExtVar.UPVRobot.RouteOptimized = 0;
app.ExtVar.UPVRobot.DirectivityType = app.ExtUI.UPVRobotDirectivityTypeTab.SelectedTab.Title;
UPVRobotGenerateMeasurementPoints(app)


% Hemisphere
function UPVRobotParameterDirectivityHemisphereChanged(~,~,app)
app.ExtVar.UPVRobot.RouteOptimized = 0;
app.ExtVar.UPVRobot.incPhiHemi = round(app.ExtUI.UPVRobotDirectivityHemisphereIncPhi.Value,2);
app.ExtVar.UPVRobot.incThetaHemi = round(app.ExtUI.UPVRobotDirectivityHemisphereIncTheta.Value,2);
app.ExtVar.UPVRobot.dirR = app.ExtUI.UPVRobotDirectivityHemisphereR.Value;
app.ExtVar.UPVRobot.DirPosition = app.ExtUI.UPVRobotDirectivityHemispherePositionDropDown.Value;
app.ExtVar.UPVRobot.DirDirection = app.ExtUI.UPVRobotDirectivityHemiTypeDropDown.Value;

app.ExtVar.UPVRobot.DirOri = [...
    app.ExtUI.UPVRobotDirectivityHemisphereOriX.Value,...
    app.ExtUI.UPVRobotDirectivityHemisphereOriY.Value,...
    app.ExtUI.UPVRobotDirectivityHemisphereOriZ.Value];

% To Hor/Ver
app.ExtUI.UPVRobotDirectivityHorVerOriX.Value = app.ExtVar.UPVRobot.DirOri(1);
app.ExtUI.UPVRobotDirectivityHorVerOriY.Value = app.ExtVar.UPVRobot.DirOri(2);
app.ExtUI.UPVRobotDirectivityHorVerOriZ.Value = app.ExtVar.UPVRobot.DirOri(3);
app.ExtUI.UPVRobotDirectivityHorVerPositionDropDown.Value = app.ExtVar.UPVRobot.DirPosition;
app.ExtUI.UPVRobotDirectivityHorVerR.Value = app.ExtVar.UPVRobot.dirR;
app.ExtUI.UPVRobotDirectivityHorVerTypeDropDown.Value = app.ExtVar.UPVRobot.DirDirection;

UPVRobotGenerateMeasurementPoints(app)

% Hor/Ver
function UPVRobotParameterDirectivityChanged(~,~,app)
app.ExtVar.UPVRobot.RouteOptimized = 0;
app.ExtVar.UPVRobot.incPhi = round(app.ExtUI.UPVRobotDirectivityHorVerIncPhi.Value,2);
app.ExtVar.UPVRobot.incTheta = round(app.ExtUI.UPVRobotDirectivityHorVerIncTheta.Value,2);
app.ExtVar.UPVRobot.dirR = app.ExtUI.UPVRobotDirectivityHorVerR.Value;
app.ExtVar.UPVRobot.DirPosition = app.ExtUI.UPVRobotDirectivityHorVerPositionDropDown.Value;
app.ExtVar.UPVRobot.DirDirection = app.ExtUI.UPVRobotDirectivityHorVerTypeDropDown.Value;

app.ExtVar.UPVRobot.DirOri = [...
    app.ExtUI.UPVRobotDirectivityHorVerOriX.Value,...
    app.ExtUI.UPVRobotDirectivityHorVerOriY.Value,...
    app.ExtUI.UPVRobotDirectivityHorVerOriZ.Value];

% To hemisphere
app.ExtUI.UPVRobotDirectivityHemisphereOriX.Value = app.ExtVar.UPVRobot.DirOri(1);
app.ExtUI.UPVRobotDirectivityHemisphereOriY.Value = app.ExtVar.UPVRobot.DirOri(2);
app.ExtUI.UPVRobotDirectivityHemisphereOriZ.Value = app.ExtVar.UPVRobot.DirOri(3);
app.ExtUI.UPVRobotDirectivityHemispherePositionDropDown.Value = app.ExtVar.UPVRobot.DirPosition;
app.ExtUI.UPVRobotDirectivityHemisphereR.Value = app.ExtVar.UPVRobot.dirR;

UPVRobotGenerateMeasurementPoints(app)

