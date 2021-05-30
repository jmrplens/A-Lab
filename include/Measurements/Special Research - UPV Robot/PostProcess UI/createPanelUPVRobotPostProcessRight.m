function createPanelUPVRobotPostProcessRight(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Create UPVRobotPostProcessMeasureinformationPanel
app.ExtUI.UPVRobotPostProcessMeasureinformationPanel = uipanel(app.ExtUI.GridRightMain);
app.ExtUI.UPVRobotPostProcessMeasureinformationPanel.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessMeasureinformationPanel.Title = 'Measure information';
app.ExtUI.UPVRobotPostProcessMeasureinformationPanel.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotPostProcessMeasureinformationPanel.Layout.Row = [1 2];
app.ExtUI.UPVRobotPostProcessMeasureinformationPanel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessMeasureinformationPanel.FontAngle = 'italic';
app.ExtUI.UPVRobotPostProcessMeasureinformationPanel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessMeasureinformationPanel.Visible = 'off';

% Create UPVRobotPostProcessMeasureinformationGrid
app.ExtUI.UPVRobotPostProcessMeasureinformationGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessMeasureinformationPanel);
app.ExtUI.UPVRobotPostProcessMeasureinformationGrid.ColumnWidth = {'1x'};
app.ExtUI.UPVRobotPostProcessMeasureinformationGrid.RowHeight = {'fit', 'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessMeasureinformationGrid.RowSpacing = 2;
app.ExtUI.UPVRobotPostProcessMeasureinformationGrid.Padding = [2 2 2 2];
app.ExtUI.UPVRobotPostProcessMeasureinformationGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessMeasureinformationHardwarePanel
app.ExtUI.UPVRobotPostProcessMeasureinformationHardwarePanel = uipanel(app.ExtUI.UPVRobotPostProcessMeasureinformationGrid);
app.ExtUI.UPVRobotPostProcessMeasureinformationHardwarePanel.BorderType = 'none';
app.ExtUI.UPVRobotPostProcessMeasureinformationHardwarePanel.Title = 'Hardware';
app.ExtUI.UPVRobotPostProcessMeasureinformationHardwarePanel.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessMeasureinformationHardwarePanel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessMeasureinformationHardwarePanel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessMeasureinformationHardwarePanel.FontWeight = 'bold';

% Create UPVRobotPostProcessMeasureinformationHardwareGrid
app.ExtUI.UPVRobotPostProcessMeasureinformationHardwareGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessMeasureinformationHardwarePanel);
app.ExtUI.UPVRobotPostProcessMeasureinformationHardwareGrid.RowHeight = {'1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x'};
app.ExtUI.UPVRobotPostProcessMeasureinformationHardwareGrid.RowSpacing = 5;
app.ExtUI.UPVRobotPostProcessMeasureinformationHardwareGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessMeasureDeviceLabel
app.ExtUI.UPVRobotPostProcessMeasureDeviceLabel = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationHardwareGrid);
app.ExtUI.UPVRobotPostProcessMeasureDeviceLabel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessMeasureDeviceLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessMeasureDeviceLabel.Text = 'Device';

% Create UPVRobotPostProcessMeasureDeviceInfo
app.ExtUI.UPVRobotPostProcessMeasureDeviceInfo = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationHardwareGrid);
app.ExtUI.UPVRobotPostProcessMeasureDeviceInfo.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessMeasureDeviceInfo.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessMeasureDeviceInfo.Text = 'Default';

% Create UPVRobotPostProcessMeasureSampleRateLabel
app.ExtUI.UPVRobotPostProcessMeasureSampleRateLabel = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationHardwareGrid);
app.ExtUI.UPVRobotPostProcessMeasureSampleRateLabel.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessMeasureSampleRateLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessMeasureSampleRateLabel.Text = 'Sample rate';

% Create UPVRobotPostProcessMeasureSampleRateInfo
app.ExtUI.UPVRobotPostProcessMeasureSampleRateInfo = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationHardwareGrid);
app.ExtUI.UPVRobotPostProcessMeasureSampleRateInfo.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessMeasureSampleRateInfo.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessMeasureSampleRateInfo.Text = '48000 Hz';

% Create UPVRobotPostProcessMeasureSamplesPerFrameLabel
app.ExtUI.UPVRobotPostProcessMeasureSamplesPerFrameLabel = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationHardwareGrid);
app.ExtUI.UPVRobotPostProcessMeasureSamplesPerFrameLabel.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessMeasureSamplesPerFrameLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessMeasureSamplesPerFrameLabel.Text = 'Samples per frame';

% Create UPVRobotPostProcessMeasureSamplesPerFrameInfo
app.ExtUI.UPVRobotPostProcessMeasureSamplesPerFrameInfo = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationHardwareGrid);
app.ExtUI.UPVRobotPostProcessMeasureSamplesPerFrameInfo.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessMeasureSamplesPerFrameInfo.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessMeasureSamplesPerFrameInfo.Text = '1024';

% Create UPVRobotPostProcessMeasureBitDepthLabel
app.ExtUI.UPVRobotPostProcessMeasureBitDepthLabel = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationHardwareGrid);
app.ExtUI.UPVRobotPostProcessMeasureBitDepthLabel.Layout.Row = 4;
app.ExtUI.UPVRobotPostProcessMeasureBitDepthLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessMeasureBitDepthLabel.Text = 'Bit Depth';

% Create UPVRobotPostProcessMeasureBitdepthInfo
app.ExtUI.UPVRobotPostProcessMeasureBitdepthInfo = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationHardwareGrid);
app.ExtUI.UPVRobotPostProcessMeasureBitdepthInfo.Layout.Row = 4;
app.ExtUI.UPVRobotPostProcessMeasureBitdepthInfo.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessMeasureBitdepthInfo.Text = '24-bit integer';

% Create UPVRobotPostProcessMeasureInputChLabel
app.ExtUI.UPVRobotPostProcessMeasureInputChLabel = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationHardwareGrid);
app.ExtUI.UPVRobotPostProcessMeasureInputChLabel.Layout.Row = 5;
app.ExtUI.UPVRobotPostProcessMeasureInputChLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessMeasureInputChLabel.Text = 'Input Channel';

% Create UPVRobotPostProcessMeasureInputChInfo
app.ExtUI.UPVRobotPostProcessMeasureInputChInfo = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationHardwareGrid);
app.ExtUI.UPVRobotPostProcessMeasureInputChInfo.Layout.Row = 5;
app.ExtUI.UPVRobotPostProcessMeasureInputChInfo.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessMeasureInputChInfo.Text = '1';

% Create UPVRobotPostProcessMeasureOutputChLabel
app.ExtUI.UPVRobotPostProcessMeasureOutputChLabel = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationHardwareGrid);
app.ExtUI.UPVRobotPostProcessMeasureOutputChLabel.Layout.Row = 6;
app.ExtUI.UPVRobotPostProcessMeasureOutputChLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessMeasureOutputChLabel.Text = 'Output Channel';

% Create UPVRobotPostProcessMeasureOutputChInfo
app.ExtUI.UPVRobotPostProcessMeasureOutputChInfo = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationHardwareGrid);
app.ExtUI.UPVRobotPostProcessMeasureOutputChInfo.Layout.Row = 6;
app.ExtUI.UPVRobotPostProcessMeasureOutputChInfo.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessMeasureOutputChInfo.Text = '1';

% Create UPVRobotPostProcessMeasureLatencyLabel
app.ExtUI.UPVRobotPostProcessMeasureLatencyLabel = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationHardwareGrid);
app.ExtUI.UPVRobotPostProcessMeasureLatencyLabel.Layout.Row = 7;
app.ExtUI.UPVRobotPostProcessMeasureLatencyLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessMeasureLatencyLabel.Text = 'Latency';

% Create UPVRobotPostProcessMeasureLatencyInfo
app.ExtUI.UPVRobotPostProcessMeasureLatencyInfo = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationHardwareGrid);
app.ExtUI.UPVRobotPostProcessMeasureLatencyInfo.Layout.Row = 7;
app.ExtUI.UPVRobotPostProcessMeasureLatencyInfo.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessMeasureLatencyInfo.Text = '30.34 ms';

% Create UPVRobotPostProcessMeasureSensivityLabel
app.ExtUI.UPVRobotPostProcessMeasureSensivityLabel = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationHardwareGrid);
app.ExtUI.UPVRobotPostProcessMeasureSensivityLabel.Layout.Row = 8;
app.ExtUI.UPVRobotPostProcessMeasureSensivityLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessMeasureSensivityLabel.Text = 'Sensitivity';

% Create UPVRobotPostProcessMeasureSensivityInfo
app.ExtUI.UPVRobotPostProcessMeasureSensivityInfo = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationHardwareGrid);
app.ExtUI.UPVRobotPostProcessMeasureSensivityInfo.Layout.Row = 8;
app.ExtUI.UPVRobotPostProcessMeasureSensivityInfo.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessMeasureSensivityInfo.Text = 'Not calibrated';

% Create UPVRobotPostProcessMeasureinformationSignalPanel
app.ExtUI.UPVRobotPostProcessMeasureinformationSignalPanel = uipanel(app.ExtUI.UPVRobotPostProcessMeasureinformationGrid);
app.ExtUI.UPVRobotPostProcessMeasureinformationSignalPanel.BorderType = 'none';
app.ExtUI.UPVRobotPostProcessMeasureinformationSignalPanel.Title = 'Signal';
app.ExtUI.UPVRobotPostProcessMeasureinformationSignalPanel.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessMeasureinformationSignalPanel.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessMeasureinformationSignalPanel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessMeasureinformationSignalPanel.FontWeight = 'bold';

% Create UPVRobotPostProcessMeasureinformationSignalGrid
app.ExtUI.UPVRobotPostProcessMeasureinformationSignalGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessMeasureinformationSignalPanel);
app.ExtUI.UPVRobotPostProcessMeasureinformationSignalGrid.RowHeight = {'1x', '1x', '1x'};
app.ExtUI.UPVRobotPostProcessMeasureinformationSignalGrid.RowSpacing = 5;
app.ExtUI.UPVRobotPostProcessMeasureinformationSignalGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessMeasureTypeSignalLabel
app.ExtUI.UPVRobotPostProcessMeasureTypeSignalLabel = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationSignalGrid);
app.ExtUI.UPVRobotPostProcessMeasureTypeSignalLabel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessMeasureTypeSignalLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessMeasureTypeSignalLabel.Text = 'Type';

% Create UPVRobotPostProcessMeasureTypeSignalInfo
app.ExtUI.UPVRobotPostProcessMeasureTypeSignalInfo = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationSignalGrid);
app.ExtUI.UPVRobotPostProcessMeasureTypeSignalInfo.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessMeasureTypeSignalInfo.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessMeasureTypeSignalInfo.Text = 'Sweep';

% Create UPVRobotPostProcessMeasureDurationLabel
app.ExtUI.UPVRobotPostProcessMeasureDurationLabel = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationSignalGrid);
app.ExtUI.UPVRobotPostProcessMeasureDurationLabel.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessMeasureDurationLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessMeasureDurationLabel.Text = 'Total duration';

% Create UPVRobotPostProcessMeasureDurationInfo
app.ExtUI.UPVRobotPostProcessMeasureDurationInfo = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationSignalGrid);
app.ExtUI.UPVRobotPostProcessMeasureDurationInfo.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessMeasureDurationInfo.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessMeasureDurationInfo.Text = '1.5 s';

% Create UPVRobotPostProcessMeasureAveragesLabel
app.ExtUI.UPVRobotPostProcessMeasureAveragesLabel = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationSignalGrid);
app.ExtUI.UPVRobotPostProcessMeasureAveragesLabel.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessMeasureAveragesLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessMeasureAveragesLabel.Text = 'Averages';

% Create UPVRobotPostProcessMeasureAveragesInfo
app.ExtUI.UPVRobotPostProcessMeasureAveragesInfo = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationSignalGrid);
app.ExtUI.UPVRobotPostProcessMeasureAveragesInfo.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessMeasureAveragesInfo.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessMeasureAveragesInfo.Text = '1';

% Create UPVRobotPostProcessMeasureinformationMeasuresPanel
app.ExtUI.UPVRobotPostProcessMeasureinformationMeasuresPanel = uipanel(app.ExtUI.UPVRobotPostProcessMeasureinformationGrid);
app.ExtUI.UPVRobotPostProcessMeasureinformationMeasuresPanel.BorderType = 'none';
app.ExtUI.UPVRobotPostProcessMeasureinformationMeasuresPanel.Title = 'Measures';
app.ExtUI.UPVRobotPostProcessMeasureinformationMeasuresPanel.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessMeasureinformationMeasuresPanel.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessMeasureinformationMeasuresPanel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessMeasureinformationMeasuresPanel.FontWeight = 'bold';

% Create UPVRobotPostProcessMeasureinformationMeasuresGrid
app.ExtUI.UPVRobotPostProcessMeasureinformationMeasuresGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessMeasureinformationMeasuresPanel);
app.ExtUI.UPVRobotPostProcessMeasureinformationMeasuresGrid.RowHeight = {'1x', '1x', '1x'};
app.ExtUI.UPVRobotPostProcessMeasureinformationMeasuresGrid.RowSpacing = 5;
app.ExtUI.UPVRobotPostProcessMeasureinformationMeasuresGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessMeasureTotalLabel
app.ExtUI.UPVRobotPostProcessMeasureTotalLabel = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationMeasuresGrid);
app.ExtUI.UPVRobotPostProcessMeasureTotalLabel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessMeasureTotalLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessMeasureTotalLabel.Text = 'Total';

% Create UPVRobotPostProcessMeasureTotalInfo
app.ExtUI.UPVRobotPostProcessMeasureTotalInfo = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationMeasuresGrid);
app.ExtUI.UPVRobotPostProcessMeasureTotalInfo.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessMeasureTotalInfo.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessMeasureTotalInfo.Text = '2500';

% Create UPVRobotPostProcessMeasureTypeCoordsLabel
app.ExtUI.UPVRobotPostProcessMeasureTypeCoordsLabel = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationMeasuresGrid);
app.ExtUI.UPVRobotPostProcessMeasureTypeCoordsLabel.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessMeasureTypeCoordsLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessMeasureTypeCoordsLabel.Text = 'Type coords';

% Create UPVRobotPostProcessMeasureTypeCoordsInfo
app.ExtUI.UPVRobotPostProcessMeasureTypeCoordsInfo = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationMeasuresGrid);
app.ExtUI.UPVRobotPostProcessMeasureTypeCoordsInfo.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessMeasureTypeCoordsInfo.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessMeasureTypeCoordsInfo.Text = 'Automatic';

% Create UPVRobotPostProcessMeasureTimeLabel
app.ExtUI.UPVRobotPostProcessMeasureTimeLabel = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationMeasuresGrid);
app.ExtUI.UPVRobotPostProcessMeasureTimeLabel.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessMeasureTimeLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessMeasureTimeLabel.Text = 'Measure time';

% Create UPVRobotPostProcessMeasureTimeInfo
app.ExtUI.UPVRobotPostProcessMeasureTimeInfo = uilabel(app.ExtUI.UPVRobotPostProcessMeasureinformationMeasuresGrid);
app.ExtUI.UPVRobotPostProcessMeasureTimeInfo.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessMeasureTimeInfo.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessMeasureTimeInfo.Text = '02:05:45';