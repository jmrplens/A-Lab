function createCenterPanelCalibrationTwoMicISO10534(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
    'Indeterminate','on');

if ~isfield(app.ExtVar.ImpedanceTubeTwoMic,'Calibration')
    app.ExtVar.ImpedanceTubeTwoMic.Calibration = struct('TypeSignal',[],'SampleRate',[],...
        'S1I',[],'S2I',[],'excitationI',[],'S1II',[],'S2II',[],'excitationII',[]);
end

% Configure Column
column = centerGrid(app,{'1x'},{'1x'});

% Create CenterMainPanelTwoMicCalib
app.ExtUI.CenterMainPanelTwoMicCalib = uipanel(column);
app.ExtUI.CenterMainPanelTwoMicCalib.TitlePosition = 'centertop';
app.ExtUI.CenterMainPanelTwoMicCalib.Title = 'Calibration ISO 10534-2';
app.ExtUI.CenterMainPanelTwoMicCalib.BackgroundColor = [1 1 1];
app.ExtUI.CenterMainPanelTwoMicCalib.Layout.Row = 1;
app.ExtUI.CenterMainPanelTwoMicCalib.Layout.Column = 1;
app.ExtUI.CenterMainPanelTwoMicCalib.FontAngle = 'italic';

% Create GridCenterPanelTwoMicCalib
app.ExtUI.GridCenterPanelTwoMicCalib = uigridlayout(app.ExtUI.CenterMainPanelTwoMicCalib);
app.ExtUI.GridCenterPanelTwoMicCalib.ColumnWidth = {'1x'};
app.ExtUI.GridCenterPanelTwoMicCalib.RowHeight = {'fit', '1x', '1x'};
app.ExtUI.GridCenterPanelTwoMicCalib.BackgroundColor = [1 1 1];

% Create TwoMicCalibInfoAndOutputGrid
app.ExtUI.TwoMicCalibInfoAndOutputGrid = uigridlayout(app.ExtUI.GridCenterPanelTwoMicCalib);
app.ExtUI.TwoMicCalibInfoAndOutputGrid.ColumnWidth = {'1x', 'fit', 'fit', 'fit', 'fit', '1x'};
app.ExtUI.TwoMicCalibInfoAndOutputGrid.RowHeight = {'fit', 'fit'};
app.ExtUI.TwoMicCalibInfoAndOutputGrid.Layout.Row = 1;
app.ExtUI.TwoMicCalibInfoAndOutputGrid.Layout.Column = 1;
app.ExtUI.TwoMicCalibInfoAndOutputGrid.BackgroundColor = [1 1 1];

% Create OutputChannelDropDownLabel
app.ExtUI.OutputChannelDropDownLabel = uilabel(app.ExtUI.TwoMicCalibInfoAndOutputGrid);
app.ExtUI.OutputChannelDropDownLabel.HorizontalAlignment = 'right';
app.ExtUI.OutputChannelDropDownLabel.FontWeight = 'bold';
app.ExtUI.OutputChannelDropDownLabel.Layout.Row = 2;
app.ExtUI.OutputChannelDropDownLabel.Layout.Column = 3;
app.ExtUI.OutputChannelDropDownLabel.Text = 'Output Channel';

[~,Nout] = getAvailableChannels(app);

% Create TwoMicCalibMeasureOutputChannelDropDown
app.ExtUI.TwoMicCalibMeasureOutputChannelDropDown = uidropdown(app.ExtUI.TwoMicCalibInfoAndOutputGrid);
app.ExtUI.TwoMicCalibMeasureOutputChannelDropDown.Items = string(1:Nout);
app.ExtUI.TwoMicCalibMeasureOutputChannelDropDown.FontWeight = 'bold';
app.ExtUI.TwoMicCalibMeasureOutputChannelDropDown.BackgroundColor = [1 1 1];
app.ExtUI.TwoMicCalibMeasureOutputChannelDropDown.Layout.Row = 2;
app.ExtUI.TwoMicCalibMeasureOutputChannelDropDown.Layout.Column = 4;
app.ExtUI.TwoMicCalibMeasureOutputChannelDropDown.Value = '1';
app.ExtUI.TwoMicCalibMeasureOutputChannelDropDown.ValueChangedFcn = {@TwoMicTubeCalibOutputChanged,app};
if isempty(app.ExtVar.ImpedanceTubeTwoMic.OutputCh) || app.ExtVar.ImpedanceTubeTwoMic.OutputCh > Nout
    app.ExtVar.ImpedanceTubeTwoMic.OutputCh = str2double(app.ExtUI.TwoMicCalibMeasureOutputChannelDropDown.Value);
else
    app.ExtUI.TwoMicCalibMeasureOutputChannelDropDown.Value = num2str(app.ExtVar.ImpedanceTubeTwoMic.OutputCh,'%d');
end

% Create TwoMicCalibMeasureInfo
app.ExtUI.TwoMicCalibMeasureInfo = uilabel(app.ExtUI.TwoMicCalibInfoAndOutputGrid);
app.ExtUI.TwoMicCalibMeasureInfo.WordWrap = 'on';
app.ExtUI.TwoMicCalibMeasureInfo.Layout.Row = 1;
app.ExtUI.TwoMicCalibMeasureInfo.Layout.Column = [1 6];
app.ExtUI.TwoMicCalibMeasureInfo.Text = 'Place an absorptive specimen in the tube to prevent strong acoustic reflections and measure with the following two settings. Remember to use the same channels as the ones you are going to use in the measurements.';

% Create TwoMicCalibrateCancelButtonGrid
app.ExtUI.TwoMicCalibrateCancelButtonGrid = uigridlayout(app.ExtUI.TwoMicCalibInfoAndOutputGrid);
app.ExtUI.TwoMicCalibrateCancelButtonGrid.RowHeight = {'1x'};
app.ExtUI.TwoMicCalibrateCancelButtonGrid.Padding = [0 0 0 0];
app.ExtUI.TwoMicCalibrateCancelButtonGrid.Layout.Row = 2;
app.ExtUI.TwoMicCalibrateCancelButtonGrid.Layout.Column = 6;
app.ExtUI.TwoMicCalibrateCancelButtonGrid.BackgroundColor = [1 1 1];

% Create TwoMicCalibrateCancelButton
app.ExtUI.TwoMicCalibrateCancelButton = uibutton(app.ExtUI.TwoMicCalibrateCancelButtonGrid, 'push');
app.ExtUI.TwoMicCalibrateCancelButton.BackgroundColor = [0.8 0.8 0.8];
app.ExtUI.TwoMicCalibrateCancelButton.FontWeight = 'bold';
app.ExtUI.TwoMicCalibrateCancelButton.FontColor = [1 0 0];
app.ExtUI.TwoMicCalibrateCancelButton.Layout.Row = 1;
app.ExtUI.TwoMicCalibrateCancelButton.Layout.Column = 2;
app.ExtUI.TwoMicCalibrateCancelButton.Text = 'Return';
app.ExtUI.TwoMicCalibrateCancelButton.ButtonPushedFcn = {@TwoMicTubeCalibReturnPushed,app};

% Create TwoMicTwoMicConfigICalibPanel
app.ExtUI.TwoMicTwoMicConfigICalibPanel = uipanel(app.ExtUI.GridCenterPanelTwoMicCalib);
app.ExtUI.TwoMicTwoMicConfigICalibPanel.TitlePosition = 'centertop';
app.ExtUI.TwoMicTwoMicConfigICalibPanel.Title = 'Standard configuration (configuration I)';
app.ExtUI.TwoMicTwoMicConfigICalibPanel.BackgroundColor = [0.9412 0.9412 0.9412];
app.ExtUI.TwoMicTwoMicConfigICalibPanel.Layout.Row = 2;
app.ExtUI.TwoMicTwoMicConfigICalibPanel.Layout.Column = 1;
app.ExtUI.TwoMicTwoMicConfigICalibPanel.FontWeight = 'bold';

% Create TwoMicTwoMicConfigICalibGrid
app.ExtUI.TwoMicTwoMicConfigICalibGrid = uigridlayout(app.ExtUI.TwoMicTwoMicConfigICalibPanel);
app.ExtUI.TwoMicTwoMicConfigICalibGrid.ColumnWidth = {'1x', '1x', 'fit', 'fit'};
app.ExtUI.TwoMicTwoMicConfigICalibGrid.RowHeight = {'1x', 'fit', 'fit'};
app.ExtUI.TwoMicTwoMicConfigICalibGrid.BackgroundColor = [1 1 1];

% Create TwoMicTwoMicConfigICalibAxes
app.ExtUI.TwoMicTwoMicConfigICalibAxes = uiaxes(app.ExtUI.TwoMicTwoMicConfigICalibGrid);
app.ExtUI.TwoMicTwoMicConfigICalibAxes.Layout.Row = 1;
app.ExtUI.TwoMicTwoMicConfigICalibAxes.Layout.Column = [1 4];

% Create TwoMicTwoMicConfigICalibMeasure
app.ExtUI.TwoMicTwoMicConfigICalibMeasure = uibutton(app.ExtUI.TwoMicTwoMicConfigICalibGrid, 'push');
app.ExtUI.TwoMicTwoMicConfigICalibMeasure.BackgroundColor = [1 1 1];
app.ExtUI.TwoMicTwoMicConfigICalibMeasure.FontWeight = 'bold';
app.ExtUI.TwoMicTwoMicConfigICalibMeasure.Layout.Row = 3;
app.ExtUI.TwoMicTwoMicConfigICalibMeasure.Layout.Column = 1;
app.ExtUI.TwoMicTwoMicConfigICalibMeasure.Text = 'Measure';
app.ExtUI.TwoMicTwoMicConfigICalibMeasure.ButtonPushedFcn = {@TwoMicTwoMicCalibConfigIMeasureFCN,app};

[Nin,~] = getAvailableChannels(app);

% Create Channelformicrophone1Label
app.ExtUI.Channelformicrophone1Label = uilabel(app.ExtUI.TwoMicTwoMicConfigICalibGrid);
app.ExtUI.Channelformicrophone1Label.BackgroundColor = [1 1 1];
app.ExtUI.Channelformicrophone1Label.HorizontalAlignment = 'right';
app.ExtUI.Channelformicrophone1Label.FontWeight = 'bold';
app.ExtUI.Channelformicrophone1Label.Layout.Row = 2;
app.ExtUI.Channelformicrophone1Label.Layout.Column = 3;
app.ExtUI.Channelformicrophone1Label.Text = 'Channel for microphone 1';

% Create TwoMicTwoMicConfigICalibMic1DropDown
app.ExtUI.TwoMicTwoMicConfigICalibMic1DropDown = uidropdown(app.ExtUI.TwoMicTwoMicConfigICalibGrid);
app.ExtUI.TwoMicTwoMicConfigICalibMic1DropDown.Items = string(1:Nin);
app.ExtUI.TwoMicTwoMicConfigICalibMic1DropDown.FontWeight = 'bold';
app.ExtUI.TwoMicTwoMicConfigICalibMic1DropDown.BackgroundColor = [1 1 1];
app.ExtUI.TwoMicTwoMicConfigICalibMic1DropDown.Layout.Row = 2;
app.ExtUI.TwoMicTwoMicConfigICalibMic1DropDown.Layout.Column = 4;
app.ExtUI.TwoMicTwoMicConfigICalibMic1DropDown.Value = '1';
app.ExtUI.TwoMicTwoMicConfigICalibMic1DropDown.ValueChangedFcn = {@TwoMicTwoMicCalibInputChannelChanged,app};
if isempty(app.ExtVar.ImpedanceTubeTwoMic.Mic1Ch) || app.ExtVar.ImpedanceTubeTwoMic.Mic1Ch > Nin
    app.ExtVar.ImpedanceTubeTwoMic.Mic1Ch = str2double(app.ExtUI.TwoMicTwoMicConfigICalibMic1DropDown.Value);
else
    app.ExtUI.TwoMicTwoMicConfigICalibMic1DropDown.Value = num2str(app.ExtVar.ImpedanceTubeTwoMic.Mic1Ch,'%d');
end

% Create Channelformicrophone2Label
app.ExtUI.Channelformicrophone2Label = uilabel(app.ExtUI.TwoMicTwoMicConfigICalibGrid);
app.ExtUI.Channelformicrophone2Label.BackgroundColor = [1 1 1];
app.ExtUI.Channelformicrophone2Label.HorizontalAlignment = 'right';
app.ExtUI.Channelformicrophone2Label.FontWeight = 'bold';
app.ExtUI.Channelformicrophone2Label.Layout.Row = 3;
app.ExtUI.Channelformicrophone2Label.Layout.Column = 3;
app.ExtUI.Channelformicrophone2Label.Text = 'Channel for microphone 2';

% Create TwoMicTwoMicConfigICalibMic2DropDown
app.ExtUI.TwoMicTwoMicConfigICalibMic2DropDown = uidropdown(app.ExtUI.TwoMicTwoMicConfigICalibGrid);
app.ExtUI.TwoMicTwoMicConfigICalibMic2DropDown.Items = string(1:Nin);
app.ExtUI.TwoMicTwoMicConfigICalibMic2DropDown.FontWeight = 'bold';
app.ExtUI.TwoMicTwoMicConfigICalibMic2DropDown.BackgroundColor = [1 1 1];
app.ExtUI.TwoMicTwoMicConfigICalibMic2DropDown.Layout.Row = 3;
app.ExtUI.TwoMicTwoMicConfigICalibMic2DropDown.Layout.Column = 4;
app.ExtUI.TwoMicTwoMicConfigICalibMic2DropDown.Value = '1';
app.ExtUI.TwoMicTwoMicConfigICalibMic2DropDown.ValueChangedFcn = {@TwoMicTwoMicCalibInputChannelChanged,app};
if isempty(app.ExtVar.ImpedanceTubeTwoMic.Mic2Ch) || app.ExtVar.ImpedanceTubeTwoMic.Mic2Ch > Nin
    app.ExtVar.ImpedanceTubeTwoMic.Mic2Ch = str2double(app.ExtUI.TwoMicTwoMicConfigICalibMic2DropDown.Value);
else
    app.ExtUI.TwoMicTwoMicConfigICalibMic2DropDown.Value = num2str(app.ExtVar.ImpedanceTubeTwoMic.Mic2Ch,'%d');
end

% Create TwoMicTwoMicConfigICalibClearMeasure
app.ExtUI.TwoMicTwoMicConfigICalibClearMeasure = uibutton(app.ExtUI.TwoMicTwoMicConfigICalibGrid, 'push');
app.ExtUI.TwoMicTwoMicConfigICalibClearMeasure.BackgroundColor = [0.651 0.651 0.651];
app.ExtUI.TwoMicTwoMicConfigICalibClearMeasure.FontWeight = 'bold';
app.ExtUI.TwoMicTwoMicConfigICalibClearMeasure.FontColor = [1 1 1];
app.ExtUI.TwoMicTwoMicConfigICalibClearMeasure.Layout.Row = 2;
app.ExtUI.TwoMicTwoMicConfigICalibClearMeasure.Layout.Column = 1;
app.ExtUI.TwoMicTwoMicConfigICalibClearMeasure.Text = 'Clear measure';
app.ExtUI.TwoMicTwoMicConfigICalibClearMeasure.ButtonPushedFcn = {@TwoMicTwoMicConfigICalibClearMeasureFCN,app};

% Create TwoMicTwoMicConfigIICalibPanel
app.ExtUI.TwoMicTwoMicConfigIICalibPanel = uipanel(app.ExtUI.GridCenterPanelTwoMicCalib);
app.ExtUI.TwoMicTwoMicConfigIICalibPanel.TitlePosition = 'centertop';
app.ExtUI.TwoMicTwoMicConfigIICalibPanel.Title = 'Configuration with microphones interchanged (configuration II)';
app.ExtUI.TwoMicTwoMicConfigIICalibPanel.BackgroundColor = [0.9412 0.9412 0.9412];
app.ExtUI.TwoMicTwoMicConfigIICalibPanel.Layout.Row = 3;
app.ExtUI.TwoMicTwoMicConfigIICalibPanel.Layout.Column = 1;
app.ExtUI.TwoMicTwoMicConfigIICalibPanel.FontWeight = 'bold';

% Create TwoMicTwoMicConfigIICalibGrid
app.ExtUI.TwoMicTwoMicConfigIICalibGrid = uigridlayout(app.ExtUI.TwoMicTwoMicConfigIICalibPanel);
app.ExtUI.TwoMicTwoMicConfigIICalibGrid.ColumnWidth = {'1x', '1x', 'fit', 'fit'};
app.ExtUI.TwoMicTwoMicConfigIICalibGrid.RowHeight = {'1x', 'fit', 'fit'};
app.ExtUI.TwoMicTwoMicConfigIICalibGrid.BackgroundColor = [1 1 1];

% Create TwoMicTwoMicConfigIICalibAxes
app.ExtUI.TwoMicTwoMicConfigIICalibAxes = uiaxes(app.ExtUI.TwoMicTwoMicConfigIICalibGrid);
app.ExtUI.TwoMicTwoMicConfigIICalibAxes.Layout.Row = 1;
app.ExtUI.TwoMicTwoMicConfigIICalibAxes.Layout.Column = [1 4];

% Create TwoMicTwoMicConfigIICalibMeasure
app.ExtUI.TwoMicTwoMicConfigIICalibMeasure = uibutton(app.ExtUI.TwoMicTwoMicConfigIICalibGrid, 'push');
app.ExtUI.TwoMicTwoMicConfigIICalibMeasure.BackgroundColor = [1 1 1];
app.ExtUI.TwoMicTwoMicConfigIICalibMeasure.FontWeight = 'bold';
app.ExtUI.TwoMicTwoMicConfigIICalibMeasure.Layout.Row = 3;
app.ExtUI.TwoMicTwoMicConfigIICalibMeasure.Layout.Column = 1;
app.ExtUI.TwoMicTwoMicConfigIICalibMeasure.Text = 'Measure';
app.ExtUI.TwoMicTwoMicConfigIICalibMeasure.ButtonPushedFcn = {@TwoMicTwoMicCalibConfigIIMeasureFCN,app};

% Create Channelformicrophone1Label_2
app.ExtUI.Channelformicrophone1Label_2 = uilabel(app.ExtUI.TwoMicTwoMicConfigIICalibGrid);
app.ExtUI.Channelformicrophone1Label_2.BackgroundColor = [1 1 1];
app.ExtUI.Channelformicrophone1Label_2.HorizontalAlignment = 'right';
app.ExtUI.Channelformicrophone1Label_2.FontWeight = 'bold';
app.ExtUI.Channelformicrophone1Label_2.Layout.Row = 2;
app.ExtUI.Channelformicrophone1Label_2.Layout.Column = 3;
app.ExtUI.Channelformicrophone1Label_2.Text = 'Channel for microphone 1';

% Create TwoMicTwoMicConfigIICalibMic1DropDown
app.ExtUI.TwoMicTwoMicConfigIICalibMic1DropDown = uidropdown(app.ExtUI.TwoMicTwoMicConfigIICalibGrid);
app.ExtUI.TwoMicTwoMicConfigIICalibMic1DropDown.Items = string(1:Nin);
app.ExtUI.TwoMicTwoMicConfigIICalibMic1DropDown.FontWeight = 'bold';
app.ExtUI.TwoMicTwoMicConfigIICalibMic1DropDown.BackgroundColor = [1 1 1];
app.ExtUI.TwoMicTwoMicConfigIICalibMic1DropDown.Layout.Row = 2;
app.ExtUI.TwoMicTwoMicConfigIICalibMic1DropDown.Layout.Column = 4;
app.ExtUI.TwoMicTwoMicConfigIICalibMic1DropDown.Value = '1';
app.ExtUI.TwoMicTwoMicConfigIICalibMic1DropDown.Enable = 'off';
if isempty(app.ExtVar.ImpedanceTubeTwoMic.Mic1Ch) || app.ExtVar.ImpedanceTubeTwoMic.Mic1Ch > Nin
    app.ExtVar.ImpedanceTubeTwoMic.Mic1Ch = str2double(app.ExtUI.TwoMicTwoMicConfigIICalibMic1DropDown.Value);
else
    app.ExtUI.TwoMicTwoMicConfigIICalibMic1DropDown.Value = num2str(app.ExtVar.ImpedanceTubeTwoMic.Mic1Ch,'%d');
end

% Create Channelformicrophone2Label_2
app.ExtUI.Channelformicrophone2Label_2 = uilabel(app.ExtUI.TwoMicTwoMicConfigIICalibGrid);
app.ExtUI.Channelformicrophone2Label_2.BackgroundColor = [1 1 1];
app.ExtUI.Channelformicrophone2Label_2.HorizontalAlignment = 'right';
app.ExtUI.Channelformicrophone2Label_2.FontWeight = 'bold';
app.ExtUI.Channelformicrophone2Label_2.Layout.Row = 3;
app.ExtUI.Channelformicrophone2Label_2.Layout.Column = 3;
app.ExtUI.Channelformicrophone2Label_2.Text = 'Channel for microphone 2';

% Create TwoMicTwoMicConfigIICalibMic2DropDown
app.ExtUI.TwoMicTwoMicConfigIICalibMic2DropDown = uidropdown(app.ExtUI.TwoMicTwoMicConfigIICalibGrid);
app.ExtUI.TwoMicTwoMicConfigIICalibMic2DropDown.Items = string(1:Nin);
app.ExtUI.TwoMicTwoMicConfigIICalibMic2DropDown.FontWeight = 'bold';
app.ExtUI.TwoMicTwoMicConfigIICalibMic2DropDown.BackgroundColor = [1 1 1];
app.ExtUI.TwoMicTwoMicConfigIICalibMic2DropDown.Layout.Row = 3;
app.ExtUI.TwoMicTwoMicConfigIICalibMic2DropDown.Layout.Column = 4;
app.ExtUI.TwoMicTwoMicConfigIICalibMic2DropDown.Value = '1';
app.ExtUI.TwoMicTwoMicConfigIICalibMic2DropDown.Enable = 'off';
if isempty(app.ExtVar.ImpedanceTubeTwoMic.Mic2Ch) || app.ExtVar.ImpedanceTubeTwoMic.Mic2Ch > Nin
    app.ExtVar.ImpedanceTubeTwoMic.Mic2Ch = str2double(app.ExtUI.TwoMicTwoMicConfigIICalibMic2DropDown.Value);
else
    app.ExtUI.TwoMicTwoMicConfigIICalibMic2DropDown.Value = num2str(app.ExtVar.ImpedanceTubeTwoMic.Mic2Ch,'%d');
end

% Create TwoMicTwoMicConfigIICalibClearMeasure
app.ExtUI.TwoMicTwoMicConfigIICalibClearMeasure = uibutton(app.ExtUI.TwoMicTwoMicConfigIICalibGrid, 'push');
app.ExtUI.TwoMicTwoMicConfigIICalibClearMeasure.BackgroundColor = [0.651 0.651 0.651];
app.ExtUI.TwoMicTwoMicConfigIICalibClearMeasure.FontWeight = 'bold';
app.ExtUI.TwoMicTwoMicConfigIICalibClearMeasure.FontColor = [1 1 1];
app.ExtUI.TwoMicTwoMicConfigIICalibClearMeasure.Layout.Row = 2;
app.ExtUI.TwoMicTwoMicConfigIICalibClearMeasure.Layout.Column = 1;
app.ExtUI.TwoMicTwoMicConfigIICalibClearMeasure.Text = 'Clear measure';
app.ExtUI.TwoMicTwoMicConfigIICalibClearMeasure.ButtonPushedFcn = {@TwoMicTwoMicConfigIICalibClearMeasureFCN,app};

% Plot
TwoMicTwoMicCalibPlotDoneZone(app)

% Close progress bar
pause(0.5)
close(d)


function [Outs,Ins] = TwoMicTwoMicCalibMeasureSystem(app,OutCh,InCh)
% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Measuring...',...
    'Indeterminate','on');

% Refresh devices
audiodevreset;

% Generate signal
[signal,~] = signalGenerator(app);

% Measure
num = app.Averages;
for i=2:2:num*2
    [Outs,Ins(:,[i-1,i])] = audioOutIn(app,signal,OutCh,InCh,1);
end
InsCH1 = Ins(:,1:2:end);
InsCH2 = Ins(:,2:2:end);
Ins = [mean(InsCH1,2),mean(InsCH2,2)];

close(d)

function TwoMicTwoMicCalibConfigIMeasureFCN(~,~,app)

% Parameters
OutCh = app.ExtVar.ImpedanceTubeTwoMic.OutputCh;
InCh = [app.ExtVar.ImpedanceTubeTwoMic.Mic1Ch,app.ExtVar.ImpedanceTubeTwoMic.Mic2Ch];

% Measure
[Outs,Ins] = TwoMicTwoMicCalibMeasureSystem(app,OutCh,InCh);

% Store data
app.ExtVar.ImpedanceTubeTwoMic.Calibration.TypeSignal = app.TypeSignal;
app.ExtVar.ImpedanceTubeTwoMic.Calibration.SampleRate = app.SampleRate;
app.ExtVar.ImpedanceTubeTwoMic.Calibration.S1I = Ins(:,1);
app.ExtVar.ImpedanceTubeTwoMic.Calibration.S2I = Ins(:,2);
app.ExtVar.ImpedanceTubeTwoMic.Calibration.excitationI = Outs;

% Plot
TwoMicTwoMicCalibPlotDoneZone(app)

% Check
TwoMicCheckForCalculate(app)

% Disable measure button
app.ExtUI.TwoMicTwoMicConfigICalibMeasure.Enable = 'off';

function TwoMicTwoMicCalibConfigIIMeasureFCN(~,~,app)

% Parameters
OutCh = app.ExtVar.ImpedanceTubeTwoMic.OutputCh;
InCh = [app.ExtVar.ImpedanceTubeTwoMic.Mic1Ch,app.ExtVar.ImpedanceTubeTwoMic.Mic2Ch];

% Measure
[Outs,Ins] = TwoMicTwoMicCalibMeasureSystem(app,OutCh,InCh);

% Store data
app.ExtVar.ImpedanceTubeTwoMic.Calibration.TypeSignal = app.TypeSignal;
app.ExtVar.ImpedanceTubeTwoMic.Calibration.SampleRate = app.SampleRate;
app.ExtVar.ImpedanceTubeTwoMic.Calibration.S1II = Ins(:,1);
app.ExtVar.ImpedanceTubeTwoMic.Calibration.S2II = Ins(:,2);
app.ExtVar.ImpedanceTubeTwoMic.Calibration.excitationII = Outs;

% Plot
TwoMicTwoMicCalibPlotDoneZone(app)

% Check
TwoMicCheckForCalculate(app)

% Disable measure button
app.ExtUI.TwoMicTwoMicConfigIICalibMeasure.Enable = 'off';

function TwoMicTwoMicCalibPlotDoneZone(app)

% Configuration I
if ~isempty(app.ExtVar.ImpedanceTubeTwoMic.Calibration.S1I) && ~isempty(app.ExtVar.ImpedanceTubeTwoMic.Calibration.S2I)
    zones = [1,2];
    app.ExtUI.TwoMicTwoMicConfigICalibMeasure.Enable = 'off';
else
    zones = [];
end
plotTubeTwoMicISO10534(app,app.ExtUI.TwoMicTwoMicConfigICalibAxes,{'Mic';'1'},{'Mic';'2'},'',0,0,zones)

% Configuration II
if ~isempty(app.ExtVar.ImpedanceTubeTwoMic.Calibration.S1II) && ~isempty(app.ExtVar.ImpedanceTubeTwoMic.Calibration.S2II)
    zones = [1,2];
    app.ExtUI.TwoMicTwoMicConfigIICalibMeasure.Enable = 'off';
else
    zones = [];
end
plotTubeTwoMicISO10534(app,app.ExtUI.TwoMicTwoMicConfigIICalibAxes,{'Mic';'2'},{'Mic';'1'},'',0,0,zones)

if ~isempty(app.ExtVar.ImpedanceTubeTwoMic.Calibration.S1I) ...
        && ~isempty(app.ExtVar.ImpedanceTubeTwoMic.Calibration.S2I) ...
        && ~isempty(app.ExtVar.ImpedanceTubeTwoMic.Calibration.S1II) ...
        && ~isempty(app.ExtVar.ImpedanceTubeTwoMic.Calibration.S2II)
    app.ExtVar.ImpedanceTubeTwoMic.Calibrated = 1;
    app.ExtUI.PanelTubeTwoMicRightInfoTubeCalLabel.Text = 'Yes';
else
    app.ExtVar.ImpedanceTubeTwoMic.Calibrated = 0;
    app.ExtUI.PanelTubeTwoMicRightInfoTubeCalLabel.Text = 'No';
end

function TwoMicTwoMicConfigICalibClearMeasureFCN(~,~,app)
msg = 'Clear measure, are you sure?';
title = 'Clear';
selection = uiconfirm(app.ALabUIFigure,msg,title,...
    'Options',{'Yes','Cancel'},...
    'DefaultOption',2,'CancelOption',2);
if strcmp(selection,'Yes')
    app.ExtVar.ImpedanceTubeTwoMic.Calibration.S1I = [];
    app.ExtVar.ImpedanceTubeTwoMic.Calibration.S2I = [];
    app.ExtVar.ImpedanceTubeTwoMic.Calibration.excitationI = [];
    TwoMicTwoMicCalibPlotDoneZone(app)
    TwoMicCheckForCalculate(app)
    % Enable measure button
    app.ExtUI.TwoMicTwoMicConfigICalibMeasure.Enable = 'on';
    app.ExtVar.ImpedanceTubeTwoMic.Calibrated = 0;
    app.ExtUI.PanelTubeTwoMicRightInfoTubeCalLabel.Text = 'No';
end

function TwoMicTwoMicConfigIICalibClearMeasureFCN(~,~,app)
msg = 'Clear measure, are you sure?';
title = 'Clear';
selection = uiconfirm(app.ALabUIFigure,msg,title,...
    'Options',{'Yes','Cancel'},...
    'DefaultOption',2,'CancelOption',2);
if strcmp(selection,'Yes')
    app.ExtVar.ImpedanceTubeTwoMic.Calibration.S1II = [];
    app.ExtVar.ImpedanceTubeTwoMic.Calibration.S2II = [];
    app.ExtVar.ImpedanceTubeTwoMic.Calibration.excitationII = [];
    TwoMicTwoMicCalibPlotDoneZone(app)
    TwoMicCheckForCalculate(app)
    % Enable measure button
    app.ExtUI.TwoMicTwoMicConfigIICalibMeasure.Enable = 'on';
    app.ExtVar.ImpedanceTubeTwoMic.Calibrated = 0;
    app.ExtUI.PanelTubeTwoMicRightInfoTubeCalLabel.Text = 'No';
end

function TwoMicTubeCalibOutputChanged(~,~,app)
app.ExtVar.ImpedanceTubeTwoMic.OutputCh = str2double(app.ExtUI.TwoMicCalibMeasureOutputChannelDropDown.Value);

function TwoMicTwoMicCalibInputChannelChanged(~,~,app)
app.ExtVar.ImpedanceTubeTwoMic.Mic1Ch = str2double(app.ExtUI.TwoMicTwoMicConfigICalibMic1DropDown.Value);
app.ExtVar.ImpedanceTubeTwoMic.Mic2Ch = str2double(app.ExtUI.TwoMicTwoMicConfigICalibMic2DropDown.Value);

function TwoMicTubeCalibReturnPushed(~,~,app)
createCenterPanelMeasureTwoMicISO10534(app)