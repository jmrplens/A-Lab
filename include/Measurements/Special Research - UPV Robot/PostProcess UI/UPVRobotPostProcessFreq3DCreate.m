function UPVRobotPostProcessFreq3DCreate(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% ===============================================
% BOTTOM GRID FOR VIEW, 3D PARAMETERS AND EXPORT PANELS

% Create GridUPVRobotPostProcessBottomCenterGridFreq3D
app.ExtUI.GridUPVRobotPostProcessBottomCenterGridFreq3D = uigridlayout(app.ExtUI.GridCenterMain);
app.ExtUI.GridUPVRobotPostProcessBottomCenterGridFreq3D.ColumnWidth = {'fit', '1x', '0.5x'};
app.ExtUI.GridUPVRobotPostProcessBottomCenterGridFreq3D.RowHeight = {'1x'};
app.ExtUI.GridUPVRobotPostProcessBottomCenterGridFreq3D.Layout.Row = 2;
app.ExtUI.GridUPVRobotPostProcessBottomCenterGridFreq3D.Layout.Column = 1;
app.ExtUI.GridUPVRobotPostProcessBottomCenterGridFreq3D.BackgroundColor = [1 1 1];

% ===============================================
% VIEW PARAMETERS

% Create UPVRobotPostProcessViewParametersPanelFreq3D
app.ExtUI.UPVRobotPostProcessViewParametersPanelFreq3D = uipanel(app.ExtUI.GridUPVRobotPostProcessBottomCenterGridFreq3D);
app.ExtUI.UPVRobotPostProcessViewParametersPanelFreq3D.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessViewParametersPanelFreq3D.TitlePosition = 'centertop';
app.ExtUI.UPVRobotPostProcessViewParametersPanelFreq3D.Title = 'View parameters';
app.ExtUI.UPVRobotPostProcessViewParametersPanelFreq3D.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotPostProcessViewParametersPanelFreq3D.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessViewParametersPanelFreq3D.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessViewParametersPanelFreq3D.FontWeight = 'bold';

% Create UPVRobotPostProcessViewParametersGridFreq3D
app.ExtUI.UPVRobotPostProcessViewParametersGridFreq3D = uigridlayout(app.ExtUI.UPVRobotPostProcessViewParametersPanelFreq3D);
app.ExtUI.UPVRobotPostProcessViewParametersGridFreq3D.ColumnWidth = {'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessViewParametersGridFreq3D.RowHeight = {'fit', 'fit', 'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessViewParametersGridFreq3D.BackgroundColor = [1 1 1];

% Create FrequencyHzEditFieldLabelFreq3D
app.ExtUI.FrequencyHzEditFieldLabelFreq3D = uilabel(app.ExtUI.UPVRobotPostProcessViewParametersGridFreq3D);
app.ExtUI.FrequencyHzEditFieldLabelFreq3D.HorizontalAlignment = 'right';
app.ExtUI.FrequencyHzEditFieldLabelFreq3D.Layout.Row = 1;
app.ExtUI.FrequencyHzEditFieldLabelFreq3D.Layout.Column = 1;
app.ExtUI.FrequencyHzEditFieldLabelFreq3D.Text = 'Frequency (Hz)';

% Create UPVRobotPostProcessFrequencyHzEditFieldFreq3D
app.ExtUI.UPVRobotPostProcessFrequencyHzEditFieldFreq3D = uieditfield(app.ExtUI.UPVRobotPostProcessViewParametersGridFreq3D, 'numeric');
app.ExtUI.UPVRobotPostProcessFrequencyHzEditFieldFreq3D.Limits = [1 Inf];
app.ExtUI.UPVRobotPostProcessFrequencyHzEditFieldFreq3D.ValueDisplayFormat = '%g';
app.ExtUI.UPVRobotPostProcessFrequencyHzEditFieldFreq3D.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFrequencyHzEditFieldFreq3D.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessFrequencyHzEditFieldFreq3D.Value = 500;
app.ExtUI.UPVRobotPostProcessFrequencyHzEditFieldFreq3D.ValueChangedFcn = {@UPVRobotPostProcessViewParamFREQChanged3D,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.FreqView)
    app.ExtUI.UPVRobotPostProcessFrequencyHzEditFieldFreq3D.Value = app.ExtVar.UPVRobotPostProcess.FreqView;
else
    app.ExtVar.UPVRobotPostProcess.FreqView = app.ExtUI.UPVRobotPostProcessFrequencyHzEditFieldFreq3D.Value;
end

% Create UPVRobotPostProcessColorrangeautomaticCheckBoxFreq3D
app.ExtUI.UPVRobotPostProcessColorrangeautomaticCheckBoxFreq3D = uicheckbox(app.ExtUI.UPVRobotPostProcessViewParametersGridFreq3D);
app.ExtUI.UPVRobotPostProcessColorrangeautomaticCheckBoxFreq3D.Text = 'Color range automatic';
app.ExtUI.UPVRobotPostProcessColorrangeautomaticCheckBoxFreq3D.WordWrap = 'on';
app.ExtUI.UPVRobotPostProcessColorrangeautomaticCheckBoxFreq3D.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessColorrangeautomaticCheckBoxFreq3D.Layout.Column = [1 2];
app.ExtUI.UPVRobotPostProcessColorrangeautomaticCheckBoxFreq3D.Value = true;
app.ExtUI.UPVRobotPostProcessColorrangeautomaticCheckBoxFreq3D.ValueChangedFcn = {@UPVRobotPostProcessViewParamFREQChanged3D,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.FreqColorAuto)
    app.ExtUI.UPVRobotPostProcessColorrangeautomaticCheckBoxFreq3D.Value = app.ExtVar.UPVRobotPostProcess.FreqColorAuto;
else
    app.ExtVar.UPVRobotPostProcess.FreqColorAuto = app.ExtUI.UPVRobotPostProcessColorrangeautomaticCheckBoxFreq3D.Value;
end

% Create MinrangeEditFieldLabelFreq3D
app.ExtUI.MinrangeEditFieldLabelFreq3D = uilabel(app.ExtUI.UPVRobotPostProcessViewParametersGridFreq3D);
app.ExtUI.MinrangeEditFieldLabelFreq3D.HorizontalAlignment = 'right';
app.ExtUI.MinrangeEditFieldLabelFreq3D.Layout.Row = 3;
app.ExtUI.MinrangeEditFieldLabelFreq3D.Layout.Column = 1;
app.ExtUI.MinrangeEditFieldLabelFreq3D.Text = 'Min range';

% Create UPVRobotPostProcessMinrangeEditFieldFreq3D
app.ExtUI.UPVRobotPostProcessMinrangeEditFieldFreq3D = uieditfield(app.ExtUI.UPVRobotPostProcessViewParametersGridFreq3D, 'numeric');
app.ExtUI.UPVRobotPostProcessMinrangeEditFieldFreq3D.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessMinrangeEditFieldFreq3D.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessMinrangeEditFieldFreq3D.Value = 70;
app.ExtUI.UPVRobotPostProcessMinrangeEditFieldFreq3D.ValueChangedFcn = {@UPVRobotPostProcessViewParamFREQChanged3D,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.FreqMinRange)
    app.ExtUI.UPVRobotPostProcessMinrangeEditFieldFreq3D.Value = app.ExtVar.UPVRobotPostProcess.FreqMinRange;
else
    app.ExtVar.UPVRobotPostProcess.FreqMinRange = app.ExtUI.UPVRobotPostProcessMinrangeEditFieldFreq3D.Value;
end

% Create MaxrangeEditFieldLabelFreq3D
app.ExtUI.MaxrangeEditFieldLabelFreq3D = uilabel(app.ExtUI.UPVRobotPostProcessViewParametersGridFreq3D);
app.ExtUI.MaxrangeEditFieldLabelFreq3D.HorizontalAlignment = 'right';
app.ExtUI.MaxrangeEditFieldLabelFreq3D.Layout.Row = 4;
app.ExtUI.MaxrangeEditFieldLabelFreq3D.Layout.Column = 1;
app.ExtUI.MaxrangeEditFieldLabelFreq3D.Text = 'Max range';

% Create UPVRobotPostProcessMaxrangeEditFieldFreq3D
app.ExtUI.UPVRobotPostProcessMaxrangeEditFieldFreq3D = uieditfield(app.ExtUI.UPVRobotPostProcessViewParametersGridFreq3D, 'numeric');
app.ExtUI.UPVRobotPostProcessMaxrangeEditFieldFreq3D.Layout.Row = 4;
app.ExtUI.UPVRobotPostProcessMaxrangeEditFieldFreq3D.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessMaxrangeEditFieldFreq3D.Value = 100;
app.ExtUI.UPVRobotPostProcessMaxrangeEditFieldFreq3D.ValueChangedFcn = {@UPVRobotPostProcessViewParamFREQChanged3D,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.FreqMaxRange)
    app.ExtUI.UPVRobotPostProcessMaxrangeEditFieldFreq3D.Value = app.ExtVar.UPVRobotPostProcess.FreqMaxRange;
else
    app.ExtVar.UPVRobotPostProcess.FreqMaxRange = app.ExtUI.UPVRobotPostProcessMaxrangeEditFieldFreq3D.Value;
end

% Logics Freq range
if app.ExtVar.UPVRobotPostProcess.FreqColorAuto
    app.ExtUI.UPVRobotPostProcessMaxrangeEditFieldFreq3D.Enable = 'off';
    app.ExtUI.UPVRobotPostProcessMinrangeEditFieldFreq3D.Enable = 'off';
else
    app.ExtUI.UPVRobotPostProcessMaxrangeEditFieldFreq3D.Enable = 'on';
    app.ExtUI.UPVRobotPostProcessMinrangeEditFieldFreq3D.Enable = 'on';
end

% ===============================================
% EXPORT PANEL

% Create UPVRobotPostProcessExportPanelFreq3D
app.ExtUI.UPVRobotPostProcessExportPanelFreq3D = uipanel(app.ExtUI.GridUPVRobotPostProcessBottomCenterGridFreq3D);
app.ExtUI.UPVRobotPostProcessExportPanelFreq3D.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessExportPanelFreq3D.Title = 'Export';
app.ExtUI.UPVRobotPostProcessExportPanelFreq3D.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotPostProcessExportPanelFreq3D.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessExportPanelFreq3D.Layout.Column = 3;
app.ExtUI.UPVRobotPostProcessExportPanelFreq3D.FontWeight = 'bold';

% Create UPVRobotPostProcessExportGridFreq3D
app.ExtUI.UPVRobotPostProcessExportGridFreq3D = uigridlayout(app.ExtUI.UPVRobotPostProcessExportPanelFreq3D);
app.ExtUI.UPVRobotPostProcessExportGridFreq3D.ColumnWidth = {'1x'};
app.ExtUI.UPVRobotPostProcessExportGridFreq3D.RowHeight = {'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessExportGridFreq3D.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessExportGraphicButtonFreq3D
app.ExtUI.UPVRobotPostProcessExportGraphicButtonFreq3D = uibutton(app.ExtUI.UPVRobotPostProcessExportGridFreq3D, 'push');
app.ExtUI.UPVRobotPostProcessExportGraphicButtonFreq3D.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessExportGraphicButtonFreq3D.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessExportGraphicButtonFreq3D.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessExportGraphicButtonFreq3D.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessExportGraphicButtonFreq3D.Text = 'Graphic';
app.ExtUI.UPVRobotPostProcessExportGraphicButtonFreq3D.ButtonPushedFcn = {@UPVRobotPostProcessFreq3DExportGraphic,app};

% Create UPVRobotPostProcessExportDataButtonFreq3D
app.ExtUI.UPVRobotPostProcessExportDataButtonFreq3D = uibutton(app.ExtUI.UPVRobotPostProcessExportGridFreq3D, 'push');
app.ExtUI.UPVRobotPostProcessExportDataButtonFreq3D.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessExportDataButtonFreq3D.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessExportDataButtonFreq3D.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessExportDataButtonFreq3D.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessExportDataButtonFreq3D.Text = 'Data';
app.ExtUI.UPVRobotPostProcessExportDataButtonFreq3D.ButtonPushedFcn = {@UPVRobotPostProcessFreq3DExportData,app};


% ===============================================
% 3D PARAMETERS

% Create UPVRobotPostProcessDParametersPanelFreq3D
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3D = uipanel(app.ExtUI.GridUPVRobotPostProcessBottomCenterGridFreq3D);
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3D.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3D.Title = '3D Parameters';
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3D.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3D.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3D.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3D.FontWeight = 'bold';

% Create UPVRobotPostProcessDParametersPanelFreq3DGrid
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3DGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3D);
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3DGrid.ColumnWidth = {'1x'};
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3DGrid.RowHeight = {'1x'};
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3DGrid.Padding = [0 0 0 0];
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3DGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessDParametersPanelFreq3DTabs
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3DTabs = uitabgroup(app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3DGrid);
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3DTabs.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3DTabs.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3DTabs.SelectionChangedFcn = {@UPVRobotPostProcessFreq3DViewTabChanged,app};

% Create UPVRobotPostProcessDParametersPanelFreq3D3SliceTab
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3D3SliceTab = uitab(app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3DTabs);
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3D3SliceTab.Title = '3 Slice';

% Create UPVRobotPostProcessFreq3D3SliceGrid
app.ExtUI.UPVRobotPostProcessFreq3D3SliceGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3D3SliceTab);
app.ExtUI.UPVRobotPostProcessFreq3D3SliceGrid.ColumnWidth = {'fit', '1x', 'fit'};
app.ExtUI.UPVRobotPostProcessFreq3D3SliceGrid.RowHeight = {'fit', 'fit', 'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessFreq3D3SliceGrid.ColumnSpacing = 5;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceGrid.RowSpacing = 8;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceGrid.Padding = [10 5 10 10];
app.ExtUI.UPVRobotPostProcessFreq3D3SliceGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessFreq3D3SliceXYSliceSliderLabel
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXYSliceSliderLabel = uilabel(app.ExtUI.UPVRobotPostProcessFreq3D3SliceGrid);
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXYSliceSliderLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXYSliceSliderLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXYSliceSliderLabel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXYSliceSliderLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXYSliceSliderLabel.Text = 'XY Slice';

% Create UPVRobotPostProcessFreq3D3SliceXYSliceSlider
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXYSliceSlider = uislider(app.ExtUI.UPVRobotPostProcessFreq3D3SliceGrid);
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXYSliceSlider.Limits = app.ExtVar.UPVRobotPostProcess.DefaultLim(3,:);
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXYSliceSlider.MajorTicks = [];
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXYSliceSlider.MajorTickLabels = {};
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXYSliceSlider.MinorTicks = [];
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXYSliceSlider.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXYSliceSlider.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXYSliceSlider.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXYSliceSlider.ValueChangingFcn = @(sld,event) UPVRobotPostProcessFreq3DXYsliderMoving(event,app);
if ~isempty(app.ExtVar.UPVRobotPostProcess.XYsliderValue)
    app.ExtUI.UPVRobotPostProcessFreq3D3SliceXYSliceSlider.Value = app.ExtVar.UPVRobotPostProcess.XYsliderValue;
else
    app.ExtVar.UPVRobotPostProcess.XYsliderValue = app.ExtUI.UPVRobotPostProcessFreq3D3SliceXYSliceSlider.Value;
end

% Create UPVRobotPostProcessFreq3D3SliceXYSliceSliderZInfo
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXYSliceSliderZInfo = uilabel(app.ExtUI.UPVRobotPostProcessFreq3D3SliceGrid);
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXYSliceSliderZInfo.FontSize = 10;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXYSliceSliderZInfo.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXYSliceSliderZInfo.Layout.Column = 3;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXYSliceSliderZInfo.Text = ['Z = ',num2str(app.ExtVar.UPVRobotPostProcess.XYsliderValue,'%.2f')];

% Create UPVRobotPostProcessFreq3D3SliceXZSliceSliderLabel
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXZSliceSliderLabel = uilabel(app.ExtUI.UPVRobotPostProcessFreq3D3SliceGrid);
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXZSliceSliderLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXZSliceSliderLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXZSliceSliderLabel.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXZSliceSliderLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXZSliceSliderLabel.Text = 'XZ Slice';

% Create UPVRobotPostProcessFreq3D3SliceXZSliceSlider
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXZSliceSlider = uislider(app.ExtUI.UPVRobotPostProcessFreq3D3SliceGrid);
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXZSliceSlider.Limits = app.ExtVar.UPVRobotPostProcess.DefaultLim(2,:);
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXZSliceSlider.MajorTicks = [];
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXZSliceSlider.MajorTickLabels = {};
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXZSliceSlider.MinorTicks = [];
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXZSliceSlider.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXZSliceSlider.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXZSliceSlider.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXZSliceSlider.ValueChangingFcn = @(sld,event) UPVRobotPostProcessFreq3DXZsliderMoving(event,app);
if ~isempty(app.ExtVar.UPVRobotPostProcess.XZsliderValue)
    app.ExtUI.UPVRobotPostProcessFreq3D3SliceXZSliceSlider.Value = app.ExtVar.UPVRobotPostProcess.XZsliderValue;
else
    app.ExtVar.UPVRobotPostProcess.XZsliderValue = app.ExtUI.UPVRobotPostProcessFreq3D3SliceXZSliceSlider.Value;
end

% Create UPVRobotPostProcessFreq3D3SliceXZSliceSliderYInfo
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXZSliceSliderYInfo = uilabel(app.ExtUI.UPVRobotPostProcessFreq3D3SliceGrid);
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXZSliceSliderYInfo.FontSize = 10;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXZSliceSliderYInfo.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXZSliceSliderYInfo.Layout.Column = 3;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXZSliceSliderYInfo.Text = ['Y = ',num2str(app.ExtVar.UPVRobotPostProcess.XZsliderValue,'%.2f')];

% Create UPVRobotPostProcessFreq3D3SliceYZSliceSliderLabel
app.ExtUI.UPVRobotPostProcessFreq3D3SliceYZSliceSliderLabel = uilabel(app.ExtUI.UPVRobotPostProcessFreq3D3SliceGrid);
app.ExtUI.UPVRobotPostProcessFreq3D3SliceYZSliceSliderLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotPostProcessFreq3D3SliceYZSliceSliderLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessFreq3D3SliceYZSliceSliderLabel.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceYZSliceSliderLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceYZSliceSliderLabel.Text = 'YZ Slice';

% Create UPVRobotPostProcessFreq3D3SliceYZSliceSlider
app.ExtUI.UPVRobotPostProcessFreq3D3SliceYZSliceSlider = uislider(app.ExtUI.UPVRobotPostProcessFreq3D3SliceGrid);
app.ExtUI.UPVRobotPostProcessFreq3D3SliceYZSliceSlider.Limits = app.ExtVar.UPVRobotPostProcess.DefaultLim(1,:);
app.ExtUI.UPVRobotPostProcessFreq3D3SliceYZSliceSlider.MajorTicks = [];
app.ExtUI.UPVRobotPostProcessFreq3D3SliceYZSliceSlider.MajorTickLabels = {};
app.ExtUI.UPVRobotPostProcessFreq3D3SliceYZSliceSlider.MinorTicks = [];
app.ExtUI.UPVRobotPostProcessFreq3D3SliceYZSliceSlider.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessFreq3D3SliceYZSliceSlider.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceYZSliceSlider.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceYZSliceSlider.ValueChangingFcn = @(sld,event) UPVRobotPostProcessFreq3DYZsliderMoving(event,app);
if ~isempty(app.ExtVar.UPVRobotPostProcess.YZsliderValue)
    app.ExtUI.UPVRobotPostProcessFreq3D3SliceYZSliceSlider.Value = app.ExtVar.UPVRobotPostProcess.YZsliderValue;
else
    app.ExtVar.UPVRobotPostProcess.YZsliderValue = app.ExtUI.UPVRobotPostProcessFreq3D3SliceYZSliceSlider.Value;
end

% Create UPVRobotPostProcessFreq3D3SliceYZSliceSliderXInfo
app.ExtUI.UPVRobotPostProcessFreq3D3SliceYZSliceSliderXInfo = uilabel(app.ExtUI.UPVRobotPostProcessFreq3D3SliceGrid);
app.ExtUI.UPVRobotPostProcessFreq3D3SliceYZSliceSliderXInfo.FontSize = 10;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceYZSliceSliderXInfo.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceYZSliceSliderXInfo.Layout.Column = 3;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceYZSliceSliderXInfo.Text = ['X = ',num2str(app.ExtVar.UPVRobotPostProcess.YZsliderValue,'%.2f')];

% Create UPVRobotPostProcessFreq3D3SliceViewLabel
app.ExtUI.UPVRobotPostProcessFreq3D3SliceViewLabel = uilabel(app.ExtUI.UPVRobotPostProcessFreq3D3SliceGrid);
app.ExtUI.UPVRobotPostProcessFreq3D3SliceViewLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessFreq3D3SliceViewLabel.Layout.Row = 4;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceViewLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceViewLabel.Text = 'View:';

% Create UPVRobotPostProcessFreq3D3SliceViewOpsGrid
app.ExtUI.UPVRobotPostProcessFreq3D3SliceViewOpsGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessFreq3D3SliceGrid);
app.ExtUI.UPVRobotPostProcessFreq3D3SliceViewOpsGrid.ColumnWidth = {'fit', 'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessFreq3D3SliceViewOpsGrid.RowHeight = {'fit'};
app.ExtUI.UPVRobotPostProcessFreq3D3SliceViewOpsGrid.ColumnSpacing = 5;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceViewOpsGrid.Padding = [0 0 0 0];
app.ExtUI.UPVRobotPostProcessFreq3D3SliceViewOpsGrid.Layout.Row = 4;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceViewOpsGrid.Layout.Column = [2 3];
app.ExtUI.UPVRobotPostProcessFreq3D3SliceViewOpsGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessFreq3D3SlicePointsCheckBox
app.ExtUI.UPVRobotPostProcessFreq3D3SlicePointsCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessFreq3D3SliceViewOpsGrid);
app.ExtUI.UPVRobotPostProcessFreq3D3SlicePointsCheckBox.ValueChangedFcn = {@UPVRobotPostProcessViewParamFreq3DVIEWPointChanged,app};
app.ExtUI.UPVRobotPostProcessFreq3D3SlicePointsCheckBox.Text = 'Points';
app.ExtUI.UPVRobotPostProcessFreq3D3SlicePointsCheckBox.FontSize = 10;
app.ExtUI.UPVRobotPostProcessFreq3D3SlicePointsCheckBox.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFreq3D3SlicePointsCheckBox.Layout.Column = 1;
if ~isempty(app.ExtVar.UPVRobotPostProcess.ViewPoints)
    app.ExtUI.UPVRobotPostProcessFreq3D3SlicePointsCheckBox.Value = app.ExtVar.UPVRobotPostProcess.ViewPoints;
else
    app.ExtVar.UPVRobotPostProcess.ViewPoints = app.ExtUI.UPVRobotPostProcessFreq3D3SlicePointsCheckBox.Value;
end

% Create UPVRobotPostProcessFreq3D3SliceBoundaryCheckBox
app.ExtUI.UPVRobotPostProcessFreq3D3SliceBoundaryCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessFreq3D3SliceViewOpsGrid);
app.ExtUI.UPVRobotPostProcessFreq3D3SliceBoundaryCheckBox.Text = 'Bound';
app.ExtUI.UPVRobotPostProcessFreq3D3SliceBoundaryCheckBox.ValueChangedFcn = {@UPVRobotPostProcessViewParamFreq3DVIEWBoundaryChanged,app};
app.ExtUI.UPVRobotPostProcessFreq3D3SliceBoundaryCheckBox.FontSize = 10;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceBoundaryCheckBox.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceBoundaryCheckBox.Layout.Column = 2;
if ~isempty(app.ExtVar.UPVRobotPostProcess.ViewBoundary)
    app.ExtUI.UPVRobotPostProcessFreq3D3SliceBoundaryCheckBox.Value = app.ExtVar.UPVRobotPostProcess.ViewBoundary;
else
    app.ExtVar.UPVRobotPostProcess.ViewBoundary = app.ExtUI.UPVRobotPostProcessFreq3D3SliceBoundaryCheckBox.Value;
end

% Create UPVRobotPostProcessFreq3D3SliceLightCheckBox
app.ExtUI.UPVRobotPostProcessFreq3D3SliceLightCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessFreq3D3SliceViewOpsGrid);
app.ExtUI.UPVRobotPostProcessFreq3D3SliceLightCheckBox.Text = 'Light';
app.ExtUI.UPVRobotPostProcessFreq3D3SliceLightCheckBox.ValueChangedFcn = {@UPVRobotPostProcessViewParamFreq3DVIEWLightChanged,app};
app.ExtUI.UPVRobotPostProcessFreq3D3SliceLightCheckBox.FontSize = 10;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceLightCheckBox.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceLightCheckBox.Layout.Column = 3;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceLightCheckBox.Value = 1;
if ~isempty(app.ExtVar.UPVRobotPostProcess.ViewLight)
    app.ExtUI.UPVRobotPostProcessFreq3D3SliceLightCheckBox.Value = app.ExtVar.UPVRobotPostProcess.ViewLight;
else
    app.ExtVar.UPVRobotPostProcess.ViewLight = app.ExtUI.UPVRobotPostProcessFreq3D3SliceLightCheckBox.Value;
end

% Create UPVRobotPostProcessDParametersPanelFreq3DMultiTab
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3DMultiTab = uitab(app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3DTabs);
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3DMultiTab.Title = 'Multi';

% Create UPVRobotPostProcessFreq3DMultiGrid
app.ExtUI.UPVRobotPostProcessFreq3DMultiGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3DMultiTab);
app.ExtUI.UPVRobotPostProcessFreq3DMultiGrid.ColumnWidth = {'fit', '1x'};
app.ExtUI.UPVRobotPostProcessFreq3DMultiGrid.RowHeight = {'fit', 'fit', 'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessFreq3DMultiGrid.RowSpacing = 5;
app.ExtUI.UPVRobotPostProcessFreq3DMultiGrid.ColumnSpacing = 5;
app.ExtUI.UPVRobotPostProcessFreq3DMultiGrid.Padding = [10 5 10 5];
app.ExtUI.UPVRobotPostProcessFreq3DMultiGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessFreq3DMultiXYSlicesEditFieldLabel
app.ExtUI.UPVRobotPostProcessFreq3DMultiXYSlicesEditFieldLabel = uilabel(app.ExtUI.UPVRobotPostProcessFreq3DMultiGrid);
app.ExtUI.UPVRobotPostProcessFreq3DMultiXYSlicesEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotPostProcessFreq3DMultiXYSlicesEditFieldLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessFreq3DMultiXYSlicesEditFieldLabel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFreq3DMultiXYSlicesEditFieldLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessFreq3DMultiXYSlicesEditFieldLabel.Text = 'XY Slices';

% Create UPVRobotPostProcessFreq3DMultiXYSlicesEditField
app.ExtUI.UPVRobotPostProcessFreq3DMultiXYSlicesEditField = uieditfield(app.ExtUI.UPVRobotPostProcessFreq3DMultiGrid, 'text');
app.ExtUI.UPVRobotPostProcessFreq3DMultiXYSlicesEditField.Tooltip = {'Unique number or number array in format ''a,b,c,...'' or empty to not make a slice'};
app.ExtUI.UPVRobotPostProcessFreq3DMultiXYSlicesEditField.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFreq3DMultiXYSlicesEditField.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessFreq3DMultiXYSlicesEditField.Value = '0,0.2,0.7';
app.ExtUI.UPVRobotPostProcessFreq3DMultiXYSlicesEditField.ValueChangedFcn = {@UPVRobotPostProcessViewParamXYSlicesChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.XYslicesValues)
    values = app.ExtVar.UPVRobotPostProcess.XYslicesValues;
    app.ExtUI.UPVRobotPostProcessFreq3DMultiXYSlicesEditField.Value = erase(num2str(values(:)','%.g,'), ' ');
else
    valuesSTR = app.ExtUI.UPVRobotPostProcessFreq3DMultiXYSlicesEditField.Value;
    try
        values = cell2mat( textscan( valuesSTR,'%f,'));
        app.ExtVar.UPVRobotPostProcess.XYslicesValues = values(:)';
    catch
        app.ExtVar.UPVRobotPostProcess.XYslicesValues = [];
    end
end

% Create UPVRobotPostProcessFreq3DMultiXZSlicesEditFieldLabel
app.ExtUI.UPVRobotPostProcessFreq3DMultiXZSlicesEditFieldLabel = uilabel(app.ExtUI.UPVRobotPostProcessFreq3DMultiGrid);
app.ExtUI.UPVRobotPostProcessFreq3DMultiXZSlicesEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotPostProcessFreq3DMultiXZSlicesEditFieldLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessFreq3DMultiXZSlicesEditFieldLabel.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessFreq3DMultiXZSlicesEditFieldLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessFreq3DMultiXZSlicesEditFieldLabel.Text = 'XZ Slices';

% Create UPVRobotPostProcessFreq3DMultiXZSlicesEditField
app.ExtUI.UPVRobotPostProcessFreq3DMultiXZSlicesEditField = uieditfield(app.ExtUI.UPVRobotPostProcessFreq3DMultiGrid, 'text');
app.ExtUI.UPVRobotPostProcessFreq3DMultiXZSlicesEditField.Tooltip = {'Unique number or number array in format ''a,b,c,...'' or empty to not make a slice'};
app.ExtUI.UPVRobotPostProcessFreq3DMultiXZSlicesEditField.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessFreq3DMultiXZSlicesEditField.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessFreq3DMultiXZSlicesEditField.Value = '1,3';
app.ExtUI.UPVRobotPostProcessFreq3DMultiXZSlicesEditField.ValueChangedFcn = {@UPVRobotPostProcessViewParamXZSlicesChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.XZslicesValues)
    values = app.ExtVar.UPVRobotPostProcess.XZslicesValues;
    app.ExtUI.UPVRobotPostProcessFreq3DMultiXZSlicesEditField.Value = erase(num2str(values(:)','%.g,'), ' ');
else
    valuesSTR = app.ExtUI.UPVRobotPostProcessFreq3DMultiXZSlicesEditField.Value;
    try
        values = cell2mat( textscan( valuesSTR,'%f,'));
        app.ExtVar.UPVRobotPostProcess.XZslicesValues = values(:)';
    catch
        app.ExtVar.UPVRobotPostProcess.XZslicesValues = [];
    end
end

% Create UPVRobotPostProcessFreq3DMultiYZSlicesEditFieldLabel
app.ExtUI.UPVRobotPostProcessFreq3DMultiYZSlicesEditFieldLabel = uilabel(app.ExtUI.UPVRobotPostProcessFreq3DMultiGrid);
app.ExtUI.UPVRobotPostProcessFreq3DMultiYZSlicesEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotPostProcessFreq3DMultiYZSlicesEditFieldLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessFreq3DMultiYZSlicesEditFieldLabel.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessFreq3DMultiYZSlicesEditFieldLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessFreq3DMultiYZSlicesEditFieldLabel.Text = 'YZ Slices';

% Create UPVRobotPostProcessFreq3DMultiYZSlicesEditField
app.ExtUI.UPVRobotPostProcessFreq3DMultiYZSlicesEditField = uieditfield(app.ExtUI.UPVRobotPostProcessFreq3DMultiGrid, 'text');
app.ExtUI.UPVRobotPostProcessFreq3DMultiYZSlicesEditField.Tooltip = {'Unique number or number array in format ''a,b,c,...'' or empty to not make a slice'};
app.ExtUI.UPVRobotPostProcessFreq3DMultiYZSlicesEditField.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessFreq3DMultiYZSlicesEditField.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessFreq3DMultiYZSlicesEditField.Value = '0.5,1,2';
app.ExtUI.UPVRobotPostProcessFreq3DMultiYZSlicesEditField.ValueChangedFcn = {@UPVRobotPostProcessViewParamYZSlicesChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.YZslicesValues)
    values = app.ExtVar.UPVRobotPostProcess.YZslicesValues;
    app.ExtUI.UPVRobotPostProcessFreq3DMultiYZSlicesEditField.Value = erase(num2str(values(:)','%.g,'), ' ');
else
    valuesSTR = app.ExtUI.UPVRobotPostProcessFreq3DMultiYZSlicesEditField.Value;
    try
        values = cell2mat( textscan( valuesSTR,'%f,'));
        app.ExtVar.UPVRobotPostProcess.YZslicesValues = values(:)';
    catch
        app.ExtVar.UPVRobotPostProcess.YZslicesValues = [];
    end
end

% Create UPVRobotPostProcessFreq3DMultiViewLabel
app.ExtUI.UPVRobotPostProcessFreq3DMultiViewLabel = uilabel(app.ExtUI.UPVRobotPostProcessFreq3DMultiGrid);
app.ExtUI.UPVRobotPostProcessFreq3DMultiViewLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessFreq3DMultiViewLabel.Layout.Row = 4;
app.ExtUI.UPVRobotPostProcessFreq3DMultiViewLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessFreq3DMultiViewLabel.Text = 'View:';

% Create UPVRobotPostProcessFreq3DMultiViewOpsGrid
app.ExtUI.UPVRobotPostProcessFreq3DMultiViewOpsGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessFreq3DMultiGrid);
app.ExtUI.UPVRobotPostProcessFreq3DMultiViewOpsGrid.ColumnWidth = {'fit', 'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessFreq3DMultiViewOpsGrid.RowHeight = {'fit'};
app.ExtUI.UPVRobotPostProcessFreq3DMultiViewOpsGrid.ColumnSpacing = 5;
app.ExtUI.UPVRobotPostProcessFreq3DMultiViewOpsGrid.Padding = [0 0 0 0];
app.ExtUI.UPVRobotPostProcessFreq3DMultiViewOpsGrid.Layout.Row = 4;
app.ExtUI.UPVRobotPostProcessFreq3DMultiViewOpsGrid.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessFreq3DMultiViewOpsGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessFreq3DMultiPointsCheckBox
app.ExtUI.UPVRobotPostProcessFreq3DMultiPointsCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessFreq3DMultiViewOpsGrid);
app.ExtUI.UPVRobotPostProcessFreq3DMultiPointsCheckBox.ValueChangedFcn = {@UPVRobotPostProcessViewParamFreq3DVIEWPointChanged,app};
app.ExtUI.UPVRobotPostProcessFreq3DMultiPointsCheckBox.Text = 'Points';
app.ExtUI.UPVRobotPostProcessFreq3DMultiPointsCheckBox.FontSize = 10;
app.ExtUI.UPVRobotPostProcessFreq3DMultiPointsCheckBox.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFreq3DMultiPointsCheckBox.Layout.Column = 1;
if ~isempty(app.ExtVar.UPVRobotPostProcess.ViewPoints)
    app.ExtUI.UPVRobotPostProcessFreq3DMultiPointsCheckBox.Value = app.ExtVar.UPVRobotPostProcess.ViewPoints;
else
    app.ExtVar.UPVRobotPostProcess.ViewPoints = app.ExtUI.UPVRobotPostProcessFreq3DMultiPointsCheckBox.Value;
end

% Create UPVRobotPostProcessFreq3DMultiBoundaryCheckBox
app.ExtUI.UPVRobotPostProcessFreq3DMultiBoundaryCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessFreq3DMultiViewOpsGrid);
app.ExtUI.UPVRobotPostProcessFreq3DMultiBoundaryCheckBox.Text = 'Bound';
app.ExtUI.UPVRobotPostProcessFreq3DMultiBoundaryCheckBox.ValueChangedFcn = {@UPVRobotPostProcessViewParamFreq3DVIEWBoundaryChanged,app};
app.ExtUI.UPVRobotPostProcessFreq3DMultiBoundaryCheckBox.FontSize = 10;
app.ExtUI.UPVRobotPostProcessFreq3DMultiBoundaryCheckBox.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFreq3DMultiBoundaryCheckBox.Layout.Column = 2;
if ~isempty(app.ExtVar.UPVRobotPostProcess.ViewBoundary)
    app.ExtUI.UPVRobotPostProcessFreq3DMultiBoundaryCheckBox.Value = app.ExtVar.UPVRobotPostProcess.ViewBoundary;
else
    app.ExtVar.UPVRobotPostProcess.ViewBoundary = app.ExtUI.UPVRobotPostProcessFreq3DMultiBoundaryCheckBox.Value;
end

% Create UPVRobotPostProcessFreq3DMultiLightCheckBox
app.ExtUI.UPVRobotPostProcessFreq3DMultiLightCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessFreq3DMultiViewOpsGrid);
app.ExtUI.UPVRobotPostProcessFreq3DMultiLightCheckBox.Text = 'Light';
app.ExtUI.UPVRobotPostProcessFreq3DMultiLightCheckBox.ValueChangedFcn = {@UPVRobotPostProcessViewParamFreq3DVIEWLightChanged,app};
app.ExtUI.UPVRobotPostProcessFreq3DMultiLightCheckBox.FontSize = 10;
app.ExtUI.UPVRobotPostProcessFreq3DMultiLightCheckBox.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFreq3DMultiLightCheckBox.Layout.Column = 3;
if ~isempty(app.ExtVar.UPVRobotPostProcess.ViewLight)
    app.ExtUI.UPVRobotPostProcessFreq3DMultiLightCheckBox.Value = app.ExtVar.UPVRobotPostProcess.ViewLight;
else
    app.ExtVar.UPVRobotPostProcess.ViewLight = app.ExtUI.UPVRobotPostProcessFreq3DMultiLightCheckBox.Value;
end

% Create UPVRobotPostProcessDParametersPanelFreq3DIsoTab
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3DIsoTab = uitab(app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3DTabs);
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3DIsoTab.Title = 'Iso';

% Create UPVRobotPostProcessFreq3DIsoGrid
app.ExtUI.UPVRobotPostProcessFreq3DIsoGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3DIsoTab);
app.ExtUI.UPVRobotPostProcessFreq3DIsoGrid.ColumnWidth = {'fit', '1x', '1x'};
app.ExtUI.UPVRobotPostProcessFreq3DIsoGrid.RowHeight = {'fit', 'fit','fit', '1x', 'fit'};
app.ExtUI.UPVRobotPostProcessFreq3DIsoGrid.RowSpacing = 5;
app.ExtUI.UPVRobotPostProcessFreq3DIsoGrid.Padding = [10 5 10 5];
app.ExtUI.UPVRobotPostProcessFreq3DIsoGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessFreq3DIsoSPLdBEditFieldLabel
app.ExtUI.UPVRobotPostProcessFreq3DIsoSPLdBEditFieldLabel = uilabel(app.ExtUI.UPVRobotPostProcessFreq3DIsoGrid);
app.ExtUI.UPVRobotPostProcessFreq3DIsoSPLdBEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotPostProcessFreq3DIsoSPLdBEditFieldLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessFreq3DIsoSPLdBEditFieldLabel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFreq3DIsoSPLdBEditFieldLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessFreq3DIsoSPLdBEditFieldLabel.Text = 'SPL (dB)';

% Create UPVRobotPostProcessFreq3DIsoSPLdBEditField
app.ExtUI.UPVRobotPostProcessFreq3DIsoSPLdBEditField = uieditfield(app.ExtUI.UPVRobotPostProcessFreq3DIsoGrid, 'numeric');
app.ExtUI.UPVRobotPostProcessFreq3DIsoSPLdBEditField.Limits = [0 Inf];
app.ExtUI.UPVRobotPostProcessFreq3DIsoSPLdBEditField.ValueDisplayFormat = '%.1f';
app.ExtUI.UPVRobotPostProcessFreq3DIsoSPLdBEditField.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFreq3DIsoSPLdBEditField.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessFreq3DIsoSPLdBEditField.Value = 80;
app.ExtUI.UPVRobotPostProcessFreq3DIsoSPLdBEditField.ValueChangedFcn = {@UPVRobotPostProcessViewParamFreq3DISOParamChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.FISOvalue)
    if isnan(app.ExtVar.UPVRobotPostProcess.FISOvalue)
        app.ExtVar.UPVRobotPostProcess.FISOvalue = app.ExtUI.UPVRobotPostProcessFreq3DIsoSPLdBEditField.Value;
    else
        app.ExtUI.UPVRobotPostProcessFreq3DIsoSPLdBEditField.Value = app.ExtVar.UPVRobotPostProcess.FISOvalue;
    end
else
    app.ExtVar.UPVRobotPostProcess.FISOvalue = app.ExtUI.UPVRobotPostProcessFreq3DIsoSPLdBEditField.Value;
end

% Create UPVRobotPostProcessFreq3DIsoFillLabel
app.ExtUI.UPVRobotPostProcessFreq3DIsoFillLabel = uilabel(app.ExtUI.UPVRobotPostProcessFreq3DIsoGrid);
app.ExtUI.UPVRobotPostProcessFreq3DIsoFillLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessFreq3DIsoFillLabel.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessFreq3DIsoFillLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessFreq3DIsoFillLabel.Text = 'Fill:';

% Create UPVRobotPostProcessFreq3DIsolowerCheckBox
app.ExtUI.UPVRobotPostProcessFreq3DIsolowerCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessFreq3DIsoGrid);
app.ExtUI.UPVRobotPostProcessFreq3DIsolowerCheckBox.Text = 'Lower';
app.ExtUI.UPVRobotPostProcessFreq3DIsolowerCheckBox.WordWrap = 'on';
app.ExtUI.UPVRobotPostProcessFreq3DIsolowerCheckBox.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessFreq3DIsolowerCheckBox.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessFreq3DIsolowerCheckBox.Value = 0;
app.ExtUI.UPVRobotPostProcessFreq3DIsolowerCheckBox.ValueChangedFcn = {@UPVRobotPostProcessViewParamFreq3DISOParamChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.FISOLower)
    app.ExtUI.UPVRobotPostProcessFreq3DIsolowerCheckBox.Value = app.ExtVar.UPVRobotPostProcess.FISOLower;
else
    app.ExtVar.UPVRobotPostProcess.FISOLower = app.ExtUI.UPVRobotPostProcessFreq3DIsolowerCheckBox.Value;
end

% Create UPVRobotPostProcessFreq3DIsoupperCheckBox
app.ExtUI.UPVRobotPostProcessFreq3DIsoupperCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessFreq3DIsoGrid);
app.ExtUI.UPVRobotPostProcessFreq3DIsoupperCheckBox.Text = 'Upper';
app.ExtUI.UPVRobotPostProcessFreq3DIsoupperCheckBox.WordWrap = 'on';
app.ExtUI.UPVRobotPostProcessFreq3DIsoupperCheckBox.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessFreq3DIsoupperCheckBox.Layout.Column = 3;
app.ExtUI.UPVRobotPostProcessFreq3DIsoupperCheckBox.Value = 0;
app.ExtUI.UPVRobotPostProcessFreq3DIsoupperCheckBox.ValueChangedFcn = {@UPVRobotPostProcessViewParamFreq3DISOParamChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.FISOUpper)
    app.ExtUI.UPVRobotPostProcessFreq3DIsoupperCheckBox.Value = app.ExtVar.UPVRobotPostProcess.FISOUpper;
else
    app.ExtVar.UPVRobotPostProcess.FISOUpper = app.ExtUI.UPVRobotPostProcessFreq3DIsoupperCheckBox.Value;
end

% Create UPVRobotPostProcessFreq3DIsoSurfaceLabel
app.ExtUI.UPVRobotPostProcessFreq3DIsoSurfaceLabel = uilabel(app.ExtUI.UPVRobotPostProcessFreq3DIsoGrid);
app.ExtUI.UPVRobotPostProcessFreq3DIsoSurfaceLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessFreq3DIsoSurfaceLabel.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessFreq3DIsoSurfaceLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessFreq3DIsoSurfaceLabel.Text = 'Surface:';

% Create UPVRobotPostProcessFreq3DIsoSmoothCheckBox
app.ExtUI.UPVRobotPostProcessFreq3DIsoSmoothCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessFreq3DIsoGrid);
app.ExtUI.UPVRobotPostProcessFreq3DIsoSmoothCheckBox.Text = 'Smooth';
app.ExtUI.UPVRobotPostProcessFreq3DIsoSmoothCheckBox.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessFreq3DIsoSmoothCheckBox.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessFreq3DIsoSmoothCheckBox.Value = 0;
app.ExtUI.UPVRobotPostProcessFreq3DIsoSmoothCheckBox.ValueChangedFcn = {@UPVRobotPostProcessViewParamFreq3DISOParamChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.FISOSmooth)
    app.ExtUI.UPVRobotPostProcessFreq3DIsoSmoothCheckBox.Value = app.ExtVar.UPVRobotPostProcess.FISOSmooth;
else
    app.ExtVar.UPVRobotPostProcess.FISOSmooth = app.ExtUI.UPVRobotPostProcessFreq3DIsoSmoothCheckBox.Value;
end

% Create UPVRobotPostProcessFreq3DIsoViewLabel
app.ExtUI.UPVRobotPostProcessFreq3DIsoViewLabel = uilabel(app.ExtUI.UPVRobotPostProcessFreq3DIsoGrid);
app.ExtUI.UPVRobotPostProcessFreq3DIsoViewLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessFreq3DIsoViewLabel.Layout.Row = 5;
app.ExtUI.UPVRobotPostProcessFreq3DIsoViewLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessFreq3DIsoViewLabel.Text = 'View:';

% Create UPVRobotPostProcessFreq3DIsoPointsCheckBox
app.ExtUI.UPVRobotPostProcessFreq3DIsoPointsCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessFreq3DIsoGrid);
app.ExtUI.UPVRobotPostProcessFreq3DIsoPointsCheckBox.ValueChangedFcn = {@UPVRobotPostProcessViewParamFreq3DVIEWPointChanged,app};
app.ExtUI.UPVRobotPostProcessFreq3DIsoPointsCheckBox.Text = 'Points';
app.ExtUI.UPVRobotPostProcessFreq3DIsoPointsCheckBox.Layout.Row = 5;
app.ExtUI.UPVRobotPostProcessFreq3DIsoPointsCheckBox.Layout.Column = 2;
if ~isempty(app.ExtVar.UPVRobotPostProcess.ViewPoints)
    app.ExtUI.UPVRobotPostProcessFreq3DIsoPointsCheckBox.Value = app.ExtVar.UPVRobotPostProcess.ViewPoints;
else
    app.ExtVar.UPVRobotPostProcess.ViewPoints = app.ExtUI.UPVRobotPostProcessFreq3DIsoPointsCheckBox.Value;
end

% Create UPVRobotPostProcessFreq3DIsoLightCheckBox
app.ExtUI.UPVRobotPostProcessFreq3DIsoLightCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessFreq3DIsoGrid);
app.ExtUI.UPVRobotPostProcessFreq3DIsoLightCheckBox.Text = 'Light';
app.ExtUI.UPVRobotPostProcessFreq3DIsoLightCheckBox.Layout.Row = 5;
app.ExtUI.UPVRobotPostProcessFreq3DIsoLightCheckBox.Layout.Column = 3;
app.ExtUI.UPVRobotPostProcessFreq3DIsoLightCheckBox.Value = 0;
app.ExtUI.UPVRobotPostProcessFreq3DIsoLightCheckBox.ValueChangedFcn = {@UPVRobotPostProcessViewParamFreq3DISOParamChanged,app};

if ~isempty(app.ExtVar.UPVRobotPostProcess.ViewLight)
    app.ExtUI.UPVRobotPostProcessFreq3DIsoLightCheckBox.Value = app.ExtVar.UPVRobotPostProcess.ViewLight;
else
    app.ExtVar.UPVRobotPostProcess.ViewLight = app.ExtUI.UPVRobotPostProcessFreq3DIsoLightCheckBox.Value;
end

% Selected tab logic
if ~isempty(app.ExtVar.UPVRobotPostProcess.ViewType3D)
    idx = find(strcmp({app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3DTabs.Children.Title},app.ExtVar.UPVRobotPostProcess.ViewType3D), 1);
    if ~isempty(idx)
        app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3DTabs.SelectedTab = app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3DTabs.Children(idx);
    else
        app.ExtVar.UPVRobotPostProcess.ViewType3D = app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3DTabs.SelectedTab.Title;
    end
else
    app.ExtVar.UPVRobotPostProcess.ViewType3D = app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3DTabs.SelectedTab.Title;
end

% =============================================================================================================
% GENERAL
function UPVRobotPostProcessViewParamFREQChanged3D(~,~,app)
app.ExtVar.UPVRobotPostProcess.FreqView = app.ExtUI.UPVRobotPostProcessFrequencyHzEditFieldFreq3D.Value;
app.ExtVar.UPVRobotPostProcess.FreqMinRange = app.ExtUI.UPVRobotPostProcessMinrangeEditFieldFreq3D.Value;
app.ExtVar.UPVRobotPostProcess.FreqMaxRange = app.ExtUI.UPVRobotPostProcessMaxrangeEditFieldFreq3D.Value;
app.ExtVar.UPVRobotPostProcess.FreqColorAuto = app.ExtUI.UPVRobotPostProcessColorrangeautomaticCheckBoxFreq3D.Value;
if app.ExtVar.UPVRobotPostProcess.FreqColorAuto
    app.ExtUI.UPVRobotPostProcessMaxrangeEditFieldFreq3D.Enable = 'off';
    app.ExtUI.UPVRobotPostProcessMinrangeEditFieldFreq3D.Enable = 'off';
else
    app.ExtUI.UPVRobotPostProcessMaxrangeEditFieldFreq3D.Enable = 'on';
    app.ExtUI.UPVRobotPostProcessMinrangeEditFieldFreq3D.Enable = 'on';
end
UPVRobotPostProcessPlot(app)

function UPVRobotPostProcessViewParamFreq3DVIEWPointChanged(data,~,app)
app.ExtVar.UPVRobotPostProcess.ViewPoints = data.Value;
app.ExtUI.UPVRobotPostProcessFreq3D3SlicePointsCheckBox.Value = data.Value;
app.ExtUI.UPVRobotPostProcessFreq3DMultiPointsCheckBox.Value = data.Value;
app.ExtUI.UPVRobotPostProcessFreq3DIsoPointsCheckBox.Value = data.Value;
UPVRobotPostProcessPlot(app)

function UPVRobotPostProcessViewParamFreq3DVIEWBoundaryChanged(data,~,app)
app.ExtVar.UPVRobotPostProcess.ViewBoundary = data.Value;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceBoundaryCheckBox.Value = data.Value;
app.ExtUI.UPVRobotPostProcessFreq3DMultiBoundaryCheckBox.Value = data.Value;
UPVRobotPostProcessPlot(app)

function UPVRobotPostProcessViewParamFreq3DVIEWLightChanged(data,~,app)
app.ExtVar.UPVRobotPostProcess.ViewLight = data.Value;
app.ExtUI.UPVRobotPostProcessFreq3D3SliceLightCheckBox.Value = data.Value;
app.ExtUI.UPVRobotPostProcessFreq3DMultiLightCheckBox.Value = data.Value;
UPVRobotPostProcessPlot(app)

function UPVRobotPostProcessFreq3DViewTabChanged(~,~,app)
app.ExtVar.UPVRobotPostProcess.ViewType3D = app.ExtUI.UPVRobotPostProcessDParametersPanelFreq3DTabs.SelectedTab.Title;
switch lower(app.ExtVar.UPVRobotPostProcess.ViewType3D)
    case '3 slice'
        
    case 'multi'
        
    case 'iso'
        
end
UPVRobotPostProcessPlot(app)

% =============================================================================================================
% 3 slices
function UPVRobotPostProcessFreq3DXYsliderMoving(event,app)
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXYSliceSlider.Value = event.Value;
app.ExtVar.UPVRobotPostProcess.XYsliderValue = event.Value;
UPVRobotPostProcessFreq3DUpdateSlicesSlider(app)

function UPVRobotPostProcessFreq3DXZsliderMoving(event,app)
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXZSliceSlider.Value = event.Value;
app.ExtVar.UPVRobotPostProcess.XZsliderValue = event.Value;
UPVRobotPostProcessFreq3DUpdateSlicesSlider(app)

function UPVRobotPostProcessFreq3DYZsliderMoving(event,app)
app.ExtUI.UPVRobotPostProcessFreq3D3SliceYZSliceSlider.Value = event.Value;
app.ExtVar.UPVRobotPostProcess.YZsliderValue = event.Value;
UPVRobotPostProcessFreq3DUpdateSlicesSlider(app)

function UPVRobotPostProcessFreq3DUpdateSlicesSlider(app)

% ===========================================
% Get sliders values
zslice = app.ExtVar.UPVRobotPostProcess.XYsliderValue;
yslice = app.ExtVar.UPVRobotPostProcess.XZsliderValue;
xslice = app.ExtVar.UPVRobotPostProcess.YZsliderValue;

% ===========================================
% Update position info
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXYSliceSliderZInfo.Text = ['Z = ',num2str(zslice,'%.2f')];
app.ExtUI.UPVRobotPostProcessFreq3D3SliceXZSliceSliderYInfo.Text = ['Y = ',num2str(yslice,'%.2f')];
app.ExtUI.UPVRobotPostProcessFreq3D3SliceYZSliceSliderXInfo.Text = ['X = ',num2str(xslice,'%.2f')];

% ===========================================
% Get data
coords = app.ExtVar.UPVRobotPostProcess.Coords;
x = coords(:,1);
y = coords(:,2);
z = coords(:,3);

X = app.ExtVar.UPVRobotPostProcess.Mesh.Xmatrix;
Y = app.ExtVar.UPVRobotPostProcess.Mesh.Ymatrix;
Z = app.ExtVar.UPVRobotPostProcess.Mesh.Zmatrix;

f = app.ExtVar.UPVRobotPostProcess.FreqVec.Data;
FreqView = app.ExtVar.UPVRobotPostProcess.FreqView;
% Locate selected frequency
idxF = find(f>=FreqView,1,'first');
% Load from .mat if selected new frequency, else work with data in workspace
if  isempty(app.ExtVar.UPVRobotPostProcess.Single_FreqIndex)
    app.ExtVar.UPVRobotPostProcess.Single_FreqIndex = idxF;
end
if idxF ~= app.ExtVar.UPVRobotPostProcess.Single_FreqIndex || isempty(app.ExtVar.UPVRobotPostProcess.PointsSPL_SingleFreq)
    app.ExtVar.UPVRobotPostProcess.Single_FreqIndex = idxF;
    app.ExtVar.UPVRobotPostProcess.PointsSPL_SingleFreq = app.ExtVar.UPVRobotPostProcess.FreqResp.Data(idxF,:);
end

% ===========================================
% Get response for selected frequency
%freqResp = app.ExtVar.UPVRobotPostProcess.PointsSPL_SingleFreq;
FL = scatteredInterpolant(x(:),y(:),z(:),app.ExtVar.UPVRobotPostProcess.PointsSPL_SingleFreq(:));
Zb = FL(X,Y,Z);

% ===========================================
% Hidden figure to get data
fig = figure("Visible",false);
sl = slice(X,Y,Z,20*log10(abs(Zb)/2e-5),xslice,yslice,zslice,'linear');

% ===========================================
% Update plot
for i = 1:numel(app.ExtVar.UPVRobotPostProcess.SlicesPlot)
    % Move Slices
    set(app.ExtVar.UPVRobotPostProcess.SlicesPlot(i),...
        'XData',sl(i).XData,'YData',sl(i).YData,'ZData',sl(i).ZData,'CData',sl(i).CData)
    
    % Move Boundary
    if app.ExtVar.UPVRobotPostProcess.ViewBoundary
        xx = app.ExtVar.UPVRobotPostProcess.SlicesPlot(i).XData;
        yy = app.ExtVar.UPVRobotPostProcess.SlicesPlot(i).YData;
        zz = app.ExtVar.UPVRobotPostProcess.SlicesPlot(i).ZData;
        if numel(unique(xx)) == 1 % YZ slice
            k = boundary([yy(:),zz(:)],0.8);
            set(app.ExtVar.UPVRobotPostProcess.SlicesBoundary{i} ,'XData',xx(k),'YData',yy(k),'ZData',zz(k))
        elseif numel(unique(yy)) == 1 % XZ slice
            k = boundary([xx(:),zz(:)],0.8);
            set(app.ExtVar.UPVRobotPostProcess.SlicesBoundary{i} ,'XData',xx(k),'YData',yy(k),'ZData',zz(k))
        elseif numel(unique(zz)) == 1 % XY slice
            k = boundary([xx(:),yy(:)],0.8);
            set(app.ExtVar.UPVRobotPostProcess.SlicesBoundary{i} ,'XData',xx(k),'YData',yy(k),'ZData',zz(k))
        end
    end
end

% ===========================================
% Delete hidden fig
delete(fig)

% =============================================================================================================
% MULTI
function UPVRobotPostProcessViewParamXYSlicesChanged(~,~,app)
valuesSTR = app.ExtUI.UPVRobotPostProcessFreq3DMultiXYSlicesEditField.Value;
try
    values = cell2mat( textscan( valuesSTR,'%f,'));
    app.ExtVar.UPVRobotPostProcess.XYslicesValues = values';
catch
    app.ExtVar.UPVRobotPostProcess.XYslicesValues = [];
end
UPVRobotPostProcessPlot(app)

function UPVRobotPostProcessViewParamXZSlicesChanged(~,~,app)
valuesSTR = app.ExtUI.UPVRobotPostProcessFreq3DMultiXZSlicesEditField.Value;
try
    values = cell2mat( textscan( valuesSTR,'%f,'));
    app.ExtVar.UPVRobotPostProcess.XZslicesValues = values(:)';
catch
    app.ExtVar.UPVRobotPostProcess.XZslicesValues = [];
end
UPVRobotPostProcessPlot(app)

function UPVRobotPostProcessViewParamYZSlicesChanged(~,~,app)
valuesSTR = app.ExtUI.UPVRobotPostProcessFreq3DMultiYZSlicesEditField.Value;
try
    values = cell2mat( textscan( valuesSTR,'%f,'));
    app.ExtVar.UPVRobotPostProcess.YZslicesValues = values(:)';
catch
    app.ExtVar.UPVRobotPostProcess.YZslicesValues = [];
end
UPVRobotPostProcessPlot(app)

% =============================================================================================================
% ISO
function UPVRobotPostProcessViewParamFreq3DISOParamChanged(~,~,app)
app.ExtVar.UPVRobotPostProcess.FISOvalue = app.ExtUI.UPVRobotPostProcessFreq3DIsoSPLdBEditField.Value;
app.ExtVar.UPVRobotPostProcess.FISOLower = app.ExtUI.UPVRobotPostProcessFreq3DIsolowerCheckBox.Value;
app.ExtVar.UPVRobotPostProcess.FISOUpper = app.ExtUI.UPVRobotPostProcessFreq3DIsoupperCheckBox.Value;
app.ExtVar.UPVRobotPostProcess.FISOSmooth = app.ExtUI.UPVRobotPostProcessFreq3DIsoSmoothCheckBox.Value;
app.ExtVar.UPVRobotPostProcess.ViewLight = app.ExtUI.UPVRobotPostProcessFreq3DIsoLightCheckBox.Value;
UPVRobotPostProcessPlot(app)

% =============================================================================================================
% EXPORT
function UPVRobotPostProcessFreq3DExportGraphic(~,~,app)
name = sprintf('Frequency Response 3D - %s type at %.0f Hz',app.ExtVar.UPVRobotPostProcess.ViewType3D,app.ExtVar.UPVRobotPostProcess.FreqView);
axes = app.ExtUI.UPVRobotPostProcessUIAxesFreq3D;
exportPlot(axes,name)

function UPVRobotPostProcessFreq3DExportData(~,~,app)
switch lower(app.ExtVar.UPVRobotPostProcess.ViewType3D)
    case {'3 slice','multi'}
        name = sprintf('Frequency Response 3D - %s type at %.0f Hz',app.ExtVar.UPVRobotPostProcess.ViewType3D,app.ExtVar.UPVRobotPostProcess.FreqView);
    case 'iso'
        name = sprintf('Frequency Response 3D - %s type at %.0f Hz and %.1f dBSPL',...
            app.ExtVar.UPVRobotPostProcess.ViewType3D,app.ExtVar.UPVRobotPostProcess.FreqView,app.ExtVar.UPVRobotPostProcess.FISOvalue);
end

% Name and path selection
[filename, pathname] = uiputfile({'*.txt','Tabulated text file (*.txt)'},'Save data',[name,'.txt']);
if filename==0; return; end

switch lower(app.ExtVar.UPVRobotPostProcess.ViewType3D)
    case {'3 slice','multi'}
        plot = app.ExtVar.UPVRobotPostProcess.SlicesPlot;
        
        for i = 1:numel(plot) % Slices
            % Data
            X = plot(i).XData; X = X(:);
            Y = plot(i).YData; Y = Y(:);
            Z = plot(i).ZData; Z = Z(:);
            SPL = plot(i).CData; SPL = SPL(:);
            
            % Create table
            T = table(X,Y,Z,SPL,'VariableNames',{'X [m]','Y [m]','Z [m]','SPL [dB]'});
            
            if endsWith(filename,'.txt')
                filenamen = [filename(1:end-4),'-Slice',num2str(i),'.txt'];
            else
                filenamen = [filename,'-Slice',num2str(i),'.txt'];
            end
            writetable(T,[pathname,filenamen],'Delimiter','\t')
        end
    case 'iso'
        plot = app.ExtVar.UPVRobotPostProcess.ISOsurf;
        
        % Data
        X = plot.XData; X = X(:);
        Y = plot.YData; Y = Y(:);
        Z = plot.ZData; Z = Z(:);
        
        % Create table
        T = table(X,Y,Z,'VariableNames',{'X [m]','Y [m]','Z [m]'});
        
        if ~endsWith(filename,'.txt'); filename = [filename,'.txt']; end
        writetable(T,[pathname,filename],'Delimiter','\t')
end

