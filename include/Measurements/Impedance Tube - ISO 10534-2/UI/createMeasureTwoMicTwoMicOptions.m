function createMeasureTwoMicTwoMicOptions(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Create TwoMicTwoMicConfigIPanel
app.ExtUI.TwoMicTwoMicConfigIPanel = uipanel(app.ExtUI.GridCenterPanelTwoMic);
app.ExtUI.TwoMicTwoMicConfigIPanel.TitlePosition = 'centertop';
app.ExtUI.TwoMicTwoMicConfigIPanel.Title = 'Standard configuration (configuration I)';
app.ExtUI.TwoMicTwoMicConfigIPanel.BackgroundColor = [0.9412 0.9412 0.9412];
app.ExtUI.TwoMicTwoMicConfigIPanel.Layout.Row = 2;
app.ExtUI.TwoMicTwoMicConfigIPanel.Layout.Column = 1;
app.ExtUI.TwoMicTwoMicConfigIPanel.FontWeight = 'bold';

% Create TwoMicTwoMicConfigIGrid
app.ExtUI.TwoMicTwoMicConfigIGrid = uigridlayout(app.ExtUI.TwoMicTwoMicConfigIPanel);
app.ExtUI.TwoMicTwoMicConfigIGrid.ColumnWidth = {'1x', '1x', 'fit', 'fit'};
app.ExtUI.TwoMicTwoMicConfigIGrid.RowHeight = {'1x', 'fit', 'fit'};
app.ExtUI.TwoMicTwoMicConfigIGrid.BackgroundColor = [1 1 1];

% Create TwoMicTwoMicConfigIAxes
app.ExtUI.TwoMicTwoMicConfigIAxes = uiaxes(app.ExtUI.TwoMicTwoMicConfigIGrid);
app.ExtUI.TwoMicTwoMicConfigIAxes.Layout.Row = 1;
app.ExtUI.TwoMicTwoMicConfigIAxes.Layout.Column = [1 4];

% Create TwoMicTwoMicConfigIMeasure
app.ExtUI.TwoMicTwoMicConfigIMeasure = uibutton(app.ExtUI.TwoMicTwoMicConfigIGrid, 'push');
app.ExtUI.TwoMicTwoMicConfigIMeasure.BackgroundColor = [1 1 1];
app.ExtUI.TwoMicTwoMicConfigIMeasure.FontWeight = 'bold';
app.ExtUI.TwoMicTwoMicConfigIMeasure.Layout.Row = 3;
app.ExtUI.TwoMicTwoMicConfigIMeasure.Layout.Column = 1;
app.ExtUI.TwoMicTwoMicConfigIMeasure.Text = 'Measure';
app.ExtUI.TwoMicTwoMicConfigIMeasure.ButtonPushedFcn = {@TwoMicTwoMicConfigIMeasureFCN,app};


[Nin,~] = getAvailableChannels(app);

% Create Channelformicrophone1Label
app.ExtUI.Channelformicrophone1Label = uilabel(app.ExtUI.TwoMicTwoMicConfigIGrid);
app.ExtUI.Channelformicrophone1Label.BackgroundColor = [1 1 1];
app.ExtUI.Channelformicrophone1Label.HorizontalAlignment = 'right';
app.ExtUI.Channelformicrophone1Label.FontWeight = 'bold';
app.ExtUI.Channelformicrophone1Label.Layout.Row = 2;
app.ExtUI.Channelformicrophone1Label.Layout.Column = 3;
app.ExtUI.Channelformicrophone1Label.Text = 'Channel for microphone 1';

% Create TwoMicTwoMicConfigIMic1DropDown
app.ExtUI.TwoMicTwoMicConfigIMic1DropDown = uidropdown(app.ExtUI.TwoMicTwoMicConfigIGrid);
app.ExtUI.TwoMicTwoMicConfigIMic1DropDown.Items = string(1:Nin);
app.ExtUI.TwoMicTwoMicConfigIMic1DropDown.FontWeight = 'bold';
app.ExtUI.TwoMicTwoMicConfigIMic1DropDown.BackgroundColor = [1 1 1];
app.ExtUI.TwoMicTwoMicConfigIMic1DropDown.Layout.Row = 2;
app.ExtUI.TwoMicTwoMicConfigIMic1DropDown.Layout.Column = 4;
app.ExtUI.TwoMicTwoMicConfigIMic1DropDown.Value = '1';
app.ExtUI.TwoMicTwoMicConfigIMic1DropDown.ValueChangedFcn = {@TwoMicTwoMicInputChannelChanged,app};
if isempty(app.ExtVar.ImpedanceTubeTwoMic.Mic1Ch) || app.ExtVar.ImpedanceTubeTwoMic.Mic1Ch > Nin
    app.ExtVar.ImpedanceTubeTwoMic.Mic1Ch = str2double(app.ExtUI.TwoMicTwoMicConfigIMic1DropDown.Value);
else
    app.ExtUI.TwoMicTwoMicConfigIMic1DropDown.Value = num2str(app.ExtVar.ImpedanceTubeTwoMic.Mic1Ch,'%d');
end

% Create Channelformicrophone2Label
app.ExtUI.Channelformicrophone2Label = uilabel(app.ExtUI.TwoMicTwoMicConfigIGrid);
app.ExtUI.Channelformicrophone2Label.BackgroundColor = [1 1 1];
app.ExtUI.Channelformicrophone2Label.HorizontalAlignment = 'right';
app.ExtUI.Channelformicrophone2Label.FontWeight = 'bold';
app.ExtUI.Channelformicrophone2Label.Layout.Row = 3;
app.ExtUI.Channelformicrophone2Label.Layout.Column = 3;
app.ExtUI.Channelformicrophone2Label.Text = 'Channel for microphone 2';

% Create TwoMicTwoMicConfigIMic2DropDown
app.ExtUI.TwoMicTwoMicConfigIMic2DropDown = uidropdown(app.ExtUI.TwoMicTwoMicConfigIGrid);
app.ExtUI.TwoMicTwoMicConfigIMic2DropDown.Items = string(1:Nin);
app.ExtUI.TwoMicTwoMicConfigIMic2DropDown.FontWeight = 'bold';
app.ExtUI.TwoMicTwoMicConfigIMic2DropDown.BackgroundColor = [1 1 1];
app.ExtUI.TwoMicTwoMicConfigIMic2DropDown.Layout.Row = 3;
app.ExtUI.TwoMicTwoMicConfigIMic2DropDown.Layout.Column = 4;
app.ExtUI.TwoMicTwoMicConfigIMic2DropDown.Value = '2';
app.ExtUI.TwoMicTwoMicConfigIMic2DropDown.ValueChangedFcn = {@TwoMicTwoMicInputChannelChanged,app};
if isempty(app.ExtVar.ImpedanceTubeTwoMic.Mic2Ch) || app.ExtVar.ImpedanceTubeTwoMic.Mic2Ch > Nin
    app.ExtVar.ImpedanceTubeTwoMic.Mic2Ch = str2double(app.ExtUI.TwoMicTwoMicConfigIMic2DropDown.Value);
else
    app.ExtUI.TwoMicTwoMicConfigIMic2DropDown.Value = num2str(app.ExtVar.ImpedanceTubeTwoMic.Mic2Ch,'%d');
end

% Create TwoMicTwoMicConfigIClearMeasure
app.ExtUI.TwoMicTwoMicConfigIClearMeasure = uibutton(app.ExtUI.TwoMicTwoMicConfigIGrid, 'push');
app.ExtUI.TwoMicTwoMicConfigIClearMeasure.BackgroundColor = [0.651 0.651 0.651];
app.ExtUI.TwoMicTwoMicConfigIClearMeasure.FontWeight = 'bold';
app.ExtUI.TwoMicTwoMicConfigIClearMeasure.FontColor = [1 1 1];
app.ExtUI.TwoMicTwoMicConfigIClearMeasure.Layout.Row = 2;
app.ExtUI.TwoMicTwoMicConfigIClearMeasure.Layout.Column = 1;
app.ExtUI.TwoMicTwoMicConfigIClearMeasure.Text = 'Clear measure';
app.ExtUI.TwoMicTwoMicConfigIClearMeasure.ButtonPushedFcn = {@TwoMicTwoMicConfigIClearMeasureFCN,app};


% Plot
TwoMicTwoMicPlotDoneZone(app)


function [Outs,Ins] = TwoMicTwoMicMeasureSystem(app,OutCh,InCh)
% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Measuring...',...
    'Indeterminate','on');

% Refresh devices
audiodevreset;

% Generate signal
[app.ExtVar.ImpedanceTubeTwoMic.Output,~] = signalGenerator(app);

% Measure
num = app.Averages;
for i=2:2:num*2
    [Outs,Ins(:,[i-1,i])] = audioOutIn(app,app.ExtVar.ImpedanceTubeTwoMic.Output,OutCh,InCh,1);
end
InsCH1 = Ins(:,1:2:end);
InsCH2 = Ins(:,2:2:end);
Ins = [mean(InsCH1,2),mean(InsCH2,2)];

close(d)

function TwoMicTwoMicConfigIMeasureFCN(~,~,app)

% Parameters
OutCh = app.ExtVar.ImpedanceTubeTwoMic.OutputCh;
InCh = [app.ExtVar.ImpedanceTubeTwoMic.Mic1Ch,app.ExtVar.ImpedanceTubeTwoMic.Mic2Ch];

% Measure
[Outs,Ins] = TwoMicTwoMicMeasureSystem(app,OutCh,InCh);

% Store data
app.ExtVar.ImpedanceTubeTwoMic.TypeSignal = app.TypeSignal;
app.ExtVar.ImpedanceTubeTwoMic.SampleRate = app.SampleRate;
app.ExtVar.ImpedanceTubeTwoMic.Mic1 = Ins(:,1);
app.ExtVar.ImpedanceTubeTwoMic.Mic2 = Ins(:,2);

app.ExtVar.ImpedanceTubeTwoMic.Output = Outs;


% Plot
TwoMicTwoMicPlotDoneZone(app)

% Check
TwoMicCheckForCalculate(app)

% Disable measure button
app.ExtUI.TwoMicTwoMicConfigIMeasure.Enable = 'off';

function TwoMicTwoMicConfigIClearMeasureFCN(~,~,app)
msg = 'Clear measure, are you sure?';
title = 'Clear';
selection = uiconfirm(app.ALabUIFigure,msg,title,...
    'Options',{'Yes','Cancel'},...
    'DefaultOption',2,'CancelOption',2);
if strcmp(selection,'Yes')
    app.ExtVar.ImpedanceTubeTwoMic.Mic1 = [];
    app.ExtVar.ImpedanceTubeTwoMic.Mic2 = [];
    app.ExtVar.ImpedanceTubeTwoMic.Output = [];
    TwoMicTwoMicPlotDoneZone(app)
    TwoMicCheckForCalculate(app)
    % Enable measure button
    app.ExtUI.TwoMicTwoMicConfigIMeasure.Enable = 'on';
end

function TwoMicTwoMicInputChannelChanged(~,~,app)
app.ExtVar.ImpedanceTubeTwoMic.Mic1Ch = str2double(app.ExtUI.TwoMicTwoMicConfigIMic1DropDown.Value);
app.ExtVar.ImpedanceTubeTwoMic.Mic2Ch = str2double(app.ExtUI.TwoMicTwoMicConfigIMic2DropDown.Value);


function TwoMicTwoMicPlotDoneZone(app)
if ~isempty(app.ExtVar.ImpedanceTubeTwoMic.Mic1) && ~isempty(app.ExtVar.ImpedanceTubeTwoMic.Mic2)
    zones = [1,2];
    % Disable measure button
    app.ExtUI.TwoMicTwoMicConfigIMeasure.Enable = 'off';
else
    zones = [];
end
plotTubeTwoMicISO10534(app,app.ExtUI.TwoMicTwoMicConfigIAxes,{'Mic';'1'},{'Mic';'2'},'Sample',0,0,zones)
