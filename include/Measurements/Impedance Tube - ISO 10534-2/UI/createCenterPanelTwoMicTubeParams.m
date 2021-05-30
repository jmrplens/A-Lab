function createCenterPanelTwoMicTubeParams(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Grid
column = centerGrid(app,{'1x'},{'1x'});

% Create CenterMainPanelTwoMicTubeParams
app.ExtUI.CenterMainPanelTwoMicTubeParams = uipanel(column);
app.ExtUI.CenterMainPanelTwoMicTubeParams.TitlePosition = 'centertop';
app.ExtUI.CenterMainPanelTwoMicTubeParams.Title = 'Tube parameters';
app.ExtUI.CenterMainPanelTwoMicTubeParams.BackgroundColor = [1 1 1];
app.ExtUI.CenterMainPanelTwoMicTubeParams.Layout.Row = 1;
app.ExtUI.CenterMainPanelTwoMicTubeParams.Layout.Column = 1;
app.ExtUI.CenterMainPanelTwoMicTubeParams.FontAngle = 'italic';

% Create GridCenterPanelTwoMicTubeParams
app.ExtUI.GridCenterPanelTwoMicTubeParams = uigridlayout(app.ExtUI.CenterMainPanelTwoMicTubeParams);
app.ExtUI.GridCenterPanelTwoMicTubeParams.ColumnWidth = {'1x', '1x', '1x'};
app.ExtUI.GridCenterPanelTwoMicTubeParams.RowHeight = {'fit', 'fit', 'fit', 'fit'};
app.ExtUI.GridCenterPanelTwoMicTubeParams.BackgroundColor = [1 1 1];

% Create TwoMicTubeParamsAxes
app.ExtUI.TwoMicTubeParamsAxes = uiaxes(app.ExtUI.GridCenterPanelTwoMicTubeParams);
app.ExtUI.TwoMicTubeParamsAxes.Layout.Row = 3;
app.ExtUI.TwoMicTubeParamsAxes.Layout.Column = [1 3];

% Create TwoMicTubeParamsInfo
app.ExtUI.TwoMicTubeParamsInfo = uilabel(app.ExtUI.GridCenterPanelTwoMicTubeParams);
app.ExtUI.TwoMicTubeParamsInfo.HorizontalAlignment = 'center';
app.ExtUI.TwoMicTubeParamsInfo.WordWrap = 'on';
app.ExtUI.TwoMicTubeParamsInfo.Layout.Row = 1;
app.ExtUI.TwoMicTubeParamsInfo.Layout.Column = [1 3];
app.ExtUI.TwoMicTubeParamsInfo.Text = 'Enter the tube and sample parameters. The graph updates automatically.';

% Create TwoMicTubeParamsTubeshapePanel
app.ExtUI.TwoMicTubeParamsTubeshapePanel = uipanel(app.ExtUI.GridCenterPanelTwoMicTubeParams);
app.ExtUI.TwoMicTubeParamsTubeshapePanel.TitlePosition = 'centertop';
app.ExtUI.TwoMicTubeParamsTubeshapePanel.Title = 'Tube shape';
app.ExtUI.TwoMicTubeParamsTubeshapePanel.BackgroundColor = [0.9412 0.9412 0.9412];
app.ExtUI.TwoMicTubeParamsTubeshapePanel.Layout.Row = 2;
app.ExtUI.TwoMicTubeParamsTubeshapePanel.Layout.Column = [1 3];
app.ExtUI.TwoMicTubeParamsTubeshapePanel.FontWeight = 'bold';

% Create TwoMicTubeParamsTubeShapeGrid
app.ExtUI.TwoMicTubeParamsTubeShapeGrid = uigridlayout(app.ExtUI.TwoMicTubeParamsTubeshapePanel);
app.ExtUI.TwoMicTubeParamsTubeShapeGrid.ColumnWidth = {'1x', 'fit', 'fit', '1x'};
app.ExtUI.TwoMicTubeParamsTubeShapeGrid.RowHeight = {'fit'};
app.ExtUI.TwoMicTubeParamsTubeShapeGrid.BackgroundColor = [1 1 1];

% Create TwoMicTubeParamsCircularCheckBox
app.ExtUI.TwoMicTubeParamsCircularCheckBox = uicheckbox(app.ExtUI.TwoMicTubeParamsTubeShapeGrid);
app.ExtUI.TwoMicTubeParamsCircularCheckBox.Text = 'Circular';
app.ExtUI.TwoMicTubeParamsCircularCheckBox.Layout.Row = 1;
app.ExtUI.TwoMicTubeParamsCircularCheckBox.Layout.Column = 2;
app.ExtUI.TwoMicTubeParamsCircularCheckBox.ValueChangedFcn = {@TwoMicTubeCircularParameterChanged,app};
app.ExtUI.TwoMicTubeParamsCircularCheckBox.Value = 1;

% Create TwoMicTubeParamsSquareCheckBox
app.ExtUI.TwoMicTubeParamsSquareCheckBox = uicheckbox(app.ExtUI.TwoMicTubeParamsTubeShapeGrid);
app.ExtUI.TwoMicTubeParamsSquareCheckBox.Text = 'Square';
app.ExtUI.TwoMicTubeParamsSquareCheckBox.Layout.Row = 1;
app.ExtUI.TwoMicTubeParamsSquareCheckBox.Layout.Column = 3;
app.ExtUI.TwoMicTubeParamsSquareCheckBox.ValueChangedFcn = {@TwoMicTubeSquareParameterChanged,app};
app.ExtUI.TwoMicTubeParamsSquareCheckBox.Value = 0;

if isempty(app.ExtVar.ImpedanceTubeTwoMic.Shape)
    app.ExtVar.ImpedanceTubeTwoMic.Shape = 'Circular';
else
    if strcmp(app.ExtVar.ImpedanceTubeTwoMic.Shape,'Circular')
        app.ExtUI.TwoMicTubeParamsCircularCheckBox.Value = true;
        app.ExtUI.TwoMicTubeParamsSquareCheckBox.Value = false;
    elseif strcmp(app.ExtVar.ImpedanceTubeTwoMic.Shape,'Square')
        app.ExtUI.TwoMicTubeParamsCircularCheckBox.Value = false;
        app.ExtUI.TwoMicTubeParamsSquareCheckBox.Value = true;
    end
end

% Create TwoMicTubeParamsUpstreamPanel
app.ExtUI.TwoMicTubeParamsUpstreamPanel = uipanel(app.ExtUI.GridCenterPanelTwoMicTubeParams);
app.ExtUI.TwoMicTubeParamsUpstreamPanel.ForegroundColor = [1 1 1];
app.ExtUI.TwoMicTubeParamsUpstreamPanel.TitlePosition = 'centertop';
app.ExtUI.TwoMicTubeParamsUpstreamPanel.Title = 'Dist. between mics';
app.ExtUI.TwoMicTubeParamsUpstreamPanel.BackgroundColor = [0.851 0.3255 0.098];
app.ExtUI.TwoMicTubeParamsUpstreamPanel.Layout.Row = 4;
app.ExtUI.TwoMicTubeParamsUpstreamPanel.Layout.Column = 1;
app.ExtUI.TwoMicTubeParamsUpstreamPanel.FontWeight = 'bold';

% Create TwoMicTubeParamsUpstreamGrid
app.ExtUI.TwoMicTubeParamsUpstreamGrid = uigridlayout(app.ExtUI.TwoMicTubeParamsUpstreamPanel);
app.ExtUI.TwoMicTubeParamsUpstreamGrid.RowHeight = {'fit'};
app.ExtUI.TwoMicTubeParamsUpstreamGrid.BackgroundColor = [1 1 1];

% Create mathbfsmLabel
app.ExtUI.mathbfsmLabel = uilabel(app.ExtUI.TwoMicTubeParamsUpstreamGrid);
app.ExtUI.mathbfsmLabel.Interpreter = 'latex';
app.ExtUI.mathbfsmLabel.HorizontalAlignment = 'right';
app.ExtUI.mathbfsmLabel.Layout.Row = 1;
app.ExtUI.mathbfsmLabel.Layout.Column = 1;
app.ExtUI.mathbfsmLabel.Text = '$\mathbf{s}$ (m)';

% Create TwoMicTubeParam_s
app.ExtUI.TwoMicTubeParam_s = uieditfield(app.ExtUI.TwoMicTubeParamsUpstreamGrid, 'numeric');
app.ExtUI.TwoMicTubeParam_s.LowerLimitInclusive = 'off';
app.ExtUI.TwoMicTubeParam_s.Limits = [0 Inf];
app.ExtUI.TwoMicTubeParam_s.Layout.Row = 1;
app.ExtUI.TwoMicTubeParam_s.Layout.Column = 2;
app.ExtUI.TwoMicTubeParam_s.Value = 0.1;
app.ExtUI.TwoMicTubeParam_s.ValueChangedFcn = {@twomictubeparamchanged,app};
if isempty(app.ExtVar.ImpedanceTubeTwoMic.s)
    app.ExtVar.ImpedanceTubeTwoMic.s = app.ExtUI.TwoMicTubeParam_s.Value;
else
    app.ExtUI.TwoMicTubeParam_s.Value = app.ExtVar.ImpedanceTubeTwoMic.s;
end

% Create TwoMicTubeParamsSampleandtubePanel
app.ExtUI.TwoMicTubeParamsSampleandtubePanel = uipanel(app.ExtUI.GridCenterPanelTwoMicTubeParams);
app.ExtUI.TwoMicTubeParamsSampleandtubePanel.ForegroundColor = [1 1 1];
app.ExtUI.TwoMicTubeParamsSampleandtubePanel.TitlePosition = 'centertop';
app.ExtUI.TwoMicTubeParamsSampleandtubePanel.Title = 'Dist. mic 1 to sample';
app.ExtUI.TwoMicTubeParamsSampleandtubePanel.BackgroundColor = [0.9294 0.6941 0.1255];
app.ExtUI.TwoMicTubeParamsSampleandtubePanel.Layout.Row = 4;
app.ExtUI.TwoMicTubeParamsSampleandtubePanel.Layout.Column = 2;
app.ExtUI.TwoMicTubeParamsSampleandtubePanel.FontWeight = 'bold';

% Create TwoMicTubeParamsSampleandtubeGrid
app.ExtUI.TwoMicTubeParamsSampleandtubeGrid = uigridlayout(app.ExtUI.TwoMicTubeParamsSampleandtubePanel);
app.ExtUI.TwoMicTubeParamsSampleandtubeGrid.RowHeight = {'fit'};
app.ExtUI.TwoMicTubeParamsSampleandtubeGrid.BackgroundColor = [1 1 1];

% Create mathbfx_1mLabel
app.ExtUI.mathbfx_1mLabel = uilabel(app.ExtUI.TwoMicTubeParamsSampleandtubeGrid);
app.ExtUI.mathbfx_1mLabel.Interpreter = 'latex';
app.ExtUI.mathbfx_1mLabel.HorizontalAlignment = 'right';
app.ExtUI.mathbfx_1mLabel.Layout.Row = 1;
app.ExtUI.mathbfx_1mLabel.Layout.Column = 1;
app.ExtUI.mathbfx_1mLabel.Text = '$\mathbf{x_1}$ (m)';

% Create TwoMicTubeParam_x1
app.ExtUI.TwoMicTubeParam_x1 = uieditfield(app.ExtUI.TwoMicTubeParamsSampleandtubeGrid, 'numeric');
app.ExtUI.TwoMicTubeParam_x1.LowerLimitInclusive = 'off';
app.ExtUI.TwoMicTubeParam_x1.Limits = [0 Inf];
app.ExtUI.TwoMicTubeParam_x1.Layout.Row = 1;
app.ExtUI.TwoMicTubeParam_x1.Layout.Column = 2;
app.ExtUI.TwoMicTubeParam_x1.Value = 0.2;
app.ExtUI.TwoMicTubeParam_x1.ValueChangedFcn = {@twomictubeparamchanged,app};
if isempty(app.ExtVar.ImpedanceTubeTwoMic.x1)
    app.ExtVar.ImpedanceTubeTwoMic.x1 = app.ExtUI.TwoMicTubeParam_x1.Value;
else
    app.ExtUI.TwoMicTubeParam_x1.Value = app.ExtVar.ImpedanceTubeTwoMic.x1;
end

% Create TwoMicTubeParamsDownstreamPanel
app.ExtUI.TwoMicTubeParamsDownstreamPanel = uipanel(app.ExtUI.GridCenterPanelTwoMicTubeParams);
app.ExtUI.TwoMicTubeParamsDownstreamPanel.ForegroundColor = [1 1 1];
app.ExtUI.TwoMicTubeParamsDownstreamPanel.TitlePosition = 'centertop';
app.ExtUI.TwoMicTubeParamsDownstreamPanel.Title = 'Tube size/diameter';
app.ExtUI.TwoMicTubeParamsDownstreamPanel.BackgroundColor = [0.4667 0.6745 0.1882];
app.ExtUI.TwoMicTubeParamsDownstreamPanel.Layout.Row = 4;
app.ExtUI.TwoMicTubeParamsDownstreamPanel.Layout.Column = 3;
app.ExtUI.TwoMicTubeParamsDownstreamPanel.FontWeight = 'bold';

% Create TwoMicTubeParamsDownstreamGrid
app.ExtUI.TwoMicTubeParamsDownstreamGrid = uigridlayout(app.ExtUI.TwoMicTubeParamsDownstreamPanel);
app.ExtUI.TwoMicTubeParamsDownstreamGrid.RowHeight = {'fit'};
app.ExtUI.TwoMicTubeParamsDownstreamGrid.BackgroundColor = [1 1 1];

% Create mathbfdmLabel
app.ExtUI.mathbfdmLabel = uilabel(app.ExtUI.TwoMicTubeParamsDownstreamGrid);
app.ExtUI.mathbfdmLabel.Interpreter = 'latex';
app.ExtUI.mathbfdmLabel.HorizontalAlignment = 'right';
app.ExtUI.mathbfdmLabel.Layout.Row = 1;
app.ExtUI.mathbfdmLabel.Layout.Column = 1;
app.ExtUI.mathbfdmLabel.Text = '$\mathbf{d}$ (m)';

% Create TwoMicTubeParam_d
app.ExtUI.TwoMicTubeParam_d = uieditfield(app.ExtUI.TwoMicTubeParamsDownstreamGrid, 'numeric');
app.ExtUI.TwoMicTubeParam_d.LowerLimitInclusive = 'off';
app.ExtUI.TwoMicTubeParam_d.Limits = [0 Inf];
app.ExtUI.TwoMicTubeParam_d.Layout.Row = 1;
app.ExtUI.TwoMicTubeParam_d.Layout.Column = 2;
app.ExtUI.TwoMicTubeParam_d.Value = 0.1;
app.ExtUI.TwoMicTubeParam_d.ValueChangedFcn = {@twomictubeparamchanged,app};
if isempty(app.ExtVar.ImpedanceTubeTwoMic.d)
    app.ExtVar.ImpedanceTubeTwoMic.d = app.ExtUI.TwoMicTubeParam_d.Value;
else
    app.ExtUI.TwoMicTubeParam_d.Value = app.ExtVar.ImpedanceTubeTwoMic.d;
end

plotTubeTwoMicISO10534(app,app.ExtUI.TwoMicTubeParamsAxes,{'Mic';'1'},{'Mic';'2'},'Sample',1,1,[])
drawnow

function twomictubeparamchanged(~,~,app)
app.ExtVar.ImpedanceTubeTwoMic.d = app.ExtUI.TwoMicTubeParam_d.Value;
app.ExtVar.ImpedanceTubeTwoMic.x1 = app.ExtUI.TwoMicTubeParam_x1.Value;
app.ExtVar.ImpedanceTubeTwoMic.s = app.ExtUI.TwoMicTubeParam_s.Value;
plotTubeTwoMicISO10534(app,app.ExtUI.TwoMicTubeParamsAxes,{'Mic';'1'},{'Mic';'2'},'Sample',1,1,[])

% Frequency limits (ISO 10534)
[freqMin,freqMax] = TwoMicCalculateTubeLimits(app);
app.ExtUI.PanelTubeTwoMicRightInfoLFreqlabel.Text = sprintf('%.1f Hz',freqMin);
app.ExtUI.PanelTubeTwoMicRightInfoUFreqlabel.Text = sprintf('%.1f Hz',freqMax);

function TwoMicTubeCircularParameterChanged(~,~,app)
if app.ExtUI.TwoMicTubeParamsCircularCheckBox.Value
    app.ExtUI.TwoMicTubeParamsSquareCheckBox.Value = false;
    app.ExtVar.ImpedanceTubeTwoMic.Shape = 'Circular';
    % Calculations
    [~,freqMax] = TwoMicCalculateTubeLimits(app);
    app.ExtUI.PanelTubeTwoMicRightInfoUFreqlabel.Text = sprintf('%.1f Hz',freqMax);
    
end

function TwoMicTubeSquareParameterChanged(~,~,app)
if app.ExtUI.TwoMicTubeParamsSquareCheckBox.Value
    app.ExtUI.TwoMicTubeParamsCircularCheckBox.Value = false;
    app.ExtVar.ImpedanceTubeTwoMic.Shape = 'Square';
    % Calculations
    [~,freqMax] = TwoMicCalculateTubeLimits(app);
    app.ExtUI.PanelTubeTwoMicRightInfoUFreqlabel.Text = sprintf('%.1f Hz',freqMax);
end