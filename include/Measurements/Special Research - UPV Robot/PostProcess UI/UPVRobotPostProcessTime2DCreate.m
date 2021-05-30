function UPVRobotPostProcessTime2DCreate(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% ===============================================
% BOTTOM GRID FOR VIEW, 2D PARAMETERS AND EXPORT PANELS
% Create GridUPVRobotPostProcessBottomCenterGrid2DTime
app.ExtUI.GridUPVRobotPostProcessBottomCenterGrid2DTime = uigridlayout(app.ExtUI.GridCenterMain);
app.ExtUI.GridUPVRobotPostProcessBottomCenterGrid2DTime.ColumnWidth = {'fit', '1x', '0.5x'};
app.ExtUI.GridUPVRobotPostProcessBottomCenterGrid2DTime.RowHeight = {'1x'};
app.ExtUI.GridUPVRobotPostProcessBottomCenterGrid2DTime.Layout.Row = 2;
app.ExtUI.GridUPVRobotPostProcessBottomCenterGrid2DTime.Layout.Column = 1;
app.ExtUI.GridUPVRobotPostProcessBottomCenterGrid2DTime.BackgroundColor = [1 1 1];


% ===============================================
% VIEW PARAMETERS

% Create UPVRobotPostProcessViewParametersPanelTime2D
app.ExtUI.UPVRobotPostProcessViewParametersPanelTime2D = uipanel(app.ExtUI.GridUPVRobotPostProcessBottomCenterGrid2DTime);
app.ExtUI.UPVRobotPostProcessViewParametersPanelTime2D.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessViewParametersPanelTime2D.TitlePosition = 'centertop';
app.ExtUI.UPVRobotPostProcessViewParametersPanelTime2D.Title = 'View parameters';
app.ExtUI.UPVRobotPostProcessViewParametersPanelTime2D.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotPostProcessViewParametersPanelTime2D.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessViewParametersPanelTime2D.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessViewParametersPanelTime2D.FontWeight = 'bold';

% Create UPVRobotPostProcessViewParametersGrid
app.ExtUI.UPVRobotPostProcessViewParametersGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessViewParametersPanelTime2D);
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
app.ExtUI.UPVRobotPostProcessFrequencyHzEditField.Limits = [1 Inf];
app.ExtUI.UPVRobotPostProcessFrequencyHzEditField.ValueDisplayFormat = '%g';
app.ExtUI.UPVRobotPostProcessFrequencyHzEditField.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFrequencyHzEditField.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessFrequencyHzEditField.Value = 500;

% Create UPVRobotPostProcessColorrangeautomaticCheckBox
app.ExtUI.UPVRobotPostProcessColorrangeautomaticCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessViewParametersGrid);
app.ExtUI.UPVRobotPostProcessColorrangeautomaticCheckBox.Text = 'Color range automatic';
app.ExtUI.UPVRobotPostProcessColorrangeautomaticCheckBox.WordWrap = 'on';
app.ExtUI.UPVRobotPostProcessColorrangeautomaticCheckBox.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessColorrangeautomaticCheckBox.Layout.Column = [1 2];
app.ExtUI.UPVRobotPostProcessColorrangeautomaticCheckBox.Value = true;

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

% ===============================================
% EXPORT PANEL

% Create UPVRobotPostProcessExportPanelTime2D
app.ExtUI.UPVRobotPostProcessExportPanelTime2D = uipanel(app.ExtUI.GridUPVRobotPostProcessBottomCenterGrid2DTime);
app.ExtUI.UPVRobotPostProcessExportPanelTime2D.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessExportPanelTime2D.Title = 'Export';
app.ExtUI.UPVRobotPostProcessExportPanelTime2D.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotPostProcessExportPanelTime2D.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessExportPanelTime2D.Layout.Column = 3;
app.ExtUI.UPVRobotPostProcessExportPanelTime2D.FontWeight = 'bold';

% Create UPVRobotPostProcessExportGridTime2D
app.ExtUI.UPVRobotPostProcessExportGridTime2D = uigridlayout(app.ExtUI.UPVRobotPostProcessExportPanelTime2D);
app.ExtUI.UPVRobotPostProcessExportGridTime2D.ColumnWidth = {'1x'};
app.ExtUI.UPVRobotPostProcessExportGridTime2D.RowHeight = {'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessExportGridTime2D.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessExportGraphicButtonTime2D
app.ExtUI.UPVRobotPostProcessExportGraphicButtonTime2D = uibutton(app.ExtUI.UPVRobotPostProcessExportGridTime2D, 'push');
app.ExtUI.UPVRobotPostProcessExportGraphicButtonTime2D.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessExportGraphicButtonTime2D.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessExportGraphicButtonTime2D.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessExportGraphicButtonTime2D.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessExportGraphicButtonTime2D.Text = 'Graphic';

% Create UPVRobotPostProcessExportDataButtonTime2D
app.ExtUI.UPVRobotPostProcessExportDataButtonTime2D = uibutton(app.ExtUI.UPVRobotPostProcessExportGridTime2D, 'push');
app.ExtUI.UPVRobotPostProcessExportDataButtonTime2D.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessExportDataButtonTime2D.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessExportDataButtonTime2D.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessExportDataButtonTime2D.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessExportDataButtonTime2D.Text = 'Data';

% ===============================================
% 2D PARAMETERS

% Create UPVRobotPostProcessDParametersPanel2DTime
app.ExtUI.UPVRobotPostProcessDParametersPanel2DTime = uipanel(app.ExtUI.GridUPVRobotPostProcessBottomCenterGrid2DTime);
app.ExtUI.UPVRobotPostProcessDParametersPanel2DTime.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessDParametersPanel2DTime.Title = '2D Parameters';
app.ExtUI.UPVRobotPostProcessDParametersPanel2DTime.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotPostProcessDParametersPanel2DTime.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDParametersPanel2DTime.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessDParametersPanel2DTime.FontWeight = 'bold';

% Create UPVRobotPostProcessDParametersGrid2DTime
app.ExtUI.UPVRobotPostProcessDParametersGrid2DTime = uigridlayout(app.ExtUI.UPVRobotPostProcessDParametersPanel2DTime);
app.ExtUI.UPVRobotPostProcessDParametersGrid2DTime.ColumnWidth = {'1x', 'fit', '0.5x'};
app.ExtUI.UPVRobotPostProcessDParametersGrid2DTime.RowHeight = {'1x', '1x', '1x', '1x'};
app.ExtUI.UPVRobotPostProcessDParametersGrid2DTime.BackgroundColor = [1 1 1];

% Create ZvaluemLabel
app.ExtUI.ZvaluemLabel = uilabel(app.ExtUI.UPVRobotPostProcessDParametersGrid2DTime);
app.ExtUI.ZvaluemLabel.HorizontalAlignment = 'right';
app.ExtUI.ZvaluemLabel.Layout.Row = 2;
app.ExtUI.ZvaluemLabel.Layout.Column = 2;
app.ExtUI.ZvaluemLabel.Text = 'Z value (m)';

% Create UPVRobotPostProcessDParametersZvalueEditField
app.ExtUI.UPVRobotPostProcessDParametersZvalueEditField = uieditfield(app.ExtUI.UPVRobotPostProcessDParametersGrid2DTime, 'numeric');
app.ExtUI.UPVRobotPostProcessDParametersZvalueEditField.Limits = [0 1];
app.ExtUI.UPVRobotPostProcessDParametersZvalueEditField.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessDParametersZvalueEditField.Layout.Column = 3;

% Create YvaluemLabel
app.ExtUI.YvaluemLabel = uilabel(app.ExtUI.UPVRobotPostProcessDParametersGrid2DTime);
app.ExtUI.YvaluemLabel.HorizontalAlignment = 'right';
app.ExtUI.YvaluemLabel.Layout.Row = 3;
app.ExtUI.YvaluemLabel.Layout.Column = 2;
app.ExtUI.YvaluemLabel.Text = 'Y value (m)';

% Create UPVRobotPostProcessDParametersYvalueEditField
app.ExtUI.UPVRobotPostProcessDParametersYvalueEditField = uieditfield(app.ExtUI.UPVRobotPostProcessDParametersGrid2DTime, 'numeric');
app.ExtUI.UPVRobotPostProcessDParametersYvalueEditField.Limits = [0 3];
app.ExtUI.UPVRobotPostProcessDParametersYvalueEditField.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessDParametersYvalueEditField.Layout.Column = 3;

% Create XvaluemLabel
app.ExtUI.XvaluemLabel = uilabel(app.ExtUI.UPVRobotPostProcessDParametersGrid2DTime);
app.ExtUI.XvaluemLabel.HorizontalAlignment = 'right';
app.ExtUI.XvaluemLabel.Layout.Row = 4;
app.ExtUI.XvaluemLabel.Layout.Column = 2;
app.ExtUI.XvaluemLabel.Text = 'X value (m)';

% Create UPVRobotPostProcessDParametersXvalueEditField
app.ExtUI.UPVRobotPostProcessDParametersXvalueEditField = uieditfield(app.ExtUI.UPVRobotPostProcessDParametersGrid2DTime, 'numeric');
app.ExtUI.UPVRobotPostProcessDParametersXvalueEditField.Limits = [0 3];
app.ExtUI.UPVRobotPostProcessDParametersXvalueEditField.Layout.Row = 4;
app.ExtUI.UPVRobotPostProcessDParametersXvalueEditField.Layout.Column = 3;

% Create UPVRobotPostProcessDParametersSliceXYCheck
app.ExtUI.UPVRobotPostProcessDParametersSliceXYCheck = uicheckbox(app.ExtUI.UPVRobotPostProcessDParametersGrid2DTime);
app.ExtUI.UPVRobotPostProcessDParametersSliceXYCheck.Text = 'Slice XY';
app.ExtUI.UPVRobotPostProcessDParametersSliceXYCheck.WordWrap = 'on';
app.ExtUI.UPVRobotPostProcessDParametersSliceXYCheck.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessDParametersSliceXYCheck.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessDParametersSliceXYCheck.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDParametersSliceXYCheck.Value = true;

% Create UPVRobotPostProcessDParametersSliceXZCheck
app.ExtUI.UPVRobotPostProcessDParametersSliceXZCheck = uicheckbox(app.ExtUI.UPVRobotPostProcessDParametersGrid2DTime);
app.ExtUI.UPVRobotPostProcessDParametersSliceXZCheck.Text = 'Slice XZ';
app.ExtUI.UPVRobotPostProcessDParametersSliceXZCheck.WordWrap = 'on';
app.ExtUI.UPVRobotPostProcessDParametersSliceXZCheck.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessDParametersSliceXZCheck.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessDParametersSliceXZCheck.Layout.Column = 1;

% Create UPVRobotPostProcessDParametersSliceYZCheck
app.ExtUI.UPVRobotPostProcessDParametersSliceYZCheck = uicheckbox(app.ExtUI.UPVRobotPostProcessDParametersGrid2DTime);
app.ExtUI.UPVRobotPostProcessDParametersSliceYZCheck.Text = 'Slice YZ';
app.ExtUI.UPVRobotPostProcessDParametersSliceYZCheck.WordWrap = 'on';
app.ExtUI.UPVRobotPostProcessDParametersSliceYZCheck.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessDParametersSliceYZCheck.Layout.Row = 4;
app.ExtUI.UPVRobotPostProcessDParametersSliceYZCheck.Layout.Column = 1;

% Create UPVRobotPostProcessDParametersViewGrid2DTime
app.ExtUI.UPVRobotPostProcessDParametersViewGrid2DTime = uigridlayout(app.ExtUI.UPVRobotPostProcessDParametersGrid2DTime);
app.ExtUI.UPVRobotPostProcessDParametersViewGrid2DTime.ColumnWidth = {'fit', 'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessDParametersViewGrid2DTime.RowHeight = {'1x'};
app.ExtUI.UPVRobotPostProcessDParametersViewGrid2DTime.Padding = [0 0 0 0];
app.ExtUI.UPVRobotPostProcessDParametersViewGrid2DTime.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDParametersViewGrid2DTime.Layout.Column = [1 3];
app.ExtUI.UPVRobotPostProcessDParametersViewGrid2DTime.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessDParametersViewLabel
app.ExtUI.UPVRobotPostProcessDParametersViewLabel = uilabel(app.ExtUI.UPVRobotPostProcessDParametersViewGrid2DTime);
app.ExtUI.UPVRobotPostProcessDParametersViewLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotPostProcessDParametersViewLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessDParametersViewLabel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDParametersViewLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDParametersViewLabel.Text = 'View:';

% Create UPVRobotPostProcessDParametersPointsCheckBox2D
app.ExtUI.UPVRobotPostProcessDParametersPointsCheckBox2D = uicheckbox(app.ExtUI.UPVRobotPostProcessDParametersViewGrid2DTime);
app.ExtUI.UPVRobotPostProcessDParametersPointsCheckBox2D.Text = 'Points';
app.ExtUI.UPVRobotPostProcessDParametersPointsCheckBox2D.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDParametersPointsCheckBox2D.Layout.Column = 2;

% Create UPVRobotPostProcessDParametersBoundaryCheckBox2D
app.ExtUI.UPVRobotPostProcessDParametersBoundaryCheckBox2D = uicheckbox(app.ExtUI.UPVRobotPostProcessDParametersViewGrid2DTime);
app.ExtUI.UPVRobotPostProcessDParametersBoundaryCheckBox2D.Text = 'Boundary';
app.ExtUI.UPVRobotPostProcessDParametersBoundaryCheckBox2D.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDParametersBoundaryCheckBox2D.Layout.Column = 3;