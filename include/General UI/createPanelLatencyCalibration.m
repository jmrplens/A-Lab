function createPanelLatencyCalibration(app)
% Copyright (C) Jose M. Requena Plens
% joreple@upv.es - jmrplens.github.io

% Center column
column = centerGrid(app,{'1x'},{'1x', '0.7x'});

% Create CenterMainPanelCalibrationLatency
app.ExtUI.CenterMainPanelCalibrationLatency = uipanel(column);
app.ExtUI.CenterMainPanelCalibrationLatency.TitlePosition = 'centertop';
app.ExtUI.CenterMainPanelCalibrationLatency.Title = 'Calibrate latency';
app.ExtUI.CenterMainPanelCalibrationLatency.BackgroundColor = [1 1 1];
app.ExtUI.CenterMainPanelCalibrationLatency.Layout.Row = 1;
app.ExtUI.CenterMainPanelCalibrationLatency.Layout.Column = 1;
app.ExtUI.CenterMainPanelCalibrationLatency.FontWeight = 'bold';
app.ExtUI.CenterMainPanelCalibrationLatency.FontSize = 14;

% Create GridCenterPanelCalibrationLatency
app.ExtUI.GridCenterPanelCalibrationLatency = uigridlayout(app.ExtUI.CenterMainPanelCalibrationLatency);
app.ExtUI.GridCenterPanelCalibrationLatency.ColumnWidth = {'1x', 'fit', 'fit', '1x'};
app.ExtUI.GridCenterPanelCalibrationLatency.RowHeight = {'fit', '1x', 'fit', 'fit', 'fit', 'fit'};
app.ExtUI.GridCenterPanelCalibrationLatency.BackgroundColor = [1 1 1];

% Get channels
[Nin,Nout] = getAvailableChannels(app);

% Create OutputchannelDropDownLabel
app.ExtUI.OutputchannelDropDownLabel = uilabel(app.ExtUI.GridCenterPanelCalibrationLatency);
app.ExtUI.OutputchannelDropDownLabel.BackgroundColor = [1 1 1];
app.ExtUI.OutputchannelDropDownLabel.WordWrap = 'on';
app.ExtUI.OutputchannelDropDownLabel.Layout.Row = 3;
app.ExtUI.OutputchannelDropDownLabel.Layout.Column = 2;
app.ExtUI.OutputchannelDropDownLabel.Text = 'Output channel';

% Create OutputchannelDropDownCalibrateLatency
app.ExtUI.OutputchannelDropDownCalibrateLatency = uidropdown(app.ExtUI.GridCenterPanelCalibrationLatency);
app.ExtUI.OutputchannelDropDownCalibrateLatency.Items = string(1:Nout);
app.ExtUI.OutputchannelDropDownCalibrateLatency.BackgroundColor = [1 1 1];
app.ExtUI.OutputchannelDropDownCalibrateLatency.Layout.Row = 3;
app.ExtUI.OutputchannelDropDownCalibrateLatency.Layout.Column = 3;
if ~isempty(app.ExtUI.OutputchannelDropDownCalibrateLatency.Items)
    app.ExtUI.OutputchannelDropDownCalibrateLatency.Value = '1';
else
    app.ExtUI.OutputchannelDropDownCalibrateLatency.Items = string(1);
end

% Create InputchannelDropDownLabel
app.ExtUI.InputchannelDropDownLabel = uilabel(app.ExtUI.GridCenterPanelCalibrationLatency);
app.ExtUI.InputchannelDropDownLabel.BackgroundColor = [1 1 1];
app.ExtUI.InputchannelDropDownLabel.WordWrap = 'on';
app.ExtUI.InputchannelDropDownLabel.Layout.Row = 4;
app.ExtUI.InputchannelDropDownLabel.Layout.Column = 2;
app.ExtUI.InputchannelDropDownLabel.Text = 'Input channel';

% Create InputchannelDropDownCalibrateLatency
app.ExtUI.InputchannelDropDownCalibrateLatency = uidropdown(app.ExtUI.GridCenterPanelCalibrationLatency);
app.ExtUI.InputchannelDropDownCalibrateLatency.Items = string(1:Nin);
app.ExtUI.InputchannelDropDownCalibrateLatency.BackgroundColor = [1 1 1];
app.ExtUI.InputchannelDropDownCalibrateLatency.Layout.Row = 4;
app.ExtUI.InputchannelDropDownCalibrateLatency.Layout.Column = 3;
if ~isempty(app.ExtUI.InputchannelDropDownCalibrateLatency.Items)
    app.ExtUI.InputchannelDropDownCalibrateLatency.Value = '1';
else
    app.ExtUI.InputchannelDropDownCalibrateLatency.Items = string(1);
end

% Create CalibrateLatencyInformation
app.ExtUI.CalibrateLatencyInformation = uilabel(app.ExtUI.GridCenterPanelCalibrationLatency);
app.ExtUI.CalibrateLatencyInformation.WordWrap = 'on';
app.ExtUI.CalibrateLatencyInformation.Layout.Row = 1;
app.ExtUI.CalibrateLatencyInformation.Layout.Column = [1 4];
app.ExtUI.CalibrateLatencyInformation.Text = 'In order to compute latency for your own audio device, you need to connect the audio out and audio in ports using a loopback cable.';

% Create CalibrationLatencyPanelImage
app.ExtUI.CalibrationLatencyPanelImage = uipanel(app.ExtUI.GridCenterPanelCalibrationLatency);
app.ExtUI.CalibrationLatencyPanelImage.BorderType = 'none';
app.ExtUI.CalibrationLatencyPanelImage.BackgroundColor = [1 1 1];
app.ExtUI.CalibrationLatencyPanelImage.Layout.Row = 2;
app.ExtUI.CalibrationLatencyPanelImage.Layout.Column = [1 4];

% Create CalibrationLatencyGridImage
app.ExtUI.CalibrationLatencyGridImage = uigridlayout(app.ExtUI.CalibrationLatencyPanelImage);
app.ExtUI.CalibrationLatencyGridImage.ColumnWidth = {'1x'};
app.ExtUI.CalibrationLatencyGridImage.RowHeight = {'0.5x'};
app.ExtUI.CalibrationLatencyGridImage.BackgroundColor = [1 1 1];

% Create CalibrationLatencyImage
app.ExtUI.CalibrationLatencyImage = uiaxes(app.ExtUI.CalibrationLatencyGridImage);
app.ExtUI.CalibrationLatencyImage.Layout.Row = 1;
app.ExtUI.CalibrationLatencyImage.Layout.Column = 1;
plotCalibrationLatencyExample(app.ExtUI.CalibrationLatencyImage)

% Create CalibratelatencyButton
app.ExtUI.CalibratelatencyButton = uibutton(app.ExtUI.GridCenterPanelCalibrationLatency, 'push');
app.ExtUI.CalibratelatencyButton.ButtonPushedFcn = {@calibrateLatencyButton,app};
app.ExtUI.CalibratelatencyButton.WordWrap = 'on';
app.ExtUI.CalibratelatencyButton.BackgroundColor = [1 1 1];
app.ExtUI.CalibratelatencyButton.Layout.Row = 5;
app.ExtUI.CalibratelatencyButton.Layout.Column = [2 3];
app.ExtUI.CalibratelatencyButton.Text = 'Calibrate latency';

% Create TotalLatencyCalibrationInfo
app.ExtUI.TotalLatencyCalibrationInfo = uilabel(app.ExtUI.GridCenterPanelCalibrationLatency);
app.ExtUI.TotalLatencyCalibrationInfo.WordWrap = 'on';
app.ExtUI.TotalLatencyCalibrationInfo.Layout.Row = 6;
app.ExtUI.TotalLatencyCalibrationInfo.Layout.Column = [2 3];
app.ExtUI.TotalLatencyCalibrationInfo.Text = ' ';
app.ExtUI.TotalLatencyCalibrationInfo.Visible = 'on';
if app.LatencyIsMeasured
    app.ExtUI.TotalLatencyCalibrationInfo.Text = sprintf('Total latency: %.2f ms',app.Latency*1000);
end

function calibrateLatencyButton(~,~,app)

%
app.ExtUI.CalibratelatencyButton.Text = 'Calibrating';
app.ExtUI.CalibratelatencyButton.Enable = 'off';
drawnow

% Signal
fs = app.SampleRate;
duration = 0.5;
dur_sil = 0.5;
fini= 10;
fend = 22000;
signal = sweeptone(duration,dur_sil,fs,'SweepFrequencyRange',[fini,fend]);
% Normalize to +-0.5
signal = (signal/max(abs(signal)))*0.5;

maxattemps = 5;
for i = 1:maxattemps
    app.ExtUI.CalibratelatencyButton.Text = sprintf('Calibrating...(%d/%d)',i,maxattemps);
    drawnow
    % Measure
    outch = str2double(app.ExtUI.OutputchannelDropDownCalibrateLatency.Value);
    inch = str2double(app.ExtUI.InputchannelDropDownCalibrateLatency.Value);
    [Out,In] = audioOutIn(app,signal,outch,inch,0);
    % Show actual result
    app.Latency = getLatencyFromSignals(Out,In,app.SampleRate);
    app.ExtUI.TotalLatencyCalibrationInfo.Text = sprintf('Total latency: %.2f ms',app.Latency*1000);
    drawnow
end

% Get latency
app.LatencyIsMeasured = 1;

% Update
app.ExtUI.CalibratelatencyButton.Text = 'Calibrate latency';
app.ExtUI.CalibratelatencyButton.Enable = 'on';

refreshPanelInformation(app)
