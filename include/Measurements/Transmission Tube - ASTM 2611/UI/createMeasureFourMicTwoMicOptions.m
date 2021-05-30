function createMeasureFourMicTwoMicOptions(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Create AnechoicendPanel
app.ExtUI.AnechoicendPanel = uipanel(app.ExtUI.GridCenterPanelFourMicTube);
app.ExtUI.AnechoicendPanel.TitlePosition = 'centertop';
app.ExtUI.AnechoicendPanel.Title = 'Anechoic end';
app.ExtUI.AnechoicendPanel.BackgroundColor = [0.9412 0.9412 0.9412];
app.ExtUI.AnechoicendPanel.Layout.Row = 2;
app.ExtUI.AnechoicendPanel.Layout.Column = 1;
app.ExtUI.AnechoicendPanel.FontWeight = 'bold';

% Create AnechoicendGrid
app.ExtUI.AnechoicendGrid = uigridlayout(app.ExtUI.AnechoicendPanel);
app.ExtUI.AnechoicendGrid.ColumnWidth = {'1x', 'fit', 'fit', '1x'};
app.ExtUI.AnechoicendGrid.RowHeight = {'1x', 'fit', 'fit'};
app.ExtUI.AnechoicendGrid.BackgroundColor = [1 1 1];

% Create FourMicTwoMicAnechoicEndMeasureUpstream
app.ExtUI.FourMicTwoMicAnechoicEndMeasureUpstream = uibutton(app.ExtUI.AnechoicendGrid, 'push');
app.ExtUI.FourMicTwoMicAnechoicEndMeasureUpstream.BackgroundColor = [1 1 1];
app.ExtUI.FourMicTwoMicAnechoicEndMeasureUpstream.FontWeight = 'bold';
app.ExtUI.FourMicTwoMicAnechoicEndMeasureUpstream.Layout.Row = 3;
app.ExtUI.FourMicTwoMicAnechoicEndMeasureUpstream.Layout.Column = 1;
app.ExtUI.FourMicTwoMicAnechoicEndMeasureUpstream.Text = 'Measure';
app.ExtUI.FourMicTwoMicAnechoicEndMeasureUpstream.ButtonPushedFcn = {@FourMicTwoMicAnechoicEndMeasureUpstream,app};

% Create FourMicTwoMicAnechoicEndMeasureDownstream
app.ExtUI.FourMicTwoMicAnechoicEndMeasureDownstream = uibutton(app.ExtUI.AnechoicendGrid, 'push');
app.ExtUI.FourMicTwoMicAnechoicEndMeasureDownstream.BackgroundColor = [1 1 1];
app.ExtUI.FourMicTwoMicAnechoicEndMeasureDownstream.FontWeight = 'bold';
app.ExtUI.FourMicTwoMicAnechoicEndMeasureDownstream.Layout.Row = 3;
app.ExtUI.FourMicTwoMicAnechoicEndMeasureDownstream.Layout.Column = 4;
app.ExtUI.FourMicTwoMicAnechoicEndMeasureDownstream.Text = 'Measure';
app.ExtUI.FourMicTwoMicAnechoicEndMeasureDownstream.ButtonPushedFcn = {@FourMicTwoMicAnechoicEndMeasureDownstream,app};


% Create FourMicTwoMicAnechoicEndClearMeasureUpstream
app.ExtUI.FourMicTwoMicAnechoicEndClearMeasureUpstream = uibutton(app.ExtUI.AnechoicendGrid, 'push');
app.ExtUI.FourMicTwoMicAnechoicEndClearMeasureUpstream.BackgroundColor = [0.651 0.651 0.651];
app.ExtUI.FourMicTwoMicAnechoicEndClearMeasureUpstream.FontWeight = 'bold';
app.ExtUI.FourMicTwoMicAnechoicEndClearMeasureUpstream.FontColor = [1 1 1];
app.ExtUI.FourMicTwoMicAnechoicEndClearMeasureUpstream.Layout.Row = 2;
app.ExtUI.FourMicTwoMicAnechoicEndClearMeasureUpstream.Layout.Column = 1;
app.ExtUI.FourMicTwoMicAnechoicEndClearMeasureUpstream.Text = 'Clear measure';
app.ExtUI.FourMicTwoMicAnechoicEndClearMeasureUpstream.ButtonPushedFcn = {@FourMicTwoMicAnechoicEndClearMeasureUpstream,app};


% Create FourMicTwoMicAnechoicEndClearMeasureDownstream
app.ExtUI.FourMicTwoMicAnechoicEndClearMeasureDownstream = uibutton(app.ExtUI.AnechoicendGrid, 'push');
app.ExtUI.FourMicTwoMicAnechoicEndClearMeasureDownstream.BackgroundColor = [0.651 0.651 0.651];
app.ExtUI.FourMicTwoMicAnechoicEndClearMeasureDownstream.FontWeight = 'bold';
app.ExtUI.FourMicTwoMicAnechoicEndClearMeasureDownstream.FontColor = [1 1 1];
app.ExtUI.FourMicTwoMicAnechoicEndClearMeasureDownstream.Layout.Row = 2;
app.ExtUI.FourMicTwoMicAnechoicEndClearMeasureDownstream.Layout.Column = 4;
app.ExtUI.FourMicTwoMicAnechoicEndClearMeasureDownstream.Text = 'Clear measure';
app.ExtUI.FourMicTwoMicAnechoicEndClearMeasureDownstream.ButtonPushedFcn = {@FourMicTwoMicAnechoicEndClearMeasureDownstream,app};


[Nin,~] = getAvailableChannels(app);

% Create ChannelforMic1ACDropDownLabel
app.ExtUI.ChannelforMic1ACDropDownLabel = uilabel(app.ExtUI.AnechoicendGrid);
app.ExtUI.ChannelforMic1ACDropDownLabel.BackgroundColor = [1 1 1];
app.ExtUI.ChannelforMic1ACDropDownLabel.HorizontalAlignment = 'right';
app.ExtUI.ChannelforMic1ACDropDownLabel.Layout.Row = 2;
app.ExtUI.ChannelforMic1ACDropDownLabel.Layout.Column = 2;
app.ExtUI.ChannelforMic1ACDropDownLabel.Text = 'Channel for Mic 1 [A,C]';

% Create FourMicTwoMicAnechoicEndMic1DropDown
app.ExtUI.FourMicTwoMicAnechoicEndMic1DropDown = uidropdown(app.ExtUI.AnechoicendGrid);
app.ExtUI.FourMicTwoMicAnechoicEndMic1DropDown.Items = string(1:Nin);
app.ExtUI.FourMicTwoMicAnechoicEndMic1DropDown.ValueChangedFcn = {@FourMicTwoMicTubeParameterChanged,app};
app.ExtUI.FourMicTwoMicAnechoicEndMic1DropDown.BackgroundColor = [1 1 1];
app.ExtUI.FourMicTwoMicAnechoicEndMic1DropDown.Layout.Row = 2;
app.ExtUI.FourMicTwoMicAnechoicEndMic1DropDown.Layout.Column = 3;
app.ExtUI.FourMicTwoMicAnechoicEndMic1DropDown.Value = '1';
if isempty(app.ExtVar.ImpedanceTubeFourMic.Mic1Ch) || app.ExtVar.ImpedanceTubeFourMic.Mic1Ch > Nin
    app.ExtVar.ImpedanceTubeFourMic.Mic1Ch = str2double(app.ExtUI.FourMicTwoMicAnechoicEndMic1DropDown.Value);
else
    app.ExtUI.FourMicTwoMicAnechoicEndMic1DropDown.Value = num2str(app.ExtVar.ImpedanceTubeFourMic.Mic1Ch,'%d');
end

% Create ChannelforMic2BDDropDownLabel
app.ExtUI.ChannelforMic2BDDropDownLabel = uilabel(app.ExtUI.AnechoicendGrid);
app.ExtUI.ChannelforMic2BDDropDownLabel.BackgroundColor = [1 1 1];
app.ExtUI.ChannelforMic2BDDropDownLabel.HorizontalAlignment = 'right';
app.ExtUI.ChannelforMic2BDDropDownLabel.Layout.Row = 3;
app.ExtUI.ChannelforMic2BDDropDownLabel.Layout.Column = 2;
app.ExtUI.ChannelforMic2BDDropDownLabel.Text = 'Channel for Mic 2 [B,D]';

% Create FourMicTwoMicAnechoicEndMic2DropDown
app.ExtUI.FourMicTwoMicAnechoicEndMic2DropDown = uidropdown(app.ExtUI.AnechoicendGrid);
app.ExtUI.FourMicTwoMicAnechoicEndMic2DropDown.Items = string(1:Nin);
app.ExtUI.FourMicTwoMicAnechoicEndMic2DropDown.ValueChangedFcn = {@FourMicTwoMicTubeParameterChanged,app};
app.ExtUI.FourMicTwoMicAnechoicEndMic2DropDown.BackgroundColor = [1 1 1];
app.ExtUI.FourMicTwoMicAnechoicEndMic2DropDown.Layout.Row = 3;
app.ExtUI.FourMicTwoMicAnechoicEndMic2DropDown.Layout.Column = 3;
if Nin <= 1
    app.ExtUI.FourMicTwoMicAnechoicEndMic2DropDown.Value = '1';
else
    app.ExtUI.FourMicTwoMicAnechoicEndMic2DropDown.Value = '2';
end
if isempty(app.ExtVar.ImpedanceTubeFourMic.Mic2Ch) || app.ExtVar.ImpedanceTubeFourMic.Mic2Ch > Nin
    app.ExtVar.ImpedanceTubeFourMic.Mic2Ch = str2double(app.ExtUI.FourMicTwoMicAnechoicEndMic2DropDown.Value);
else
    app.ExtUI.FourMicTwoMicAnechoicEndMic2DropDown.Value = num2str(app.ExtVar.ImpedanceTubeFourMic.Mic2Ch,'%d');
end

% Create FourMicTwoMicAnechoicAxes
app.ExtUI.FourMicTwoMicAnechoicAxes = uiaxes(app.ExtUI.AnechoicendGrid);
app.ExtUI.FourMicTwoMicAnechoicAxes.Layout.Row = 1;
app.ExtUI.FourMicTwoMicAnechoicAxes.Layout.Column = [1 4];

% Create FourMicTwoMicRigidendPanel
if isfield(app.ExtUI,'FourMicTwoMicRigidendPanel')
    delete(findobj(app.ExtUI.GridCenterPanelFourMicTube.Children,'Title','Rigid end'))
end

app.ExtUI.FourMicTwoMicRigidendPanel = uipanel(app.ExtUI.GridCenterPanelFourMicTube);
app.ExtUI.FourMicTwoMicRigidendPanel.Visible = 'off';
app.ExtUI.FourMicTwoMicRigidendPanel.TitlePosition = 'centertop';
app.ExtUI.FourMicTwoMicRigidendPanel.Title = 'Rigid end';
app.ExtUI.FourMicTwoMicRigidendPanel.BackgroundColor = [0.9412 0.9412 0.9412];
app.ExtUI.FourMicTwoMicRigidendPanel.Layout.Row = 3;
app.ExtUI.FourMicTwoMicRigidendPanel.Layout.Column = 1;
app.ExtUI.FourMicTwoMicRigidendPanel.FontWeight = 'bold';
if ~isempty(app.ExtVar.ImpedanceTubeFourMic.Symmetrical)
    if ~app.ExtVar.ImpedanceTubeFourMic.Symmetrical
        app.ExtUI.FourMicTwoMicRigidendPanel.Visible = 'on';
    end
else
    app.ExtVar.ImpedanceTubeFourMic.Symmetrical = true;
end

% Create FourMicTwoMicRigidendGrid
app.ExtUI.FourMicTwoMicRigidendGrid = uigridlayout(app.ExtUI.FourMicTwoMicRigidendPanel);
app.ExtUI.FourMicTwoMicRigidendGrid.ColumnWidth = {'1x', 'fit', 'fit', '1x'};
app.ExtUI.FourMicTwoMicRigidendGrid.RowHeight = {'1x', 'fit', 'fit'};
app.ExtUI.FourMicTwoMicRigidendGrid.BackgroundColor = [1 1 1];

% Create FourMicTwoMicRigidEndMeasureUpstream
app.ExtUI.FourMicTwoMicRigidEndMeasureUpstream = uibutton(app.ExtUI.FourMicTwoMicRigidendGrid, 'push');
app.ExtUI.FourMicTwoMicRigidEndMeasureUpstream.BackgroundColor = [1 1 1];
app.ExtUI.FourMicTwoMicRigidEndMeasureUpstream.FontWeight = 'bold';
app.ExtUI.FourMicTwoMicRigidEndMeasureUpstream.Layout.Row = 3;
app.ExtUI.FourMicTwoMicRigidEndMeasureUpstream.Layout.Column = 1;
app.ExtUI.FourMicTwoMicRigidEndMeasureUpstream.Text = 'Measure';
app.ExtUI.FourMicTwoMicRigidEndMeasureUpstream.ButtonPushedFcn = {@FourMicTwoMicRigidEndMeasureUpstream,app};

% Create FourMicTwoMicRigidEndMeasureDownstream
app.ExtUI.FourMicTwoMicRigidEndMeasureDownstream = uibutton(app.ExtUI.FourMicTwoMicRigidendGrid, 'push');
app.ExtUI.FourMicTwoMicRigidEndMeasureDownstream.BackgroundColor = [1 1 1];
app.ExtUI.FourMicTwoMicRigidEndMeasureDownstream.FontWeight = 'bold';
app.ExtUI.FourMicTwoMicRigidEndMeasureDownstream.Layout.Row = 3;
app.ExtUI.FourMicTwoMicRigidEndMeasureDownstream.Layout.Column = 4;
app.ExtUI.FourMicTwoMicRigidEndMeasureDownstream.Text = 'Measure';
app.ExtUI.FourMicTwoMicRigidEndMeasureDownstream.ButtonPushedFcn = {@FourMicTwoMicRigidEndMeasureDownstream,app};

% Create FourMicTwoMicRigidEndClearMeasureUpstream
app.ExtUI.FourMicTwoMicRigidEndClearMeasureUpstream = uibutton(app.ExtUI.FourMicTwoMicRigidendGrid, 'push');
app.ExtUI.FourMicTwoMicRigidEndClearMeasureUpstream.BackgroundColor = [0.651 0.651 0.651];
app.ExtUI.FourMicTwoMicRigidEndClearMeasureUpstream.FontWeight = 'bold';
app.ExtUI.FourMicTwoMicRigidEndClearMeasureUpstream.FontColor = [1 1 1];
app.ExtUI.FourMicTwoMicRigidEndClearMeasureUpstream.Layout.Row = 2;
app.ExtUI.FourMicTwoMicRigidEndClearMeasureUpstream.Layout.Column = 1;
app.ExtUI.FourMicTwoMicRigidEndClearMeasureUpstream.Text = 'Clear measure';
app.ExtUI.FourMicTwoMicRigidEndClearMeasureUpstream.ButtonPushedFcn = {@FourMicTwoMicRigidEndClearMeasureUpstream,app};


% Create FourMicTwoMicRigidEndClearMeasureDownstream
app.ExtUI.FourMicTwoMicRigidEndClearMeasureDownstream = uibutton(app.ExtUI.FourMicTwoMicRigidendGrid, 'push');
app.ExtUI.FourMicTwoMicRigidEndClearMeasureDownstream.BackgroundColor = [0.651 0.651 0.651];
app.ExtUI.FourMicTwoMicRigidEndClearMeasureDownstream.FontWeight = 'bold';
app.ExtUI.FourMicTwoMicRigidEndClearMeasureDownstream.FontColor = [1 1 1];
app.ExtUI.FourMicTwoMicRigidEndClearMeasureDownstream.Layout.Row = 2;
app.ExtUI.FourMicTwoMicRigidEndClearMeasureDownstream.Layout.Column = 4;
app.ExtUI.FourMicTwoMicRigidEndClearMeasureDownstream.Text = 'Clear measure';
app.ExtUI.FourMicTwoMicRigidEndClearMeasureDownstream.ButtonPushedFcn = {@FourMicTwoMicRigidEndClearMeasureDownstream,app};

% Create ChannelforMic1ACDropDown_2Label
app.ExtUI.ChannelforMic1ACDropDown_2Label = uilabel(app.ExtUI.FourMicTwoMicRigidendGrid);
app.ExtUI.ChannelforMic1ACDropDown_2Label.BackgroundColor = [1 1 1];
app.ExtUI.ChannelforMic1ACDropDown_2Label.HorizontalAlignment = 'right';
app.ExtUI.ChannelforMic1ACDropDown_2Label.Layout.Row = 2;
app.ExtUI.ChannelforMic1ACDropDown_2Label.Layout.Column = 2;
app.ExtUI.ChannelforMic1ACDropDown_2Label.Text = 'Channel for Mic 1 [A,C]';

% Create FourMicTwoMicRigidEndMic1DropDown
app.ExtUI.FourMicTwoMicRigidEndMic1DropDown = uidropdown(app.ExtUI.FourMicTwoMicRigidendGrid);
app.ExtUI.FourMicTwoMicRigidEndMic1DropDown.Items = app.ExtUI.FourMicTwoMicAnechoicEndMic1DropDown.Items;
app.ExtUI.FourMicTwoMicRigidEndMic1DropDown.BackgroundColor = [1 1 1];
app.ExtUI.FourMicTwoMicRigidEndMic1DropDown.Layout.Row = 2;
app.ExtUI.FourMicTwoMicRigidEndMic1DropDown.Layout.Column = 3;
app.ExtUI.FourMicTwoMicRigidEndMic1DropDown.Enable = 'off';
app.ExtUI.FourMicTwoMicRigidEndMic1DropDown.Value = app.ExtUI.FourMicTwoMicAnechoicEndMic1DropDown.Value;

% Create ChannelforMic2BDDropDown_2Label
app.ExtUI.ChannelforMic2BDDropDown_2Label = uilabel(app.ExtUI.FourMicTwoMicRigidendGrid);
app.ExtUI.ChannelforMic2BDDropDown_2Label.BackgroundColor = [1 1 1];
app.ExtUI.ChannelforMic2BDDropDown_2Label.HorizontalAlignment = 'right';
app.ExtUI.ChannelforMic2BDDropDown_2Label.Layout.Row = 3;
app.ExtUI.ChannelforMic2BDDropDown_2Label.Layout.Column = 2;
app.ExtUI.ChannelforMic2BDDropDown_2Label.Text = 'Channel for Mic 2 [B,D]';

% Create FourMicTwoMicRigidEndMic2DropDown
app.ExtUI.FourMicTwoMicRigidEndMic2DropDown = uidropdown(app.ExtUI.FourMicTwoMicRigidendGrid);
app.ExtUI.FourMicTwoMicRigidEndMic2DropDown.Items = app.ExtUI.FourMicTwoMicAnechoicEndMic2DropDown.Items;
app.ExtUI.FourMicTwoMicRigidEndMic2DropDown.BackgroundColor = [1 1 1];
app.ExtUI.FourMicTwoMicRigidEndMic2DropDown.Layout.Row = 3;
app.ExtUI.FourMicTwoMicRigidEndMic2DropDown.Layout.Column = 3;
app.ExtUI.FourMicTwoMicRigidEndMic2DropDown.Enable = 'off';
app.ExtUI.FourMicTwoMicRigidEndMic2DropDown.Value = app.ExtUI.FourMicTwoMicAnechoicEndMic2DropDown.Value;

% Create FourMicTwoMicRigidAxes
app.ExtUI.FourMicTwoMicRigidAxes = uiaxes(app.ExtUI.FourMicTwoMicRigidendGrid);
app.ExtUI.FourMicTwoMicRigidAxes.Layout.Row = 1;
app.ExtUI.FourMicTwoMicRigidAxes.Layout.Column = [1 4];

% Plot tubes
aux = app.ExtVar.ImpedanceTubeFourMic.Symmetrical;
app.ExtVar.ImpedanceTubeFourMic.Symmetrical = false;
FourMicTwoMicPlotDoneZone(app)
app.ExtVar.ImpedanceTubeFourMic.Symmetrical = aux;

function FourMicTwoMicTubeParameterChanged(~,~,app)
app.ExtVar.ImpedanceTubeFourMic.Mic1Ch = str2double(app.ExtUI.FourMicTwoMicAnechoicEndMic1DropDown.Value);
app.ExtVar.ImpedanceTubeFourMic.Mic2Ch = str2double(app.ExtUI.FourMicTwoMicAnechoicEndMic2DropDown.Value);
app.ExtVar.ImpedanceTubeFourMic.Mic3Ch = [];
app.ExtVar.ImpedanceTubeFourMic.Mic4Ch = [];
app.ExtUI.FourMicTwoMicRigidEndMic1DropDown.Value = app.ExtUI.FourMicTwoMicAnechoicEndMic1DropDown.Value;
app.ExtUI.FourMicTwoMicRigidEndMic2DropDown.Value = app.ExtUI.FourMicTwoMicAnechoicEndMic2DropDown.Value;

function [Outs,Ins] = FourMicTwoMicMeasureSystem(app,OutCh,InCh)
% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Measuring...',...
    'Indeterminate','on');

% Refresh devices
audiodevreset;

% Generate signal
[app.ExtVar.ImpedanceTubeFourMic.Output,~] = signalGenerator(app);

% Measure
num = app.Averages;
for i=2:2:num*2
    [Outs,Ins(:,[i-1,i])] = audioOutIn(app,app.ExtVar.ImpedanceTubeFourMic.Output,OutCh,InCh,1);
end
InsCH1 = Ins(:,1:2:end);
InsCH2 = Ins(:,2:2:end);
Ins = [mean(InsCH1,2),mean(InsCH2,2)];

close(d)

function FourMicTwoMicAnechoicEndMeasureUpstream(~,~,app)
% Parameters
OutCh = app.ExtVar.ImpedanceTubeFourMic.OutputCh;
InCh = [app.ExtVar.ImpedanceTubeFourMic.Mic1Ch,app.ExtVar.ImpedanceTubeFourMic.Mic2Ch];

% Measure
[Outs,Ins] = FourMicTwoMicMeasureSystem(app,OutCh,InCh);

% Store data
app.ExtVar.ImpedanceTubeFourMic.TypeSignal = app.TypeSignal;
app.ExtVar.ImpedanceTubeFourMic.SampleRate = app.SampleRate;
app.ExtVar.ImpedanceTubeFourMic.Mic1a = Ins(:,1);
app.ExtVar.ImpedanceTubeFourMic.Mic2a = Ins(:,2);
app.ExtVar.ImpedanceTubeFourMic.Output1a = Outs;
app.ExtVar.ImpedanceTubeFourMic.Output2a = Outs;

% Plot
FourMicTwoMicPlotDoneZone(app)

% Check
FourMicCheckForCalculate(app)

% Disable measure button
app.ExtUI.FourMicTwoMicAnechoicEndMeasureUpstream.Enable = 'off';

function FourMicTwoMicAnechoicEndMeasureDownstream(~,~,app)
% Parameters
OutCh = app.ExtVar.ImpedanceTubeFourMic.OutputCh;
InCh = [app.ExtVar.ImpedanceTubeFourMic.Mic1Ch,app.ExtVar.ImpedanceTubeFourMic.Mic2Ch];

% Measure
[Outs,Ins] = FourMicTwoMicMeasureSystem(app,OutCh,InCh);

% Store data
app.ExtVar.ImpedanceTubeFourMic.TypeSignal = app.TypeSignal;
app.ExtVar.ImpedanceTubeFourMic.SampleRate = app.SampleRate;
app.ExtVar.ImpedanceTubeFourMic.Mic3a = Ins(:,1);
app.ExtVar.ImpedanceTubeFourMic.Mic4a = Ins(:,2);
app.ExtVar.ImpedanceTubeFourMic.Output3a = Outs;
app.ExtVar.ImpedanceTubeFourMic.Output4a = Outs;

% Plot
FourMicTwoMicPlotDoneZone(app)

% Check
FourMicCheckForCalculate(app)

% Disable measure button
app.ExtUI.FourMicTwoMicAnechoicEndMeasureDownstream.Enable = 'off';

function FourMicTwoMicRigidEndMeasureUpstream(~,~,app)

% Parameters
OutCh = app.ExtVar.ImpedanceTubeFourMic.OutputCh;
InCh = [app.ExtVar.ImpedanceTubeFourMic.Mic1Ch,app.ExtVar.ImpedanceTubeFourMic.Mic2Ch];

% Measure
[Outs,Ins] = FourMicTwoMicMeasureSystem(app,OutCh,InCh);

% Store data
app.ExtVar.ImpedanceTubeFourMic.TypeSignal = app.TypeSignal;
app.ExtVar.ImpedanceTubeFourMic.SampleRate = app.SampleRate;
app.ExtVar.ImpedanceTubeFourMic.Mic1b = Ins(:,1);
app.ExtVar.ImpedanceTubeFourMic.Mic2b = Ins(:,2);
app.ExtVar.ImpedanceTubeFourMic.Output1b = Outs;
app.ExtVar.ImpedanceTubeFourMic.Output2b = Outs;

% Plot
FourMicTwoMicPlotDoneZone(app)

% Check
FourMicCheckForCalculate(app)

% Disable measure button
app.ExtUI.FourMicTwoMicRigidEndMeasureUpstream.Enable = 'off';

function FourMicTwoMicRigidEndMeasureDownstream(~,~,app)

% Parameters
OutCh = app.ExtVar.ImpedanceTubeFourMic.OutputCh;
InCh = [app.ExtVar.ImpedanceTubeFourMic.Mic1Ch,app.ExtVar.ImpedanceTubeFourMic.Mic2Ch];

% Measure
[Outs,Ins] = FourMicTwoMicMeasureSystem(app,OutCh,InCh);

% Store data
app.ExtVar.ImpedanceTubeFourMic.TypeSignal = app.TypeSignal;
app.ExtVar.ImpedanceTubeFourMic.SampleRate = app.SampleRate;
app.ExtVar.ImpedanceTubeFourMic.Mic3b = Ins(:,1);
app.ExtVar.ImpedanceTubeFourMic.Mic4b = Ins(:,2);
app.ExtVar.ImpedanceTubeFourMic.Output3b = Outs;
app.ExtVar.ImpedanceTubeFourMic.Output4b = Outs;

% Plot
FourMicTwoMicPlotDoneZone(app)

% Check
FourMicCheckForCalculate(app)

% Disable measure button
app.ExtUI.FourMicTwoMicRigidEndMeasureDownstream.Enable = 'off';

function FourMicTwoMicAnechoicEndClearMeasureUpstream(~,~,app)
msg = 'Clear measure, are you sure?';
title = 'Clear';
selection = uiconfirm(app.ALabUIFigure,msg,title,...
    'Options',{'Yes','Cancel'},...
    'DefaultOption',2,'CancelOption',2);
if strcmp(selection,'Yes')
    app.ExtVar.ImpedanceTubeFourMic.Mic1a = [];
    app.ExtVar.ImpedanceTubeFourMic.Mic2a = [];
    app.ExtVar.ImpedanceTubeFourMic.Output1a = [];
    app.ExtVar.ImpedanceTubeFourMic.Output2a = [];
    FourMicTwoMicPlotDoneZone(app)
    FourMicCheckForCalculate(app)
    % Enable measure button
    app.ExtUI.FourMicTwoMicAnechoicEndMeasureUpstream.Enable = 'on';
end

function FourMicTwoMicAnechoicEndClearMeasureDownstream(~,~,app)
msg = 'Clear measure, are you sure?';
title = 'Clear';
selection = uiconfirm(app.ALabUIFigure,msg,title,...
    'Options',{'Yes','Cancel'},...
    'DefaultOption',2,'CancelOption',2);
if strcmp(selection,'Yes')
    app.ExtVar.ImpedanceTubeFourMic.Mic3a = [];
    app.ExtVar.ImpedanceTubeFourMic.Mic4a = [];
    app.ExtVar.ImpedanceTubeFourMic.Output3a = [];
    app.ExtVar.ImpedanceTubeFourMic.Output4a = [];
    FourMicTwoMicPlotDoneZone(app)
    FourMicCheckForCalculate(app)
    % Enable measure button
    app.ExtUI.FourMicTwoMicAnechoicEndMeasureDownstream.Enable = 'on';
end

function FourMicTwoMicRigidEndClearMeasureUpstream(~,~,app)
msg = 'Clear measure, are you sure?';
title = 'Clear';
selection = uiconfirm(app.ALabUIFigure,msg,title,...
    'Options',{'Yes','Cancel'},...
    'DefaultOption',2,'CancelOption',2);
if strcmp(selection,'Yes')
    app.ExtVar.ImpedanceTubeFourMic.Mic1b = [];
    app.ExtVar.ImpedanceTubeFourMic.Mic2b = [];
    app.ExtVar.ImpedanceTubeFourMic.Output1b = [];
    app.ExtVar.ImpedanceTubeFourMic.Output2b = [];
    FourMicTwoMicPlotDoneZone(app)
    FourMicCheckForCalculate(app)
    % Enable measure button
    app.ExtUI.FourMicTwoMicRigidEndMeasureUpstream.Enable = 'on';
end

function FourMicTwoMicRigidEndClearMeasureDownstream(~,~,app)
msg = 'Clear measure, are you sure?';
title = 'Clear';
selection = uiconfirm(app.ALabUIFigure,msg,title,...
    'Options',{'Yes','Cancel'},...
    'DefaultOption',2,'CancelOption',2);
if strcmp(selection,'Yes')
    app.ExtVar.ImpedanceTubeFourMic.Mic3b = [];
    app.ExtVar.ImpedanceTubeFourMic.Mic4b = [];
    app.ExtVar.ImpedanceTubeFourMic.Output3b = [];
    app.ExtVar.ImpedanceTubeFourMic.Output4b = [];
    FourMicTwoMicPlotDoneZone(app)
    FourMicCheckForCalculate(app)
    % Enable measure button
    app.ExtUI.FourMicTwoMicRigidEndMeasureDownstream.Enable = 'on';
end

function FourMicTwoMicPlotDoneZone(app)
zones = [];
if ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic1a) && ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic2a)
    zones = [zones,1,2];
    % Disable measure button
    app.ExtUI.FourMicTwoMicAnechoicEndMeasureUpstream.Enable = 'off';
end
if ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic3a) && ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic4a)
    zones = [zones,3,4];
    % Disable measure button
    app.ExtUI.FourMicTwoMicAnechoicEndMeasureDownstream.Enable = 'off';
end
plotTubeFourMicASTM2611(app,app.ExtUI.FourMicTwoMicAnechoicAxes,{'Mic 1';'A'},{'Mic 2';'B'},{'Mic 1';'C'},{'Mic 2';'D'},0,0,0,zones)

if ~app.ExtVar.ImpedanceTubeFourMic.Symmetrical
    zones = [];
    if ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic1b) && ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic2b)
        zones = [zones,1,2];
        % Disable measure button
        app.ExtUI.FourMicTwoMicRigidEndMeasureUpstream.Enable = 'off';
    end
    if ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic3b) && ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic4b)
        zones = [zones,3,4];
        % Disable measure button
        app.ExtUI.FourMicTwoMicRigidEndMeasureDownstream.Enable = 'off';
    end
    plotTubeFourMicASTM2611(app,app.ExtUI.FourMicTwoMicRigidAxes,{'Mic 1';'A'},{'Mic 2';'B'},{'Mic 1';'C'},{'Mic 2';'D'},0,1,0,zones)
end
