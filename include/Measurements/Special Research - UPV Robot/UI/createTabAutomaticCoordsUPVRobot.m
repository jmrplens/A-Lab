function createTabAutomaticCoordsUPVRobot(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Create TabUPVRobotLeftPanelMeasurementPointsAutomatic
app.ExtUI.TabUPVRobotLeftPanelMeasurementPointsAutomatic = uitab(app.ExtUI.TabUPVRobotLeftPanelMeasurementPoints);
app.ExtUI.TabUPVRobotLeftPanelMeasurementPointsAutomatic.Title = 'Auto';
app.ExtUI.TabUPVRobotLeftPanelMeasurementPointsAutomatic.BackgroundColor = [1 1 1];

% Create GridLayout10
app.ExtUI.GridLayout10 = uigridlayout(app.ExtUI.TabUPVRobotLeftPanelMeasurementPointsAutomatic);
app.ExtUI.GridLayout10.ColumnWidth = {'fit', '1x', '1x', '1x'};
app.ExtUI.GridLayout10.RowHeight = {'fit', 'fit', 'fit', 'fit', 'fit', 'fit', 'fit'};
app.ExtUI.GridLayout10.BackgroundColor = [1 1 1];

% Create UPVRobotOriginXEditField
app.ExtUI.UPVRobotOriginXEditField = uieditfield(app.ExtUI.GridLayout10, 'numeric');
app.ExtUI.UPVRobotOriginXEditField.ValueChangedFcn = {@UPVRobotParameterAutomaticChanged,app};
app.ExtUI.UPVRobotOriginXEditField.Limits = [0 app.ExtVar.UPVRobot.XLen];
app.ExtUI.UPVRobotOriginXEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotOriginXEditField.Layout.Row = 3;
app.ExtUI.UPVRobotOriginXEditField.Layout.Column = 2;
if ~isempty(app.ExtVar.UPVRobot.XOri)
    app.ExtUI.UPVRobotOriginXEditField.Value = app.ExtVar.UPVRobot.XOri;
else
    app.ExtVar.UPVRobot.XOri = app.ExtUI.UPVRobotOriginXEditField.Value;
end

% Create UPVRobotEndXEditField
app.ExtUI.UPVRobotEndXEditField = uieditfield(app.ExtUI.GridLayout10, 'numeric');
app.ExtUI.UPVRobotEndXEditField.ValueChangedFcn = {@UPVRobotParameterAutomaticChanged,app};
app.ExtUI.UPVRobotEndXEditField.Limits = [0 app.ExtVar.UPVRobot.XLen];
app.ExtUI.UPVRobotEndXEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotEndXEditField.Layout.Row = 3;
app.ExtUI.UPVRobotEndXEditField.Layout.Column = 3;
app.ExtUI.UPVRobotEndXEditField.Value = app.ExtVar.UPVRobot.XLen;
if ~isempty(app.ExtVar.UPVRobot.XEnd)
    app.ExtUI.UPVRobotEndXEditField.Value = app.ExtVar.UPVRobot.XEnd;
else
    app.ExtVar.UPVRobot.XEnd = app.ExtUI.UPVRobotEndXEditField.Value;
end

% Create UPVRobotOriginYEditField
app.ExtUI.UPVRobotOriginYEditField = uieditfield(app.ExtUI.GridLayout10, 'numeric');
app.ExtUI.UPVRobotOriginYEditField.ValueChangedFcn = {@UPVRobotParameterAutomaticChanged,app};
app.ExtUI.UPVRobotOriginYEditField.Limits = [0 app.ExtVar.UPVRobot.YLen];
app.ExtUI.UPVRobotOriginYEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotOriginYEditField.Layout.Row = 4;
app.ExtUI.UPVRobotOriginYEditField.Layout.Column = 2;
if ~isempty(app.ExtVar.UPVRobot.YOri)
    app.ExtUI.UPVRobotOriginYEditField.Value = app.ExtVar.UPVRobot.YOri;
else
    app.ExtVar.UPVRobot.YOri = app.ExtUI.UPVRobotOriginYEditField.Value;
end

% Create UPVRobotEndYEditField
app.ExtUI.UPVRobotEndYEditField = uieditfield(app.ExtUI.GridLayout10, 'numeric');
app.ExtUI.UPVRobotEndYEditField.ValueChangedFcn = {@UPVRobotParameterAutomaticChanged,app};
app.ExtUI.UPVRobotEndYEditField.Limits = [0 app.ExtVar.UPVRobot.YLen];
app.ExtUI.UPVRobotEndYEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotEndYEditField.Layout.Row = 4;
app.ExtUI.UPVRobotEndYEditField.Layout.Column = 3;
app.ExtUI.UPVRobotEndYEditField.Value = app.ExtVar.UPVRobot.YLen;
if ~isempty(app.ExtVar.UPVRobot.YEnd)
    app.ExtUI.UPVRobotEndYEditField.Value = app.ExtVar.UPVRobot.YEnd;
else
    app.ExtVar.UPVRobot.YEnd = app.ExtUI.UPVRobotEndYEditField.Value;
end

% Create UPVRobotOriginZEditField
app.ExtUI.UPVRobotOriginZEditField = uieditfield(app.ExtUI.GridLayout10, 'numeric');
app.ExtUI.UPVRobotOriginZEditField.ValueChangedFcn = {@UPVRobotParameterAutomaticChanged,app};
app.ExtUI.UPVRobotOriginZEditField.Limits = [0 app.ExtVar.UPVRobot.ZLen];
app.ExtUI.UPVRobotOriginZEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotOriginZEditField.Layout.Row = 5;
app.ExtUI.UPVRobotOriginZEditField.Layout.Column = 2;
if ~isempty(app.ExtVar.UPVRobot.ZOri)
    app.ExtUI.UPVRobotOriginZEditField.Value = app.ExtVar.UPVRobot.ZOri;
else
    app.ExtVar.UPVRobot.ZOri = app.ExtUI.UPVRobotOriginZEditField.Value;
end

% Create UPVRobotEndZEditField
app.ExtUI.UPVRobotEndZEditField = uieditfield(app.ExtUI.GridLayout10, 'numeric');
app.ExtUI.UPVRobotEndZEditField.ValueChangedFcn = {@UPVRobotParameterAutomaticChanged,app};
app.ExtUI.UPVRobotEndZEditField.Limits = [0 app.ExtVar.UPVRobot.ZLen];
app.ExtUI.UPVRobotEndZEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotEndZEditField.Layout.Row = 5;
app.ExtUI.UPVRobotEndZEditField.Layout.Column = 3;
app.ExtUI.UPVRobotEndZEditField.Value = app.ExtVar.UPVRobot.ZLen;
if ~isempty(app.ExtVar.UPVRobot.ZEnd)
    app.ExtUI.UPVRobotEndZEditField.Value = app.ExtVar.UPVRobot.ZEnd;
else
    app.ExtVar.UPVRobot.ZEnd = app.ExtUI.UPVRobotEndZEditField.Value;
end

% Create UPVRobotPointsXEditField
app.ExtUI.UPVRobotPointsXEditField = uieditfield(app.ExtUI.GridLayout10, 'numeric');
app.ExtUI.UPVRobotPointsXEditField.ValueChangedFcn = {@UPVRobotParameterAutomaticChanged,app};
app.ExtUI.UPVRobotPointsXEditField.Limits = [1 Inf];
app.ExtUI.UPVRobotPointsXEditField.RoundFractionalValues = 'on';
app.ExtUI.UPVRobotPointsXEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotPointsXEditField.Layout.Row = 3;
app.ExtUI.UPVRobotPointsXEditField.Layout.Column = 4;
app.ExtUI.UPVRobotPointsXEditField.Value = 10;
if ~isempty(app.ExtVar.UPVRobot.XRes) && app.ExtVar.UPVRobot.XRes > 0
    app.ExtUI.UPVRobotPointsXEditField.Value = app.ExtVar.UPVRobot.XRes;
else
    app.ExtVar.UPVRobot.XRes = app.ExtUI.UPVRobotPointsXEditField.Value;
end

% Create UPVRobotPointsYEditField
app.ExtUI.UPVRobotPointsYEditField = uieditfield(app.ExtUI.GridLayout10, 'numeric');
app.ExtUI.UPVRobotPointsYEditField.ValueChangedFcn = {@UPVRobotParameterAutomaticChanged,app};
app.ExtUI.UPVRobotPointsYEditField.Limits = [1 Inf];
app.ExtUI.UPVRobotPointsYEditField.RoundFractionalValues = 'on';
app.ExtUI.UPVRobotPointsYEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotPointsYEditField.Layout.Row = 4;
app.ExtUI.UPVRobotPointsYEditField.Layout.Column = 4;
app.ExtUI.UPVRobotPointsYEditField.Value = 10;
if ~isempty(app.ExtVar.UPVRobot.YRes) && app.ExtVar.UPVRobot.YRes > 0
    app.ExtUI.UPVRobotPointsYEditField.Value = app.ExtVar.UPVRobot.YRes;
else
    app.ExtVar.UPVRobot.YRes = app.ExtUI.UPVRobotPointsYEditField.Value;
end

% Create UPVRobotPointsZEditField
app.ExtUI.UPVRobotPointsZEditField = uieditfield(app.ExtUI.GridLayout10, 'numeric');
app.ExtUI.UPVRobotPointsZEditField.ValueChangedFcn = {@UPVRobotParameterAutomaticChanged,app};
app.ExtUI.UPVRobotPointsZEditField.Limits = [1 Inf];
app.ExtUI.UPVRobotPointsZEditField.RoundFractionalValues = 'on';
app.ExtUI.UPVRobotPointsZEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotPointsZEditField.Layout.Row = 5;
app.ExtUI.UPVRobotPointsZEditField.Layout.Column = 4;
app.ExtUI.UPVRobotPointsZEditField.Value = 10;
if ~isempty(app.ExtVar.UPVRobot.ZRes) && app.ExtVar.UPVRobot.ZRes > 0
    app.ExtUI.UPVRobotPointsZEditField.Value = app.ExtVar.UPVRobot.ZRes;
else
    app.ExtVar.UPVRobot.ZRes = app.ExtUI.UPVRobotPointsZEditField.Value;
end

% Create UPVRoboAutomaticPointsInfo
app.ExtUI.UPVRoboAutomaticPointsInfo = uilabel(app.ExtUI.GridLayout10);
app.ExtUI.UPVRoboAutomaticPointsInfo.WordWrap = 'on';
app.ExtUI.UPVRoboAutomaticPointsInfo.Layout.Row = 1;
app.ExtUI.UPVRoboAutomaticPointsInfo.Layout.Column = [1 4];
app.ExtUI.UPVRoboAutomaticPointsInfo.Text = {'The origin and end point of each axis in meters. '; 'Resolution indicates the number of measurement points on an axis.'};

% Create UPVRoboAutomaticPointsOriginmLabel
app.ExtUI.UPVRoboAutomaticPointsOriginmLabel = uilabel(app.ExtUI.GridLayout10);
app.ExtUI.UPVRoboAutomaticPointsOriginmLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRoboAutomaticPointsOriginmLabel.WordWrap = 'on';
app.ExtUI.UPVRoboAutomaticPointsOriginmLabel.FontWeight = 'bold';
app.ExtUI.UPVRoboAutomaticPointsOriginmLabel.Layout.Row = 2;
app.ExtUI.UPVRoboAutomaticPointsOriginmLabel.Layout.Column = 2;
app.ExtUI.UPVRoboAutomaticPointsOriginmLabel.Text = 'Origin (m)';

% Create UPVRoboAutomaticPointsEndmLabel
app.ExtUI.UPVRoboAutomaticPointsEndmLabel = uilabel(app.ExtUI.GridLayout10);
app.ExtUI.UPVRoboAutomaticPointsEndmLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRoboAutomaticPointsEndmLabel.WordWrap = 'on';
app.ExtUI.UPVRoboAutomaticPointsEndmLabel.FontWeight = 'bold';
app.ExtUI.UPVRoboAutomaticPointsEndmLabel.Layout.Row = 2;
app.ExtUI.UPVRoboAutomaticPointsEndmLabel.Layout.Column = 3;
app.ExtUI.UPVRoboAutomaticPointsEndmLabel.Text = 'End (m)';

% Create UPVRoboAutomaticPointsResolutionLabel
app.ExtUI.UPVRoboAutomaticPointsResolutionLabel = uilabel(app.ExtUI.GridLayout10);
app.ExtUI.UPVRoboAutomaticPointsResolutionLabel.WordWrap = 'on';
app.ExtUI.UPVRoboAutomaticPointsResolutionLabel.FontWeight = 'bold';
app.ExtUI.UPVRoboAutomaticPointsResolutionLabel.Layout.Row = 2;
app.ExtUI.UPVRoboAutomaticPointsResolutionLabel.Layout.Column = 4;
app.ExtUI.UPVRoboAutomaticPointsResolutionLabel.Text = 'Resolution';

% Create UPVRoboAutomaticPointsXAxisLabel
app.ExtUI.UPVRoboAutomaticPointsXAxisLabel = uilabel(app.ExtUI.GridLayout10);
app.ExtUI.UPVRoboAutomaticPointsXAxisLabel.Layout.Row = 3;
app.ExtUI.UPVRoboAutomaticPointsXAxisLabel.Layout.Column = 1;
app.ExtUI.UPVRoboAutomaticPointsXAxisLabel.Text = 'X Axis';

% Create UPVRoboAutomaticPointsYAxisLabel
app.ExtUI.UPVRoboAutomaticPointsYAxisLabel = uilabel(app.ExtUI.GridLayout10);
app.ExtUI.UPVRoboAutomaticPointsYAxisLabel.Layout.Row = 4;
app.ExtUI.UPVRoboAutomaticPointsYAxisLabel.Layout.Column = 1;
app.ExtUI.UPVRoboAutomaticPointsYAxisLabel.Text = 'Y Axis';

% Create UPVRoboAutomaticPointsZaxisLabel_2
app.ExtUI.UPVRoboAutomaticPointsZaxisLabel_2 = uilabel(app.ExtUI.GridLayout10);
app.ExtUI.UPVRoboAutomaticPointsZaxisLabel_2.Layout.Row = 5;
app.ExtUI.UPVRoboAutomaticPointsZaxisLabel_2.Layout.Column = 1;
app.ExtUI.UPVRoboAutomaticPointsZaxisLabel_2.Text = 'Z Axis';

% Logics
% X
if app.ExtUI.UPVRobotPointsXEditField.Value==1
    app.ExtUI.UPVRobotEndXEditField.Enable = 'off';
    app.ExtVar.UPVRobot.XEnd = app.ExtUI.UPVRobotOriginXEditField.Value;
else
    app.ExtUI.UPVRobotEndXEditField.Enable = 'on';
end
% Y
if app.ExtUI.UPVRobotPointsYEditField.Value==1
    app.ExtUI.UPVRobotEndYEditField.Enable = 'off';
    app.ExtVar.UPVRobot.YEnd = app.ExtUI.UPVRobotOriginYEditField.Value;
else
    app.ExtUI.UPVRobotEndYEditField.Enable = 'on';
end
% Z
if app.ExtUI.UPVRobotPointsZEditField.Value==1
    app.ExtUI.UPVRobotEndZEditField.Enable = 'off';
    app.ExtVar.UPVRobot.ZEnd = app.ExtUI.UPVRobotOriginZEditField.Value;
else
    app.ExtUI.UPVRobotEndZEditField.Enable = 'on';
end

function UPVRobotParameterAutomaticChanged(~,~,app)

app.ExtVar.UPVRobot.RouteOptimized = 0;

% Resolution
app.ExtVar.UPVRobot.XRes = app.ExtUI.UPVRobotPointsXEditField.Value;
app.ExtVar.UPVRobot.YRes = app.ExtUI.UPVRobotPointsYEditField.Value;
app.ExtVar.UPVRobot.ZRes = app.ExtUI.UPVRobotPointsZEditField.Value;

% Logics
% X
if app.ExtUI.UPVRobotPointsXEditField.Value==1
    app.ExtUI.UPVRobotEndXEditField.Enable = 'off';
    app.ExtVar.UPVRobot.XEnd = app.ExtUI.UPVRobotOriginXEditField.Value;
%     % Restrict
%     app.ExtUI.UPVRobotEndXEditFieldRestrict.Enable = 'off';
%     app.ExtUI.UPVRobotOriginXEditFieldRestrict.Enable = 'off';
%     app.ExtUI.UPVRobotOriginXEditFieldRestrict.Value = 0;
%     app.ExtUI.UPVRobotEndXEditFieldRestrict.Value = app.ExtVar.UPVRobot.XLen;
%     app.ExtVar.UPVRobot.XNaNOri = 0;
%     app.ExtVar.UPVRobot.XNaNEnd = app.ExtVar.UPVRobot.XLen;
else
    app.ExtVar.UPVRobot.XEnd = app.ExtUI.UPVRobotEndXEditField.Value;
    app.ExtUI.UPVRobotEndXEditField.Enable = 'on';
%     app.ExtUI.UPVRobotEndXEditFieldRestrict.Enable = 'on';
%     app.ExtUI.UPVRobotOriginXEditFieldRestrict.Enable = 'on';
end
% Y
if app.ExtUI.UPVRobotPointsYEditField.Value==1
    app.ExtUI.UPVRobotEndYEditField.Enable = 'off';
    app.ExtVar.UPVRobot.YEnd = app.ExtUI.UPVRobotOriginYEditField.Value;
%     % Restrict
%     app.ExtUI.UPVRobotEndYEditFieldRestrict.Enable = 'off';
%     app.ExtUI.UPVRobotOriginYEditFieldRestrict.Enable = 'off';
%     app.ExtUI.UPVRobotOriginYEditFieldRestrict.Value = 0;
%     app.ExtUI.UPVRobotEndYEditFieldRestrict.Value = app.ExtVar.UPVRobot.YLen;
%     app.ExtVar.UPVRobot.YNaNOri = 0;
%     app.ExtVar.UPVRobot.YNaNEnd = app.ExtVar.UPVRobot.YLen;
else
    app.ExtVar.UPVRobot.YEnd = app.ExtUI.UPVRobotEndYEditField.Value;
    app.ExtUI.UPVRobotEndYEditField.Enable = 'on';
%     app.ExtUI.UPVRobotEndYEditFieldRestrict.Enable = 'on';
%     app.ExtUI.UPVRobotOriginYEditFieldRestrict.Enable = 'on';
end
% Z
if app.ExtUI.UPVRobotPointsZEditField.Value==1
    app.ExtUI.UPVRobotEndZEditField.Enable = 'off';
    app.ExtVar.UPVRobot.ZEnd = app.ExtUI.UPVRobotOriginZEditField.Value;
    % Restric
%     app.ExtUI.UPVRobotEndZEditFieldRestrict.Enable = 'off';
%     app.ExtUI.UPVRobotOriginZEditFieldRestrict.Enable = 'off';
%     app.ExtUI.UPVRobotOriginZEditFieldRestrict.Value = 0;
%     app.ExtUI.UPVRobotEndZEditFieldRestrict.Value = app.ExtVar.UPVRobot.ZLen;
%     app.ExtVar.UPVRobot.ZNaNOri = 0;
%     app.ExtVar.UPVRobot.ZNaNEnd = app.ExtVar.UPVRobot.ZLen;
else
    app.ExtVar.UPVRobot.ZEnd = app.ExtUI.UPVRobotEndZEditField.Value;
    app.ExtUI.UPVRobotEndZEditField.Enable = 'on';
%     app.ExtUI.UPVRobotEndZEditFieldRestrict.Enable = 'on';
%     app.ExtUI.UPVRobotOriginZEditFieldRestrict.Enable = 'on';
end

% Origin-End
app.ExtVar.UPVRobot.XOri = app.ExtUI.UPVRobotOriginXEditField.Value;
app.ExtVar.UPVRobot.YOri = app.ExtUI.UPVRobotOriginYEditField.Value;
app.ExtVar.UPVRobot.ZOri = app.ExtUI.UPVRobotOriginZEditField.Value;

UPVRobotGenerateMeasurementPoints(app)
