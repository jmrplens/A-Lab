function createPanelUPVRobotPostProcessDirectivityTabs(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Center column
centerGrid(app,{'1x'},{'1x', '0.5x'});

% ================================================================================================
% MAIN (TABS with axes and table)

% Create CenterMainPanelUPVRobotPostProcessDirectivity
app.ExtUI.CenterMainPanelUPVRobotPostProcessDirectivity = uipanel(app.ExtUI.GridCenterMain);
app.ExtUI.CenterMainPanelUPVRobotPostProcessDirectivity.TitlePosition = 'centertop';
app.ExtUI.CenterMainPanelUPVRobotPostProcessDirectivity.Title = 'Directivity';
app.ExtUI.CenterMainPanelUPVRobotPostProcessDirectivity.BackgroundColor = [1 1 1];
app.ExtUI.CenterMainPanelUPVRobotPostProcessDirectivity.Layout.Row = 1;
app.ExtUI.CenterMainPanelUPVRobotPostProcessDirectivity.Layout.Column = 1;
app.ExtUI.CenterMainPanelUPVRobotPostProcessDirectivity.FontWeight = 'bold';
app.ExtUI.CenterMainPanelUPVRobotPostProcessDirectivity.FontSize = 14;

% Create CenterMainGridUPVRobotPostProcessDirectivity
app.ExtUI.CenterMainGridUPVRobotPostProcessDirectivity = uigridlayout(app.ExtUI.CenterMainPanelUPVRobotPostProcessDirectivity);
app.ExtUI.CenterMainGridUPVRobotPostProcessDirectivity.ColumnWidth = {'1x'};
app.ExtUI.CenterMainGridUPVRobotPostProcessDirectivity.RowHeight = {'1x'};
app.ExtUI.CenterMainGridUPVRobotPostProcessDirectivity.Padding = [0 0 0 0];
app.ExtUI.CenterMainGridUPVRobotPostProcessDirectivity.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessDirectivityTabGroup
app.ExtUI.UPVRobotPostProcessDirectivityTabGroup = uitabgroup(app.ExtUI.CenterMainGridUPVRobotPostProcessDirectivity);
app.ExtUI.UPVRobotPostProcessDirectivityTabGroup.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDirectivityTabGroup.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDirectivityTabGroup.SelectionChangedFcn = {@UPVRobotPostProcessDirTabChanged,app};
app.ExtUI.UPVRobotPostProcessDirectivityTabGroup.Visible = 'off';

% Create UPVRobotPostProcessDirectivityPolarTab
app.ExtUI.UPVRobotPostProcessDirectivityPolarTab = uitab(app.ExtUI.UPVRobotPostProcessDirectivityTabGroup);
app.ExtUI.UPVRobotPostProcessDirectivityPolarTab.Title = 'Polar';

% Create UPVRobotPostProcessDirectivityPolarGrid
app.ExtUI.UPVRobotPostProcessDirectivityPolarGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessDirectivityPolarTab);
app.ExtUI.UPVRobotPostProcessDirectivityPolarGrid.ColumnWidth = {'1x'};
app.ExtUI.UPVRobotPostProcessDirectivityPolarGrid.RowHeight = {'1x'};
app.ExtUI.UPVRobotPostProcessDirectivityPolarGrid.BackgroundColor = [1 1 1];

% Create DirectivityPolarAxes
app.ExtUI.DirectivityPolarAxes = polaraxes(app.ExtUI.UPVRobotPostProcessDirectivityPolarGrid);
app.ExtUI.DirectivityPolarAxes.Layout.Row = 1;
app.ExtUI.DirectivityPolarAxes.Layout.Column = 1;

% Create UPVRobotPostProcessDirectivity2DTab
app.ExtUI.UPVRobotPostProcessDirectivity2DTab = uitab(app.ExtUI.UPVRobotPostProcessDirectivityTabGroup);
app.ExtUI.UPVRobotPostProcessDirectivity2DTab.Title = '2D';

% Create UPVRobotPostProcessDirectivity2DGrid
app.ExtUI.UPVRobotPostProcessDirectivity2DGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessDirectivity2DTab);
app.ExtUI.UPVRobotPostProcessDirectivity2DGrid.ColumnWidth = {'1x',10};
app.ExtUI.UPVRobotPostProcessDirectivity2DGrid.RowHeight = {'1x'};
app.ExtUI.UPVRobotPostProcessDirectivity2DGrid.BackgroundColor = [1 1 1];

% Create Directivity2DAxes
app.ExtUI.Directivity2DAxes = uiaxes(app.ExtUI.UPVRobotPostProcessDirectivity2DGrid);
app.ExtUI.Directivity2DAxes.Layout.Row = 1;
app.ExtUI.Directivity2DAxes.Layout.Column = 1;

% Create UPVRobotPostProcessDirectivity3DTab
app.ExtUI.UPVRobotPostProcessDirectivity3DTab = uitab(app.ExtUI.UPVRobotPostProcessDirectivityTabGroup);
app.ExtUI.UPVRobotPostProcessDirectivity3DTab.Title = '3D';

% Create UPVRobotPostProcessDirectivity3DGrid
app.ExtUI.UPVRobotPostProcessDirectivity3DGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessDirectivity3DTab);
app.ExtUI.UPVRobotPostProcessDirectivity3DGrid.ColumnWidth = {'1x',10};
app.ExtUI.UPVRobotPostProcessDirectivity3DGrid.RowHeight = {'1x'};
app.ExtUI.UPVRobotPostProcessDirectivity3DGrid.BackgroundColor = [1 1 1];

% Create Directivity3DAxes
app.ExtUI.Directivity3DAxes = uiaxes(app.ExtUI.UPVRobotPostProcessDirectivity3DGrid);
app.ExtUI.Directivity3DAxes.Layout.Row = 1;
app.ExtUI.Directivity3DAxes.Layout.Column = 1;

% Create UPVRobotPostProcessDirectivityParametersTab
app.ExtUI.UPVRobotPostProcessDirectivityParametersTab = uitab(app.ExtUI.UPVRobotPostProcessDirectivityTabGroup);
app.ExtUI.UPVRobotPostProcessDirectivityParametersTab.Title = 'Parameters';

% Create UPVRobotPostProcessDirectivityParametersGrid
app.ExtUI.UPVRobotPostProcessDirectivityParametersGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessDirectivityParametersTab);
app.ExtUI.UPVRobotPostProcessDirectivityParametersGrid.ColumnWidth = {'1x'};
app.ExtUI.UPVRobotPostProcessDirectivityParametersGrid.RowHeight = {'1x'};
app.ExtUI.UPVRobotPostProcessDirectivityParametersGrid.BackgroundColor = [1 1 1];

% Create DirectivityParametersTable
app.ExtUI.DirectivityParametersTable = uitable(app.ExtUI.UPVRobotPostProcessDirectivityParametersGrid);
app.ExtUI.DirectivityParametersTable.ColumnName = {'Q'; 'DI'};
app.ExtUI.DirectivityParametersTable.RowName = {};
app.ExtUI.DirectivityParametersTable.Layout.Row = 1;
app.ExtUI.DirectivityParametersTable.Layout.Column = 1;

% ======================================================================================================================
% Bottom tools
% Create GridUPVRobotPostProcessBottomCenterGridDirectivity
app.ExtUI.GridUPVRobotPostProcessBottomCenterGridDirectivity = uigridlayout(app.ExtUI.GridCenterMain);
app.ExtUI.GridUPVRobotPostProcessBottomCenterGridDirectivity.ColumnWidth = {'1x', '1x', '0.4x'};
app.ExtUI.GridUPVRobotPostProcessBottomCenterGridDirectivity.RowHeight = {'fit'};
app.ExtUI.GridUPVRobotPostProcessBottomCenterGridDirectivity.ColumnSpacing = 2;
app.ExtUI.GridUPVRobotPostProcessBottomCenterGridDirectivity.RowSpacing = 2;
app.ExtUI.GridUPVRobotPostProcessBottomCenterGridDirectivity.Padding = [0 0 0 0];
app.ExtUI.GridUPVRobotPostProcessBottomCenterGridDirectivity.Layout.Row = 2;
app.ExtUI.GridUPVRobotPostProcessBottomCenterGridDirectivity.Layout.Column = 1;
app.ExtUI.GridUPVRobotPostProcessBottomCenterGridDirectivity.BackgroundColor = [1 1 1];

% ================================================================================================
% COL 1

% Create UPVRobotPostProcessDirectivityToolsCol1Grid
app.ExtUI.UPVRobotPostProcessDirectivityToolsCol1Grid = uigridlayout(app.ExtUI.GridUPVRobotPostProcessBottomCenterGridDirectivity);
app.ExtUI.UPVRobotPostProcessDirectivityToolsCol1Grid.ColumnWidth = {'1x'};
app.ExtUI.UPVRobotPostProcessDirectivityToolsCol1Grid.RowHeight = {'fit', 'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessDirectivityToolsCol1Grid.ColumnSpacing = 2;
app.ExtUI.UPVRobotPostProcessDirectivityToolsCol1Grid.RowSpacing = 2;
app.ExtUI.UPVRobotPostProcessDirectivityToolsCol1Grid.Padding = [0 0 0 0];
app.ExtUI.UPVRobotPostProcessDirectivityToolsCol1Grid.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDirectivityToolsCol1Grid.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDirectivityToolsCol1Grid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessDirectivityFrequenciesPanel
app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesPanel = uipanel(app.ExtUI.UPVRobotPostProcessDirectivityToolsCol1Grid);
app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesPanel.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesPanel.TitlePosition = 'centertop';
app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesPanel.Title = 'Frequencies';
app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesPanel.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesPanel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesPanel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesPanel.FontWeight = 'bold';

% Create UPVRobotPostProcessDirectivityFrequenciesGrid
app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesPanel);
app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesGrid.ColumnWidth = {'0.6x', '1x'};
app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesGrid.RowHeight = {'fit', 'fit', 20};
app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesGrid.ColumnSpacing = 2;
app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesGrid.RowSpacing = 2;
app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesGrid.Padding = [5 5 5 5];
app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessDirectivityFreqsHzLabel
app.ExtUI.UPVRobotPostProcessDirectivityFreqsHzLabel = uilabel(app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesGrid);
app.ExtUI.UPVRobotPostProcessDirectivityFreqsHzLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotPostProcessDirectivityFreqsHzLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessDirectivityFreqsHzLabel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDirectivityFreqsHzLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDirectivityFreqsHzLabel.Text = 'Freqs (Hz):';

% Create UPVRobotPostProcessDirectivityFreqPolarArray
app.ExtUI.UPVRobotPostProcessDirectivityFreqPolarArray = uitextarea(app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesGrid);
app.ExtUI.UPVRobotPostProcessDirectivityFreqPolarArray.FontSize = 11;
app.ExtUI.UPVRobotPostProcessDirectivityFreqPolarArray.Tooltip = {'Unique number or number array in format ''a,b,c,...'' '};
app.ExtUI.UPVRobotPostProcessDirectivityFreqPolarArray.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDirectivityFreqPolarArray.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessDirectivityFreqPolarArray.Value = {'125,500,1000,2000,4000'};
app.ExtUI.UPVRobotPostProcessDirectivityFreqPolarArray.ValueChangedFcn = {@UPVRobotPostProcessDirectivityParamChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.DirFreqPolar)
    values = app.ExtVar.UPVRobotPostProcess.DirFreqPolar;
    app.ExtUI.UPVRobotPostProcessDirectivityFreqPolarArray.Value = erase(num2str(values(:)','%g,'), ' ');
else
    valuesSTR = app.ExtUI.UPVRobotPostProcessDirectivityFreqPolarArray.Value;
    try
        values = cell2mat( textscan( char(valuesSTR),'%f,'));
        app.ExtVar.UPVRobotPostProcess.DirFreqPolar = values(:)';
    catch
        values = app.ExtVar.UPVRobotPostProcess.DirFreqPolar;
        app.ExtUI.UPVRobotPostProcessDirectivityFreqPolarArray.Value = erase(num2str(values(:)','%g,'), ' ');
    end
end

% Create UPVRobotPostProcessDirectivityFromLabel
app.ExtUI.UPVRobotPostProcessDirectivityFromLabel = uilabel(app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesGrid);
app.ExtUI.UPVRobotPostProcessDirectivityFromLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotPostProcessDirectivityFromLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessDirectivityFromLabel.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessDirectivityFromLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDirectivityFromLabel.Text = 'From:';

% Create UPVRobotPostProcessDirectivityFromSwitch
app.ExtUI.UPVRobotPostProcessDirectivityFromSwitch = uiswitch(app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesGrid, 'slider');
app.ExtUI.UPVRobotPostProcessDirectivityFromSwitch.Items = {'FFT', '3rd Octave'};
app.ExtUI.UPVRobotPostProcessDirectivityFromSwitch.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessDirectivityFromSwitch.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessDirectivityFromSwitch.Value = '3rd Octave';
app.ExtUI.UPVRobotPostProcessDirectivityFromSwitch.ValueChangedFcn = {@UPVRobotPostProcessDirectivityParamChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.DirDataType)
    app.ExtUI.UPVRobotPostProcessDirectivityFromSwitch.Value = app.ExtVar.UPVRobotPostProcess.DirDataType;
else
    app.ExtVar.UPVRobotPostProcess.DirDataType = app.ExtUI.UPVRobotPostProcessDirectivityFromSwitch.Value;
end

% Create UPVRobotPostProcessDirectivityFreqHzLabel
app.ExtUI.UPVRobotPostProcessDirectivityFreqHzLabel = uilabel(app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesGrid);
app.ExtUI.UPVRobotPostProcessDirectivityFreqHzLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotPostProcessDirectivityFreqHzLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessDirectivityFreqHzLabel.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessDirectivityFreqHzLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDirectivityFreqHzLabel.Text = 'Freq (Hz):';

% Create UPVRobotPostProcessDirectivityFreq3D
app.ExtUI.UPVRobotPostProcessDirectivityFreq3D = uieditfield(app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesGrid, 'numeric');
app.ExtUI.UPVRobotPostProcessDirectivityFreq3D.LowerLimitInclusive = 'off';
app.ExtUI.UPVRobotPostProcessDirectivityFreq3D.Limits = [0 Inf];
app.ExtUI.UPVRobotPostProcessDirectivityFreq3D.RoundFractionalValues = 'on';
app.ExtUI.UPVRobotPostProcessDirectivityFreq3D.ValueDisplayFormat = '%.0f';
app.ExtUI.UPVRobotPostProcessDirectivityFreq3D.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessDirectivityFreq3D.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessDirectivityFreq3D.Value = 1000;
app.ExtUI.UPVRobotPostProcessDirectivityFreq3D.ValueChangedFcn = {@UPVRobotPostProcessDirectivityParamChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.DirFreq3D)
    app.ExtUI.UPVRobotPostProcessDirectivityFreq3D.Value = app.ExtVar.UPVRobotPostProcess.DirFreq3D;
else
    app.ExtVar.UPVRobotPostProcess.DirFreq3D = app.ExtUI.UPVRobotPostProcessDirectivityFreq3D.Value;
end

% Create UPVRobotPostProcessDirectivityReferencePanel
app.ExtUI.UPVRobotPostProcessDirectivityReferencePanel = uipanel(app.ExtUI.UPVRobotPostProcessDirectivityToolsCol1Grid);
app.ExtUI.UPVRobotPostProcessDirectivityReferencePanel.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessDirectivityReferencePanel.TitlePosition = 'centertop';
app.ExtUI.UPVRobotPostProcessDirectivityReferencePanel.Title = 'Reference';
app.ExtUI.UPVRobotPostProcessDirectivityReferencePanel.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotPostProcessDirectivityReferencePanel.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessDirectivityReferencePanel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDirectivityReferencePanel.FontWeight = 'bold';

% Create UPVRobotPostProcessDirectivityReferenceGrid
app.ExtUI.UPVRobotPostProcessDirectivityReferenceGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessDirectivityReferencePanel);
app.ExtUI.UPVRobotPostProcessDirectivityReferenceGrid.ColumnWidth = {'0.6x', '1x', '0.25x'};
app.ExtUI.UPVRobotPostProcessDirectivityReferenceGrid.RowHeight = {'fit', 'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessDirectivityReferenceGrid.ColumnSpacing = 2;
app.ExtUI.UPVRobotPostProcessDirectivityReferenceGrid.RowSpacing = 2;
app.ExtUI.UPVRobotPostProcessDirectivityReferenceGrid.Padding = [5 5 5 5];
app.ExtUI.UPVRobotPostProcessDirectivityReferenceGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessDirectivityReferenceLabel
app.ExtUI.UPVRobotPostProcessDirectivityReferenceLabel = uilabel(app.ExtUI.UPVRobotPostProcessDirectivityReferenceGrid);
app.ExtUI.UPVRobotPostProcessDirectivityReferenceLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotPostProcessDirectivityReferenceLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessDirectivityReferenceLabel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDirectivityReferenceLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDirectivityReferenceLabel.Text = 'Reference:';

% Create UPVRobotPostProcessDirectivityReferenceSwitch
app.ExtUI.UPVRobotPostProcessDirectivityReferenceSwitch = uiswitch(app.ExtUI.UPVRobotPostProcessDirectivityReferenceGrid, 'slider');
app.ExtUI.UPVRobotPostProcessDirectivityReferenceSwitch.Items = {'20µPa', 'Relative'};
app.ExtUI.UPVRobotPostProcessDirectivityReferenceSwitch.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDirectivityReferenceSwitch.Layout.Column = [2 3];
app.ExtUI.UPVRobotPostProcessDirectivityReferenceSwitch.Value = 'Relative';
app.ExtUI.UPVRobotPostProcessDirectivityReferenceSwitch.ValueChangedFcn = {@UPVRobotPostProcessDirectivityParamChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.DirReference)
    app.ExtUI.UPVRobotPostProcessDirectivityReferenceSwitch.Value = app.ExtVar.UPVRobotPostProcess.DirReference;
else
    app.ExtVar.UPVRobotPostProcess.DirReference = app.ExtUI.UPVRobotPostProcessDirectivityReferenceSwitch.Value;
end

% Create UPVRobotPostProcessDirectivityRelativeoptionsLabel
app.ExtUI.UPVRobotPostProcessDirectivityRelativeoptionsLabel = uilabel(app.ExtUI.UPVRobotPostProcessDirectivityReferenceGrid);
app.ExtUI.UPVRobotPostProcessDirectivityRelativeoptionsLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotPostProcessDirectivityRelativeoptionsLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessDirectivityRelativeoptionsLabel.Layout.Row = [2 3];
app.ExtUI.UPVRobotPostProcessDirectivityRelativeoptionsLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDirectivityRelativeoptionsLabel.Text = {'Relative'; 'options'};

% Create UPVRobotPostProcessDirectivityFromAngleValueField
app.ExtUI.UPVRobotPostProcessDirectivityFromAngleValueField = uieditfield(app.ExtUI.UPVRobotPostProcessDirectivityReferenceGrid, 'numeric');
app.ExtUI.UPVRobotPostProcessDirectivityFromAngleValueField.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessDirectivityFromAngleValueField.Layout.Column = 3;
app.ExtUI.UPVRobotPostProcessDirectivityFromAngleValueField.ValueChangedFcn = {@UPVRobotPostProcessDirectivityParamChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.DirRefAngle)
    app.ExtUI.UPVRobotPostProcessDirectivityFromAngleValueField.Value = app.ExtVar.UPVRobotPostProcess.DirRefAngle;
else
    app.ExtVar.UPVRobotPostProcess.DirRefAngle = app.ExtUI.UPVRobotPostProcessDirectivityFromAngleValueField.Value;
end

% Create UPVRobotPostProcessDirectivityFromangledegCheckBox
app.ExtUI.UPVRobotPostProcessDirectivityFromangledegCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessDirectivityReferenceGrid);
app.ExtUI.UPVRobotPostProcessDirectivityFromangledegCheckBox.Text = 'From angle (deg)';
app.ExtUI.UPVRobotPostProcessDirectivityFromangledegCheckBox.WordWrap = 'on';
app.ExtUI.UPVRobotPostProcessDirectivityFromangledegCheckBox.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessDirectivityFromangledegCheckBox.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessDirectivityFromangledegCheckBox.Value = 0;
app.ExtUI.UPVRobotPostProcessDirectivityFromangledegCheckBox.ValueChangedFcn = {@UPVRobotPostProcessDirectivityParamRefAngleChanged,app};


% Create UPVRobotPostProcessDirectivityFrommaxvalueCheckBox
app.ExtUI.UPVRobotPostProcessDirectivityFrommaxvalueCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessDirectivityReferenceGrid);
app.ExtUI.UPVRobotPostProcessDirectivityFrommaxvalueCheckBox.Text = 'From max value';
app.ExtUI.UPVRobotPostProcessDirectivityFrommaxvalueCheckBox.WordWrap = 'on';
app.ExtUI.UPVRobotPostProcessDirectivityFrommaxvalueCheckBox.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessDirectivityFrommaxvalueCheckBox.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessDirectivityFrommaxvalueCheckBox.Value = 1;
app.ExtUI.UPVRobotPostProcessDirectivityFrommaxvalueCheckBox.ValueChangedFcn = {@UPVRobotPostProcessDirectivityParamRefMaxChanged,app};

if ~isempty(app.ExtVar.UPVRobotPostProcess.DirRefType)
    if strcmp(app.ExtVar.UPVRobotPostProcess.DirRefType,'Angle')
        app.ExtUI.UPVRobotPostProcessDirectivityFrommaxvalueCheckBox.Value = 0;
        app.ExtUI.UPVRobotPostProcessDirectivityFromangledegCheckBox.Value = 1;
    else
        app.ExtUI.UPVRobotPostProcessDirectivityFrommaxvalueCheckBox.Value = 1;
        app.ExtUI.UPVRobotPostProcessDirectivityFromangledegCheckBox.Value = 0;
        app.ExtVar.UPVRobotPostProcess.DirRefType = 'Max';
    end
else
    app.ExtUI.UPVRobotPostProcessDirectivityFrommaxvalueCheckBox.Value = 1;
    app.ExtUI.UPVRobotPostProcessDirectivityFromangledegCheckBox.Value = 0;
    app.ExtVar.UPVRobotPostProcess.DirRefType = 'Max';
end

% Create UPVRobotPostProcessDirectivityPlottypePanel
app.ExtUI.UPVRobotPostProcessDirectivityPlottypePanel = uipanel(app.ExtUI.UPVRobotPostProcessDirectivityToolsCol1Grid);
app.ExtUI.UPVRobotPostProcessDirectivityPlottypePanel.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessDirectivityPlottypePanel.TitlePosition = 'centertop';
app.ExtUI.UPVRobotPostProcessDirectivityPlottypePanel.Title = 'Plot type';
app.ExtUI.UPVRobotPostProcessDirectivityPlottypePanel.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotPostProcessDirectivityPlottypePanel.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessDirectivityPlottypePanel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDirectivityPlottypePanel.FontWeight = 'bold';

% Create UPVRobotPostProcessDirectivityPlottypeGrid
app.ExtUI.UPVRobotPostProcessDirectivityPlottypeGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessDirectivityPlottypePanel);
app.ExtUI.UPVRobotPostProcessDirectivityPlottypeGrid.ColumnWidth = {'fit'};
app.ExtUI.UPVRobotPostProcessDirectivityPlottypeGrid.RowHeight = {'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessDirectivityPlottypeGrid.ColumnSpacing = 2;
app.ExtUI.UPVRobotPostProcessDirectivityPlottypeGrid.RowSpacing = 2;
app.ExtUI.UPVRobotPostProcessDirectivityPlottypeGrid.Padding = [5 5 5 5];
app.ExtUI.UPVRobotPostProcessDirectivityPlottypeGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessDirectivityRectangularcoordinatesCheckBox
app.ExtUI.UPVRobotPostProcessDirectivityRectangularcoordinatesCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessDirectivityPlottypeGrid);
app.ExtUI.UPVRobotPostProcessDirectivityRectangularcoordinatesCheckBox.Text = 'Rectangular coordinates';
app.ExtUI.UPVRobotPostProcessDirectivityRectangularcoordinatesCheckBox.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDirectivityRectangularcoordinatesCheckBox.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDirectivityRectangularcoordinatesCheckBox.ValueChangedFcn = {@UPVRobotPostProcessDirectivityPlot2DRectChanged,app};
app.ExtUI.UPVRobotPostProcessDirectivityRectangularcoordinatesCheckBox.Value = 1;

% Create UPVRobotPostProcessDirectivityFrequencyresponseCheckBox
app.ExtUI.UPVRobotPostProcessDirectivityFrequencyresponseCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessDirectivityPlottypeGrid);
app.ExtUI.UPVRobotPostProcessDirectivityFrequencyresponseCheckBox.Text = 'Frequency response';
app.ExtUI.UPVRobotPostProcessDirectivityFrequencyresponseCheckBox.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessDirectivityFrequencyresponseCheckBox.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDirectivityFrequencyresponseCheckBox.Value = 0;
app.ExtUI.UPVRobotPostProcessDirectivityFrequencyresponseCheckBox.ValueChangedFcn = {@UPVRobotPostProcessDirectivityPlot2DFreqChanged,app};

% Create UPVRobotPostProcessDirectivityAxisPanel
app.ExtUI.UPVRobotPostProcessDirectivityAxisPanel = uipanel(app.ExtUI.UPVRobotPostProcessDirectivityToolsCol1Grid);
app.ExtUI.UPVRobotPostProcessDirectivityAxisPanel.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessDirectivityAxisPanel.TitlePosition = 'centertop';
app.ExtUI.UPVRobotPostProcessDirectivityAxisPanel.Title = 'Axis';
app.ExtUI.UPVRobotPostProcessDirectivityAxisPanel.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotPostProcessDirectivityAxisPanel.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessDirectivityAxisPanel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDirectivityAxisPanel.FontWeight = 'bold';

% Create UPVRobotPostProcessDirectivityAxisGrid
app.ExtUI.UPVRobotPostProcessDirectivityAxisGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessDirectivityAxisPanel);
app.ExtUI.UPVRobotPostProcessDirectivityAxisGrid.ColumnWidth = {'fit','fit'};
app.ExtUI.UPVRobotPostProcessDirectivityAxisGrid.RowHeight = {'fit','fit'};
app.ExtUI.UPVRobotPostProcessDirectivityAxisGrid.ColumnSpacing = 2;
app.ExtUI.UPVRobotPostProcessDirectivityAxisGrid.RowSpacing = 2;
app.ExtUI.UPVRobotPostProcessDirectivityAxisGrid.Padding = [5 5 5 5];
app.ExtUI.UPVRobotPostProcessDirectivityAxisGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessDirectivityAxisShowCheckBox
app.ExtUI.UPVRobotPostProcessDirectivityAxisShowCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessDirectivityAxisGrid);
app.ExtUI.UPVRobotPostProcessDirectivityAxisShowCheckBox.Text = 'Show Arrows';
app.ExtUI.UPVRobotPostProcessDirectivityAxisShowCheckBox.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDirectivityAxisShowCheckBox.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDirectivityAxisShowCheckBox.Value = true;
app.ExtUI.UPVRobotPostProcessDirectivityAxisShowCheckBox.ValueChangedFcn = {@UPVRobotPostProcessDirectivityParamChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.Dir3DAxisArrows)
    app.ExtUI.UPVRobotPostProcessDirectivityAxisShowCheckBox.Value = app.ExtVar.UPVRobotPostProcess.Dir3DAxisArrows;
else
    app.ExtVar.UPVRobotPostProcess.Dir3DAxisArrows = app.ExtUI.UPVRobotPostProcessDirectivityAxisShowCheckBox.Value;
end

% Create UPVRobotPostProcessDirectivityAxisShowCheckBox
app.ExtUI.UPVRobotPostProcessDirectivityAxisShowPolarCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessDirectivityAxisGrid);
app.ExtUI.UPVRobotPostProcessDirectivityAxisShowPolarCheckBox.Text = 'Show Polar Axes';
app.ExtUI.UPVRobotPostProcessDirectivityAxisShowPolarCheckBox.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDirectivityAxisShowPolarCheckBox.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessDirectivityAxisShowPolarCheckBox.Value = true;
app.ExtUI.UPVRobotPostProcessDirectivityAxisShowPolarCheckBox.ValueChangedFcn = {@UPVRobotPostProcessDirectivityParamChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.Dir3DAxisPolar)
    app.ExtUI.UPVRobotPostProcessDirectivityAxisShowPolarCheckBox.Value = app.ExtVar.UPVRobotPostProcess.Dir3DAxisPolar;
else
    app.ExtVar.UPVRobotPostProcess.Dir3DAxisPolar = app.ExtUI.UPVRobotPostProcessDirectivityAxisShowPolarCheckBox.Value;
end

% Create UPVRobotPostProcessDirectivityAxisShowCheckBox
app.ExtUI.UPVRobotPostProcessDirectivityAxisShowCartCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessDirectivityAxisGrid);
app.ExtUI.UPVRobotPostProcessDirectivityAxisShowCartCheckBox.Text = 'Show Cart Axes';
app.ExtUI.UPVRobotPostProcessDirectivityAxisShowCartCheckBox.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessDirectivityAxisShowCartCheckBox.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDirectivityAxisShowCartCheckBox.Value = true;
app.ExtUI.UPVRobotPostProcessDirectivityAxisShowCartCheckBox.ValueChangedFcn = {@UPVRobotPostProcessDirectivityParamChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.Dir3DAxisCart)
    app.ExtUI.UPVRobotPostProcessDirectivityAxisShowCartCheckBox.Value = app.ExtVar.UPVRobotPostProcess.Dir3DAxisCart;
else
    app.ExtVar.UPVRobotPostProcess.Dir3DAxisCart = app.ExtUI.UPVRobotPostProcessDirectivityAxisShowCartCheckBox.Value;
end

% ================================================================================================
% COL 2
% Create UPVRobotPostProcessDirectivityToolsCol2Grid
app.ExtUI.UPVRobotPostProcessDirectivityToolsCol2Grid = uigridlayout(app.ExtUI.GridUPVRobotPostProcessBottomCenterGridDirectivity);
app.ExtUI.UPVRobotPostProcessDirectivityToolsCol2Grid.ColumnWidth = {'1x'};
app.ExtUI.UPVRobotPostProcessDirectivityToolsCol2Grid.RowHeight = {'fit', 'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessDirectivityToolsCol2Grid.ColumnSpacing = 2;
app.ExtUI.UPVRobotPostProcessDirectivityToolsCol2Grid.RowSpacing = 2;
app.ExtUI.UPVRobotPostProcessDirectivityToolsCol2Grid.Padding = [0 0 0 0];
app.ExtUI.UPVRobotPostProcessDirectivityToolsCol2Grid.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDirectivityToolsCol2Grid.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessDirectivityToolsCol2Grid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessDirectivityPlanePanel
app.ExtUI.UPVRobotPostProcessDirectivityPlanePanel = uipanel(app.ExtUI.UPVRobotPostProcessDirectivityToolsCol2Grid);
app.ExtUI.UPVRobotPostProcessDirectivityPlanePanel.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessDirectivityPlanePanel.TitlePosition = 'centertop';
app.ExtUI.UPVRobotPostProcessDirectivityPlanePanel.Title = 'Plane';
app.ExtUI.UPVRobotPostProcessDirectivityPlanePanel.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotPostProcessDirectivityPlanePanel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDirectivityPlanePanel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDirectivityPlanePanel.FontWeight = 'bold';

% Create UPVRobotPostProcessDirectivityPlaneGrid
app.ExtUI.UPVRobotPostProcessDirectivityPlaneGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessDirectivityPlanePanel);
app.ExtUI.UPVRobotPostProcessDirectivityPlaneGrid.ColumnWidth = {'0.5x', '1x'};
app.ExtUI.UPVRobotPostProcessDirectivityPlaneGrid.RowHeight = {'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessDirectivityPlaneGrid.ColumnSpacing = 2;
app.ExtUI.UPVRobotPostProcessDirectivityPlaneGrid.RowSpacing = 2;
app.ExtUI.UPVRobotPostProcessDirectivityPlaneGrid.Padding = [5 5 5 5];
app.ExtUI.UPVRobotPostProcessDirectivityPlaneGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessDirectivityPlaneLabel
app.ExtUI.UPVRobotPostProcessDirectivityPlaneLabel = uilabel(app.ExtUI.UPVRobotPostProcessDirectivityPlaneGrid);
app.ExtUI.UPVRobotPostProcessDirectivityPlaneLabel.WordWrap = 'on';
app.ExtUI.UPVRobotPostProcessDirectivityPlaneLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessDirectivityPlaneLabel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDirectivityPlaneLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDirectivityPlaneLabel.Text = 'Polar Plane:';

% Create UPVRobotPostProcessDirectivityHorVerSwitch
app.ExtUI.UPVRobotPostProcessDirectivityHorVerSwitch = uiswitch(app.ExtUI.UPVRobotPostProcessDirectivityPlaneGrid, 'slider');
app.ExtUI.UPVRobotPostProcessDirectivityHorVerSwitch.Items = {'Horizontal', 'Vertical'};
app.ExtUI.UPVRobotPostProcessDirectivityHorVerSwitch.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDirectivityHorVerSwitch.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessDirectivityHorVerSwitch.Value = 'Horizontal';
app.ExtUI.UPVRobotPostProcessDirectivityHorVerSwitch.ValueChangedFcn = {@UPVRobotPostProcessDirectivityParamChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.DirPolarPlane)
    app.ExtUI.UPVRobotPostProcessDirectivityHorVerSwitch.Value = app.ExtVar.UPVRobotPostProcess.DirPolarPlane;
else
    app.ExtVar.UPVRobotPostProcess.DirPolarPlane = app.ExtUI.UPVRobotPostProcessDirectivityHorVerSwitch.Value;
end

% Create UPVRobotPostProcessDirectivityForce360CheckBox
app.ExtUI.UPVRobotPostProcessDirectivityForce360CheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessDirectivityPlaneGrid);
app.ExtUI.UPVRobotPostProcessDirectivityForce360CheckBox.Text = 'Force 360º ';
app.ExtUI.UPVRobotPostProcessDirectivityForce360CheckBox.WordWrap = 'on';
app.ExtUI.UPVRobotPostProcessDirectivityForce360CheckBox.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessDirectivityForce360CheckBox.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessDirectivityForce360CheckBox.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDirectivityForce360CheckBox.Value = 0;
app.ExtUI.UPVRobotPostProcessDirectivityForce360CheckBox.ValueChangedFcn = {@UPVRobotPostProcessDirectivityParamChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.Dir360)
    app.ExtUI.UPVRobotPostProcessDirectivityForce360CheckBox.Value = app.ExtVar.UPVRobotPostProcess.Dir360;
else
    app.ExtVar.UPVRobotPostProcess.Dir360 = app.ExtUI.UPVRobotPostProcessDirectivityForce360CheckBox.Value;
end

% Create UPVRobotPostProcessDirectivityMirrordatafrom180measuresLabel
app.ExtUI.UPVRobotPostProcessDirectivityMirrordatafrom180measuresLabel = uilabel(app.ExtUI.UPVRobotPostProcessDirectivityPlaneGrid);
app.ExtUI.UPVRobotPostProcessDirectivityMirrordatafrom180measuresLabel.WordWrap = 'on';
app.ExtUI.UPVRobotPostProcessDirectivityMirrordatafrom180measuresLabel.FontSize = 9;
app.ExtUI.UPVRobotPostProcessDirectivityMirrordatafrom180measuresLabel.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessDirectivityMirrordatafrom180measuresLabel.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessDirectivityMirrordatafrom180measuresLabel.Text = 'Mirror data from 180º measures';

% Create UPVRobotPostProcessDirectivityRotatedataPanel
app.ExtUI.UPVRobotPostProcessDirectivityRotatedataPanel = uipanel(app.ExtUI.UPVRobotPostProcessDirectivityToolsCol2Grid);
app.ExtUI.UPVRobotPostProcessDirectivityRotatedataPanel.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessDirectivityRotatedataPanel.TitlePosition = 'centertop';
app.ExtUI.UPVRobotPostProcessDirectivityRotatedataPanel.Title = 'Rotate data';
app.ExtUI.UPVRobotPostProcessDirectivityRotatedataPanel.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotPostProcessDirectivityRotatedataPanel.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessDirectivityRotatedataPanel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDirectivityRotatedataPanel.FontWeight = 'bold';

% Create UPVRobotPostProcessDirectivityRotatedataGrid
app.ExtUI.UPVRobotPostProcessDirectivityRotatedataGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessDirectivityRotatedataPanel);
app.ExtUI.UPVRobotPostProcessDirectivityRotatedataGrid.ColumnWidth = {'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessDirectivityRotatedataGrid.RowHeight = {'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessDirectivityRotatedataGrid.ColumnSpacing = 5;
app.ExtUI.UPVRobotPostProcessDirectivityRotatedataGrid.RowSpacing = 2;
app.ExtUI.UPVRobotPostProcessDirectivityRotatedataGrid.Padding = [1 1 1 1];
app.ExtUI.UPVRobotPostProcessDirectivityRotatedataGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessDirectivityHorizontaldegEditFieldLabel
app.ExtUI.UPVRobotPostProcessDirectivityHorizontaldegEditFieldLabel = uilabel(app.ExtUI.UPVRobotPostProcessDirectivityRotatedataGrid);
app.ExtUI.UPVRobotPostProcessDirectivityHorizontaldegEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotPostProcessDirectivityHorizontaldegEditFieldLabel.WordWrap = 'on';
app.ExtUI.UPVRobotPostProcessDirectivityHorizontaldegEditFieldLabel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDirectivityHorizontaldegEditFieldLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDirectivityHorizontaldegEditFieldLabel.Text = 'Horizontal (deg)';

% Create UPVRobotPostProcessDirectivityHorizontaldegEditField
app.ExtUI.UPVRobotPostProcessDirectivityHorizontaldegEditField = uieditfield(app.ExtUI.UPVRobotPostProcessDirectivityRotatedataGrid, 'numeric');
app.ExtUI.UPVRobotPostProcessDirectivityHorizontaldegEditField.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDirectivityHorizontaldegEditField.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessDirectivityHorizontaldegEditField.Value = 0;
app.ExtUI.UPVRobotPostProcessDirectivityHorizontaldegEditField.ValueChangedFcn = {@UPVRobotPostProcessDirectivityParamChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.DirRotateHor)
    app.ExtUI.UPVRobotPostProcessDirectivityHorizontaldegEditField.Value = app.ExtVar.UPVRobotPostProcess.DirRotateHor;
else
    app.ExtVar.UPVRobotPostProcess.DirRotateHor = app.ExtUI.UPVRobotPostProcessDirectivityHorizontaldegEditField.Value;
end

% Create UPVRobotPostProcessDirectivityVerticaldegEditFieldLabel
app.ExtUI.UPVRobotPostProcessDirectivityVerticaldegEditFieldLabel = uilabel(app.ExtUI.UPVRobotPostProcessDirectivityRotatedataGrid);
app.ExtUI.UPVRobotPostProcessDirectivityVerticaldegEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotPostProcessDirectivityVerticaldegEditFieldLabel.WordWrap = 'on';
app.ExtUI.UPVRobotPostProcessDirectivityVerticaldegEditFieldLabel.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessDirectivityVerticaldegEditFieldLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDirectivityVerticaldegEditFieldLabel.Text = 'Vertical (deg)';

% Create UPVRobotPostProcessDirectivityVerticaldegEditField
app.ExtUI.UPVRobotPostProcessDirectivityVerticaldegEditField = uieditfield(app.ExtUI.UPVRobotPostProcessDirectivityRotatedataGrid, 'numeric');
app.ExtUI.UPVRobotPostProcessDirectivityVerticaldegEditField.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessDirectivityVerticaldegEditField.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessDirectivityVerticaldegEditField.Value = 0;
app.ExtUI.UPVRobotPostProcessDirectivityVerticaldegEditField.ValueChangedFcn = {@UPVRobotPostProcessDirectivityParamChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.DirRotateVer)
    app.ExtUI.UPVRobotPostProcessDirectivityVerticaldegEditField.Value = app.ExtVar.UPVRobotPostProcess.DirRotateVer;
else
    app.ExtVar.UPVRobotPostProcess.DirRotateVer = app.ExtUI.UPVRobotPostProcessDirectivityVerticaldegEditField.Value;
end

% Create UPVRobotPostProcessDirectivityColorRangePanel
app.ExtUI.UPVRobotPostProcessDirectivityColorRangePanel = uipanel(app.ExtUI.UPVRobotPostProcessDirectivityToolsCol2Grid);
app.ExtUI.UPVRobotPostProcessDirectivityColorRangePanel.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessDirectivityColorRangePanel.TitlePosition = 'centertop';
app.ExtUI.UPVRobotPostProcessDirectivityColorRangePanel.Title = 'Color range';
app.ExtUI.UPVRobotPostProcessDirectivityColorRangePanel.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotPostProcessDirectivityColorRangePanel.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessDirectivityColorRangePanel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDirectivityColorRangePanel.FontWeight = 'bold';

% Create UPVRobotPostProcessDirectivityColorRangeGrid
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessDirectivityColorRangePanel);
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeGrid.ColumnWidth = {'fit', '1x', 'fit', '1x'};
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeGrid.RowHeight = {'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeGrid.ColumnSpacing = 2;
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeGrid.RowSpacing = 2;
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeGrid.Padding = [5 5 5 5];
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessDirectivityColorRangeAutomaticCheck
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeAutomaticCheck = uicheckbox(app.ExtUI.UPVRobotPostProcessDirectivityColorRangeGrid);
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeAutomaticCheck.Text = 'Color range automatic';
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeAutomaticCheck.WordWrap = 'on';
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeAutomaticCheck.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeAutomaticCheck.Layout.Column = [1 4];
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeAutomaticCheck.Value = true;
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeAutomaticCheck.ValueChangedFcn = {@UPVRobotPostProcessDirectivityParamChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.DirRangeAuto)
    app.ExtUI.UPVRobotPostProcessDirectivityColorRangeAutomaticCheck.Value = app.ExtVar.UPVRobotPostProcess.DirRangeAuto;
else
    app.ExtVar.UPVRobotPostProcess.DirRangeAuto = app.ExtUI.UPVRobotPostProcessDirectivityColorRangeAutomaticCheck.Value;
end

% Create UPVRobotPostProcessDirectivityColorRangeMinLabel
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMinLabel = uilabel(app.ExtUI.UPVRobotPostProcessDirectivityColorRangeGrid);
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMinLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMinLabel.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMinLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMinLabel.Text = 'Min (dB)';

% Create UPVRobotPostProcessDirectivityColorRangeMinField
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMinField = uieditfield(app.ExtUI.UPVRobotPostProcessDirectivityColorRangeGrid, 'numeric');
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMinField.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMinField.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMinField.ValueDisplayFormat = '%.1f';
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMinField.Value = 70;
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMinField.ValueChangedFcn = {@UPVRobotPostProcessDirectivityParamChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.DirMinRange)
    app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMinField.Value = app.ExtVar.UPVRobotPostProcess.DirMinRange;
else
    app.ExtVar.UPVRobotPostProcess.DirMinRange = app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMinField.Value;
end

% Create UPVRobotPostProcessDirectivityColorRangeMaxLabel
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMaxLabel = uilabel(app.ExtUI.UPVRobotPostProcessDirectivityColorRangeGrid);
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMaxLabel.HorizontalAlignment = 'right';
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMaxLabel.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMaxLabel.Layout.Column = 3;
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMaxLabel.Text = 'Max (dB)';

% Create UPVRobotPostProcessDirectivityColorRangeMaxField
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMaxField = uieditfield(app.ExtUI.UPVRobotPostProcessDirectivityColorRangeGrid, 'numeric');
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMaxField.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMaxField.Layout.Column = 4;
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMaxField.ValueDisplayFormat = '%.1f';
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMaxField.Value = 100;
app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMaxField.ValueChangedFcn = {@UPVRobotPostProcessDirectivityParamChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.DirMaxRange)
    app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMaxField.Value = app.ExtVar.UPVRobotPostProcess.DirMaxRange;
else
    app.ExtVar.UPVRobotPostProcess.DirMaxRange = app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMaxField.Value;
end

% ================================================================================================
% COL 3
% Create UPVRobotPostProcessDirectivityToolsCol3Grid
app.ExtUI.UPVRobotPostProcessDirectivityToolsCol3Grid = uigridlayout(app.ExtUI.GridUPVRobotPostProcessBottomCenterGridDirectivity);
app.ExtUI.UPVRobotPostProcessDirectivityToolsCol3Grid.ColumnWidth = {'1x'};
app.ExtUI.UPVRobotPostProcessDirectivityToolsCol3Grid.RowHeight = {'fit', 'fit','fit'};
app.ExtUI.UPVRobotPostProcessDirectivityToolsCol3Grid.ColumnSpacing = 2;
app.ExtUI.UPVRobotPostProcessDirectivityToolsCol3Grid.RowSpacing = 2;
app.ExtUI.UPVRobotPostProcessDirectivityToolsCol3Grid.Padding = [0 0 0 0];
app.ExtUI.UPVRobotPostProcessDirectivityToolsCol3Grid.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDirectivityToolsCol3Grid.Layout.Column = 3;
app.ExtUI.UPVRobotPostProcessDirectivityToolsCol3Grid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessDirectivitySmoothDataPanel
app.ExtUI.UPVRobotPostProcessDirectivitySmoothDataPanel = uipanel(app.ExtUI.UPVRobotPostProcessDirectivityToolsCol3Grid);
app.ExtUI.UPVRobotPostProcessDirectivitySmoothDataPanel.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessDirectivitySmoothDataPanel.Title = 'Smooth Data';
app.ExtUI.UPVRobotPostProcessDirectivitySmoothDataPanel.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotPostProcessDirectivitySmoothDataPanel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDirectivitySmoothDataPanel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDirectivitySmoothDataPanel.FontWeight = 'bold';

% Create UPVRobotPostProcessDirectivitySmoothGrid
app.ExtUI.UPVRobotPostProcessDirectivitySmoothGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessDirectivitySmoothDataPanel);
app.ExtUI.UPVRobotPostProcessDirectivitySmoothGrid.RowHeight = {'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessDirectivitySmoothGrid.ColumnSpacing = 2;
app.ExtUI.UPVRobotPostProcessDirectivitySmoothGrid.RowSpacing = 2;
app.ExtUI.UPVRobotPostProcessDirectivitySmoothGrid.Padding = [5 5 5 5];
app.ExtUI.UPVRobotPostProcessDirectivitySmoothGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessDirectivitySmoothCheckBox
app.ExtUI.UPVRobotPostProcessDirectivitySmoothCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessDirectivitySmoothGrid);
app.ExtUI.UPVRobotPostProcessDirectivitySmoothCheckBox.Text = 'Smooth';
app.ExtUI.UPVRobotPostProcessDirectivitySmoothCheckBox.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDirectivitySmoothCheckBox.Layout.Column = [1 2];
app.ExtUI.UPVRobotPostProcessDirectivitySmoothCheckBox.Value = 0;
app.ExtUI.UPVRobotPostProcessDirectivitySmoothCheckBox.ValueChangedFcn = {@UPVRobotPostProcessDirectivityParamChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.DirSmooth)
    app.ExtUI.UPVRobotPostProcessDirectivitySmoothCheckBox.Value = app.ExtVar.UPVRobotPostProcess.DirSmooth;
else
    app.ExtVar.UPVRobotPostProcess.DirSmooth = app.ExtUI.UPVRobotPostProcessDirectivitySmoothCheckBox.Value;
end

% Create LevelEditFieldLabel
app.ExtUI.LevelEditFieldLabel = uilabel(app.ExtUI.UPVRobotPostProcessDirectivitySmoothGrid);
app.ExtUI.LevelEditFieldLabel.Layout.Row = 2;
app.ExtUI.LevelEditFieldLabel.Layout.Column = 2;
app.ExtUI.LevelEditFieldLabel.Text = '%';

% Create UPVRobotPostProcessDirectivitySmoothLevelEditField
app.ExtUI.UPVRobotPostProcessDirectivitySmoothLevelEditField = uieditfield(app.ExtUI.UPVRobotPostProcessDirectivitySmoothGrid, 'numeric');
app.ExtUI.UPVRobotPostProcessDirectivitySmoothLevelEditField.Limits = [0 100];
app.ExtUI.UPVRobotPostProcessDirectivitySmoothLevelEditField.RoundFractionalValues = 'on';
app.ExtUI.UPVRobotPostProcessDirectivitySmoothLevelEditField.ValueDisplayFormat = '%g';
app.ExtUI.UPVRobotPostProcessDirectivitySmoothLevelEditField.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessDirectivitySmoothLevelEditField.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDirectivitySmoothLevelEditField.Value = 5;
app.ExtUI.UPVRobotPostProcessDirectivitySmoothLevelEditField.ValueChangedFcn = {@UPVRobotPostProcessDirectivityParamChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.DirSmoothLev)
    app.ExtUI.UPVRobotPostProcessDirectivitySmoothLevelEditField.Value = app.ExtVar.UPVRobotPostProcess.DirSmoothLev;
else
    app.ExtVar.UPVRobotPostProcess.DirSmoothLev = app.ExtUI.UPVRobotPostProcessDirectivitySmoothLevelEditField.Value;
end

% Create UPVRobotPostProcessDirectivityUnitsPanel
app.ExtUI.UPVRobotPostProcessDirectivityUnitsPanel = uipanel(app.ExtUI.UPVRobotPostProcessDirectivityToolsCol3Grid);
app.ExtUI.UPVRobotPostProcessDirectivityUnitsPanel.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessDirectivityUnitsPanel.TitlePosition = 'centertop';
app.ExtUI.UPVRobotPostProcessDirectivityUnitsPanel.Title = 'Units';
app.ExtUI.UPVRobotPostProcessDirectivityUnitsPanel.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotPostProcessDirectivityUnitsPanel.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessDirectivityUnitsPanel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDirectivityUnitsPanel.FontWeight = 'bold';

% Create UPVRobotPostProcessDirectivityUnitsGrid
app.ExtUI.UPVRobotPostProcessDirectivityUnitsGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessDirectivityUnitsPanel);
app.ExtUI.UPVRobotPostProcessDirectivityUnitsGrid.ColumnWidth = {'1x'};
app.ExtUI.UPVRobotPostProcessDirectivityUnitsGrid.RowHeight = {'fit'};
app.ExtUI.UPVRobotPostProcessDirectivityUnitsGrid.ColumnSpacing = 2;
app.ExtUI.UPVRobotPostProcessDirectivityUnitsGrid.RowSpacing = 2;
app.ExtUI.UPVRobotPostProcessDirectivityUnitsGrid.Padding = [5 5 5 5];
app.ExtUI.UPVRobotPostProcessDirectivityUnitsGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessDirectivityUnitsSwitch
app.ExtUI.UPVRobotPostProcessDirectivityUnitsSwitch = uiswitch(app.ExtUI.UPVRobotPostProcessDirectivityUnitsGrid, 'slider');
app.ExtUI.UPVRobotPostProcessDirectivityUnitsSwitch.Items = {'dB', 'Pa'};
app.ExtUI.UPVRobotPostProcessDirectivityUnitsSwitch.FontSize = 11;
app.ExtUI.UPVRobotPostProcessDirectivityUnitsSwitch.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDirectivityUnitsSwitch.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessDirectivityUnitsSwitch.Value = 'dB';
app.ExtUI.UPVRobotPostProcessDirectivityUnitsSwitch.ValueChangedFcn = {@UPVRobotPostProcessDirectivityParamChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.DirUnits)
    app.ExtUI.UPVRobotPostProcessDirectivityUnitsSwitch.Value = app.ExtVar.UPVRobotPostProcess.DirUnits;
else
    app.ExtVar.UPVRobotPostProcess.DirUnits = app.ExtUI.UPVRobotPostProcessDirectivityUnitsSwitch.Value;
end

switch app.ExtVar.UPVRobotPostProcess.DirUnits
    case 'dB'
        app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMinLabel.Text = 'Min (dB)';
        app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMaxLabel.Text = 'Max (dB)';
    case 'Pa'
        app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMinLabel.Text = 'Min (Pa)';
        app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMaxLabel.Text = 'Max (Pa)';
end

% Create UPVRobotPostProcessExportPanel
app.ExtUI.UPVRobotPostProcessExportPanel = uipanel(app.ExtUI.UPVRobotPostProcessDirectivityToolsCol3Grid);
app.ExtUI.UPVRobotPostProcessExportPanel.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessExportPanel.Title = 'Export';
app.ExtUI.UPVRobotPostProcessExportPanel.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotPostProcessExportPanel.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessExportPanel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessExportPanel.FontWeight = 'bold';

% Create UPVRobotPostProcessExportGrid
app.ExtUI.UPVRobotPostProcessExportGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessExportPanel);
app.ExtUI.UPVRobotPostProcessExportGrid.ColumnWidth = {'1x'};
app.ExtUI.UPVRobotPostProcessExportGrid.RowHeight = {'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessExportGrid.Padding = [5 5 5 5];
app.ExtUI.UPVRobotPostProcessExportGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessExportGraphicButton
app.ExtUI.UPVRobotPostProcessExportGraphicButton = uibutton(app.ExtUI.UPVRobotPostProcessExportGrid, 'push');
app.ExtUI.UPVRobotPostProcessExportGraphicButton.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessExportGraphicButton.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessExportGraphicButton.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessExportGraphicButton.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessExportGraphicButton.Text = 'Graphic';

% Create UPVRobotPostProcessExportDataButton
app.ExtUI.UPVRobotPostProcessExportDataButton = uibutton(app.ExtUI.UPVRobotPostProcessExportGrid, 'push');
app.ExtUI.UPVRobotPostProcessExportDataButton.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessExportDataButton.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessExportDataButton.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessExportDataButton.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessExportDataButton.Text = 'Data';


% ================================================================================================
% Logics
if ~isempty(app.ExtVar.UPVRobotPostProcess.DirPlotType2D)
    if strcmp(app.ExtVar.UPVRobotPostProcess.DirPlotType2D,'Rectangular')
        app.ExtUI.UPVRobotPostProcessDirectivityFrequencyresponseCheckBox.Value = 0;
        app.ExtUI.UPVRobotPostProcessDirectivityRectangularcoordinatesCheckBox.Value = 1;
        app.ExtUI.UPVRobotPostProcessDirectivityHorVerSwitch.Enable = 'off';
        app.ExtUI.UPVRobotPostProcessDirectivityForce360CheckBox.Enable = 'on';
        app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesGrid.RowHeight = {0, 'fit', 20};
    else
        app.ExtUI.UPVRobotPostProcessDirectivityFrequencyresponseCheckBox.Value = 1;
        app.ExtUI.UPVRobotPostProcessDirectivityRectangularcoordinatesCheckBox.Value = 0;
        app.ExtVar.UPVRobotPostProcess.DirPlotType2D = 'Frequency';
        app.ExtUI.UPVRobotPostProcessDirectivityHorVerSwitch.Enable = 'on';
        app.ExtUI.UPVRobotPostProcessDirectivityForce360CheckBox.Enable = 'on';
        app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesGrid.RowHeight = {0, 0, 20};
    end
else
    app.ExtUI.UPVRobotPostProcessDirectivityRectangularcoordinatesCheckBox.Value = 0;
    app.ExtUI.UPVRobotPostProcessDirectivityFrequencyresponseCheckBox.Value = 1;
    app.ExtUI.UPVRobotPostProcessDirectivityHorVerSwitch.Enable = 'on';
    app.ExtUI.UPVRobotPostProcessDirectivityForce360CheckBox.Enable = 'on';
    app.ExtVar.UPVRobotPostProcess.DirPlotType2D = 'Frequency';
    app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesGrid.RowHeight = {0, 0, 20};
end

switch app.ExtVar.UPVRobotPostProcess.DirectivityType
    case 'Hemisphere'
        app.ExtUI.UPVRobotPostProcessDirectivityHorVerSwitch.Visible = 'on';
    case 'Hor/Ver'
        if app.ExtVar.UPVRobotPostProcess.incTheta == 0
           app.ExtUI.UPVRobotPostProcessDirectivityHorVerSwitch.Visible = 'off'; 
           app.ExtUI.UPVRobotPostProcessDirectivityPlaneLabel.Visible  = 'off';
           app.ExtUI.UPVRobotPostProcessDirectivityHorVerSwitch.Value = 'Horizontal';
           app.ExtVar.UPVRobotPostProcess.DirPolarPlane = 'Horizontal';
        end
        if app.ExtVar.UPVRobotPostProcess.incPhi == 0
            app.ExtUI.UPVRobotPostProcessDirectivityHorVerSwitch.Visible = 'off'; 
            app.ExtUI.UPVRobotPostProcessDirectivityPlaneLabel.Visible  = 'off';
            app.ExtUI.UPVRobotPostProcessDirectivityHorVerSwitch.Value = 'Vertical';
            app.ExtVar.UPVRobotPostProcess.DirPolarPlane = 'Vertical';
        end
end

% Selected tab logic
if ~isempty(app.ExtVar.UPVRobotPostProcess.DirType)
    idx = find(strcmp({app.ExtUI.UPVRobotPostProcessDirectivityTabGroup.Children.Title},app.ExtVar.UPVRobotPostProcess.DirType), 1);
    if ~isempty(idx)
        app.ExtUI.UPVRobotPostProcessDirectivityTabGroup.SelectedTab = app.ExtUI.UPVRobotPostProcessDirectivityTabGroup.Children(idx);
    else
        app.ExtVar.UPVRobotPostProcess.DirType = app.ExtUI.UPVRobotPostProcessDirectivityTabGroup.SelectedTab.Title;
    end
else
    app.ExtVar.UPVRobotPostProcess.DirType = app.ExtUI.UPVRobotPostProcessDirectivityTabGroup.SelectedTab.Title;
end

% Load specific tools and plot
switch app.ExtVar.UPVRobotPostProcess.DirType
    case 'Polar'
        % Plot
        UPVRobotPostProcessDirToolsPolar(app)
    case '2D'
        % Plot
        UPVRobotPostProcessDirTools2D(app)
    case '3D'
        % Plot
        UPVRobotPostProcessDirTools3D(app)
    case 'Parameters'
        UPVRobotPostProcessDirToolsParams(app)
end

% Plot
UPVRobotPostProcessPlot(app)
drawnow
app.ExtUI.UPVRobotPostProcessDirectivityTabGroup.Visible = 'on';
app.ExtUI.GridUPVRobotPostProcessBottomCenterGridDirectivity.Visible = 'on';
drawnow

function UPVRobotPostProcessDirToolsPolar(app)
app.ExtUI.UPVRobotPostProcessDirectivityColorRangePanel.Visible = 'off';
app.ExtUI.UPVRobotPostProcessDirectivityPlottypePanel.Visible = 'off';
app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesGrid.RowHeight = {'fit', 0, 20};
app.ExtUI.UPVRobotPostProcessDirectivityReferenceGrid.RowHeight = {'fit', 'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessDirectivityRotatedataPanel.Visible = 'on';
app.ExtUI.UPVRobotPostProcessDirectivityRotatedataPanel.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessDirectivityColorRangePanel.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessDirectivityPlaneGrid.RowHeight = {'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessDirectivityForce360CheckBox.Enable = 'on';
app.ExtUI.UPVRobotPostProcessDirectivityHorVerSwitch.Enable = 'on';
app.ExtUI.UPVRobotPostProcessDirectivityAxisPanel.Visible = 'off';
app.ExtUI.UPVRobotPostProcessDirectivityReferencePanel.Visible = 'on';
app.ExtUI.UPVRobotPostProcessDirectivityPlanePanel.Visible = 'on';
app.ExtUI.UPVRobotPostProcessDirectivityUnitsPanel.Visible = 'on';
app.ExtUI.UPVRobotPostProcessDirectivitySmoothDataPanel.Visible = 'on';
drawnow


function UPVRobotPostProcessDirTools2D(app)
app.ExtUI.UPVRobotPostProcessDirectivityColorRangePanel.Visible = 'on';
app.ExtUI.UPVRobotPostProcessDirectivityPlottypePanel.Visible = 'on';
app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesGrid.RowHeight = {0, 0, 20};
app.ExtUI.UPVRobotPostProcessDirectivityReferenceGrid.RowHeight = {'fit', 0, 0};
app.ExtUI.UPVRobotPostProcessDirectivityRotatedataPanel.Visible = 'off';
app.ExtUI.UPVRobotPostProcessDirectivityRotatedataPanel.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessDirectivityColorRangePanel.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessDirectivityPlaneGrid.RowHeight = {'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessDirectivityAxisPanel.Visible = 'off';
app.ExtUI.UPVRobotPostProcessDirectivityReferencePanel.Visible = 'on';
app.ExtUI.UPVRobotPostProcessDirectivityPlanePanel.Visible = 'on';
app.ExtUI.UPVRobotPostProcessDirectivityUnitsPanel.Visible = 'on';
app.ExtUI.UPVRobotPostProcessDirectivitySmoothDataPanel.Visible = 'on';
if app.ExtUI.UPVRobotPostProcessDirectivityRectangularcoordinatesCheckBox.Value
    app.ExtVar.UPVRobotPostProcess.DirPlotType2D = 'Rectangular';
    app.ExtUI.UPVRobotPostProcessDirectivityFrequencyresponseCheckBox.Value = 0;
    app.ExtUI.UPVRobotPostProcessDirectivityForce360CheckBox.Enable = 'on';
    app.ExtUI.UPVRobotPostProcessDirectivityHorVerSwitch.Enable = 'off';
    app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesGrid.RowHeight = {0, 'fit', 20};
else
    app.ExtUI.UPVRobotPostProcessDirectivityFrequencyresponseCheckBox.Value = 1;
    app.ExtVar.UPVRobotPostProcess.DirPlotType2D = 'Frequency';
    app.ExtUI.UPVRobotPostProcessDirectivityForce360CheckBox.Enable = 'on';
    app.ExtUI.UPVRobotPostProcessDirectivityHorVerSwitch.Enable = 'on';
    app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesGrid.RowHeight = {0, 0, 20};
end
drawnow

function UPVRobotPostProcessDirTools3D(app)
app.ExtUI.UPVRobotPostProcessDirectivityColorRangePanel.Visible = 'on';
app.ExtUI.UPVRobotPostProcessDirectivityPlottypePanel.Visible = 'off';
app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesGrid.RowHeight = {0, 'fit', 20};
app.ExtUI.UPVRobotPostProcessDirectivityReferenceGrid.RowHeight = {'fit', 0, 0};
app.ExtUI.UPVRobotPostProcessDirectivityRotatedataPanel.Visible = 'on';
app.ExtUI.UPVRobotPostProcessDirectivityRotatedataPanel.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessDirectivityColorRangePanel.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessDirectivityPlaneGrid.RowHeight = {0, 'fit'};
app.ExtUI.UPVRobotPostProcessDirectivityForce360CheckBox.Enable = 'on';
app.ExtUI.UPVRobotPostProcessDirectivityAxisPanel.Visible = 'on';
app.ExtUI.UPVRobotPostProcessDirectivityReferencePanel.Visible = 'on';
app.ExtUI.UPVRobotPostProcessDirectivityPlanePanel.Visible = 'on';
app.ExtUI.UPVRobotPostProcessDirectivityUnitsPanel.Visible = 'on';
app.ExtUI.UPVRobotPostProcessDirectivitySmoothDataPanel.Visible = 'on';
drawnow

function UPVRobotPostProcessDirToolsParams(app)
app.ExtUI.UPVRobotPostProcessDirectivityColorRangePanel.Visible = 'off';
app.ExtUI.UPVRobotPostProcessDirectivityPlottypePanel.Visible = 'off';
app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesGrid.RowHeight = {'fit', 0, 20};
app.ExtUI.UPVRobotPostProcessDirectivityRotatedataPanel.Visible = 'off';
app.ExtUI.UPVRobotPostProcessDirectivityAxisPanel.Visible = 'off';
app.ExtUI.UPVRobotPostProcessDirectivityReferencePanel.Visible = 'off';
app.ExtUI.UPVRobotPostProcessDirectivityPlanePanel.Visible = 'off';
app.ExtUI.UPVRobotPostProcessDirectivityUnitsPanel.Visible = 'off';
app.ExtUI.UPVRobotPostProcessDirectivitySmoothDataPanel.Visible = 'off';
drawnow

function UPVRobotPostProcessDirTabChanged(~,~,app)
% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Loading',...
    'Indeterminate','on');

% Update DirType
app.ExtVar.UPVRobotPostProcess.DirType = app.ExtUI.UPVRobotPostProcessDirectivityTabGroup.SelectedTab.Title;

% Load specific tools
switch app.ExtVar.UPVRobotPostProcess.DirType
    case 'Polar'
        % Plot
        UPVRobotPostProcessDirToolsPolar(app)
        UPVRobotPostProcessPlot(app)
    case '2D'
        % Plot
        UPVRobotPostProcessDirTools2D(app)
        UPVRobotPostProcessPlot(app)
    case '3D'
        % Plot
        UPVRobotPostProcessDirTools3D(app)
        UPVRobotPostProcessPlot(app)
    case 'Parameters'
        UPVRobotPostProcessDirToolsParams(app)
        UPVRobotPostProcessPlot(app)
        
end

% Close info
drawnow
pause(0.5)
close(d)

function UPVRobotPostProcessDirectivityParamChanged(~,~,app)
app.ExtVar.UPVRobotPostProcess.DirReference = app.ExtUI.UPVRobotPostProcessDirectivityReferenceSwitch.Value;
app.ExtVar.UPVRobotPostProcess.DirDataType = app.ExtUI.UPVRobotPostProcessDirectivityFromSwitch.Value;
valuesSTR = app.ExtUI.UPVRobotPostProcessDirectivityFreqPolarArray.Value;
try
    values = cell2mat( textscan( char(valuesSTR),'%f,'));
    app.ExtVar.UPVRobotPostProcess.DirFreqPolar = values(:)';
catch
    values = app.ExtVar.UPVRobotPostProcess.DirFreqPolar;
    app.ExtUI.UPVRobotPostProcessDirectivityFreqPolarArray.Value = erase(num2str(values(:)','%g,'), ' ');
end
app.ExtVar.UPVRobotPostProcess.DirFreq3D = app.ExtUI.UPVRobotPostProcessDirectivityFreq3D.Value;
app.ExtVar.UPVRobotPostProcess.DirPolarPlane = app.ExtUI.UPVRobotPostProcessDirectivityHorVerSwitch.Value;
app.ExtVar.UPVRobotPostProcess.DirRefAngle = app.ExtUI.UPVRobotPostProcessDirectivityFromAngleValueField.Value;
app.ExtVar.UPVRobotPostProcess.DirRotateHor = app.ExtUI.UPVRobotPostProcessDirectivityHorizontaldegEditField.Value;
app.ExtVar.UPVRobotPostProcess.DirRotateVer = app.ExtUI.UPVRobotPostProcessDirectivityVerticaldegEditField.Value;
app.ExtVar.UPVRobotPostProcess.Dir360 = app.ExtUI.UPVRobotPostProcessDirectivityForce360CheckBox.Value;
app.ExtVar.UPVRobotPostProcess.DirRangeAuto = app.ExtUI.UPVRobotPostProcessDirectivityColorRangeAutomaticCheck.Value;
app.ExtVar.UPVRobotPostProcess.DirMinRange = app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMinField.Value;
app.ExtVar.UPVRobotPostProcess.DirMaxRange = app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMaxField.Value;
app.ExtVar.UPVRobotPostProcess.DirSmoothLev = app.ExtUI.UPVRobotPostProcessDirectivitySmoothLevelEditField.Value;
app.ExtVar.UPVRobotPostProcess.DirSmooth = app.ExtUI.UPVRobotPostProcessDirectivitySmoothCheckBox.Value;
app.ExtVar.UPVRobotPostProcess.Dir3DAxis = app.ExtUI.UPVRobotPostProcessDirectivityAxisShowCheckBox.Value;
app.ExtVar.UPVRobotPostProcess.DirUnits = app.ExtUI.UPVRobotPostProcessDirectivityUnitsSwitch.Value;
app.ExtVar.UPVRobotPostProcess.Dir3DAxisArrows = app.ExtUI.UPVRobotPostProcessDirectivityAxisShowCheckBox.Value;
app.ExtVar.UPVRobotPostProcess.Dir3DAxisPolar = app.ExtUI.UPVRobotPostProcessDirectivityAxisShowPolarCheckBox.Value;
app.ExtVar.UPVRobotPostProcess.Dir3DAxisCart = app.ExtUI.UPVRobotPostProcessDirectivityAxisShowCartCheckBox.Value;


if ~app.ExtVar.UPVRobotPostProcess.Dir360 && strcmp(app.ExtVar.UPVRobotPostProcess.DirType,'Polar')
    app.ExtUI.UPVRobotPostProcessDirectivityHorizontaldegEditField.Enable = 'off';
    app.ExtUI.UPVRobotPostProcessDirectivityVerticaldegEditField.Enable = 'off';
else
    app.ExtUI.UPVRobotPostProcessDirectivityHorizontaldegEditField.Enable = 'on';
    app.ExtUI.UPVRobotPostProcessDirectivityVerticaldegEditField.Enable = 'on';
end

if app.ExtVar.UPVRobotPostProcess.DirSmooth
    app.ExtUI.UPVRobotPostProcessDirectivitySmoothLevelEditField.Enable = 'on';
else
    app.ExtUI.UPVRobotPostProcessDirectivitySmoothLevelEditField.Enable = 'off';
end
switch app.ExtVar.UPVRobotPostProcess.DirUnits
    case 'dB'
        app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMinLabel.Text = 'Min (dB)';
        app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMaxLabel.Text = 'Max (dB)';
        app.ExtUI.UPVRobotPostProcessDirectivityReferenceSwitch.Enable = 'on';
        app.ExtUI.UPVRobotPostProcessDirectivityFromangledegCheckBox.Enable = 'on';
        app.ExtUI.UPVRobotPostProcessDirectivityFrommaxvalueCheckBox.Enable = 'on';
    case 'Pa'
        app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMinLabel.Text = 'Min (Pa)';
        app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMaxLabel.Text = 'Max (Pa)';
        app.ExtUI.UPVRobotPostProcessDirectivityReferenceSwitch.Enable = 'off';
        app.ExtUI.UPVRobotPostProcessDirectivityFromangledegCheckBox.Enable = 'off';
app.ExtUI.UPVRobotPostProcessDirectivityFrommaxvalueCheckBox.Enable = 'off';
end
if app.ExtVar.UPVRobotPostProcess.DirRangeAuto
    app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMinField.Enable = 'off';
    app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMaxField.Enable = 'off';
else
    app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMinField.Enable = 'on';
    app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMaxField.Enable = 'on';
end
drawnow
UPVRobotPostProcessPlot(app)

function UPVRobotPostProcessDirectivityParamRefMaxChanged(~,~,app)
if app.ExtUI.UPVRobotPostProcessDirectivityFrommaxvalueCheckBox.Value
    app.ExtVar.UPVRobotPostProcess.DirRefType = 'Max';
    app.ExtUI.UPVRobotPostProcessDirectivityFromangledegCheckBox.Value = 0;
else
    app.ExtUI.UPVRobotPostProcessDirectivityFromangledegCheckBox.Value = 1;
    app.ExtVar.UPVRobotPostProcess.DirRefType = 'Angle';
end
drawnow
UPVRobotPostProcessPlot(app)



function UPVRobotPostProcessDirectivityParamRefAngleChanged(~,~,app)
if app.ExtUI.UPVRobotPostProcessDirectivityFromangledegCheckBox.Value
    app.ExtVar.UPVRobotPostProcess.DirRefType = 'Angle';
    app.ExtUI.UPVRobotPostProcessDirectivityFrommaxvalueCheckBox.Value = 0;
else
    app.ExtUI.UPVRobotPostProcessDirectivityFrommaxvalueCheckBox.Value = 1;
    app.ExtVar.UPVRobotPostProcess.DirRefType = 'Max';
end
drawnow
UPVRobotPostProcessPlot(app)

function UPVRobotPostProcessDirectivityPlot2DRectChanged(~,~,app)
if app.ExtUI.UPVRobotPostProcessDirectivityRectangularcoordinatesCheckBox.Value
    app.ExtVar.UPVRobotPostProcess.DirPlotType2D = 'Rectangular';
    app.ExtUI.UPVRobotPostProcessDirectivityFrequencyresponseCheckBox.Value = 0;
    app.ExtUI.UPVRobotPostProcessDirectivityForce360CheckBox.Enable = 'on';
    app.ExtUI.UPVRobotPostProcessDirectivityHorVerSwitch.Enable = 'off';
    app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesGrid.RowHeight = {0, 'fit', 20};
else
    app.ExtUI.UPVRobotPostProcessDirectivityFrequencyresponseCheckBox.Value = 1;
    app.ExtVar.UPVRobotPostProcess.DirPlotType2D = 'Frequency';
    app.ExtUI.UPVRobotPostProcessDirectivityForce360CheckBox.Enable = 'on';
    app.ExtUI.UPVRobotPostProcessDirectivityHorVerSwitch.Enable = 'on';
    app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesGrid.RowHeight = {0, 0, 20};
end
drawnow
UPVRobotPostProcessPlot(app)


function UPVRobotPostProcessDirectivityPlot2DFreqChanged(~,~,app)
if app.ExtUI.UPVRobotPostProcessDirectivityFrequencyresponseCheckBox.Value
    app.ExtVar.UPVRobotPostProcess.DirPlotType2D = 'Frequency';
    app.ExtUI.UPVRobotPostProcessDirectivityRectangularcoordinatesCheckBox.Value = 0;
    app.ExtUI.UPVRobotPostProcessDirectivityForce360CheckBox.Enable = 'on';
    app.ExtUI.UPVRobotPostProcessDirectivityHorVerSwitch.Enable = 'on';
    app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesGrid.RowHeight = {0, 0, 20};
else
    app.ExtUI.UPVRobotPostProcessDirectivityRectangularcoordinatesCheckBox.Value = 1;
    app.ExtVar.UPVRobotPostProcess.DirPlotType2D = 'Rectangular';
    app.ExtUI.UPVRobotPostProcessDirectivityForce360CheckBox.Enable = 'on';
    app.ExtUI.UPVRobotPostProcessDirectivityHorVerSwitch.Enable = 'off';
    app.ExtUI.UPVRobotPostProcessDirectivityFrequenciesGrid.RowHeight = {0, 'fit', 20};
end
drawnow
UPVRobotPostProcessPlot(app)