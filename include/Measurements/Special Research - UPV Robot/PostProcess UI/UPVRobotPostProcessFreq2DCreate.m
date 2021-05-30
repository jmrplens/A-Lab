function UPVRobotPostProcessFreq2DCreate(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% ===============================================
% BOTTOM GRID FOR VIEW, 2D PARAMETERS AND EXPORT PANELS

% Create GridUPVRobotPostProcessBottomCenterGrid
app.ExtUI.GridUPVRobotPostProcessBottomCenterGrid = uigridlayout(app.ExtUI.GridCenterMain);
app.ExtUI.GridUPVRobotPostProcessBottomCenterGrid.ColumnWidth = {'fit', '1x', '0.5x'};
app.ExtUI.GridUPVRobotPostProcessBottomCenterGrid.RowHeight = {'1x'};
app.ExtUI.GridUPVRobotPostProcessBottomCenterGrid.Layout.Row = 2;
app.ExtUI.GridUPVRobotPostProcessBottomCenterGrid.Layout.Column = 1;
app.ExtUI.GridUPVRobotPostProcessBottomCenterGrid.BackgroundColor = [1 1 1];

% ===============================================
% VIEW PARAMETERS

% Create UPVRobotPostProcessViewParametersPanel
app.ExtUI.UPVRobotPostProcessViewParametersPanel = uipanel(app.ExtUI.GridUPVRobotPostProcessBottomCenterGrid);
app.ExtUI.UPVRobotPostProcessViewParametersPanel.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessViewParametersPanel.TitlePosition = 'centertop';
app.ExtUI.UPVRobotPostProcessViewParametersPanel.Title = 'View parameters';
app.ExtUI.UPVRobotPostProcessViewParametersPanel.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotPostProcessViewParametersPanel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessViewParametersPanel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessViewParametersPanel.FontWeight = 'bold';

% Create UPVRobotPostProcessViewParametersGrid
app.ExtUI.UPVRobotPostProcessViewParametersGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessViewParametersPanel);
app.ExtUI.UPVRobotPostProcessViewParametersGrid.ColumnWidth = {'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessViewParametersGrid.RowHeight = {'fit', 'fit', 'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessViewParametersGrid.BackgroundColor = [1 1 1];

% Create FrequencyHzEditFieldLabel
app.ExtUI.FrequencyHzEditFieldLabel = uilabel(app.ExtUI.UPVRobotPostProcessViewParametersGrid);
app.ExtUI.FrequencyHzEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.FrequencyHzEditFieldLabel.Layout.Row = 1;
app.ExtUI.FrequencyHzEditFieldLabel.Layout.Column = 1;
app.ExtUI.FrequencyHzEditFieldLabel.Text = 'Frequency (Hz)';

% Create UPVRobotPostProcessFrequencyHzEditField
app.ExtUI.UPVRobotPostProcessFrequencyHzEditField = uieditfield(app.ExtUI.UPVRobotPostProcessViewParametersGrid, 'numeric');
app.ExtUI.UPVRobotPostProcessFrequencyHzEditField.ValueChangedFcn = {@UPVRobotPostProcessViewParamFREQChanged,app};
app.ExtUI.UPVRobotPostProcessFrequencyHzEditField.Limits = [1 Inf];
app.ExtUI.UPVRobotPostProcessFrequencyHzEditField.ValueDisplayFormat = '%g';
app.ExtUI.UPVRobotPostProcessFrequencyHzEditField.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFrequencyHzEditField.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessFrequencyHzEditField.Value = 500;
if ~isempty(app.ExtVar.UPVRobotPostProcess.FreqView)
    app.ExtUI.UPVRobotPostProcessFrequencyHzEditField.Value = app.ExtVar.UPVRobotPostProcess.FreqView;
else
    app.ExtVar.UPVRobotPostProcess.FreqView = app.ExtUI.UPVRobotPostProcessFrequencyHzEditField.Value;
end

% Create UPVRobotPostProcessColorrangeautomaticCheckBox
app.ExtUI.UPVRobotPostProcessColorrangeautomaticCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessViewParametersGrid);
app.ExtUI.UPVRobotPostProcessColorrangeautomaticCheckBox.Text = 'Color range automatic';
app.ExtUI.UPVRobotPostProcessColorrangeautomaticCheckBox.ValueChangedFcn = {@UPVRobotPostProcessViewParamFREQChanged,app};
app.ExtUI.UPVRobotPostProcessColorrangeautomaticCheckBox.WordWrap = 'on';
app.ExtUI.UPVRobotPostProcessColorrangeautomaticCheckBox.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessColorrangeautomaticCheckBox.Layout.Column = [1 2];
app.ExtUI.UPVRobotPostProcessColorrangeautomaticCheckBox.Value = true;
if ~isempty(app.ExtVar.UPVRobotPostProcess.FreqColorAuto)
    app.ExtUI.UPVRobotPostProcessColorrangeautomaticCheckBox.Value = app.ExtVar.UPVRobotPostProcess.FreqColorAuto;
else
    app.ExtVar.UPVRobotPostProcess.FreqColorAuto = app.ExtUI.UPVRobotPostProcessColorrangeautomaticCheckBox.Value;
end

% Create MinrangeEditFieldLabel
app.ExtUI.MinrangeEditFieldLabel = uilabel(app.ExtUI.UPVRobotPostProcessViewParametersGrid);
app.ExtUI.MinrangeEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.MinrangeEditFieldLabel.Layout.Row = 3;
app.ExtUI.MinrangeEditFieldLabel.Layout.Column = 1;
app.ExtUI.MinrangeEditFieldLabel.Text = 'Min range';

% Create UPVRobotPostProcessMinrangeEditField
app.ExtUI.UPVRobotPostProcessMinrangeEditField = uieditfield(app.ExtUI.UPVRobotPostProcessViewParametersGrid, 'numeric');
app.ExtUI.UPVRobotPostProcessMinrangeEditField.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessMinrangeEditField.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessMinrangeEditField.Value = 70;
app.ExtUI.UPVRobotPostProcessMinrangeEditField.ValueChangedFcn = {@UPVRobotPostProcessViewParamFREQChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.FreqMinRange)
    app.ExtUI.UPVRobotPostProcessMinrangeEditField.Value = app.ExtVar.UPVRobotPostProcess.FreqMinRange;
else
    app.ExtVar.UPVRobotPostProcess.FreqMinRange = app.ExtUI.UPVRobotPostProcessMinrangeEditField.Value;
end

% Create MaxrangeEditFieldLabel
app.ExtUI.MaxrangeEditFieldLabel = uilabel(app.ExtUI.UPVRobotPostProcessViewParametersGrid);
app.ExtUI.MaxrangeEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.MaxrangeEditFieldLabel.Layout.Row = 4;
app.ExtUI.MaxrangeEditFieldLabel.Layout.Column = 1;
app.ExtUI.MaxrangeEditFieldLabel.Text = 'Max range';

% Create UPVRobotPostProcessMaxrangeEditField
app.ExtUI.UPVRobotPostProcessMaxrangeEditField = uieditfield(app.ExtUI.UPVRobotPostProcessViewParametersGrid, 'numeric');
app.ExtUI.UPVRobotPostProcessMaxrangeEditField.Layout.Row = 4;
app.ExtUI.UPVRobotPostProcessMaxrangeEditField.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessMaxrangeEditField.Value = 100;
app.ExtUI.UPVRobotPostProcessMaxrangeEditField.ValueChangedFcn = {@UPVRobotPostProcessViewParamFREQChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.FreqMaxRange)
    app.ExtUI.UPVRobotPostProcessMaxrangeEditField.Value = app.ExtVar.UPVRobotPostProcess.FreqMaxRange;
else
    app.ExtVar.UPVRobotPostProcess.FreqMaxRange = app.ExtUI.UPVRobotPostProcessMaxrangeEditField.Value;
end

% Logics Freq range
if app.ExtVar.UPVRobotPostProcess.FreqColorAuto
    app.ExtUI.UPVRobotPostProcessMaxrangeEditField.Enable = 'off';
    app.ExtUI.UPVRobotPostProcessMinrangeEditField.Enable = 'off';
else
    app.ExtUI.UPVRobotPostProcessMaxrangeEditField.Enable = 'on';
    app.ExtUI.UPVRobotPostProcessMinrangeEditField.Enable = 'on';
end


% ===============================================
% EXPORT PANEL

% Create UPVRobotPostProcessExportPanel
app.ExtUI.UPVRobotPostProcessExportPanel = uipanel(app.ExtUI.GridUPVRobotPostProcessBottomCenterGrid);
app.ExtUI.UPVRobotPostProcessExportPanel.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessExportPanel.Title = 'Export';
app.ExtUI.UPVRobotPostProcessExportPanel.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotPostProcessExportPanel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessExportPanel.Layout.Column = 3;
app.ExtUI.UPVRobotPostProcessExportPanel.FontWeight = 'bold';

% Create UPVRobotPostProcessExportGrid
app.ExtUI.UPVRobotPostProcessExportGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessExportPanel);
app.ExtUI.UPVRobotPostProcessExportGrid.ColumnWidth = {'1x'};
app.ExtUI.UPVRobotPostProcessExportGrid.RowHeight = {'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessExportGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessExportGraphicButton
app.ExtUI.UPVRobotPostProcessExportGraphicButton = uibutton(app.ExtUI.UPVRobotPostProcessExportGrid, 'push');
app.ExtUI.UPVRobotPostProcessExportGraphicButton.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessExportGraphicButton.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessExportGraphicButton.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessExportGraphicButton.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessExportGraphicButton.Text = 'Graphic';
app.ExtUI.UPVRobotPostProcessExportGraphicButton.ButtonPushedFcn = {@UPVRobotPostProcessFreq2DExportGraphic,app};

% Create UPVRobotPostProcessExportDataButton
app.ExtUI.UPVRobotPostProcessExportDataButton = uibutton(app.ExtUI.UPVRobotPostProcessExportGrid, 'push');
app.ExtUI.UPVRobotPostProcessExportDataButton.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessExportDataButton.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessExportDataButton.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessExportDataButton.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessExportDataButton.Text = 'Data';
app.ExtUI.UPVRobotPostProcessExportDataButton.ButtonPushedFcn = {@UPVRobotPostProcessFreq2DExportData,app};


% ===============================================
% 2D PARAMETERS

% Create UPVRobotPostProcessDParametersPanel
app.ExtUI.UPVRobotPostProcessDParametersPanel = uipanel(app.ExtUI.GridUPVRobotPostProcessBottomCenterGrid);
app.ExtUI.UPVRobotPostProcessDParametersPanel.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessDParametersPanel.Title = '2D Parameters';
app.ExtUI.UPVRobotPostProcessDParametersPanel.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotPostProcessDParametersPanel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDParametersPanel.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessDParametersPanel.FontWeight = 'bold';

% app.ExtUI.UPVRobotPostProcessButtonAxesXY.Visible = 'off';
% app.ExtUI.UPVRobotPostProcessButtonAxesXZ.Visible = 'off';
% app.ExtUI.UPVRobotPostProcessButtonAxesYZ.Visible = 'off';
% app.ExtUI.UPVRobotPostProcessButtonAxes3D.Visible = 'off';

% Create UPVRobotPostProcessDParametersGrid
app.ExtUI.UPVRobotPostProcessDParametersGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessDParametersPanel);
app.ExtUI.UPVRobotPostProcessDParametersGrid.ColumnWidth = {'1x', 'fit', '0.5x'};
app.ExtUI.UPVRobotPostProcessDParametersGrid.RowHeight = {'1x', '1x', '1x', '1x'};
app.ExtUI.UPVRobotPostProcessDParametersGrid.BackgroundColor = [1 1 1];

% Create ZvaluemLabel
app.ExtUI.ZvaluemLabel = uilabel(app.ExtUI.UPVRobotPostProcessDParametersGrid);
app.ExtUI.ZvaluemLabel.HorizontalAlignment = 'right';
app.ExtUI.ZvaluemLabel.Layout.Row = 2;
app.ExtUI.ZvaluemLabel.Layout.Column = 2;
app.ExtUI.ZvaluemLabel.Text = 'Z value (m)';

% coords
coords = app.ExtVar.UPVRobotPostProcess.Coords;
x = coords(:,1);
y = coords(:,2);
z = coords(:,3);

% Create UPVRobotPostProcessDParametersZvalueEditField
app.ExtUI.UPVRobotPostProcessDParametersZvalueEditField = uieditfield(app.ExtUI.UPVRobotPostProcessDParametersGrid, 'numeric');
app.ExtUI.UPVRobotPostProcessDParametersZvalueEditField.Limits = app.ExtVar.UPVRobotPostProcess.DefaultLim(3,:);
app.ExtUI.UPVRobotPostProcessDParametersZvalueEditField.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessDParametersZvalueEditField.Layout.Column = 3;
app.ExtUI.UPVRobotPostProcessDParametersZvalueEditField.ValueChangedFcn = {@UPVRobotPostProcessViewParamSLICEValueChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.SliceXY_Zvalue)
    app.ExtUI.UPVRobotPostProcessDParametersZvalueEditField.Value = app.ExtVar.UPVRobotPostProcess.SliceXY_Zvalue;
else
    app.ExtVar.UPVRobotPostProcess.SliceXY_Zvalue = app.ExtUI.UPVRobotPostProcessDParametersZvalueEditField.Value;
end

if sum(z == app.ExtVar.UPVRobotPostProcess.SliceXY_Zvalue) == 0
    app.ExtVar.UPVRobotPostProcess.SliceXY_Zvalue = z(1);
    app.ExtUI.UPVRobotPostProcessDParametersZvalueEditField.Value = z(1);
end

% Create YvaluemLabel
app.ExtUI.YvaluemLabel = uilabel(app.ExtUI.UPVRobotPostProcessDParametersGrid);
app.ExtUI.YvaluemLabel.HorizontalAlignment = 'right';
app.ExtUI.YvaluemLabel.Layout.Row = 3;
app.ExtUI.YvaluemLabel.Layout.Column = 2;
app.ExtUI.YvaluemLabel.Text = 'Y value (m)';

% Create UPVRobotPostProcessDParametersYvalueEditField
app.ExtUI.UPVRobotPostProcessDParametersYvalueEditField = uieditfield(app.ExtUI.UPVRobotPostProcessDParametersGrid, 'numeric');
app.ExtUI.UPVRobotPostProcessDParametersYvalueEditField.Limits = app.ExtVar.UPVRobotPostProcess.DefaultLim(2,:);
app.ExtUI.UPVRobotPostProcessDParametersYvalueEditField.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessDParametersYvalueEditField.Layout.Column = 3;
app.ExtUI.UPVRobotPostProcessDParametersYvalueEditField.ValueChangedFcn = {@UPVRobotPostProcessViewParamSLICEValueChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.SliceXZ_Yvalue)
    app.ExtUI.UPVRobotPostProcessDParametersYvalueEditField.Value = app.ExtVar.UPVRobotPostProcess.SliceXZ_Yvalue;
else
    app.ExtVar.UPVRobotPostProcess.SliceXZ_Yvalue = app.ExtUI.UPVRobotPostProcessDParametersYvalueEditField.Value;
end

if sum(y == app.ExtVar.UPVRobotPostProcess.SliceXZ_Yvalue) == 0
    app.ExtVar.UPVRobotPostProcess.SliceXZ_Yvalue = y(1);
    app.ExtUI.UPVRobotPostProcessDParametersYvalueEditField.Value = y(1);
end

% Create XvaluemLabel
app.ExtUI.XvaluemLabel = uilabel(app.ExtUI.UPVRobotPostProcessDParametersGrid);
app.ExtUI.XvaluemLabel.HorizontalAlignment = 'right';
app.ExtUI.XvaluemLabel.Layout.Row = 4;
app.ExtUI.XvaluemLabel.Layout.Column = 2;
app.ExtUI.XvaluemLabel.Text = 'X value (m)';

% Create UPVRobotPostProcessDParametersXvalueEditField
app.ExtUI.UPVRobotPostProcessDParametersXvalueEditField = uieditfield(app.ExtUI.UPVRobotPostProcessDParametersGrid, 'numeric');
app.ExtUI.UPVRobotPostProcessDParametersXvalueEditField.Limits = app.ExtVar.UPVRobotPostProcess.DefaultLim(1,:);
app.ExtUI.UPVRobotPostProcessDParametersXvalueEditField.Layout.Row = 4;
app.ExtUI.UPVRobotPostProcessDParametersXvalueEditField.Layout.Column = 3;
app.ExtUI.UPVRobotPostProcessDParametersXvalueEditField.ValueChangedFcn = {@UPVRobotPostProcessViewParamSLICEValueChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.SliceYZ_Xvalue)
    app.ExtUI.UPVRobotPostProcessDParametersXvalueEditField.Value = app.ExtVar.UPVRobotPostProcess.SliceYZ_Xvalue;
else
    app.ExtVar.UPVRobotPostProcess.SliceYZ_Xvalue = app.ExtUI.UPVRobotPostProcessDParametersXvalueEditField.Value;
end

if sum(x == app.ExtVar.UPVRobotPostProcess.SliceYZ_Xvalue) == 0
    app.ExtVar.UPVRobotPostProcess.SliceYZ_Xvalue = x(1);
    app.ExtUI.UPVRobotPostProcessDParametersXvalueEditField.Value = x(1);
end

% Create UPVRobotPostProcessDParametersSliceXYCheck
app.ExtUI.UPVRobotPostProcessDParametersSliceXYCheck = uicheckbox(app.ExtUI.UPVRobotPostProcessDParametersGrid);
app.ExtUI.UPVRobotPostProcessDParametersSliceXYCheck.Text = 'Slice XY';
app.ExtUI.UPVRobotPostProcessDParametersSliceXYCheck.ValueChangedFcn = {@UPVRobotPostProcessViewParamSLICEXYChanged,app};
app.ExtUI.UPVRobotPostProcessDParametersSliceXYCheck.WordWrap = 'on';
app.ExtUI.UPVRobotPostProcessDParametersSliceXYCheck.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessDParametersSliceXYCheck.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessDParametersSliceXYCheck.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDParametersSliceXYCheck.Value = true;

% Create UPVRobotPostProcessDParametersSliceXZCheck
app.ExtUI.UPVRobotPostProcessDParametersSliceXZCheck = uicheckbox(app.ExtUI.UPVRobotPostProcessDParametersGrid);
app.ExtUI.UPVRobotPostProcessDParametersSliceXZCheck.Text = 'Slice XZ';
app.ExtUI.UPVRobotPostProcessDParametersSliceXZCheck.ValueChangedFcn = {@UPVRobotPostProcessViewParamSLICEXZChanged,app};
app.ExtUI.UPVRobotPostProcessDParametersSliceXZCheck.WordWrap = 'on';
app.ExtUI.UPVRobotPostProcessDParametersSliceXZCheck.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessDParametersSliceXZCheck.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessDParametersSliceXZCheck.Layout.Column = 1;

% Create UPVRobotPostProcessDParametersSliceYZCheck
app.ExtUI.UPVRobotPostProcessDParametersSliceYZCheck = uicheckbox(app.ExtUI.UPVRobotPostProcessDParametersGrid);
app.ExtUI.UPVRobotPostProcessDParametersSliceYZCheck.Text = 'Slice YZ';
app.ExtUI.UPVRobotPostProcessDParametersSliceYZCheck.ValueChangedFcn = {@UPVRobotPostProcessViewParamSLICEYZChanged,app};
app.ExtUI.UPVRobotPostProcessDParametersSliceYZCheck.WordWrap = 'on';
app.ExtUI.UPVRobotPostProcessDParametersSliceYZCheck.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessDParametersSliceYZCheck.Layout.Row = 4;
app.ExtUI.UPVRobotPostProcessDParametersSliceYZCheck.Layout.Column = 1;

% Default
app.ExtUI.UPVRobotPostProcessDParametersSliceXYCheck.Value = true;
app.ExtUI.UPVRobotPostProcessDParametersSliceXZCheck.Value = false;
app.ExtUI.UPVRobotPostProcessDParametersSliceYZCheck.Value = false;
app.ExtUI.UPVRobotPostProcessDParametersZvalueEditField.Enable = 'on';
app.ExtUI.UPVRobotPostProcessDParametersYvalueEditField.Enable = 'off';
app.ExtUI.UPVRobotPostProcessDParametersXvalueEditField.Enable = 'off';

if ~isempty(app.ExtVar.UPVRobotPostProcess.Slice2DType)
    switch app.ExtVar.UPVRobotPostProcess.Slice2DType
        case 'XY'
            % Default
        case 'XZ'
            app.ExtUI.UPVRobotPostProcessDParametersSliceXZCheck.Value = true;
            app.ExtUI.UPVRobotPostProcessDParametersSliceXYCheck.Value = false;
            app.ExtUI.UPVRobotPostProcessDParametersSliceYZCheck.Value = false;
            app.ExtUI.UPVRobotPostProcessDParametersZvalueEditField.Enable = 'off';
            app.ExtUI.UPVRobotPostProcessDParametersYvalueEditField.Enable = 'on';
            app.ExtUI.UPVRobotPostProcessDParametersXvalueEditField.Enable = 'off';
        case 'YZ'
            app.ExtUI.UPVRobotPostProcessDParametersSliceYZCheck.Value = true;
            app.ExtUI.UPVRobotPostProcessDParametersSliceXZCheck.Value = false;
            app.ExtUI.UPVRobotPostProcessDParametersSliceXYCheck.Value = false;
            app.ExtUI.UPVRobotPostProcessDParametersZvalueEditField.Enable = 'off';
            app.ExtUI.UPVRobotPostProcessDParametersYvalueEditField.Enable = 'off';
            app.ExtUI.UPVRobotPostProcessDParametersXvalueEditField.Enable = 'on';
    end
else
    app.ExtVar.UPVRobotPostProcess.Slice2DType = 'XY';
end

% Check dimension
coords = app.ExtVar.UPVRobotPostProcess.Coords;
nx = numel(unique(coords(:,1)));
ny = numel(unique(coords(:,2)));
nz = numel(unique(coords(:,3)));

if nz == 1 || ny == 1 || nx == 1
    app.ExtUI.UPVRobotPostProcessDParametersSliceYZCheck.Value = false;
    app.ExtUI.UPVRobotPostProcessDParametersSliceXZCheck.Value = false;
    app.ExtUI.UPVRobotPostProcessDParametersSliceXYCheck.Value = false;
    app.ExtUI.UPVRobotPostProcessDParametersSliceYZCheck.Enable = 'off';
    app.ExtUI.UPVRobotPostProcessDParametersSliceXZCheck.Enable = 'off';
    app.ExtUI.UPVRobotPostProcessDParametersSliceXYCheck.Enable = 'off';
    app.ExtUI.UPVRobotPostProcessDParametersZvalueEditField.Enable = 'off';
    app.ExtUI.UPVRobotPostProcessDParametersYvalueEditField.Enable = 'off';
    app.ExtUI.UPVRobotPostProcessDParametersXvalueEditField.Enable = 'off';
    if nz == 1
        app.ExtUI.UPVRobotPostProcessDParametersSliceXYCheck.Value = true;
        app.ExtUI.UPVRobotPostProcessDParametersZvalueEditField.Value = coords(1,3);
        app.ExtVar.UPVRobotPostProcess.Slice2DType = 'XY';
    elseif ny == 1
        app.ExtUI.UPVRobotPostProcessDParametersSliceXZCheck.Value = true;
        app.ExtUI.UPVRobotPostProcessDParametersYvalueEditField.Value = coords(1,2);
        app.ExtVar.UPVRobotPostProcess.Slice2DType = 'XZ';
    elseif nx == 1
        app.ExtUI.UPVRobotPostProcessDParametersSliceYZCheck.Value = true;
        app.ExtUI.UPVRobotPostProcessDParametersXvalueEditField.Value = coords(1,1);
        app.ExtVar.UPVRobotPostProcess.Slice2DType = 'YZ';
    end
end


% Create UPVRobotPostProcessDParametersViewGrid
app.ExtUI.UPVRobotPostProcessDParametersViewGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessDParametersGrid);
app.ExtUI.UPVRobotPostProcessDParametersViewGrid.ColumnWidth = {'fit', 'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessDParametersViewGrid.RowHeight = {'1x'};
app.ExtUI.UPVRobotPostProcessDParametersViewGrid.Padding = [0 0 0 0];
app.ExtUI.UPVRobotPostProcessDParametersViewGrid.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDParametersViewGrid.Layout.Column = [1 3];
app.ExtUI.UPVRobotPostProcessDParametersViewGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessDParametersViewLabel
app.ExtUI.UPVRobotPostProcessDParametersViewLabel = uilabel(app.ExtUI.UPVRobotPostProcessDParametersViewGrid);
app.ExtUI.UPVRobotPostProcessDParametersViewLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotPostProcessDParametersViewLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessDParametersViewLabel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDParametersViewLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDParametersViewLabel.Text = 'View:';

% Create UPVRobotPostProcessDParametersPointsCheckBox
app.ExtUI.UPVRobotPostProcessDParametersPointsCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessDParametersViewGrid);
app.ExtUI.UPVRobotPostProcessDParametersPointsCheckBox.Text = 'Points';
app.ExtUI.UPVRobotPostProcessDParametersPointsCheckBox.ValueChangedFcn = {@UPVRobotPostProcessViewParamVIEWChanged,app};
app.ExtUI.UPVRobotPostProcessDParametersPointsCheckBox.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDParametersPointsCheckBox.Layout.Column = 2;
if ~isempty(app.ExtVar.UPVRobotPostProcess.ViewPoints)
    app.ExtUI.UPVRobotPostProcessDParametersPointsCheckBox.Value = app.ExtVar.UPVRobotPostProcess.ViewPoints;
else
    app.ExtVar.UPVRobotPostProcess.ViewPoints = app.ExtUI.UPVRobotPostProcessDParametersPointsCheckBox.Value;
end

% Create UPVRobotPostProcessDParametersBoundaryCheckBox
app.ExtUI.UPVRobotPostProcessDParametersBoundaryCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessDParametersViewGrid);
app.ExtUI.UPVRobotPostProcessDParametersBoundaryCheckBox.Text = 'Boundary';
app.ExtUI.UPVRobotPostProcessDParametersBoundaryCheckBox.ValueChangedFcn = {@UPVRobotPostProcessViewParamVIEWChanged,app};
app.ExtUI.UPVRobotPostProcessDParametersBoundaryCheckBox.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDParametersBoundaryCheckBox.Layout.Column = 3;
if ~isempty(app.ExtVar.UPVRobotPostProcess.ViewBoundary)
    app.ExtUI.UPVRobotPostProcessDParametersBoundaryCheckBox.Value = app.ExtVar.UPVRobotPostProcess.ViewBoundary;
else
    app.ExtVar.UPVRobotPostProcess.ViewBoundary = app.ExtUI.UPVRobotPostProcessDParametersBoundaryCheckBox.Value;
end


% =============================================================================================================
function UPVRobotPostProcessViewParamFREQChanged(~,~,app)
app.ExtVar.UPVRobotPostProcess.FreqView = app.ExtUI.UPVRobotPostProcessFrequencyHzEditField.Value;
app.ExtVar.UPVRobotPostProcess.FreqMinRange = app.ExtUI.UPVRobotPostProcessMinrangeEditField.Value;
app.ExtVar.UPVRobotPostProcess.FreqMaxRange = app.ExtUI.UPVRobotPostProcessMaxrangeEditField.Value;
app.ExtVar.UPVRobotPostProcess.FreqColorAuto = app.ExtUI.UPVRobotPostProcessColorrangeautomaticCheckBox.Value;
if app.ExtVar.UPVRobotPostProcess.FreqColorAuto
    app.ExtUI.UPVRobotPostProcessMaxrangeEditField.Enable = 'off';
    app.ExtUI.UPVRobotPostProcessMinrangeEditField.Enable = 'off';
else
    app.ExtUI.UPVRobotPostProcessMaxrangeEditField.Enable = 'on';
    app.ExtUI.UPVRobotPostProcessMinrangeEditField.Enable = 'on';
end
UPVRobotPostProcessPlot(app)

function UPVRobotPostProcessViewParamSLICEXYChanged(~,~,app)

app.ExtUI.UPVRobotPostProcessDParametersSliceXYCheck.Value = true;
app.ExtUI.UPVRobotPostProcessDParametersSliceXZCheck.Value = false;
app.ExtUI.UPVRobotPostProcessDParametersSliceYZCheck.Value = false;

app.ExtVar.UPVRobotPostProcess.Slice2DType = 'XY';
app.ExtUI.UPVRobotPostProcessDParametersZvalueEditField.Enable = 'on';
app.ExtUI.UPVRobotPostProcessDParametersYvalueEditField.Enable = 'off';
app.ExtUI.UPVRobotPostProcessDParametersXvalueEditField.Enable = 'off';
drawnow
UPVRobotPostProcessPlot(app)


function UPVRobotPostProcessViewParamSLICEXZChanged(~,~,app)

app.ExtUI.UPVRobotPostProcessDParametersSliceXZCheck.Value = true;
app.ExtUI.UPVRobotPostProcessDParametersSliceXYCheck.Value = false;
app.ExtUI.UPVRobotPostProcessDParametersSliceYZCheck.Value = false;

app.ExtVar.UPVRobotPostProcess.Slice2DType = 'XZ';
app.ExtUI.UPVRobotPostProcessDParametersZvalueEditField.Enable = 'off';
app.ExtUI.UPVRobotPostProcessDParametersYvalueEditField.Enable = 'on';
app.ExtUI.UPVRobotPostProcessDParametersXvalueEditField.Enable = 'off';
drawnow
UPVRobotPostProcessPlot(app)


function UPVRobotPostProcessViewParamSLICEYZChanged(~,~,app)

app.ExtUI.UPVRobotPostProcessDParametersSliceYZCheck.Value = true;
app.ExtUI.UPVRobotPostProcessDParametersSliceXZCheck.Value = false;
app.ExtUI.UPVRobotPostProcessDParametersSliceXYCheck.Value = false;

app.ExtVar.UPVRobotPostProcess.Slice2DType = 'YZ';
app.ExtUI.UPVRobotPostProcessDParametersZvalueEditField.Enable = 'off';
app.ExtUI.UPVRobotPostProcessDParametersYvalueEditField.Enable = 'off';
app.ExtUI.UPVRobotPostProcessDParametersXvalueEditField.Enable = 'on';
drawnow
UPVRobotPostProcessPlot(app)

function UPVRobotPostProcessViewParamSLICEValueChanged(~,~,app)
app.ExtVar.UPVRobotPostProcess.SliceXY_Zvalue = app.ExtUI.UPVRobotPostProcessDParametersZvalueEditField.Value;
app.ExtVar.UPVRobotPostProcess.SliceXZ_Yvalue = app.ExtUI.UPVRobotPostProcessDParametersYvalueEditField.Value;
app.ExtVar.UPVRobotPostProcess.SliceYZ_Xvalue = app.ExtUI.UPVRobotPostProcessDParametersXvalueEditField.Value;
UPVRobotPostProcessPlot(app)

function UPVRobotPostProcessViewParamVIEWChanged(~,~,app)
app.ExtVar.UPVRobotPostProcess.ViewBoundary = app.ExtUI.UPVRobotPostProcessDParametersBoundaryCheckBox.Value;
app.ExtVar.UPVRobotPostProcess.ViewPoints = app.ExtUI.UPVRobotPostProcessDParametersPointsCheckBox.Value;
UPVRobotPostProcessPlot(app)

% =============================================================================================================
% EXPORT
function UPVRobotPostProcessFreq2DExportGraphic(~,~,app)
name = sprintf('Frequency Response 2D - %s plane at %.0f Hz',app.ExtVar.UPVRobotPostProcess.Slice2DType,app.ExtVar.UPVRobotPostProcess.FreqView);
axes = app.ExtUI.UPVRobotPostProcessUIAxesFreq2D;
exportPlot(axes,name)

function UPVRobotPostProcessFreq2DExportData(~,~,app)
name = sprintf('Frequency Response 2D - %s plane at %.0f Hz',app.ExtVar.UPVRobotPostProcess.Slice2DType,app.ExtVar.UPVRobotPostProcess.FreqView);
plot = app.ExtVar.UPVRobotPostProcess.SurfacePlot;

% Data
X = plot.XData; X = X(:);
Y = plot.YData; Y = Y(:);
Z = plot.ZData; Z = Z(:);
SPL = plot.CData; SPL = SPL(:);

% Create table
T = table(X,Y,Z,SPL,'VariableNames',{'X [m]','Y [m]','Z [m]','SPL [dB]'});

% Name and path selection
[filename, pathname] = uiputfile({'*.txt','Tabulated text file (*.txt)'},'Save data',[name,'.txt']);
if filename==0; return; end
if ~endsWith(filename,'.txt'); filename = [filename,'.txt']; end
writetable(T,[pathname,filename],'Delimiter','\t')