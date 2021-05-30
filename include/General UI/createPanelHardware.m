function createPanelHardware(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Delete content in center column
delete(app.LeftPanel.Children)

% Right column
column = leftGrid(app,{'1x'},{'fit'});

% Main panel
app.ExtUI.PanelHardware = uipanel(column);
app.ExtUI.PanelHardware.TitlePosition = 'centertop';
app.ExtUI.PanelHardware.Title = 'Hardware configuration';
app.ExtUI.PanelHardware.Layout.Row = 1;
app.ExtUI.PanelHardware.Layout.Column = 1;
app.ExtUI.PanelHardware.BorderType = 'none';
app.ExtUI.PanelHardware.FontWeight = 'bold';
app.ExtUI.PanelHardware.FontSize = 14;
app.ExtUI.PanelHardware.BackgroundColor = [1 1 1];

% Create GridHardware
app.ExtUI.GridHardware = uigridlayout(app.ExtUI.PanelHardware);
app.ExtUI.GridHardware.ColumnWidth = {'1x'};
app.ExtUI.GridHardware.RowHeight = {'fit', 'fit','fit'};
app.ExtUI.GridHardware.BackgroundColor = [1 1 1];

% Create HardwareGeneralPanel
app.ExtUI.HardwareGeneralPanel = uipanel(app.ExtUI.GridHardware);
app.ExtUI.HardwareGeneralPanel.ForegroundColor = [1 1 1];
app.ExtUI.HardwareGeneralPanel.BorderType = 'none';
app.ExtUI.HardwareGeneralPanel.Title = 'General';
app.ExtUI.HardwareGeneralPanel.BackgroundColor = [1 0.4118 0.1608];
app.ExtUI.HardwareGeneralPanel.Layout.Row = 1;
app.ExtUI.HardwareGeneralPanel.Layout.Column = 1;
app.ExtUI.HardwareGeneralPanel.FontAngle = 'italic';
app.ExtUI.HardwareGeneralPanel.FontWeight = 'bold';

% Create GridHardwareGeneral
app.ExtUI.GridHardwareGeneral = uigridlayout(app.ExtUI.HardwareGeneralPanel);
app.ExtUI.GridHardwareGeneral.ColumnWidth = {'1x', '0.4x'};
app.ExtUI.GridHardwareGeneral.RowHeight = {'fit', 'fit'};
app.ExtUI.GridHardwareGeneral.BackgroundColor = [1 1 1];

% Create SamplerateHzEditFieldLabel
app.ExtUI.SamplerateHzEditFieldLabel = uilabel(app.ExtUI.GridHardwareGeneral);
app.ExtUI.SamplerateHzEditFieldLabel.Layout.Row = 1;
app.ExtUI.SamplerateHzEditFieldLabel.Layout.Column = 1;
app.ExtUI.SamplerateHzEditFieldLabel.Text = 'Sample rate (Hz)';

% Create SamplerateHzEditField
% app.ExtUI.SamplerateHzEditField = uieditfield(app.ExtUI.GridHardwareGeneral, 'numeric');
% app.ExtUI.SamplerateHzEditField.Limits = [1 Inf];
% app.ExtUI.SamplerateHzEditField.RoundFractionalValues = 'on';
% app.ExtUI.SamplerateHzEditField.ValueDisplayFormat = '%d';
% app.ExtUI.SamplerateHzEditField.Layout.Row = 1;
% app.ExtUI.SamplerateHzEditField.Layout.Column = 2;
% if isempty(app.SampleRate)
%     app.ExtUI.SamplerateHzEditField.Value = 48000;
%     app.SampleRate = app.ExtUI.SamplerateHzEditField.Value;
% else
%     app.ExtUI.SamplerateHzEditField.Value = app.SampleRate;
% end
% app.ExtUI.SamplerateHzEditField.ValueChangedFcn = {@HardwareValueChanged,app};
app.ExtUI.SamplerateHzEditField = uidropdown(app.ExtUI.GridHardwareGeneral);
app.ExtUI.SamplerateHzEditField.Layout.Row = 1;
app.ExtUI.SamplerateHzEditField.Layout.Column = 2;
app.ExtUI.SamplerateHzEditField.BackgroundColor = [1 1 1];
app.ExtUI.SamplerateHzEditField.Items =  {'11025','22050', '44100', '48000', '96000','192000'};
app.ExtUI.SamplerateHzEditField.Value = '48000';
if isempty(app.SampleRate)
    app.SampleRate = str2double(app.ExtUI.SamplerateHzEditField.Value);
else
    try
        app.ExtUI.SamplerateHzEditField.Value = num2str(app.SampleRate,'%.0f');
    catch
        app.SampleRate = str2double(app.ExtUI.SamplerateHzEditField.Value);
    end
end
app.ExtUI.SamplerateHzEditField.ValueChangedFcn = {@HardwareValueChanged,app};

% Create SamplesperframeEditFieldLabel
app.ExtUI.SamplesperframeEditFieldLabel = uilabel(app.ExtUI.GridHardwareGeneral);
app.ExtUI.SamplesperframeEditFieldLabel.Layout.Row = 2;
app.ExtUI.SamplesperframeEditFieldLabel.Layout.Column = 1;
app.ExtUI.SamplesperframeEditFieldLabel.Text = 'Samples per frame';

% Create SamplesperframeEditField
app.ExtUI.SamplesperframeEditField = uieditfield(app.ExtUI.GridHardwareGeneral, 'numeric');
app.ExtUI.SamplesperframeEditField.Limits = [1 Inf];
app.ExtUI.SamplesperframeEditField.RoundFractionalValues = 'on';
app.ExtUI.SamplesperframeEditField.ValueDisplayFormat = '%d';
app.ExtUI.SamplesperframeEditField.Layout.Row = 2;
app.ExtUI.SamplesperframeEditField.Layout.Column = 2;
if isempty(app.SamplesPerFrame)
    app.ExtUI.SamplesperframeEditField.Value = 2048;
    app.SamplesPerFrame = app.ExtUI.SamplesperframeEditField.Value;
else
    app.ExtUI.SamplesperframeEditField.Value = app.SamplesPerFrame;
end
app.ExtUI.SamplesperframeEditField.ValueChangedFcn = {@HardwareValueChanged,app};

% Create HardwareDevicePanel
app.ExtUI.HardwareDevicePanel = uipanel(app.ExtUI.GridHardware);
app.ExtUI.HardwareDevicePanel.ForegroundColor = [1 1 1];
app.ExtUI.HardwareDevicePanel.BorderType = 'none';
app.ExtUI.HardwareDevicePanel.Title = 'Device';
app.ExtUI.HardwareDevicePanel.BackgroundColor = [0 0 0];
app.ExtUI.HardwareDevicePanel.Layout.Row = 2;
app.ExtUI.HardwareDevicePanel.Layout.Column = 1;
app.ExtUI.HardwareDevicePanel.FontAngle = 'italic';
app.ExtUI.HardwareDevicePanel.FontWeight = 'bold';

% Create GridHardwareDevice
app.ExtUI.GridHardwareDevice = uigridlayout(app.ExtUI.HardwareDevicePanel);
app.ExtUI.GridHardwareDevice.RowHeight = {'fit', 'fit', 'fit','fit'};
app.ExtUI.GridHardwareDevice.BackgroundColor = [1 1 1];

% Create DriverDropDownLabel
app.ExtUI.DriverDropDownLabel = uilabel(app.ExtUI.GridHardwareDevice);
app.ExtUI.DriverDropDownLabel.Layout.Row = 1;
app.ExtUI.DriverDropDownLabel.Layout.Column = 1;
app.ExtUI.DriverDropDownLabel.Text = 'Driver';


% Create DeviceDriverDropDown
app.ExtUI.DeviceDriverDropDown = uidropdown(app.ExtUI.GridHardwareDevice);
app.ExtUI.DeviceDriverDropDown.Layout.Row = 1;
app.ExtUI.DeviceDriverDropDown.Layout.Column = 2;
app.ExtUI.DeviceDriverDropDown.BackgroundColor = [1 1 1];
app.ExtUI.DeviceDriverDropDown.Items = getAvailableDrivers();
if isempty(app.Driver)
    app.Driver = app.ExtUI.DeviceDriverDropDown.Value;
else
    try
        app.ExtUI.DeviceDriverDropDown.Value = app.Driver;
    catch
        app.Driver = app.ExtUI.DeviceDriverDropDown.Value;
    end
end
app.ExtUI.DeviceDriverDropDown.ValueChangedFcn = {@HardwareValueChanged,app};

% Create DeviceDropDownLabel
app.ExtUI.DeviceDropDownLabel = uilabel(app.ExtUI.GridHardwareDevice);
app.ExtUI.DeviceDropDownLabel.Layout.Row = 2;
app.ExtUI.DeviceDropDownLabel.Layout.Column = 1;
app.ExtUI.DeviceDropDownLabel.Text = 'Device';

% Create Device
app.ExtUI.DeviceDropDown = uidropdown(app.ExtUI.GridHardwareDevice);
app.ExtUI.DeviceDropDown.Layout.Row = 2;
app.ExtUI.DeviceDropDown.Layout.Column = 2;
app.ExtUI.DeviceDropDown.BackgroundColor = [1 1 1];
app.ExtUI.DeviceDropDown.Items = getAvailableDevices();
if isempty(app.Device)
    app.Device = app.ExtUI.DeviceDropDown.Value;
else
    try
        app.ExtUI.DeviceDropDown.Value = app.Device;
    catch
        app.Device = app.ExtUI.DeviceDropDown.Value;
    end
end
app.ExtUI.DeviceDropDown.ValueChangedFcn = {@HardwareValueChanged,app};

% Create BitdepthDropDownLabel
app.ExtUI.BitdepthDropDownLabel = uilabel(app.ExtUI.GridHardwareDevice);
app.ExtUI.BitdepthDropDownLabel.Layout.Row = 3;
app.ExtUI.BitdepthDropDownLabel.Layout.Column = 1;
app.ExtUI.BitdepthDropDownLabel.Text = 'Bit depth';

% Create BitdepthDevice
app.ExtUI.BitdepthDevice = uidropdown(app.ExtUI.GridHardwareDevice);
app.ExtUI.BitdepthDevice.Layout.Row = 3;
app.ExtUI.BitdepthDevice.Layout.Column = 2;
app.ExtUI.BitdepthDevice.BackgroundColor = [1 1 1];
app.ExtUI.BitdepthDevice.Items = {'16-bit integer','24-bit integer','32-bit float'};
if isempty(app.BitDepth)
    app.BitDepth = app.ExtUI.BitdepthDevice.Value;
else
    app.ExtUI.BitdepthDevice.Value = app.BitDepth;
end
app.ExtUI.BitdepthDevice.ValueChangedFcn = {@HardwareValueChanged,app};

% Create RefreshButton
app.ExtUI.RefreshavailabledevicesButton = uibutton(app.ExtUI.GridHardwareDevice, 'push');
app.ExtUI.RefreshavailabledevicesButton.ButtonPushedFcn = {@RefreshavailabledevicesButtonPushed,app};
app.ExtUI.RefreshavailabledevicesButton.Text = 'Refresh available devices';
app.ExtUI.RefreshavailabledevicesButton.BackgroundColor = [1 1 1];
app.ExtUI.RefreshavailabledevicesButton.Layout.Row = 4;
app.ExtUI.RefreshavailabledevicesButton.Layout.Column = [1,2];

% Create AirParametersPanel
app.ExtUI.AirParametersPanel = uipanel(app.ExtUI.GridHardware);
app.ExtUI.AirParametersPanel.ForegroundColor = [1 1 1];
app.ExtUI.AirParametersPanel.BorderType = 'none';
app.ExtUI.AirParametersPanel.Title = 'Air parameters';
app.ExtUI.AirParametersPanel.BackgroundColor = [0 0 0];
app.ExtUI.AirParametersPanel.Layout.Row = 3;
app.ExtUI.AirParametersPanel.Layout.Column = 1;
app.ExtUI.AirParametersPanel.FontAngle = 'italic';
app.ExtUI.AirParametersPanel.FontWeight = 'bold';

% Create AirParametersGrid
app.ExtUI.AirParametersGrid = uigridlayout(app.ExtUI.AirParametersPanel);
app.ExtUI.AirParametersGrid.RowHeight = {'fit', 'fit'};
app.ExtUI.AirParametersGrid.ColumnWidth = {'1x', '0.4x'};
app.ExtUI.AirParametersGrid.Padding = [10 10 10 10];
app.ExtUI.AirParametersGrid.BackgroundColor = [1 1 1];

% Create SpeedofsoundmsEditFieldLabel
app.ExtUI.SpeedofsoundmsEditFieldLabel = uilabel(app.ExtUI.AirParametersGrid);
app.ExtUI.SpeedofsoundmsEditFieldLabel.HorizontalAlignment = 'left';
app.ExtUI.SpeedofsoundmsEditFieldLabel.WordWrap = 'on';
app.ExtUI.SpeedofsoundmsEditFieldLabel.Layout.Row = 1;
app.ExtUI.SpeedofsoundmsEditFieldLabel.Layout.Column = 1;
app.ExtUI.SpeedofsoundmsEditFieldLabel.Text = 'Speed of sound (m/s)';

% Create SpeedofsoundmsEditField
app.ExtUI.SpeedofsoundmsEditField = uieditfield(app.ExtUI.AirParametersGrid, 'numeric');
app.ExtUI.SpeedofsoundmsEditField.Limits = [0 Inf];
app.ExtUI.SpeedofsoundmsEditField.Layout.Row = 1;
app.ExtUI.SpeedofsoundmsEditField.Layout.Column = 2;
app.ExtUI.SpeedofsoundmsEditField.Value = app.c;
app.ExtUI.SpeedofsoundmsEditField.ValueChangedFcn = {@SpeedValueChanged,app};

% Create Airdensitykgm3EditFieldLabel
app.ExtUI.Airdensitykgm3EditFieldLabel = uilabel(app.ExtUI.AirParametersGrid);
app.ExtUI.Airdensitykgm3EditFieldLabel.HorizontalAlignment = 'left';
app.ExtUI.Airdensitykgm3EditFieldLabel.WordWrap = 'on';
app.ExtUI.Airdensitykgm3EditFieldLabel.Layout.Row = 2;
app.ExtUI.Airdensitykgm3EditFieldLabel.Layout.Column = 1;
app.ExtUI.Airdensitykgm3EditFieldLabel.Text = ['Air density (kg/m',char(179),')'];

% Create Airdensitykgm3EditField
app.ExtUI.Airdensitykgm3EditField = uieditfield(app.ExtUI.AirParametersGrid, 'numeric');
app.ExtUI.Airdensitykgm3EditField.Limits = [0 Inf];
app.ExtUI.Airdensitykgm3EditField.Layout.Row = 2;
app.ExtUI.Airdensitykgm3EditField.Layout.Column = 2;
app.ExtUI.Airdensitykgm3EditField.Value = app.rho;
app.ExtUI.Airdensitykgm3EditField.ValueChangedFcn = {@DensityValueChanged,app};

end

function RefreshavailabledevicesButtonPushed(~,~,app)
audiodevreset;
app.ExtUI.DeviceDropDown.Items = getAvailableDevices();
app.ExtUI.DeviceDriverDropDown.Items = getAvailableDrivers();
end

function HardwareValueChanged(~,~,app)
audiodevreset;
app.SampleRate = str2double(app.ExtUI.SamplerateHzEditField.Value);
app.SamplesPerFrame = app.ExtUI.SamplesperframeEditField.Value;
app.BitDepth = app.ExtUI.BitdepthDevice.Value;
app.Device = app.ExtUI.DeviceDropDown.Value;

% Load params in hardware
aPR = audioPlayerRecorder('Device', app.Device,...
    'SampleRate',app.SampleRate,...
    'BitDepth',app.BitDepth,...
    'SupportVariableSize',true,...
    'BufferSize',app.SamplesPerFrame);
setup(aPR,0);
release(aPR);
audiodevreset;

% Get channels
[Nin,Nout] = getAvailableChannels(app);

% Dropdown Latency
app.ExtUI.OutputchannelDropDownCalibrateLatency.Items = string(1:Nout);
app.ExtUI.InputchannelDropDownCalibrateLatency.Items = string(1:Nin);
drawnow
printTableCalibrationSens(app)
% Latency calculated
app.Latency = estimateLatency(app.SampleRate,app.SamplesPerFrame);
app.LatencyIsMeasured = 0;



refreshPanelInformation(app)
end

function printTableCalibrationSens(app)
[Nin,~] = getAvailableChannels(app);
if size(app.Sensitivity,1)~=Nin
    app.Sensitivity = zeros(Nin,1);
    app.SensitivityIsMeasured = false(Nin,1);
end
% Get calibrated channels if exist
calibrated = strings(Nin,1);
value = cell(Nin,1);

for ii = 1:Nin
    if app.SensitivityIsMeasured(ii)
        calibrated(ii) = "Yes";
        value{ii} = app.Sensitivity(ii);
    else
        calibrated(ii) = "No";
        value{ii} = "[]";
    end
end
% Table
app.ExtUI.TableCalibration.Data = table([1:Nin]',calibrated,value);
% Yes format
idx = find(calibrated=="Yes");
for ii = 1:length(idx)
    s = uistyle('FontWeight','bold','FontAngle','normal','FontColor',[0,0.75,0]);
    addStyle(app.ExtUI.TableCalibration,s,'cell',[idx(ii),2])
end
% No format
idx = find(calibrated~="Yes");
for ii = 1:length(idx)
    s = uistyle('FontWeight','bold','FontAngle','italic','FontColor','r');
    addStyle(app.ExtUI.TableCalibration,s,'cell',[idx(ii),2])
end
drawnow
end

function SpeedValueChanged(~,~,app)
app.c = app.ExtUI.SpeedofsoundmsEditField.Value;
end

function DensityValueChanged(~,~,app)
app.rho = app.ExtUI.Airdensitykgm3EditField.Value;
end