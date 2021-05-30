function createPanelInformation(app,column,Row,Col)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Create InformationPanel
app.ExtUI.InformationPanel = uipanel(column);
app.ExtUI.InformationPanel.ForegroundColor = [1 1 1];
app.ExtUI.InformationPanel.Title = 'Information';
app.ExtUI.InformationPanel.BackgroundColor = [0 0 0];
app.ExtUI.InformationPanel.Layout.Row = Row;
app.ExtUI.InformationPanel.Layout.Column = Col;
app.ExtUI.InformationPanel.FontAngle = 'italic';
app.ExtUI.InformationPanel.FontWeight = 'bold';

% Create GridInformation
app.ExtUI.GridInformation = uigridlayout(app.ExtUI.InformationPanel);
app.ExtUI.GridInformation.ColumnWidth = {'fit', '1x'};
app.ExtUI.GridInformation.RowHeight = {'1x', '1x', '1x','1x', '1x', '1x', '1x'};
app.ExtUI.GridInformation.BackgroundColor = [1 1 1];

% Create InfoDeviceLabel
app.ExtUI.InfoDeviceLabel = uilabel(app.ExtUI.GridInformation);
app.ExtUI.InfoDeviceLabel.Layout.Row = 1;
app.ExtUI.InfoDeviceLabel.Layout.Column = 1;
app.ExtUI.InfoDeviceLabel.Text = 'Device';

% Create InfoSampleRateLabel
app.ExtUI.InfoSampleRateLabel = uilabel(app.ExtUI.GridInformation);
app.ExtUI.InfoSampleRateLabel.Layout.Row = 2;
app.ExtUI.InfoSampleRateLabel.Layout.Column = 1;
app.ExtUI.InfoSampleRateLabel.Text = 'Sample rate';

% Create InfoSamplesPerFrameLabel
app.ExtUI.InfoSamplesPerFrameLabel = uilabel(app.ExtUI.GridInformation);
app.ExtUI.InfoSamplesPerFrameLabel.Layout.Row = 3;
app.ExtUI.InfoSamplesPerFrameLabel.Layout.Column = 1;
app.ExtUI.InfoSamplesPerFrameLabel.Text = 'Samples per frame';

% Create InfoBitDepthLabel
app.ExtUI.InfoBitDepthLabel = uilabel(app.ExtUI.GridInformation);
app.ExtUI.InfoBitDepthLabel.Layout.Row = 4;
app.ExtUI.InfoBitDepthLabel.Layout.Column = 1;
app.ExtUI.InfoBitDepthLabel.Text = 'Bit depth';

% Create InfoBitDepth
app.ExtUI.InfoBitDepth = uilabel(app.ExtUI.GridInformation);
app.ExtUI.InfoBitDepth.Layout.Row = 4;
app.ExtUI.InfoBitDepth.Layout.Column = 2;

% Create Capture Info
app.ExtUI.InfoAudioErrorLabel = uilabel(app.ExtUI.GridInformation);
app.ExtUI.InfoAudioErrorLabel.Layout.Row = 5;
app.ExtUI.InfoAudioErrorLabel.Layout.Column = 1;
app.ExtUI.InfoAudioErrorLabel.Text = '';
app.ExtUI.InfoAudioErrorLabel.FontWeight = 'bold';
app.ExtUI.InfoAudioErrorLabel.FontColor = [0.8 0 0];

app.ExtUI.InfoAudioError = uilabel(app.ExtUI.GridInformation);
app.ExtUI.InfoAudioError.Layout.Row = 5;
app.ExtUI.InfoAudioError.Layout.Column = 2;
app.ExtUI.InfoAudioError.Text = ' ';
app.ExtUI.InfoAudioError.FontWeight = 'bold';
app.ExtUI.InfoAudioError.BackgroundColor = 'none';
app.ExtUI.InfoAudioError.FontColor = [0 0 0];


% Create InfoInputsCalibratedLabel
app.ExtUI.InfoInputsCalibratedLabel = uilabel(app.ExtUI.GridInformation);
app.ExtUI.InfoInputsCalibratedLabel.Layout.Row = 6;
app.ExtUI.InfoInputsCalibratedLabel.Layout.Column = 1;
app.ExtUI.InfoInputsCalibratedLabel.Text = 'Inputs calibrated';

% Create InfoLatencyLabel
app.ExtUI.InfoLatencyLabel = uilabel(app.ExtUI.GridInformation);
app.ExtUI.InfoLatencyLabel.Layout.Row = 7;
app.ExtUI.InfoLatencyLabel.Layout.Column = 1;
app.ExtUI.InfoLatencyLabel.Text = 'Latency calibrated';

% Create InfoDevice
app.ExtUI.InfoDevice = uilabel(app.ExtUI.GridInformation);
app.ExtUI.InfoDevice.Layout.Row = 1;
app.ExtUI.InfoDevice.Layout.Column = 2;

% Create InfoSampleRate
app.ExtUI.InfoSampleRate = uilabel(app.ExtUI.GridInformation);
app.ExtUI.InfoSampleRate.Layout.Row = 2;
app.ExtUI.InfoSampleRate.Layout.Column = 2;

% Create InfoSamplesPerFrame
app.ExtUI.InfoSamplesPerFrame = uilabel(app.ExtUI.GridInformation);
app.ExtUI.InfoSamplesPerFrame.Layout.Row = 3;
app.ExtUI.InfoSamplesPerFrame.Layout.Column = 2;

% Create InfoInputsCalibrated
app.ExtUI.InfoInputsCalibrated = uilabel(app.ExtUI.GridInformation);
app.ExtUI.InfoInputsCalibrated.Layout.Row = 6;
app.ExtUI.InfoInputsCalibrated.Layout.Column = 2;

% Create InfoLatency
app.ExtUI.InfoLatency = uilabel(app.ExtUI.GridInformation);
app.ExtUI.InfoLatency.Layout.Row = 7;
app.ExtUI.InfoLatency.Layout.Column = 2;


refreshPanelInformation(app)

end