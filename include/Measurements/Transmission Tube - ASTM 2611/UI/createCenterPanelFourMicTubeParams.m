function createCenterPanelFourMicTubeParams(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Grid
column = centerGrid(app,{'1x'},{'1x'});

% Create CenterMainPanelFourMicTubeParams
app.ExtUI.CenterMainPanelFourMicTubeParams = uipanel(column);
app.ExtUI.CenterMainPanelFourMicTubeParams.TitlePosition = 'centertop';
app.ExtUI.CenterMainPanelFourMicTubeParams.Title = 'Tube parameters';
app.ExtUI.CenterMainPanelFourMicTubeParams.BackgroundColor = [1 1 1];
app.ExtUI.CenterMainPanelFourMicTubeParams.Layout.Row = 1;
app.ExtUI.CenterMainPanelFourMicTubeParams.Layout.Column = 1;
app.ExtUI.CenterMainPanelFourMicTubeParams.FontAngle = 'italic';

% Create GridCenterPanelFourMicTubeParams
app.ExtUI.GridCenterPanelFourMicTubeParams = uigridlayout(app.ExtUI.CenterMainPanelFourMicTubeParams);
app.ExtUI.GridCenterPanelFourMicTubeParams.ColumnWidth = {'1x', '1x', '1x'};
app.ExtUI.GridCenterPanelFourMicTubeParams.RowHeight = {'fit', 'fit','1x', 'fit','1x'};
app.ExtUI.GridCenterPanelFourMicTubeParams.BackgroundColor = [1 1 1];

% Create FourMicTubeParamsInfo
app.ExtUI.FourMicTubeParamsInfo = uilabel(app.ExtUI.GridCenterPanelFourMicTubeParams);
app.ExtUI.FourMicTubeParamsInfo.HorizontalAlignment = 'center';
app.ExtUI.FourMicTubeParamsInfo.WordWrap = 'on';
app.ExtUI.FourMicTubeParamsInfo.Layout.Row = 1;
app.ExtUI.FourMicTubeParamsInfo.Layout.Column = [1 3];
app.ExtUI.FourMicTubeParamsInfo.Text = 'Enter the tube and sample parameters. The graph updates automatically.';

% Create FourMicTubeParamsTubeshapePanel
app.ExtUI.FourMicTubeParamsTubeshapePanel = uipanel(app.ExtUI.GridCenterPanelFourMicTubeParams);
app.ExtUI.FourMicTubeParamsTubeshapePanel.TitlePosition = 'centertop';
app.ExtUI.FourMicTubeParamsTubeshapePanel.Title = 'Tube shape';
app.ExtUI.FourMicTubeParamsTubeshapePanel.BackgroundColor = [0.9412 0.9412 0.9412];
app.ExtUI.FourMicTubeParamsTubeshapePanel.Layout.Row = 2;
app.ExtUI.FourMicTubeParamsTubeshapePanel.Layout.Column = [1 3];
app.ExtUI.FourMicTubeParamsTubeshapePanel.FontWeight = 'bold';

% Create FourMicTubeParamsTubeShapeGrid
app.ExtUI.FourMicTubeParamsTubeShapeGrid = uigridlayout(app.ExtUI.FourMicTubeParamsTubeshapePanel);
app.ExtUI.FourMicTubeParamsTubeShapeGrid.ColumnWidth = {'1x', 'fit', 'fit', '1x'};
app.ExtUI.FourMicTubeParamsTubeShapeGrid.RowHeight = {'fit'};
app.ExtUI.FourMicTubeParamsTubeShapeGrid.BackgroundColor = [1 1 1];

% Create FourMicTubeParamsCircularCheckBox
app.ExtUI.FourMicTubeParamsCircularCheckBox = uicheckbox(app.ExtUI.FourMicTubeParamsTubeShapeGrid);
app.ExtUI.FourMicTubeParamsCircularCheckBox.Text = 'Circular';
app.ExtUI.FourMicTubeParamsCircularCheckBox.Layout.Row = 1;
app.ExtUI.FourMicTubeParamsCircularCheckBox.Value = true;
app.ExtUI.FourMicTubeParamsCircularCheckBox.Layout.Column = 2;
app.ExtUI.FourMicTubeParamsCircularCheckBox.ValueChangedFcn = {@FourMicTubeCircularParameterChanged,app};

% Create FourMicTubeParamsSquareCheckBox
app.ExtUI.FourMicTubeParamsSquareCheckBox = uicheckbox(app.ExtUI.FourMicTubeParamsTubeShapeGrid);
app.ExtUI.FourMicTubeParamsSquareCheckBox.Text = 'Square';
app.ExtUI.FourMicTubeParamsSquareCheckBox.Layout.Row = 1;
app.ExtUI.FourMicTubeParamsSquareCheckBox.Value = false;
app.ExtUI.FourMicTubeParamsSquareCheckBox.Layout.Column = 3;
app.ExtUI.FourMicTubeParamsSquareCheckBox.ValueChangedFcn = {@FourMicTubeSquareParameterChanged,app};

if isempty(app.ExtVar.ImpedanceTubeFourMic.Shape)
    app.ExtVar.ImpedanceTubeFourMic.Shape = 'Circular';
else
    if strcmp(app.ExtVar.ImpedanceTubeFourMic.Shape,'Circular')
        app.ExtUI.FourMicTubeParamsCircularCheckBox.Value = true;
        app.ExtUI.FourMicTubeParamsSquareCheckBox.Value = false;
    elseif strcmp(app.ExtVar.ImpedanceTubeFourMic.Shape,'Square')
        app.ExtUI.FourMicTubeParamsCircularCheckBox.Value = false;
        app.ExtUI.FourMicTubeParamsSquareCheckBox.Value = true;
    end
end

% Create FourMicTubeParamsUpstreamPanel
app.ExtUI.FourMicTubeParamsUpstreamPanel = uipanel(app.ExtUI.GridCenterPanelFourMicTubeParams);
app.ExtUI.FourMicTubeParamsUpstreamPanel.ForegroundColor = [1 1 1];
app.ExtUI.FourMicTubeParamsUpstreamPanel.TitlePosition = 'centertop';
app.ExtUI.FourMicTubeParamsUpstreamPanel.Title = 'Upstream';
app.ExtUI.FourMicTubeParamsUpstreamPanel.BackgroundColor = [0.851 0.3255 0.098]-0.06;
app.ExtUI.FourMicTubeParamsUpstreamPanel.Layout.Row = 4;
app.ExtUI.FourMicTubeParamsUpstreamPanel.Layout.Column = 1;
app.ExtUI.FourMicTubeParamsUpstreamPanel.FontWeight = 'bold';

% Create FourMicTubeParamsUpstreamGrid
app.ExtUI.FourMicTubeParamsUpstreamGrid = uigridlayout(app.ExtUI.FourMicTubeParamsUpstreamPanel);
app.ExtUI.FourMicTubeParamsUpstreamGrid.BackgroundColor = [1 1 1];

% Create l_1mEditFieldLabel
app.ExtUI.l_1mEditFieldLabel = uilabel(app.ExtUI.FourMicTubeParamsUpstreamGrid);
app.ExtUI.l_1mEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.l_1mEditFieldLabel.FontWeight = 'bold';
app.ExtUI.l_1mEditFieldLabel.Layout.Row = 1;
app.ExtUI.l_1mEditFieldLabel.Layout.Column = 1;
app.ExtUI.l_1mEditFieldLabel.Text = ['l',char(8321),' (m)'];

% Create FourMicTubeParam_l1
app.ExtUI.FourMicTubeParam_l1 = uieditfield(app.ExtUI.FourMicTubeParamsUpstreamGrid, 'numeric');
app.ExtUI.FourMicTubeParam_l1.Limits = [0.001 Inf];
app.ExtUI.FourMicTubeParam_l1.Layout.Row = 1;
app.ExtUI.FourMicTubeParam_l1.Layout.Column = 2;
app.ExtUI.FourMicTubeParam_l1.Value = 0.2;
app.ExtUI.FourMicTubeParam_l1.ValueChangedFcn = {@fourmictubeparamchanged,app};
if isempty(app.ExtVar.ImpedanceTubeFourMic.l1)
    app.ExtVar.ImpedanceTubeFourMic.l1 = app.ExtUI.FourMicTubeParam_l1.Value;
else
    app.ExtUI.FourMicTubeParam_l1.Value = app.ExtVar.ImpedanceTubeFourMic.l1;
end

% Create s_1mEditFieldLabel
app.ExtUI.s_1mEditFieldLabel = uilabel(app.ExtUI.FourMicTubeParamsUpstreamGrid);
app.ExtUI.s_1mEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.s_1mEditFieldLabel.FontWeight = 'bold';
app.ExtUI.s_1mEditFieldLabel.Layout.Row = 2;
app.ExtUI.s_1mEditFieldLabel.Layout.Column = 1;
app.ExtUI.s_1mEditFieldLabel.Text = ['s',char(8321),' (m)'];

% Create FourMicTubeParam_s1
app.ExtUI.FourMicTubeParam_s1 = uieditfield(app.ExtUI.FourMicTubeParamsUpstreamGrid, 'numeric');
app.ExtUI.FourMicTubeParam_s1.Limits = [0.001 Inf];
app.ExtUI.FourMicTubeParam_s1.Layout.Row = 2;
app.ExtUI.FourMicTubeParam_s1.Layout.Column = 2;
app.ExtUI.FourMicTubeParam_s1.Value = 0.1;
app.ExtUI.FourMicTubeParam_s1.ValueChangedFcn = {@fourmictubeparamchanged,app};
if isempty(app.ExtVar.ImpedanceTubeFourMic.s1)
    app.ExtVar.ImpedanceTubeFourMic.s1 = app.ExtUI.FourMicTubeParam_s1.Value;
else
    app.ExtUI.FourMicTubeParam_s1.Value = app.ExtVar.ImpedanceTubeFourMic.s1;
end

% Create FourMicTubeParamsSampleandtubePanel
app.ExtUI.FourMicTubeParamsSampleandtubePanel = uipanel(app.ExtUI.GridCenterPanelFourMicTubeParams);
app.ExtUI.FourMicTubeParamsSampleandtubePanel.ForegroundColor = [1 1 1];
app.ExtUI.FourMicTubeParamsSampleandtubePanel.TitlePosition = 'centertop';
app.ExtUI.FourMicTubeParamsSampleandtubePanel.Title = 'Sample and tube';
app.ExtUI.FourMicTubeParamsSampleandtubePanel.BackgroundColor = [0.7255,0.5765,0.3529]-0.25;%[0.9294 0.6941 0.1255];
app.ExtUI.FourMicTubeParamsSampleandtubePanel.Layout.Row = 4;
app.ExtUI.FourMicTubeParamsSampleandtubePanel.Layout.Column = 2;
app.ExtUI.FourMicTubeParamsSampleandtubePanel.FontWeight = 'bold';

% Create FourMicTubeParamsSampleandtubeGrid
app.ExtUI.FourMicTubeParamsSampleandtubeGrid = uigridlayout(app.ExtUI.FourMicTubeParamsSampleandtubePanel);
app.ExtUI.FourMicTubeParamsSampleandtubeGrid.BackgroundColor = [1 1 1];

% Create dmEditFieldLabel
app.ExtUI.dmEditFieldLabel = uilabel(app.ExtUI.FourMicTubeParamsSampleandtubeGrid);
app.ExtUI.dmEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.dmEditFieldLabel.FontWeight = 'bold';
app.ExtUI.dmEditFieldLabel.Layout.Row = 1;
app.ExtUI.dmEditFieldLabel.Layout.Column = 1;
app.ExtUI.dmEditFieldLabel.Text = 'd (m)';

% Create FourMicTubeParam_d
app.ExtUI.FourMicTubeParam_d = uieditfield(app.ExtUI.FourMicTubeParamsSampleandtubeGrid, 'numeric');
app.ExtUI.FourMicTubeParam_d.Limits = [0.001 Inf];
app.ExtUI.FourMicTubeParam_d.Layout.Row = 1;
app.ExtUI.FourMicTubeParam_d.Layout.Column = 2;
app.ExtUI.FourMicTubeParam_d.Value = 0.1;
app.ExtUI.FourMicTubeParam_d.ValueChangedFcn = {@fourmictubeparamchanged,app};
if isempty(app.ExtVar.ImpedanceTubeFourMic.d)
    app.ExtVar.ImpedanceTubeFourMic.d = app.ExtUI.FourMicTubeParam_d.Value;
else
    app.ExtUI.FourMicTubeParam_d.Value = app.ExtVar.ImpedanceTubeFourMic.d;
end

% Create d_tmEditFieldLabel
app.ExtUI.d_tmEditFieldLabel = uilabel(app.ExtUI.FourMicTubeParamsSampleandtubeGrid);
app.ExtUI.d_tmEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.d_tmEditFieldLabel.FontWeight = 'bold';
app.ExtUI.d_tmEditFieldLabel.Layout.Row = 2;
app.ExtUI.d_tmEditFieldLabel.Layout.Column = 1;
app.ExtUI.d_tmEditFieldLabel.Text = 't (m)';

% Create FourMicTubeParam_dt
app.ExtUI.FourMicTubeParam_t = uieditfield(app.ExtUI.FourMicTubeParamsSampleandtubeGrid, 'numeric');
app.ExtUI.FourMicTubeParam_t.Limits = [0.001 Inf];
app.ExtUI.FourMicTubeParam_t.Layout.Row = 2;
app.ExtUI.FourMicTubeParam_t.Layout.Column = 2;
app.ExtUI.FourMicTubeParam_t.Value = 0.1;
app.ExtUI.FourMicTubeParam_t.ValueChangedFcn = {@fourmictubeparamchanged,app};
if isempty(app.ExtVar.ImpedanceTubeFourMic.t)
    app.ExtVar.ImpedanceTubeFourMic.t = app.ExtUI.FourMicTubeParam_t.Value;
else
    app.ExtUI.FourMicTubeParam_t.Value = app.ExtVar.ImpedanceTubeFourMic.t;
end

% Create FourMicTubeParamsDownstreamPanel
app.ExtUI.FourMicTubeParamsDownstreamPanel = uipanel(app.ExtUI.GridCenterPanelFourMicTubeParams);
app.ExtUI.FourMicTubeParamsDownstreamPanel.ForegroundColor = [1 1 1];
app.ExtUI.FourMicTubeParamsDownstreamPanel.TitlePosition = 'centertop';
app.ExtUI.FourMicTubeParamsDownstreamPanel.Title = 'Downstream';
app.ExtUI.FourMicTubeParamsDownstreamPanel.BackgroundColor = [0.4667 0.6745 0.1882]-0.1;
app.ExtUI.FourMicTubeParamsDownstreamPanel.Layout.Row = 4;
app.ExtUI.FourMicTubeParamsDownstreamPanel.Layout.Column = 3;
app.ExtUI.FourMicTubeParamsDownstreamPanel.FontWeight = 'bold';

% Create FourMicTubeParamsDownstreamGrid
app.ExtUI.FourMicTubeParamsDownstreamGrid = uigridlayout(app.ExtUI.FourMicTubeParamsDownstreamPanel);
app.ExtUI.FourMicTubeParamsDownstreamGrid.BackgroundColor = [1 1 1];

% Create l_2mEditFieldLabel
app.ExtUI.l_2mEditFieldLabel = uilabel(app.ExtUI.FourMicTubeParamsDownstreamGrid);
app.ExtUI.l_2mEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.l_2mEditFieldLabel.FontWeight = 'bold';
app.ExtUI.l_2mEditFieldLabel.Layout.Row = 1;
app.ExtUI.l_2mEditFieldLabel.Layout.Column = 1;
app.ExtUI.l_2mEditFieldLabel.Text = ['l',char(8322),' (m)'];

% Create FourMicTubeParam_l2
app.ExtUI.FourMicTubeParam_l2 = uieditfield(app.ExtUI.FourMicTubeParamsDownstreamGrid, 'numeric');
app.ExtUI.FourMicTubeParam_l2.Limits = [0.001 Inf];
app.ExtUI.FourMicTubeParam_l2.Layout.Row = 1;
app.ExtUI.FourMicTubeParam_l2.Layout.Column = 2;
app.ExtUI.FourMicTubeParam_l2.Value = 0.2;
app.ExtUI.FourMicTubeParam_l2.ValueChangedFcn = {@fourmictubeparamchanged,app};
if isempty(app.ExtVar.ImpedanceTubeFourMic.l2)
    app.ExtVar.ImpedanceTubeFourMic.l2 = app.ExtUI.FourMicTubeParam_l2.Value;
else
    app.ExtUI.FourMicTubeParam_l2.Value = app.ExtVar.ImpedanceTubeFourMic.l2;
end

% Create s_2mEditFieldLabel
app.ExtUI.s_2mEditFieldLabel = uilabel(app.ExtUI.FourMicTubeParamsDownstreamGrid);
app.ExtUI.s_2mEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.s_2mEditFieldLabel.FontWeight = 'bold';
app.ExtUI.s_2mEditFieldLabel.Layout.Row = 2;
app.ExtUI.s_2mEditFieldLabel.Layout.Column = 1;
app.ExtUI.s_2mEditFieldLabel.Text = ['s',char(8322),' (m)'];

% Create FourMicTubeParam_s2
app.ExtUI.FourMicTubeParam_s2 = uieditfield(app.ExtUI.FourMicTubeParamsDownstreamGrid, 'numeric');
app.ExtUI.FourMicTubeParam_s2.Limits = [0.001 Inf];
app.ExtUI.FourMicTubeParam_s2.Layout.Row = 2;
app.ExtUI.FourMicTubeParam_s2.Layout.Column = 2;
app.ExtUI.FourMicTubeParam_s2.Value = 0.2;
app.ExtUI.FourMicTubeParam_s2.ValueChangedFcn = {@fourmictubeparamchanged,app};
if isempty(app.ExtVar.ImpedanceTubeFourMic.s2)
    app.ExtVar.ImpedanceTubeFourMic.s2 = app.ExtUI.FourMicTubeParam_s2.Value;
else
    app.ExtUI.FourMicTubeParam_s2.Value = app.ExtVar.ImpedanceTubeFourMic.s2;
end

% Create FourMicTubeParamsAxes
app.ExtUI.FourMicTubeParamsAxes = uiaxes(app.ExtUI.GridCenterPanelFourMicTubeParams);
app.ExtUI.FourMicTubeParamsAxes.Layout.Row = 3;
app.ExtUI.FourMicTubeParamsAxes.Layout.Column = [1 3];

plotTubeFourMicASTM2611(app,app.ExtUI.FourMicTubeParamsAxes,{'Mic';'1'},{'Mic';'2'},{'Mic';'3'},{'Mic';'4'},1,1,1,[])
drawnow

function fourmictubeparamchanged(~,~,app)
app.ExtVar.ImpedanceTubeFourMic.t = app.ExtUI.FourMicTubeParam_t.Value;
app.ExtVar.ImpedanceTubeFourMic.d = app.ExtUI.FourMicTubeParam_d.Value;
app.ExtVar.ImpedanceTubeFourMic.l1 = app.ExtUI.FourMicTubeParam_l1.Value;
app.ExtVar.ImpedanceTubeFourMic.s1 = app.ExtUI.FourMicTubeParam_s1.Value;
app.ExtVar.ImpedanceTubeFourMic.l2 = app.ExtUI.FourMicTubeParam_l2.Value;
app.ExtVar.ImpedanceTubeFourMic.s2 = app.ExtUI.FourMicTubeParam_s2.Value;
plotTubeFourMicASTM2611(app,app.ExtUI.FourMicTubeParamsAxes,{'Mic';'1'},{'Mic';'2'},{'Mic';'3'},{'Mic';'4'},1,1,1,[])

% Frequency limits (ASTM 2611-19, equation (1,2))
[freqMin,freqMax] = FourMicCalculateTubeLimits(app);
app.ExtUI.PanelTubeFourMicRightInfoLFreqlabel.Text = sprintf('%.1f Hz',freqMin);
app.ExtUI.PanelTubeFourMicRightInfoUFreqlabel.Text = sprintf('%.1f Hz',freqMax);


function FourMicTubeCircularParameterChanged(~,~,app)
if app.ExtUI.FourMicTubeParamsCircularCheckBox.Value
    app.ExtUI.FourMicTubeParamsSquareCheckBox.Value = false;
    app.ExtVar.ImpedanceTubeFourMic.Shape = 'Circular';
    [~,freqMax] = FourMicCalculateTubeLimits(app);
    app.ExtUI.PanelTubeFourMicRightInfoUFreqlabel.Text = sprintf('%.1f Hz',freqMax);
    
end

function FourMicTubeSquareParameterChanged(~,~,app)
if app.ExtUI.FourMicTubeParamsSquareCheckBox.Value
    app.ExtUI.FourMicTubeParamsCircularCheckBox.Value = false;
    app.ExtVar.ImpedanceTubeFourMic.Shape = 'Square';
    [~,freqMax] = FourMicCalculateTubeLimits(app);
    app.ExtUI.PanelTubeFourMicRightInfoUFreqlabel.Text = sprintf('%.1f Hz',freqMax);
end