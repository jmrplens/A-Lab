function createPanelUPVRobotCenter(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Center column
column = centerGrid(app,{'1x'},{'1x', 'fit'});

% Create CenterMainPanelUPVRobot
app.ExtUI.CenterMainPanelUPVRobot = uipanel(column);
app.ExtUI.CenterMainPanelUPVRobot.TitlePosition = 'centertop';
app.ExtUI.CenterMainPanelUPVRobot.Title = 'Map of measurement points';
app.ExtUI.CenterMainPanelUPVRobot.BackgroundColor = [1 1 1];
app.ExtUI.CenterMainPanelUPVRobot.Layout.Row = 1;
app.ExtUI.CenterMainPanelUPVRobot.Layout.Column = 1;
app.ExtUI.CenterMainPanelUPVRobot.FontWeight = 'bold';
app.ExtUI.CenterMainPanelUPVRobot.FontSize = 14;

% Create GridCenterMainPanelUPVRobot
app.ExtUI.GridCenterMainPanelUPVRobot = uigridlayout(app.ExtUI.CenterMainPanelUPVRobot);
app.ExtUI.GridCenterMainPanelUPVRobot.ColumnWidth = {'1x', '1x', '1x', '1x'};
app.ExtUI.GridCenterMainPanelUPVRobot.RowHeight = {'fit','1x', 'fit'};
app.ExtUI.GridCenterMainPanelUPVRobot.BackgroundColor = [1 1 1];

% Create GridUPVRobotRoute
app.ExtUI.GridUPVRobotRoute = uigridlayout(app.ExtUI.GridCenterMainPanelUPVRobot);
app.ExtUI.GridUPVRobotRoute.ColumnWidth = {'1x', '1x', '1x', '1x'};
app.ExtUI.GridUPVRobotRoute.RowHeight = {'fit'};
app.ExtUI.GridUPVRobotRoute.Padding = [0 0 0 0];
app.ExtUI.GridUPVRobotRoute.Layout.Row = 1;
app.ExtUI.GridUPVRobotRoute.Layout.Column = [1 4];
app.ExtUI.GridUPVRobotRoute.BackgroundColor = [1 1 1];

% Create UPVRobotViewrobotrouteButton
app.ExtUI.UPVRobotViewrobotrouteButton = uibutton(app.ExtUI.GridUPVRobotRoute, 'push');
app.ExtUI.UPVRobotViewrobotrouteButton.WordWrap = 'on';
app.ExtUI.UPVRobotViewrobotrouteButton.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotViewrobotrouteButton.FontWeight = 'bold';
app.ExtUI.UPVRobotViewrobotrouteButton.Layout.Row = 1;
app.ExtUI.UPVRobotViewrobotrouteButton.Layout.Column = 2;
app.ExtUI.UPVRobotViewrobotrouteButton.Text = 'View robot route';
app.ExtUI.UPVRobotViewrobotrouteButton.Visible = 'off';
app.ExtUI.UPVRobotViewrobotrouteButton.ButtonPushedFcn = {@UPVRobotViewRoutepushed,app};

% Create UPVRobotOptimizerouteButton
app.ExtUI.UPVRobotOptimizerouteButton = uibutton(app.ExtUI.GridUPVRobotRoute, 'push');
app.ExtUI.UPVRobotOptimizerouteButton.WordWrap = 'on';
app.ExtUI.UPVRobotOptimizerouteButton.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotOptimizerouteButton.FontWeight = 'bold';
app.ExtUI.UPVRobotOptimizerouteButton.Layout.Row = 1;
app.ExtUI.UPVRobotOptimizerouteButton.Layout.Column = 3;
app.ExtUI.UPVRobotOptimizerouteButton.Text = 'Optimize route';
app.ExtUI.UPVRobotOptimizerouteButton.Visible = 'off';
app.ExtUI.UPVRobotOptimizerouteButton.ButtonPushedFcn = {@UPVRobotOptimizeRoutepushed,app};


% Create UPVRobotOptimizerouteReturnButton
app.ExtUI.UPVRobotOptimizerouteReturnButton = uibutton(app.ExtUI.GridUPVRobotRoute, 'push');
app.ExtUI.UPVRobotOptimizerouteReturnButton.Visible = 'off';
app.ExtUI.UPVRobotOptimizerouteReturnButton.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotOptimizerouteReturnButton.FontWeight = 'bold';
app.ExtUI.UPVRobotOptimizerouteReturnButton.Layout.Row = 1;
app.ExtUI.UPVRobotOptimizerouteReturnButton.Layout.Column = 4;
app.ExtUI.UPVRobotOptimizerouteReturnButton.Text = 'Return';
app.ExtUI.UPVRobotOptimizerouteReturnButton.ButtonPushedFcn = {@UPVRobotRouteReturnpushed,app};

% Create UPVRobotXYButton
app.ExtUI.UPVRobotXYButton = uibutton(app.ExtUI.GridCenterMainPanelUPVRobot, 'push');
app.ExtUI.UPVRobotXYButton.ButtonPushedFcn = {@UPVRobotXYpushed,app};
app.ExtUI.UPVRobotXYButton.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotXYButton.FontWeight = 'bold';
app.ExtUI.UPVRobotXYButton.Layout.Row = 3;
app.ExtUI.UPVRobotXYButton.Layout.Column = 1;
app.ExtUI.UPVRobotXYButton.Text = 'XY';
app.ExtUI.UPVRobotXYButton.Visible = 'off';

% Create UPVRobotXZButton
app.ExtUI.UPVRobotXZButton = uibutton(app.ExtUI.GridCenterMainPanelUPVRobot, 'push');
app.ExtUI.UPVRobotXZButton.ButtonPushedFcn = {@UPVRobotXZpushed,app};
app.ExtUI.UPVRobotXZButton.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotXZButton.FontWeight = 'bold';
app.ExtUI.UPVRobotXZButton.Layout.Row = 3;
app.ExtUI.UPVRobotXZButton.Layout.Column = 2;
app.ExtUI.UPVRobotXZButton.Text = 'XZ';
app.ExtUI.UPVRobotXZButton.Visible = 'off';

% Create UPVRobotYZButton
app.ExtUI.UPVRobotYZButton = uibutton(app.ExtUI.GridCenterMainPanelUPVRobot, 'push');
app.ExtUI.UPVRobotYZButton.ButtonPushedFcn = {@UPVRobotYZpushed,app};
app.ExtUI.UPVRobotYZButton.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotYZButton.FontWeight = 'bold';
app.ExtUI.UPVRobotYZButton.Layout.Row = 3;
app.ExtUI.UPVRobotYZButton.Layout.Column = 3;
app.ExtUI.UPVRobotYZButton.Text = 'YZ';
app.ExtUI.UPVRobotYZButton.Visible = 'off';

% Create UPVRobotButton3D
app.ExtUI.UPVRobotButton3D = uibutton(app.ExtUI.GridCenterMainPanelUPVRobot, 'push');
app.ExtUI.UPVRobotButton3D.ButtonPushedFcn = {@UPVRobot3Dpushed,app};
app.ExtUI.UPVRobotButton3D.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotButton3D.FontWeight = 'bold';
app.ExtUI.UPVRobotButton3D.FontColor = [0.6353 0.0784 0.1843];
app.ExtUI.UPVRobotButton3D.Layout.Row = 3;
app.ExtUI.UPVRobotButton3D.Layout.Column = 4;
app.ExtUI.UPVRobotButton3D.Text = '3D';
app.ExtUI.UPVRobotButton3D.Visible = 'off';

% Create UPVRobotUIAxes
app.ExtUI.UPVRobotUIAxes = uiaxes(app.ExtUI.GridCenterMainPanelUPVRobot);
app.ExtUI.UPVRobotUIAxes.Layout.Row = 2;
app.ExtUI.UPVRobotUIAxes.Layout.Column = [1 4];
app.ExtUI.UPVRobotUIAxes.Visible = 'off';

% Create UPVRobotUIAxes
app.ExtUI.UPVRobotUIAxesRoute = uiaxes(app.ExtUI.GridCenterMainPanelUPVRobot);
app.ExtUI.UPVRobotUIAxesRoute.Layout.Row = 2;
app.ExtUI.UPVRobotUIAxesRoute.Layout.Column = [1 4];
app.ExtUI.UPVRobotUIAxesRoute.Visible = 'off';

% Create GridUPVRobotMainRestric
app.ExtUI.GridUPVRobotMainRestric = uigridlayout(column);
app.ExtUI.GridUPVRobotMainRestric.ColumnWidth = {'1x', '1x', '0.5x'};
app.ExtUI.GridUPVRobotMainRestric.RowHeight = {'1x'};
app.ExtUI.GridUPVRobotMainRestric.Layout.Row = 2;
app.ExtUI.GridUPVRobotMainRestric.Layout.Column = 1;
app.ExtUI.GridUPVRobotMainRestric.BackgroundColor = [1 1 1];

% Create UPVRobotRestrictedareaPanel
app.ExtUI.UPVRobotRestrictedareaPanel = uipanel(app.ExtUI.GridUPVRobotMainRestric);
app.ExtUI.UPVRobotRestrictedareaPanel.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotRestrictedareaPanel.TitlePosition = 'centertop';
app.ExtUI.UPVRobotRestrictedareaPanel.Title = 'Restricted area';
app.ExtUI.UPVRobotRestrictedareaPanel.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotRestrictedareaPanel.Layout.Row = 1;
app.ExtUI.UPVRobotRestrictedareaPanel.Layout.Column = 1;
app.ExtUI.UPVRobotRestrictedareaPanel.FontWeight = 'bold';

% Create GridUPVRobotRestrictedareaPanel
app.ExtUI.GridUPVRobotRestrictedareaPanel = uigridlayout(app.ExtUI.UPVRobotRestrictedareaPanel);
app.ExtUI.GridUPVRobotRestrictedareaPanel.ColumnWidth = {'1x','1x','1x'};
app.ExtUI.GridUPVRobotRestrictedareaPanel.RowHeight = {'fit', 'fit', 'fit', 'fit'};
app.ExtUI.GridUPVRobotRestrictedareaPanel.BackgroundColor = [1 1 1];

% Create OriginmEditFieldLabelRestrict
app.ExtUI.OriginmEditFieldLabelRestrict = uilabel(app.ExtUI.GridUPVRobotRestrictedareaPanel);
app.ExtUI.OriginmEditFieldLabelRestrict.HorizontalAlignment = 'center';
app.ExtUI.OriginmEditFieldLabelRestrict.FontWeight = 'bold';
app.ExtUI.OriginmEditFieldLabelRestrict.Layout.Row = 1;
app.ExtUI.OriginmEditFieldLabelRestrict.Layout.Column = 2;
app.ExtUI.OriginmEditFieldLabelRestrict.Text = 'Origin (m)';

% Create XaxisEditFieldLabel
app.ExtUI.XaxisEditFieldLabel = uilabel(app.ExtUI.GridUPVRobotRestrictedareaPanel);
app.ExtUI.XaxisEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.XaxisEditFieldLabel.Layout.Row = 2;
app.ExtUI.XaxisEditFieldLabel.Layout.Column = 1;
app.ExtUI.XaxisEditFieldLabel.Text = 'X axis';

% Create UPVRobotOriginXEditFieldRestrict
app.ExtUI.UPVRobotOriginXEditFieldRestrict = uieditfield(app.ExtUI.GridUPVRobotRestrictedareaPanel, 'numeric');
app.ExtUI.UPVRobotOriginXEditFieldRestrict.ValueChangedFcn = {@UPVRobotParameterRestrictChanged,app};
app.ExtUI.UPVRobotOriginXEditFieldRestrict.Limits = [0 app.ExtVar.UPVRobot.XLen];
app.ExtUI.UPVRobotOriginXEditFieldRestrict.Layout.Row = 2;
app.ExtUI.UPVRobotOriginXEditFieldRestrict.Layout.Column = 2;
app.ExtUI.UPVRobotOriginXEditFieldRestrict.Value = 0;
if ~isempty(app.ExtVar.UPVRobot.XNaNOri) ...
        && app.ExtVar.UPVRobot.XNaNOri >= 0 ...
        && app.ExtVar.UPVRobot.XNaNOri <= app.ExtVar.UPVRobot.XLen
    app.ExtUI.UPVRobotOriginXEditFieldRestrict.Value = app.ExtVar.UPVRobot.XNaNOri;
else
    app.ExtVar.UPVRobot.XNaNOri = app.ExtUI.UPVRobotOriginXEditFieldRestrict.Value;
end

% Create UPVRobotEndXEditFieldRestrict
app.ExtUI.UPVRobotEndXEditFieldRestrict = uieditfield(app.ExtUI.GridUPVRobotRestrictedareaPanel, 'numeric');
app.ExtUI.UPVRobotEndXEditFieldRestrict.ValueChangedFcn = {@UPVRobotParameterRestrictChanged,app};
app.ExtUI.UPVRobotEndXEditFieldRestrict.Limits = [0 app.ExtVar.UPVRobot.XLen];
app.ExtUI.UPVRobotEndXEditFieldRestrict.Layout.Row = 2;
app.ExtUI.UPVRobotEndXEditFieldRestrict.Layout.Column = 3;
app.ExtUI.UPVRobotEndXEditFieldRestrict.Value = 1;
if ~isempty(app.ExtVar.UPVRobot.XNaNEnd) ...
        && app.ExtVar.UPVRobot.XNaNEnd >= 0 ...
        && app.ExtVar.UPVRobot.XNaNEnd <= app.ExtVar.UPVRobot.XLen
    app.ExtUI.UPVRobotEndXEditFieldRestrict.Value = app.ExtVar.UPVRobot.XNaNEnd;
else
    app.ExtVar.UPVRobot.XNaNEnd = app.ExtUI.UPVRobotEndXEditFieldRestrict.Value;
end

% Create YaxisLabel
app.ExtUI.YaxisLabel = uilabel(app.ExtUI.GridUPVRobotRestrictedareaPanel);
app.ExtUI.YaxisLabel.HorizontalAlignment = 'right';
app.ExtUI.YaxisLabel.Layout.Row = 3;
app.ExtUI.YaxisLabel.Layout.Column = 1;
app.ExtUI.YaxisLabel.Text = 'Y axis';

% Create UPVRobotOriginYEditFieldRestrict
app.ExtUI.UPVRobotOriginYEditFieldRestrict = uieditfield(app.ExtUI.GridUPVRobotRestrictedareaPanel, 'numeric');
app.ExtUI.UPVRobotOriginYEditFieldRestrict.ValueChangedFcn = {@UPVRobotParameterRestrictChanged,app};
app.ExtUI.UPVRobotOriginYEditFieldRestrict.Limits = [0 app.ExtVar.UPVRobot.YLen];
app.ExtUI.UPVRobotOriginYEditFieldRestrict.Layout.Row = 3;
app.ExtUI.UPVRobotOriginYEditFieldRestrict.Layout.Column = 2;
app.ExtUI.UPVRobotOriginYEditFieldRestrict.Value = 0;
if ~isempty(app.ExtVar.UPVRobot.YNaNOri) ...
        && app.ExtVar.UPVRobot.YNaNOri >= 0 ...
        && app.ExtVar.UPVRobot.YNaNOri <= app.ExtVar.UPVRobot.YLen
    app.ExtUI.UPVRobotOriginYEditFieldRestrict.Value = app.ExtVar.UPVRobot.YNaNOri;
else
    app.ExtVar.UPVRobot.YNaNOri = app.ExtUI.UPVRobotOriginYEditFieldRestrict.Value;
end

% Create UPVRobotEndYEditFieldRestrict
app.ExtUI.UPVRobotEndYEditFieldRestrict = uieditfield(app.ExtUI.GridUPVRobotRestrictedareaPanel, 'numeric');
app.ExtUI.UPVRobotEndYEditFieldRestrict.ValueChangedFcn = {@UPVRobotParameterRestrictChanged,app};
app.ExtUI.UPVRobotEndYEditFieldRestrict.Limits = [0 app.ExtVar.UPVRobot.YLen];
app.ExtUI.UPVRobotEndYEditFieldRestrict.Layout.Row = 3;
app.ExtUI.UPVRobotEndYEditFieldRestrict.Layout.Column = 3;
app.ExtUI.UPVRobotEndYEditFieldRestrict.Value = 1;
if ~isempty(app.ExtVar.UPVRobot.YNaNEnd) ...
        && app.ExtVar.UPVRobot.YNaNEnd >= 0 ...
        && app.ExtVar.UPVRobot.YNaNEnd <= app.ExtVar.UPVRobot.YLen
    app.ExtUI.UPVRobotEndYEditFieldRestrict.Value = app.ExtVar.UPVRobot.YNaNEnd;
else
    app.ExtVar.UPVRobot.YNaNEnd = app.ExtUI.UPVRobotEndYEditFieldRestrict.Value;
end

% Create ZaxisLabel
app.ExtUI.ZaxisLabel = uilabel(app.ExtUI.GridUPVRobotRestrictedareaPanel);
app.ExtUI.ZaxisLabel.HorizontalAlignment = 'right';
app.ExtUI.ZaxisLabel.Layout.Row = 4;
app.ExtUI.ZaxisLabel.Layout.Column = 1;
app.ExtUI.ZaxisLabel.Text = 'Z axis';

% Create UPVRobotOriginZEditFieldRestrict
app.ExtUI.UPVRobotOriginZEditFieldRestrict = uieditfield(app.ExtUI.GridUPVRobotRestrictedareaPanel, 'numeric');
app.ExtUI.UPVRobotOriginZEditFieldRestrict.ValueChangedFcn = {@UPVRobotParameterRestrictChanged,app};
app.ExtUI.UPVRobotOriginZEditFieldRestrict.Limits = [0 app.ExtVar.UPVRobot.ZLen];
app.ExtUI.UPVRobotOriginZEditFieldRestrict.Layout.Row = 4;
app.ExtUI.UPVRobotOriginZEditFieldRestrict.Layout.Column = 2;
app.ExtUI.UPVRobotOriginZEditFieldRestrict.Value = 0;
if ~isempty(app.ExtVar.UPVRobot.ZNaNOri) ...
        && app.ExtVar.UPVRobot.ZNaNOri >= 0 ...
        && app.ExtVar.UPVRobot.ZNaNOri <= app.ExtVar.UPVRobot.ZLen
    app.ExtUI.UPVRobotOriginZEditFieldRestrict.Value = app.ExtVar.UPVRobot.ZNaNOri;
else
    app.ExtVar.UPVRobot.ZNaNOri = app.ExtUI.UPVRobotOriginZEditFieldRestrict.Value;
end

% Create UPVRobotEndZEditFieldRestrict
app.ExtUI.UPVRobotEndZEditFieldRestrict = uieditfield(app.ExtUI.GridUPVRobotRestrictedareaPanel, 'numeric');
app.ExtUI.UPVRobotEndZEditFieldRestrict.ValueChangedFcn = {@UPVRobotParameterRestrictChanged,app};
app.ExtUI.UPVRobotEndZEditFieldRestrict.Limits = [0 app.ExtVar.UPVRobot.ZLen];
app.ExtUI.UPVRobotEndZEditFieldRestrict.Layout.Row = 4;
app.ExtUI.UPVRobotEndZEditFieldRestrict.Layout.Column = 3;
app.ExtUI.UPVRobotEndZEditFieldRestrict.Value = 1;
if ~isempty(app.ExtVar.UPVRobot.ZNaNEnd) ...
        && app.ExtVar.UPVRobot.ZNaNEnd >= 0 ...
        && app.ExtVar.UPVRobot.ZNaNEnd <= app.ExtVar.UPVRobot.ZLen
    app.ExtUI.UPVRobotEndZEditFieldRestrict.Value = app.ExtVar.UPVRobot.ZNaNEnd;
else
    app.ExtVar.UPVRobot.ZNaNEnd = app.ExtUI.UPVRobotEndZEditFieldRestrict.Value;
end

% Create EndmEditFieldLabelRestrict
app.ExtUI.EndmEditFieldLabelRestrict = uilabel(app.ExtUI.GridUPVRobotRestrictedareaPanel);
app.ExtUI.EndmEditFieldLabelRestrict.HorizontalAlignment = 'center';
app.ExtUI.EndmEditFieldLabelRestrict.FontWeight = 'bold';
app.ExtUI.EndmEditFieldLabelRestrict.Layout.Row = 1;
app.ExtUI.EndmEditFieldLabelRestrict.Layout.Column = 3;
app.ExtUI.EndmEditFieldLabelRestrict.Text = 'End (m)';

% Create UPVRobotRestrictCheckBox
app.ExtUI.UPVRobotRestrictCheckBox = uicheckbox(app.ExtUI.GridUPVRobotRestrictedareaPanel);
app.ExtUI.UPVRobotRestrictCheckBox.ValueChangedFcn = {@UPVRobotRestrictChanged,app};
app.ExtUI.UPVRobotRestrictCheckBox.Text = 'Restrict';
app.ExtUI.UPVRobotRestrictCheckBox.Layout.Row = 1;
app.ExtUI.UPVRobotRestrictCheckBox.Layout.Column = 1;
app.ExtUI.UPVRobotRestrictCheckBox.Value = 0;
app.ExtUI.UPVRobotRestrictCheckBox.Enable = 'off';
if ~isempty(app.ExtVar.UPVRobot.Restricted)
    app.ExtUI.UPVRobotRestrictCheckBox.Value = app.ExtVar.UPVRobot.Restricted;
else
    app.ExtVar.UPVRobot.Restricted = app.ExtUI.UPVRobotRestrictCheckBox.Value;
end


% Logics
% X
if app.ExtUI.UPVRobotPointsXEditField.Value==1
    app.ExtUI.UPVRobotEndXEditFieldRestrict.Enable = 'off';
    app.ExtUI.UPVRobotOriginXEditFieldRestrict.Enable = 'off';
else
    app.ExtUI.UPVRobotEndXEditFieldRestrict.Enable = 'on';
    app.ExtUI.UPVRobotOriginXEditFieldRestrict.Enable = 'on';
end
% Y
if app.ExtUI.UPVRobotPointsYEditField.Value==1
    app.ExtUI.UPVRobotEndYEditFieldRestrict.Enable = 'off';
    app.ExtUI.UPVRobotOriginYEditFieldRestrict.Enable = 'off';
else
    app.ExtUI.UPVRobotEndYEditFieldRestrict.Enable = 'on';
    app.ExtUI.UPVRobotOriginYEditFieldRestrict.Enable = 'on';
end
% Z
if app.ExtUI.UPVRobotPointsZEditField.Value==1
    app.ExtUI.UPVRobotEndZEditFieldRestrict.Enable = 'off';
    app.ExtUI.UPVRobotOriginZEditFieldRestrict.Enable = 'off';
else
    app.ExtUI.UPVRobotEndZEditFieldRestrict.Enable = 'on';
    app.ExtUI.UPVRobotOriginZEditFieldRestrict.Enable = 'on';
end
% Limitation of UPV Robot: It is impossible to measure points in Z located above the restricted area
app.ExtVar.UPVRobot.ZNaNEnd = app.ExtVar.UPVRobot.ZLen;
app.ExtUI.UPVRobotEndZEditFieldRestrict.Value = app.ExtVar.UPVRobot.ZLen;

if app.ExtUI.UPVRobotRestrictCheckBox.Value == 0
    app.ExtUI.UPVRobotEndXEditFieldRestrict.Enable = 'off';
    app.ExtUI.UPVRobotOriginXEditFieldRestrict.Enable = 'off';
    app.ExtUI.UPVRobotEndYEditFieldRestrict.Enable = 'off';
    app.ExtUI.UPVRobotOriginYEditFieldRestrict.Enable = 'off';
    app.ExtUI.UPVRobotEndZEditFieldRestrict.Enable = 'off';
    app.ExtUI.UPVRobotOriginZEditFieldRestrict.Enable = 'off';
else
    if app.ExtUI.UPVRobotPointsXEditField.Value>1
        app.ExtUI.UPVRobotEndXEditFieldRestrict.Enable = 'on';
        app.ExtUI.UPVRobotOriginXEditFieldRestrict.Enable = 'on';
    end
    if app.ExtUI.UPVRobotPointsYEditField.Value>1
        app.ExtUI.UPVRobotEndYEditFieldRestrict.Enable = 'on';
        app.ExtUI.UPVRobotOriginYEditFieldRestrict.Enable = 'on';
    end
    if app.ExtUI.UPVRobotPointsZEditField.Value>1
        app.ExtUI.UPVRobotEndZEditFieldRestrict.Enable = 'on';
        app.ExtUI.UPVRobotOriginZEditFieldRestrict.Enable = 'on';
    end
end

% Create UPVRobotStatusPanel
app.ExtUI.UPVRobotStatusPanel = uipanel(app.ExtUI.GridUPVRobotMainRestric);
app.ExtUI.UPVRobotStatusPanel.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotStatusPanel.Title = 'Status';
app.ExtUI.UPVRobotStatusPanel.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotStatusPanel.Layout.Row = 1;
app.ExtUI.UPVRobotStatusPanel.Layout.Column = 2;
app.ExtUI.UPVRobotStatusPanel.FontWeight = 'bold';

% Create GridUPVRobotStatus
app.ExtUI.GridUPVRobotStatus = uigridlayout(app.ExtUI.UPVRobotStatusPanel);
app.ExtUI.GridUPVRobotStatus.ColumnWidth = {'fit', '1x'};
app.ExtUI.GridUPVRobotStatus.RowHeight = {'1x', '1x', '1x', '1x', '1x'};
app.ExtUI.GridUPVRobotStatus.ColumnSpacing = 5;
app.ExtUI.GridUPVRobotStatus.RowSpacing = 5;
app.ExtUI.GridUPVRobotStatus.BackgroundColor = [1 1 1];

% Create UPVRobotStatusLocationLabel
app.ExtUI.UPVRobotStatusLocationLabel = uilabel(app.ExtUI.GridUPVRobotStatus);
app.ExtUI.UPVRobotStatusLocationLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotStatusLocationLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotStatusLocationLabel.Layout.Row = 1;
app.ExtUI.UPVRobotStatusLocationLabel.Layout.Column = 1;
app.ExtUI.UPVRobotStatusLocationLabel.Text = 'Location:';

% Create UPVRobotStatusNextpointLabel
app.ExtUI.UPVRobotStatusNextpointLabel = uilabel(app.ExtUI.GridUPVRobotStatus);
app.ExtUI.UPVRobotStatusNextpointLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotStatusNextpointLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotStatusNextpointLabel.Layout.Row = 2;
app.ExtUI.UPVRobotStatusNextpointLabel.Layout.Column = 1;
app.ExtUI.UPVRobotStatusNextpointLabel.Text = 'Next point:';

% Create UPVRobotStatusElapsedtimeLabel
app.ExtUI.UPVRobotStatusElapsedtimeLabel = uilabel(app.ExtUI.GridUPVRobotStatus);
app.ExtUI.UPVRobotStatusElapsedtimeLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotStatusElapsedtimeLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotStatusElapsedtimeLabel.Layout.Row = 4;
app.ExtUI.UPVRobotStatusElapsedtimeLabel.Layout.Column = 1;
app.ExtUI.UPVRobotStatusElapsedtimeLabel.Text = 'Elapsed time:';

% Create UPVRobotStatusRemainingLabel
app.ExtUI.UPVRobotStatusRemainingLabel = uilabel(app.ExtUI.GridUPVRobotStatus);
app.ExtUI.UPVRobotStatusRemainingLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotStatusRemainingLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotStatusRemainingLabel.Layout.Row = 5;
app.ExtUI.UPVRobotStatusRemainingLabel.Layout.Column = 1;
app.ExtUI.UPVRobotStatusRemainingLabel.Text = 'Remaining:';

% Create UPVRobotStatusLocation
app.ExtUI.UPVRobotStatusLocation = uilabel(app.ExtUI.GridUPVRobotStatus);
app.ExtUI.UPVRobotStatusLocation.Layout.Row = 1;
app.ExtUI.UPVRobotStatusLocation.Layout.Column = 2;
app.ExtUI.UPVRobotStatusLocation.Text = '[0.00, 0.00, 0.00]';

% Create UPVRobotStatusNextPoint
app.ExtUI.UPVRobotStatusNextPoint = uilabel(app.ExtUI.GridUPVRobotStatus);
app.ExtUI.UPVRobotStatusNextPoint.Layout.Row = 2;
app.ExtUI.UPVRobotStatusNextPoint.Layout.Column = 2;
app.ExtUI.UPVRobotStatusNextPoint.Text = '~';

% Create UPVRobotStatusElapsed
app.ExtUI.UPVRobotStatusElapsed = uilabel(app.ExtUI.GridUPVRobotStatus);
app.ExtUI.UPVRobotStatusElapsed.Layout.Row = 4;
app.ExtUI.UPVRobotStatusElapsed.Layout.Column = 2;
app.ExtUI.UPVRobotStatusElapsed.Text = '~';

% Create UPVRobotStatusRemaining
app.ExtUI.UPVRobotStatusRemaining = uilabel(app.ExtUI.GridUPVRobotStatus);
app.ExtUI.UPVRobotStatusRemaining.Layout.Row = 5;
app.ExtUI.UPVRobotStatusRemaining.Layout.Column = 2;
app.ExtUI.UPVRobotStatusRemaining.Text = '~';

% Create UPVRobotStatusCompletedLabel
app.ExtUI.UPVRobotStatusCompletedLabel = uilabel(app.ExtUI.GridUPVRobotStatus);
app.ExtUI.UPVRobotStatusCompletedLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotStatusCompletedLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotStatusCompletedLabel.Layout.Row = 3;
app.ExtUI.UPVRobotStatusCompletedLabel.Layout.Column = 1;
app.ExtUI.UPVRobotStatusCompletedLabel.Text = 'Completed:';

% Create UPVRobotStatusCompleted
app.ExtUI.UPVRobotStatusCompleted = uilabel(app.ExtUI.GridUPVRobotStatus);
app.ExtUI.UPVRobotStatusCompleted.Layout.Row = 3;
app.ExtUI.UPVRobotStatusCompleted.Layout.Column = 2;
app.ExtUI.UPVRobotStatusCompleted.Text = '~';

% Create UPVRobotRunningPanel
app.ExtUI.UPVRobotRunningPanel = uipanel(app.ExtUI.GridUPVRobotMainRestric);
app.ExtUI.UPVRobotRunningPanel.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotRunningPanel.Title = ' ';
app.ExtUI.UPVRobotRunningPanel.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotRunningPanel.Layout.Row = 1;
app.ExtUI.UPVRobotRunningPanel.Layout.Column = 3;
app.ExtUI.UPVRobotRunningPanel.FontWeight = 'bold';
app.ExtUI.UPVRobotRunningPanel.Visible = 'off';

% Create GridUPVRobotRunningPanel
app.ExtUI.GridUPVRobotRunningPanel = uigridlayout(app.ExtUI.UPVRobotRunningPanel);
app.ExtUI.GridUPVRobotRunningPanel.ColumnWidth = {'1x'};
app.ExtUI.GridUPVRobotRunningPanel.BackgroundColor = [1 1 1];

% Create UPVRobotPauseButton
app.ExtUI.UPVRobotPauseButton = uibutton(app.ExtUI.GridUPVRobotRunningPanel, 'push');
app.ExtUI.UPVRobotPauseButton.ButtonPushedFcn = {@pauseUPVRobotcallback,app};
app.ExtUI.UPVRobotPauseButton.BackgroundColor = [0.4667 0.6745 0.1882];
app.ExtUI.UPVRobotPauseButton.FontWeight = 'bold';
app.ExtUI.UPVRobotPauseButton.FontColor = [1 1 1];
app.ExtUI.UPVRobotPauseButton.Layout.Row = 1;
app.ExtUI.UPVRobotPauseButton.Layout.Column = 1;
app.ExtUI.UPVRobotPauseButton.Text = 'Pause';

% Create UPVRobotStopButton
app.ExtUI.UPVRobotStopButton = uibutton(app.ExtUI.GridUPVRobotRunningPanel, 'push');
app.ExtUI.UPVRobotStopButton.ButtonPushedFcn = {@stopUPVRobotcallback,app};
app.ExtUI.UPVRobotStopButton.BackgroundColor = [0.6353 0.0784 0.1843];
app.ExtUI.UPVRobotStopButton.FontWeight = 'bold';
app.ExtUI.UPVRobotStopButton.FontColor = [1 1 1];
app.ExtUI.UPVRobotStopButton.Layout.Row = 2;
app.ExtUI.UPVRobotStopButton.Layout.Column = 1;
app.ExtUI.UPVRobotStopButton.Text = 'Stop';


function UPVRobotOptimizeRoutepushed(~,~,app)
UPVRobotOptimizeRoute(app)
app.ExtUI.UPVRobotOptimizerouteReturnButton.Visible = 'on';
app.ExtUI.GridUPVRobotRoute.ColumnWidth = {'1x', '1x', '1x', '1x','1x'};

function UPVRobotRouteReturnpushed(~,~,app)
app.ExtUI.UPVRobotOptimizerouteReturnButton.Visible = 'off';
app.ExtUI.GridUPVRobotRoute.ColumnWidth = {'1x', '1x', '1x', '1x'};
axroute = app.ExtUI.UPVRobotUIAxesRoute;
cla(axroute,'reset')
axroute.Visible = 'off';
UPVRobotGenerateMeasurementPoints(app)


function UPVRobotViewRoutepushed(~,~,app)
app.ExtUI.UPVRobotOptimizerouteReturnButton.Visible = 'on';
app.ExtUI.GridUPVRobotRoute.ColumnWidth = {'1x', '1x', '1x', '1x','1x'};

% Hide general plot
axgen = app.ExtUI.UPVRobotUIAxes;
cla(axgen,'reset')
axgen.Visible = 'off';

% Reset route plot
ax = app.ExtUI.UPVRobotUIAxesRoute;
cla(ax,'reset')
ax.Visible = 'off';

% Coords XY (unique)
coords = app.ExtVar.UPVRobot.MeasurePoints;

% Disable optimize button for 3D coords
if numel(unique(coords(:,1))) == 1 || numel(unique(coords(:,2))) == 1 || numel(unique(coords(:,3))) == 1
app.ExtUI.UPVRobotOptimizerouteButton.Enable = 'on';
else    
app.ExtUI.UPVRobotOptimizerouteButton.Enable = 'off';
end
drawnow

% SizeRobot
XLen = app.ExtVar.UPVRobot.XLen;
YLen = app.ExtVar.UPVRobot.YLen;
ZLen = app.ExtVar.UPVRobot.ZLen;

% Coords XY (unique)
coords = app.ExtVar.UPVRobot.MeasurePoints;
% [~,idx] = unique(coords,'row');
% coords = coords(sort(idx),:);

% Calculate actual travel distance
v = diff(coords);
distXYZ = sqrt(sum(v .^ 2,2)); % = sqrt( (x(i+1)-x(i))^2 + (y(i+1)-y(i))^2 ) ... Euclidian
travelDist = sum(distXYZ);

% Colors for gradient
colors = cool(size(coords,1));

% Route with gradient
pp = plot3(ax,coords(:,1),coords(:,2),coords(:,3),'linewidth',1.5);
cd = [uint8(colors*255) uint8(ones(size(coords,1),1))].';

hold(ax,'on')
% Start point
h(1) = scatter3(ax,coords(1,1),coords(1,2),coords(1,3),'o','MarkerEdgeColor','k','MarkerFaceColor',colors(1,:));
% End point
h(2) = scatter3(ax,coords(end,1),coords(end,2),coords(end,3),'o','MarkerEdgeColor','k','MarkerFaceColor',colors(end,:));
% Others points
scatter3(ax,coords(2:end-1,1),coords(2:end-1,2),coords(2:end-1,3),'kx','linewidth',1)

% Set axes
title(ax,sprintf('Travel distance: %.2f m',travelDist))
xlabel(ax,'X axis (m)')
ylabel(ax,'Y axis (m)')
axis(ax,'equal')
box(ax,'on')
grid(ax,'on')
grid(ax,'minor')
hold(ax,'off')
axis(ax,[0-0.01*XLen,XLen*1.01,0-0.01*YLen,YLen*1.01,0-0.01,ZLen*1.01])
leg = legend(h, 'Start route','End route','Location','northoutside');
leg.NumColumns = 2;
view(ax,app.ExtVar.UPVRobot.viewPos)
if (app.ExtVar.UPVRobot.viewPos(1) == 20 && app.ExtVar.UPVRobot.viewPos(2) == 20) ...
    || (app.ExtVar.UPVRobot.viewPos(1) == 0 && app.ExtVar.UPVRobot.viewPos(2) == 90)
    set(ax, 'Ydir', 'reverse')
end
UPVRobotRouteStylePlot(ax)
ax.Visible = 'on';
drawnow
% Set gradient
set(pp.Edge, 'ColorBinding','interpolated', 'ColorData',cd)
rotate3d(ax,'on')

function UPVRobotRouteStylePlot(ax)

% Style
% Params
Black = [0 0 0];
lwidth = 0.5;
fsize = 12;
font = 'Arial';
type = 'Latex';
% Axes linewidth
set(ax,'linewidth',lwidth);
% Text properties
ht=findobj(ax,'type','text'); % Get all text
set(ht,'fontname',font,'fontsize',fsize,'color',Black,'interpreter',type);
set(ax,'fontname',font,'fontsize',fsize)
set(ax,'XMinorTick','on','YMinorTick','on','ZMinorTick','on','TickLabelInterpreter',type)
% Axis labels
set([ax.XLabel ax.YLabel ax.ZLabel],...
    'fontname',font,'fontsize',fsize,'color',Black,'interpreter',type);
% Title
set(ax.Title,'fontname',font,'fontsize',fsize,'color',Black,'interpreter',type);
% Legend General
set(ax.Legend,'fontname',font,'fontsize',fsize,'interpreter',type); % Text
set(ax.Legend,'Color',[1,1,1],'EdgeColor',[0.4 0.6 0.7],'LineWidth',1.5) % Box

function UPVRobotXYpushed(~,~,app)
axroute = app.ExtUI.UPVRobotUIAxesRoute;
cla(axroute,'reset')
axroute.Visible = 'off';
if isempty(app.ExtUI.UPVRobotUIAxes.Children)
    UPVRobotGenerateMeasurementPoints(app)
end
app.ExtUI.UPVRobotUIAxes.Visible = 'on';
app.ExtVar.UPVRobot.viewPos = [0,90];
view(app.ExtUI.UPVRobotUIAxes,app.ExtVar.UPVRobot.viewPos)
set(app.ExtUI.UPVRobotUIAxes, 'Ydir', 'reverse')

function UPVRobotXZpushed(~,~,app)
axroute = app.ExtUI.UPVRobotUIAxesRoute;
cla(axroute,'reset')
axroute.Visible = 'off';
if isempty(app.ExtUI.UPVRobotUIAxes.Children)
    UPVRobotGenerateMeasurementPoints(app)
end
app.ExtUI.UPVRobotUIAxes.Visible = 'on';
app.ExtVar.UPVRobot.viewPos = [0,0];
view(app.ExtUI.UPVRobotUIAxes,app.ExtVar.UPVRobot.viewPos)

function UPVRobotYZpushed(~,~,app)
axroute = app.ExtUI.UPVRobotUIAxesRoute;
cla(axroute,'reset')
axroute.Visible = 'off';
if isempty(app.ExtUI.UPVRobotUIAxes.Children)
    UPVRobotGenerateMeasurementPoints(app)
end
app.ExtUI.UPVRobotUIAxes.Visible = 'on';
app.ExtVar.UPVRobot.viewPos = [90,0];
view(app.ExtUI.UPVRobotUIAxes,app.ExtVar.UPVRobot.viewPos)

function UPVRobot3Dpushed(~,~,app)
axroute = app.ExtUI.UPVRobotUIAxesRoute;
cla(axroute,'reset')
axroute.Visible = 'off';
if isempty(app.ExtUI.UPVRobotUIAxes.Children)
    UPVRobotGenerateMeasurementPoints(app)
end
app.ExtUI.UPVRobotUIAxes.Visible = 'on';
app.ExtVar.UPVRobot.viewPos = [20,20];
view(app.ExtUI.UPVRobotUIAxes,20,20)
set(app.ExtUI.UPVRobotUIAxes, 'Ydir', 'reverse')

function UPVRobotParameterRestrictChanged(~,~,app)
app.ExtVar.UPVRobot.XNaNOri = app.ExtUI.UPVRobotOriginXEditFieldRestrict.Value;
app.ExtVar.UPVRobot.XNaNEnd = app.ExtUI.UPVRobotEndXEditFieldRestrict.Value;
app.ExtVar.UPVRobot.YNaNOri = app.ExtUI.UPVRobotOriginYEditFieldRestrict.Value;
app.ExtVar.UPVRobot.YNaNEnd = app.ExtUI.UPVRobotEndYEditFieldRestrict.Value;
app.ExtVar.UPVRobot.ZNaNOri = app.ExtUI.UPVRobotOriginZEditFieldRestrict.Value;
app.ExtVar.UPVRobot.ZNaNEnd = app.ExtUI.UPVRobotEndZEditFieldRestrict.Value;
% % Logics
% % X
% if app.ExtUI.UPVRobotPointsXEditField.Value==1
%     app.ExtUI.UPVRobotEndXEditFieldRestrict.Enable = 'off';
%     app.ExtUI.UPVRobotOriginXEditFieldRestrict.Enable = 'off';
%     app.ExtUI.UPVRobotOriginXEditFieldRestrict.Value = 0;
%     app.ExtUI.UPVRobotEndXEditFieldRestrict.Value = app.ExtVar.UPVRobot.XLen;
%     app.ExtVar.UPVRobot.XNaNOri = 0;
%     app.ExtVar.UPVRobot.XNaNEnd = app.ExtVar.UPVRobot.XLen;
% else
%     app.ExtUI.UPVRobotEndXEditFieldRestrict.Enable = 'on';
%     app.ExtUI.UPVRobotOriginXEditFieldRestrict.Enable = 'on';
% end
% % Y
% if app.ExtUI.UPVRobotPointsYEditField.Value==1
%     app.ExtUI.UPVRobotEndYEditFieldRestrict.Enable = 'off';
%     app.ExtUI.UPVRobotOriginYEditFieldRestrict.Enable = 'off';
%     app.ExtUI.UPVRobotOriginYEditFieldRestrict.Value = 0;
%     app.ExtUI.UPVRobotEndYEditFieldRestrict.Value = app.ExtVar.UPVRobot.YLen;
%     app.ExtVar.UPVRobot.YNaNOri = 0;
%     app.ExtVar.UPVRobot.YNaNEnd = app.ExtVar.UPVRobot.YLen;
% else
%     app.ExtUI.UPVRobotEndYEditFieldRestrict.Enable = 'on';
%     app.ExtUI.UPVRobotOriginYEditFieldRestrict.Enable = 'on';
% end
% % Z
% if app.ExtUI.UPVRobotPointsZEditField.Value==1
%     app.ExtUI.UPVRobotEndZEditFieldRestrict.Enable = 'off';
%     app.ExtUI.UPVRobotOriginZEditFieldRestrict.Enable = 'off';
%     app.ExtUI.UPVRobotOriginZEditFieldRestrict.Value = 0;
%     app.ExtUI.UPVRobotEndZEditFieldRestrict.Value = app.ExtVar.UPVRobot.ZLen;
%     app.ExtVar.UPVRobot.ZNaNOri = 0;
%     app.ExtVar.UPVRobot.ZNaNEnd = app.ExtVar.UPVRobot.ZLen;
% else
%     app.ExtUI.UPVRobotEndZEditFieldRestrict.Enable = 'on';
%     app.ExtUI.UPVRobotOriginZEditFieldRestrict.Enable = 'on';
% end
% Plot
UPVRobotGenerateMeasurementPoints(app)


function UPVRobotRestrictChanged(~,~,app)
app.ExtVar.UPVRobot.Restricted = app.ExtUI.UPVRobotRestrictCheckBox.Value;
if app.ExtUI.UPVRobotRestrictCheckBox.Value == 0
    app.ExtUI.UPVRobotEndXEditFieldRestrict.Enable = 'off';
    app.ExtUI.UPVRobotOriginXEditFieldRestrict.Enable = 'off';
    app.ExtUI.UPVRobotEndYEditFieldRestrict.Enable = 'off';
    app.ExtUI.UPVRobotOriginYEditFieldRestrict.Enable = 'off';
    app.ExtUI.UPVRobotEndZEditFieldRestrict.Enable = 'off';
    app.ExtUI.UPVRobotOriginZEditFieldRestrict.Enable = 'off';
else
    app.ExtUI.UPVRobotEndXEditFieldRestrict.Enable = 'on';
    app.ExtUI.UPVRobotOriginXEditFieldRestrict.Enable = 'on';
    
    app.ExtUI.UPVRobotEndYEditFieldRestrict.Enable = 'on';
    app.ExtUI.UPVRobotOriginYEditFieldRestrict.Enable = 'on';
    
    app.ExtUI.UPVRobotEndZEditFieldRestrict.Enable = 'on';
    app.ExtUI.UPVRobotOriginZEditFieldRestrict.Enable = 'on';
    
end
UPVRobotGenerateMeasurementPoints(app)

function pauseUPVRobotcallback(~,~,app)
if app.ExtVar.UPVRobot.Pause == 0
    app.ExtVar.UPVRobot.Pause = 1;
else
    app.ExtVar.UPVRobot.Pause = 0;
end

function stopUPVRobotcallback(~,~,app)
if app.ExtVar.UPVRobot.Stop == 0
    app.ExtVar.UPVRobot.Stop = 1;
    UPVRobotUIDisableMeasuring(app,1)
else
    app.ExtVar.UPVRobot.Stop = 0;
end