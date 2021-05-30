function createMeasureTwoMicOneMicOptions(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Create TwoMicOneMicConfigIPanel
app.ExtUI.TwoMicOneMicConfigIPanel = uipanel(app.ExtUI.GridCenterPanelTwoMic);
app.ExtUI.TwoMicOneMicConfigIPanel.TitlePosition = 'centertop';
app.ExtUI.TwoMicOneMicConfigIPanel.Title = 'Standard configuration (configuration I)';
app.ExtUI.TwoMicOneMicConfigIPanel.BackgroundColor = [0.9412 0.9412 0.9412];
app.ExtUI.TwoMicOneMicConfigIPanel.Layout.Row = 2;
app.ExtUI.TwoMicOneMicConfigIPanel.Layout.Column = 1;
app.ExtUI.TwoMicOneMicConfigIPanel.FontWeight = 'bold';

% Create TwoMicOneMicConfigIGrid
app.ExtUI.TwoMicOneMicConfigIGrid = uigridlayout(app.ExtUI.TwoMicOneMicConfigIPanel);
app.ExtUI.TwoMicOneMicConfigIGrid.ColumnWidth = {'1x', '1x', 'fit', '1x'};
app.ExtUI.TwoMicOneMicConfigIGrid.RowHeight = {'fit', '1x', 'fit', 'fit'};
app.ExtUI.TwoMicOneMicConfigIGrid.BackgroundColor = [1 1 1];

% Create TwoMicOneMicConfigIAxes
app.ExtUI.TwoMicOneMicConfigIAxes = uiaxes(app.ExtUI.TwoMicOneMicConfigIGrid);
app.ExtUI.TwoMicOneMicConfigIAxes.Layout.Row = 2;
app.ExtUI.TwoMicOneMicConfigIAxes.Layout.Column = [1 4];

% Create TwoMicOneMicConfigIMeasure
app.ExtUI.TwoMicOneMicConfigIMeasure = uibutton(app.ExtUI.TwoMicOneMicConfigIGrid, 'push');
app.ExtUI.TwoMicOneMicConfigIMeasure.BackgroundColor = [1 1 1];
app.ExtUI.TwoMicOneMicConfigIMeasure.FontWeight = 'bold';
app.ExtUI.TwoMicOneMicConfigIMeasure.Layout.Row = 4;
app.ExtUI.TwoMicOneMicConfigIMeasure.Layout.Column = 1;
app.ExtUI.TwoMicOneMicConfigIMeasure.Text = 'Measure [A]';
app.ExtUI.TwoMicOneMicConfigIMeasure.ButtonPushedFcn = {@TwoMicOneMicConfigIMeasureA,app};


[Nin,~] = getAvailableChannels(app);

% Create ChannelformicrophoneLabel_2
app.ExtUI.ChannelformicrophoneLabel_2 = uilabel(app.ExtUI.TwoMicOneMicConfigIGrid);
app.ExtUI.ChannelformicrophoneLabel_2.BackgroundColor = [1 1 1];
app.ExtUI.ChannelformicrophoneLabel_2.HorizontalAlignment = 'right';
app.ExtUI.ChannelformicrophoneLabel_2.FontWeight = 'bold';
app.ExtUI.ChannelformicrophoneLabel_2.Layout.Row = 3;
app.ExtUI.ChannelformicrophoneLabel_2.Layout.Column = 2;
app.ExtUI.ChannelformicrophoneLabel_2.Text = 'Channel for microphone';

% Create TwoMicOneMicConfigIMic1DropDown
app.ExtUI.TwoMicOneMicConfigIMic1DropDown = uidropdown(app.ExtUI.TwoMicOneMicConfigIGrid);
app.ExtUI.TwoMicOneMicConfigIMic1DropDown.Items = string(1:Nin);
app.ExtUI.TwoMicOneMicConfigIMic1DropDown.FontWeight = 'bold';
app.ExtUI.TwoMicOneMicConfigIMic1DropDown.BackgroundColor = [1 1 1];
app.ExtUI.TwoMicOneMicConfigIMic1DropDown.Layout.Row = 3;
app.ExtUI.TwoMicOneMicConfigIMic1DropDown.Layout.Column = 3;
app.ExtUI.TwoMicOneMicConfigIMic1DropDown.Value = '1';
app.ExtUI.TwoMicOneMicConfigIMic1DropDown.ValueChangedFcn = {@TwoMicOneMicInputChannelChanged,app};
if isempty(app.ExtVar.ImpedanceTubeTwoMic.Mic1Ch) || app.ExtVar.ImpedanceTubeTwoMic.Mic1Ch > Nin
    app.ExtVar.ImpedanceTubeTwoMic.Mic1Ch = str2double(app.ExtUI.TwoMicOneMicConfigIMic1DropDown.Value);
else
    app.ExtUI.TwoMicOneMicConfigIMic1DropDown.Value = num2str(app.ExtVar.ImpedanceTubeTwoMic.Mic1Ch,'%d');
end

% Create TwoMicOneMicConfigIClearMeasure
app.ExtUI.TwoMicOneMicConfigIClearMeasure = uibutton(app.ExtUI.TwoMicOneMicConfigIGrid, 'push');
app.ExtUI.TwoMicOneMicConfigIClearMeasure.BackgroundColor = [0.651 0.651 0.651];
app.ExtUI.TwoMicOneMicConfigIClearMeasure.FontWeight = 'bold';
app.ExtUI.TwoMicOneMicConfigIClearMeasure.FontColor = [1 1 1];
app.ExtUI.TwoMicOneMicConfigIClearMeasure.Layout.Row = 3;
app.ExtUI.TwoMicOneMicConfigIClearMeasure.Layout.Column = 1;
app.ExtUI.TwoMicOneMicConfigIClearMeasure.Text = 'Clear measure [A]';
app.ExtUI.TwoMicOneMicConfigIClearMeasure.ButtonPushedFcn = {@TwoMicOneMicConfigIClearMeasureA,app};


% Create TwoMicOneMicConfigIMeasure_2
app.ExtUI.TwoMicOneMicConfigIMeasure_2 = uibutton(app.ExtUI.TwoMicOneMicConfigIGrid, 'push');
app.ExtUI.TwoMicOneMicConfigIMeasure_2.BackgroundColor = [1 1 1];
app.ExtUI.TwoMicOneMicConfigIMeasure_2.FontWeight = 'bold';
app.ExtUI.TwoMicOneMicConfigIMeasure_2.Layout.Row = 4;
app.ExtUI.TwoMicOneMicConfigIMeasure_2.Layout.Column = 4;
app.ExtUI.TwoMicOneMicConfigIMeasure_2.Text = 'Measure [B]';
app.ExtUI.TwoMicOneMicConfigIMeasure_2.ButtonPushedFcn = {@TwoMicOneMicConfigIMeasureB,app};

% Create TwoMicOneMicConfigIClearMeasure_2
app.ExtUI.TwoMicOneMicConfigIClearMeasure_2 = uibutton(app.ExtUI.TwoMicOneMicConfigIGrid, 'push');
app.ExtUI.TwoMicOneMicConfigIClearMeasure_2.BackgroundColor = [0.651 0.651 0.651];
app.ExtUI.TwoMicOneMicConfigIClearMeasure_2.FontWeight = 'bold';
app.ExtUI.TwoMicOneMicConfigIClearMeasure_2.FontColor = [1 1 1];
app.ExtUI.TwoMicOneMicConfigIClearMeasure_2.Layout.Row = 3;
app.ExtUI.TwoMicOneMicConfigIClearMeasure_2.Layout.Column = 4;
app.ExtUI.TwoMicOneMicConfigIClearMeasure_2.Text = 'Clear measure [B]';
app.ExtUI.TwoMicOneMicConfigIClearMeasure_2.ButtonPushedFcn = {@TwoMicOneMicConfigIClearMeasureB,app};

% Create TwoMicOneMicInfoLabel
app.ExtUI.TwoMicOneMicInfoLabel = uilabel(app.ExtUI.TwoMicOneMicConfigIGrid);
app.ExtUI.TwoMicOneMicInfoLabel.WordWrap = 'on';
app.ExtUI.TwoMicOneMicInfoLabel.FontSize = 10;
app.ExtUI.TwoMicOneMicInfoLabel.Layout.Row = 1;
app.ExtUI.TwoMicOneMicInfoLabel.Layout.Column = [1 4];
app.ExtUI.TwoMicOneMicInfoLabel.Text = 'Put the microphone in position A and push ''Measure [A]'', then move the microphone to position B and push ''Measure [B]''.';

% Plot
TwoMicOneMicPlotDoneZone(app)


function [Outs,Ins] = TwoMicOneMicMeasureSystem(app,OutCh,InCh)
% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Measuring...',...
    'Indeterminate','on');

% Refresh devices
audiodevreset;

% Generate signal
[app.ExtVar.ImpedanceTubeTwoMic.Output,~] = signalGenerator(app);

% Measure
num = app.Averages;
for i=1:num
    [Outs,Ins(:,i)] = audioOutIn(app,app.ExtVar.ImpedanceTubeTwoMic.Output,OutCh,InCh,1); %#ok<AGROW>
end

Ins = mean(Ins,2);


close(d)

function TwoMicOneMicConfigIMeasureA(~,~,app)

% Parameters
OutCh = app.ExtVar.ImpedanceTubeTwoMic.OutputCh;
InCh = app.ExtVar.ImpedanceTubeTwoMic.Mic1Ch;

% Measure
[Outs,Ins] = TwoMicOneMicMeasureSystem(app,OutCh,InCh);

% Store data
app.ExtVar.ImpedanceTubeTwoMic.TypeSignal = app.TypeSignal;
app.ExtVar.ImpedanceTubeTwoMic.SampleRate = app.SampleRate;
app.ExtVar.ImpedanceTubeTwoMic.Mic1 = Ins;
app.ExtVar.ImpedanceTubeTwoMic.Output = Outs;

% Plot
TwoMicOneMicPlotDoneZone(app)

% Check
TwoMicCheckForCalculate(app)

% Disable measure button
app.ExtUI.TwoMicOneMicConfigIMeasure.Enable = 'off';

function TwoMicOneMicConfigIMeasureB(~,~,app)

% Parameters
OutCh = app.ExtVar.ImpedanceTubeTwoMic.OutputCh;
InCh = app.ExtVar.ImpedanceTubeTwoMic.Mic1Ch;

% Measure
[Outs,Ins] = TwoMicOneMicMeasureSystem(app,OutCh,InCh);

% Store data
app.ExtVar.ImpedanceTubeTwoMic.TypeSignal = app.TypeSignal;
app.ExtVar.ImpedanceTubeTwoMic.SampleRate = app.SampleRate;
app.ExtVar.ImpedanceTubeTwoMic.Mic2 = Ins;
app.ExtVar.ImpedanceTubeTwoMic.Output = Outs;

% Plot
TwoMicOneMicPlotDoneZone(app)

% Check
TwoMicCheckForCalculate(app)

% Disable measure button
app.ExtUI.TwoMicOneMicConfigIMeasure_2.Enable = 'off';

function TwoMicOneMicConfigIClearMeasureA(~,~,app)
msg = 'Clear measure, are you sure?';
title = 'Clear';
selection = uiconfirm(app.ALabUIFigure,msg,title,...
    'Options',{'Yes','Cancel'},...
    'DefaultOption',2,'CancelOption',2);
if strcmp(selection,'Yes')
    app.ExtVar.ImpedanceTubeTwoMic.Mic1 = [];
    TwoMicOneMicPlotDoneZone(app)
    TwoMicCheckForCalculate(app)
    % Enable measure button
    app.ExtUI.TwoMicOneMicConfigIMeasure.Enable = 'on';
end

function TwoMicOneMicConfigIClearMeasureB(~,~,app)
msg = 'Clear measure, are you sure?';
title = 'Clear';
selection = uiconfirm(app.ALabUIFigure,msg,title,...
    'Options',{'Yes','Cancel'},...
    'DefaultOption',2,'CancelOption',2);
if strcmp(selection,'Yes')
    app.ExtVar.ImpedanceTubeTwoMic.Mic2 = [];
    TwoMicOneMicPlotDoneZone(app)
    TwoMicCheckForCalculate(app)
    % Enable measure button
    app.ExtUI.TwoMicOneMicConfigIMeasure_2.Enable = 'on';
end

function TwoMicOneMicInputChannelChanged(~,~,app)
app.ExtVar.ImpedanceTubeTwoMic.Mic1Ch = str2double(app.ExtUI.TwoMicTwoMicConfigIMic1DropDown.Value);


function TwoMicOneMicPlotDoneZone(app)
zones = [];
if ~isempty(app.ExtVar.ImpedanceTubeTwoMic.Mic1) 
    zones = [zones,1];
    app.ExtUI.TwoMicOneMicConfigIMeasure.Enable = 'off';
end
if ~isempty(app.ExtVar.ImpedanceTubeTwoMic.Mic2)
    zones = [zones,2];
    app.ExtUI.TwoMicOneMicConfigIMeasure_2.Enable = 'off';
end

plotTubeTwoMicISO10534(app,app.ExtUI.TwoMicOneMicConfigIAxes,{'Mic';'A'},{'Mic';'B'},'Sample',0,0,zones)