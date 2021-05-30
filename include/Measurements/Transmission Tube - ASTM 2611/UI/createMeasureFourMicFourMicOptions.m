function createMeasureFourMicFourMicOptions(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Create FourMicFourMicAnechoicendPanel
app.ExtUI.FourMicFourMicAnechoicendPanel = uipanel(app.ExtUI.GridCenterPanelFourMicTube);
app.ExtUI.FourMicFourMicAnechoicendPanel.TitlePosition = 'centertop';
app.ExtUI.FourMicFourMicAnechoicendPanel.Title = 'Anechoic end';
app.ExtUI.FourMicFourMicAnechoicendPanel.BackgroundColor = [0.9412 0.9412 0.9412];
app.ExtUI.FourMicFourMicAnechoicendPanel.Layout.Row = 2;
app.ExtUI.FourMicFourMicAnechoicendPanel.Layout.Column = 1;
app.ExtUI.FourMicFourMicAnechoicendPanel.FontWeight = 'bold';

% Create FourMicFourMicAnechoicendGrid
app.ExtUI.FourMicFourMicAnechoicendGrid = uigridlayout(app.ExtUI.FourMicFourMicAnechoicendPanel);
app.ExtUI.FourMicFourMicAnechoicendGrid.ColumnWidth = {'fit', 'fit', 'fit', 'fit', '0.2x', '1x'};
app.ExtUI.FourMicFourMicAnechoicendGrid.RowHeight = {'1x', 'fit', 'fit'};
app.ExtUI.FourMicFourMicAnechoicendGrid.BackgroundColor = [1 1 1];

[Nin,~] = getAvailableChannels(app);

% Create InputChannel1Label
app.ExtUI.InputChannel1Label = uilabel(app.ExtUI.FourMicFourMicAnechoicendGrid);
app.ExtUI.InputChannel1Label.BackgroundColor = [1 1 1];
app.ExtUI.InputChannel1Label.HorizontalAlignment = 'right';
app.ExtUI.InputChannel1Label.WordWrap = 'on';
app.ExtUI.InputChannel1Label.Layout.Row = 2;
app.ExtUI.InputChannel1Label.Layout.Column = 1;
app.ExtUI.InputChannel1Label.Text = 'Input Channel 1';

% Create FourMicFourMicAnechoicendMic1
app.ExtUI.FourMicFourMicAnechoicendMic1 = uidropdown(app.ExtUI.FourMicFourMicAnechoicendGrid);
app.ExtUI.FourMicFourMicAnechoicendMic1.ValueChangedFcn = {@FourMicFourMicTubeParameterChanged,app};
app.ExtUI.FourMicFourMicAnechoicendMic1.Items = string(1:Nin);
app.ExtUI.FourMicFourMicAnechoicendMic1.BackgroundColor = [1 1 1];
app.ExtUI.FourMicFourMicAnechoicendMic1.Layout.Row = 2;
app.ExtUI.FourMicFourMicAnechoicendMic1.Layout.Column = 2;
app.ExtUI.FourMicFourMicAnechoicendMic1.Value = '1';
if isempty(app.ExtVar.ImpedanceTubeFourMic.Mic1Ch) || app.ExtVar.ImpedanceTubeFourMic.Mic1Ch > Nin
    app.ExtVar.ImpedanceTubeFourMic.Mic1Ch = str2double(app.ExtUI.FourMicFourMicAnechoicendMic1.Value);
else
    app.ExtUI.FourMicFourMicAnechoicendMic1.Value = num2str(app.ExtVar.ImpedanceTubeFourMic.Mic1Ch,'%d');
end

% Create InputChannel2Label
app.ExtUI.InputChannel2Label = uilabel(app.ExtUI.FourMicFourMicAnechoicendGrid);
app.ExtUI.InputChannel2Label.BackgroundColor = [1 1 1];
app.ExtUI.InputChannel2Label.HorizontalAlignment = 'right';
app.ExtUI.InputChannel2Label.WordWrap = 'on';
app.ExtUI.InputChannel2Label.Layout.Row = 3;
app.ExtUI.InputChannel2Label.Layout.Column = 1;
app.ExtUI.InputChannel2Label.Text = 'Input Channel 2';

% Create FourMicFourMicAnechoicendMic2
app.ExtUI.FourMicFourMicAnechoicendMic2 = uidropdown(app.ExtUI.FourMicFourMicAnechoicendGrid);
app.ExtUI.FourMicFourMicAnechoicendMic2.ValueChangedFcn = {@FourMicFourMicTubeParameterChanged,app};
app.ExtUI.FourMicFourMicAnechoicendMic2.Items = string(1:Nin);
app.ExtUI.FourMicFourMicAnechoicendMic2.BackgroundColor = [1 1 1];
app.ExtUI.FourMicFourMicAnechoicendMic2.Layout.Row = 3;
app.ExtUI.FourMicFourMicAnechoicendMic2.Layout.Column = 2;
if Nin <= 1
    app.ExtUI.FourMicFourMicAnechoicendMic2.Value = '1';
else
    app.ExtUI.FourMicFourMicAnechoicendMic2.Value = '2';
end
if isempty(app.ExtVar.ImpedanceTubeFourMic.Mic2Ch) || app.ExtVar.ImpedanceTubeFourMic.Mic2Ch > Nin
    app.ExtVar.ImpedanceTubeFourMic.Mic2Ch = str2double(app.ExtUI.FourMicFourMicAnechoicendMic2.Value);
else
    app.ExtUI.FourMicFourMicAnechoicendMic2.Value = num2str(app.ExtVar.ImpedanceTubeFourMic.Mic2Ch,'%d');
end

% Create InputChannel3Label
app.ExtUI.InputChannel3Label = uilabel(app.ExtUI.FourMicFourMicAnechoicendGrid);
app.ExtUI.InputChannel3Label.BackgroundColor = [1 1 1];
app.ExtUI.InputChannel3Label.HorizontalAlignment = 'right';
app.ExtUI.InputChannel3Label.WordWrap = 'on';
app.ExtUI.InputChannel3Label.Layout.Row = 2;
app.ExtUI.InputChannel3Label.Layout.Column = 3;
app.ExtUI.InputChannel3Label.Text = 'Input Channel 3';

% Create FourMicFourMicAnechoicendMic3
app.ExtUI.FourMicFourMicAnechoicendMic3 = uidropdown(app.ExtUI.FourMicFourMicAnechoicendGrid);
app.ExtUI.FourMicFourMicAnechoicendMic3.ValueChangedFcn = {@FourMicFourMicTubeParameterChanged,app};
app.ExtUI.FourMicFourMicAnechoicendMic3.Items = string(1:Nin);
app.ExtUI.FourMicFourMicAnechoicendMic3.BackgroundColor = [1 1 1];
app.ExtUI.FourMicFourMicAnechoicendMic3.Layout.Row = 2;
app.ExtUI.FourMicFourMicAnechoicendMic3.Layout.Column = 4;
if Nin <= 2
    app.ExtUI.FourMicFourMicAnechoicendMic3.Value = '1';
else
    app.ExtUI.FourMicFourMicAnechoicendMic3.Value = '3';
end
if isempty(app.ExtVar.ImpedanceTubeFourMic.Mic3Ch) || app.ExtVar.ImpedanceTubeFourMic.Mic3Ch > Nin
    app.ExtVar.ImpedanceTubeFourMic.Mic3Ch = str2double(app.ExtUI.FourMicFourMicAnechoicendMic3.Value);
else
    app.ExtUI.FourMicFourMicAnechoicendMic3.Value = num2str(app.ExtVar.ImpedanceTubeFourMic.Mic3Ch,'%d');
end

% Create InputChannel4Label
app.ExtUI.InputChannel4Label = uilabel(app.ExtUI.FourMicFourMicAnechoicendGrid);
app.ExtUI.InputChannel4Label.BackgroundColor = [1 1 1];
app.ExtUI.InputChannel4Label.HorizontalAlignment = 'right';
app.ExtUI.InputChannel4Label.WordWrap = 'on';
app.ExtUI.InputChannel4Label.Layout.Row = 3;
app.ExtUI.InputChannel4Label.Layout.Column = 3;
app.ExtUI.InputChannel4Label.Text = 'Input Channel 4';

% Create FourMicFourMicAnechoicendMic4
app.ExtUI.FourMicFourMicAnechoicendMic4 = uidropdown(app.ExtUI.FourMicFourMicAnechoicendGrid);
app.ExtUI.FourMicFourMicAnechoicendMic4.ValueChangedFcn = {@FourMicFourMicTubeParameterChanged,app};
app.ExtUI.FourMicFourMicAnechoicendMic4.Items = string(1:Nin);
app.ExtUI.FourMicFourMicAnechoicendMic4.BackgroundColor = [1 1 1];
app.ExtUI.FourMicFourMicAnechoicendMic4.Layout.Row = 3;
app.ExtUI.FourMicFourMicAnechoicendMic4.Layout.Column = 4;
if Nin <= 3
    app.ExtUI.FourMicFourMicAnechoicendMic4.Value = '1';
else
    app.ExtUI.FourMicFourMicAnechoicendMic4.Value = '4';
end
if isempty(app.ExtVar.ImpedanceTubeFourMic.Mic4Ch) || app.ExtVar.ImpedanceTubeFourMic.Mic4Ch > Nin
    app.ExtVar.ImpedanceTubeFourMic.Mic4Ch = str2double(app.ExtUI.FourMicFourMicAnechoicendMic4.Value);
else
    app.ExtUI.FourMicFourMicAnechoicendMic4.Value = num2str(app.ExtVar.ImpedanceTubeFourMic.Mic4Ch,'%d');
end

% Create FourMicFourMicAnechoicendMeasure
app.ExtUI.FourMicFourMicAnechoicendMeasure = uibutton(app.ExtUI.FourMicFourMicAnechoicendGrid, 'push');
app.ExtUI.FourMicFourMicAnechoicendMeasure.BackgroundColor = [1 1 1];
app.ExtUI.FourMicFourMicAnechoicendMeasure.FontWeight = 'bold';
app.ExtUI.FourMicFourMicAnechoicendMeasure.Layout.Row = 3;
app.ExtUI.FourMicFourMicAnechoicendMeasure.Layout.Column = 6;
app.ExtUI.FourMicFourMicAnechoicendMeasure.Text = 'Measure';
app.ExtUI.FourMicFourMicAnechoicendMeasure.ButtonPushedFcn = {@FourMicFourMicAnechoicEndMeasure,app};

% Create FourMicFourMicAnechoicendClearMeasure
app.ExtUI.FourMicFourMicAnechoicendClearMeasure = uibutton(app.ExtUI.FourMicFourMicAnechoicendGrid, 'push');
app.ExtUI.FourMicFourMicAnechoicendClearMeasure.BackgroundColor = [0.651 0.651 0.651];
app.ExtUI.FourMicFourMicAnechoicendClearMeasure.FontWeight = 'bold';
app.ExtUI.FourMicFourMicAnechoicendClearMeasure.FontColor = [1 1 1];
app.ExtUI.FourMicFourMicAnechoicendClearMeasure.Layout.Row = 2;
app.ExtUI.FourMicFourMicAnechoicendClearMeasure.Layout.Column = 6;
app.ExtUI.FourMicFourMicAnechoicendClearMeasure.Text = 'Clear measure';
app.ExtUI.FourMicFourMicAnechoicendClearMeasure.ButtonPushedFcn = {@FourMicFourMicAnechoicEndClearMeasure,app};

% Create FourMicFourMicAnechoicAxes
app.ExtUI.FourMicFourMicAnechoicAxes = uiaxes(app.ExtUI.FourMicFourMicAnechoicendGrid);
app.ExtUI.FourMicFourMicAnechoicAxes.Layout.Row = 1;
app.ExtUI.FourMicFourMicAnechoicAxes.Layout.Column = [1 6];

% Create FourMicFourMicRigidendPanel
if isfield(app.ExtUI,'FourMicFourMicRigidendPanel')
    delete(findobj(app.ExtUI.GridCenterPanelFourMicTube.Children,'Title','Rigid end'))
end

app.ExtUI.FourMicFourMicRigidendPanel = uipanel(app.ExtUI.GridCenterPanelFourMicTube);
app.ExtUI.FourMicFourMicRigidendPanel.TitlePosition = 'centertop';
app.ExtUI.FourMicFourMicRigidendPanel.Visible = 'off';
app.ExtUI.FourMicFourMicRigidendPanel.Title = 'Rigid end';
app.ExtUI.FourMicFourMicRigidendPanel.BackgroundColor = [0.9412 0.9412 0.9412];
app.ExtUI.FourMicFourMicRigidendPanel.Layout.Row = 3;
app.ExtUI.FourMicFourMicRigidendPanel.Layout.Column = 1;
app.ExtUI.FourMicFourMicRigidendPanel.FontWeight = 'bold';
if ~isempty(app.ExtVar.ImpedanceTubeFourMic.Symmetrical)
    if ~app.ExtVar.ImpedanceTubeFourMic.Symmetrical
        app.ExtUI.FourMicFourMicRigidendPanel.Visible = 'on';
    end
else
    app.ExtVar.ImpedanceTubeFourMic.Symmetrical = true;
end

% Create FourMicFourMicRigidendGrid
app.ExtUI.FourMicFourMicRigidendGrid = uigridlayout(app.ExtUI.FourMicFourMicRigidendPanel);
app.ExtUI.FourMicFourMicRigidendGrid.ColumnWidth = {'fit', 'fit', 'fit', 'fit', '0.2x', '1x'};
app.ExtUI.FourMicFourMicRigidendGrid.RowHeight = {'1x', 'fit', 'fit'};
app.ExtUI.FourMicFourMicRigidendGrid.BackgroundColor = [1 1 1];

% Create InputChannel1Label_2
app.ExtUI.InputChannel1Label_2 = uilabel(app.ExtUI.FourMicFourMicRigidendGrid);
app.ExtUI.InputChannel1Label_2.BackgroundColor = [1 1 1];
app.ExtUI.InputChannel1Label_2.HorizontalAlignment = 'right';
app.ExtUI.InputChannel1Label_2.WordWrap = 'on';
app.ExtUI.InputChannel1Label_2.Layout.Row = 2;
app.ExtUI.InputChannel1Label_2.Layout.Column = 1;
app.ExtUI.InputChannel1Label_2.Text = 'Input Channel 1';

% Create FourMicFourMicRigidendMic1
app.ExtUI.FourMicFourMicRigidendMic1 = uidropdown(app.ExtUI.FourMicFourMicRigidendGrid);
app.ExtUI.FourMicFourMicRigidendMic1.Items = string(1:Nin);
app.ExtUI.FourMicFourMicRigidendMic1.Enable = 'off';
app.ExtUI.FourMicFourMicRigidendMic1.BackgroundColor = [1 1 1];
app.ExtUI.FourMicFourMicRigidendMic1.Layout.Row = 2;
app.ExtUI.FourMicFourMicRigidendMic1.Layout.Column = 2;
app.ExtUI.FourMicFourMicRigidendMic1.Value = app.ExtUI.FourMicFourMicAnechoicendMic1.Value;

% Create InputChannel2Label_2
app.ExtUI.InputChannel2Label_2 = uilabel(app.ExtUI.FourMicFourMicRigidendGrid);
app.ExtUI.InputChannel2Label_2.BackgroundColor = [1 1 1];
app.ExtUI.InputChannel2Label_2.HorizontalAlignment = 'right';
app.ExtUI.InputChannel2Label_2.WordWrap = 'on';
app.ExtUI.InputChannel2Label_2.Layout.Row = 3;
app.ExtUI.InputChannel2Label_2.Layout.Column = 1;
app.ExtUI.InputChannel2Label_2.Text = 'Input Channel 2';

% Create FourMicFourMicRigidendMic2
app.ExtUI.FourMicFourMicRigidendMic2 = uidropdown(app.ExtUI.FourMicFourMicRigidendGrid);
app.ExtUI.FourMicFourMicRigidendMic2.Items = string(1:Nin);
app.ExtUI.FourMicFourMicRigidendMic2.Enable = 'off';
app.ExtUI.FourMicFourMicRigidendMic2.BackgroundColor = [1 1 1];
app.ExtUI.FourMicFourMicRigidendMic2.Layout.Row = 3;
app.ExtUI.FourMicFourMicRigidendMic2.Layout.Column = 2;
app.ExtUI.FourMicFourMicRigidendMic2.Value = app.ExtUI.FourMicFourMicAnechoicendMic2.Value;

% Create InputChannel3Label_2
app.ExtUI.InputChannel3Label_2 = uilabel(app.ExtUI.FourMicFourMicRigidendGrid);
app.ExtUI.InputChannel3Label_2.BackgroundColor = [1 1 1];
app.ExtUI.InputChannel3Label_2.HorizontalAlignment = 'right';
app.ExtUI.InputChannel3Label_2.WordWrap = 'on';
app.ExtUI.InputChannel3Label_2.Layout.Row = 2;
app.ExtUI.InputChannel3Label_2.Layout.Column = 3;
app.ExtUI.InputChannel3Label_2.Text = 'Input Channel 3';

% Create FourMicFourMicRigidendMic3
app.ExtUI.FourMicFourMicRigidendMic3 = uidropdown(app.ExtUI.FourMicFourMicRigidendGrid);
app.ExtUI.FourMicFourMicRigidendMic3.Items = string(1:Nin);
app.ExtUI.FourMicFourMicRigidendMic3.Enable = 'off';
app.ExtUI.FourMicFourMicRigidendMic3.BackgroundColor = [1 1 1];
app.ExtUI.FourMicFourMicRigidendMic3.Layout.Row = 2;
app.ExtUI.FourMicFourMicRigidendMic3.Layout.Column = 4;
app.ExtUI.FourMicFourMicRigidendMic3.Value = app.ExtUI.FourMicFourMicAnechoicendMic3.Value;

% Create InputChannel4Label_2
app.ExtUI.InputChannel4Label_2 = uilabel(app.ExtUI.FourMicFourMicRigidendGrid);
app.ExtUI.InputChannel4Label_2.BackgroundColor = [1 1 1];
app.ExtUI.InputChannel4Label_2.HorizontalAlignment = 'right';
app.ExtUI.InputChannel4Label_2.WordWrap = 'on';
app.ExtUI.InputChannel4Label_2.Layout.Row = 3;
app.ExtUI.InputChannel4Label_2.Layout.Column = 3;
app.ExtUI.InputChannel4Label_2.Text = 'Input Channel 4';

% Create FourMicFourMicRigidendMic4
app.ExtUI.FourMicFourMicRigidendMic4 = uidropdown(app.ExtUI.FourMicFourMicRigidendGrid);
app.ExtUI.FourMicFourMicRigidendMic4.Items = string(1:Nin);
app.ExtUI.FourMicFourMicRigidendMic4.Enable = 'off';
app.ExtUI.FourMicFourMicRigidendMic4.BackgroundColor = [1 1 1];
app.ExtUI.FourMicFourMicRigidendMic4.Layout.Row = 3;
app.ExtUI.FourMicFourMicRigidendMic4.Layout.Column = 4;
app.ExtUI.FourMicFourMicRigidendMic4.Value = app.ExtUI.FourMicFourMicAnechoicendMic4.Value;

% Create FourMicFourMicRigidendMeasure
app.ExtUI.FourMicFourMicRigidendMeasure = uibutton(app.ExtUI.FourMicFourMicRigidendGrid, 'push');
app.ExtUI.FourMicFourMicRigidendMeasure.BackgroundColor = [1 1 1];
app.ExtUI.FourMicFourMicRigidendMeasure.FontWeight = 'bold';
app.ExtUI.FourMicFourMicRigidendMeasure.Layout.Row = 3;
app.ExtUI.FourMicFourMicRigidendMeasure.Layout.Column = 6;
app.ExtUI.FourMicFourMicRigidendMeasure.Text = 'Measure';
app.ExtUI.FourMicFourMicRigidendMeasure.ButtonPushedFcn = {@FourMicFourMicRigidEndMeasure,app};

% Create FourMicFourMicRigidendClearMeasure
app.ExtUI.FourMicFourMicRigidendClearMeasure = uibutton(app.ExtUI.FourMicFourMicRigidendGrid, 'push');
app.ExtUI.FourMicFourMicRigidendClearMeasure.BackgroundColor = [0.651 0.651 0.651];
app.ExtUI.FourMicFourMicRigidendClearMeasure.FontWeight = 'bold';
app.ExtUI.FourMicFourMicRigidendClearMeasure.FontColor = [1 1 1];
app.ExtUI.FourMicFourMicRigidendClearMeasure.Layout.Row = 2;
app.ExtUI.FourMicFourMicRigidendClearMeasure.Layout.Column = 6;
app.ExtUI.FourMicFourMicRigidendClearMeasure.Text = 'Clear measure';
app.ExtUI.FourMicFourMicRigidendClearMeasure.ButtonPushedFcn = {@FourMicFourMicRigidEndClearMeasure,app};

% Create FourMicFourMicRigidAxes
app.ExtUI.FourMicFourMicRigidAxes = uiaxes(app.ExtUI.FourMicFourMicRigidendGrid);
app.ExtUI.FourMicFourMicRigidAxes.Layout.Row = 1;
app.ExtUI.FourMicFourMicRigidAxes.Layout.Column = [1 6];

% Plot tubes
aux = app.ExtVar.ImpedanceTubeFourMic.Symmetrical;
app.ExtVar.ImpedanceTubeFourMic.Symmetrical = false;
FourMicFourMicPlotDoneZone(app)
app.ExtVar.ImpedanceTubeFourMic.Symmetrical = aux;


function FourMicFourMicTubeParameterChanged(~,~,app)
app.ExtVar.ImpedanceTubeFourMic.Mic1Ch = str2double(app.ExtUI.FourMicFourMicAnechoicendMic1.Value);
app.ExtVar.ImpedanceTubeFourMic.Mic2Ch = str2double(app.ExtUI.FourMicFourMicAnechoicendMic2.Value);
app.ExtVar.ImpedanceTubeFourMic.Mic3Ch = str2double(app.ExtUI.FourMicFourMicAnechoicendMic3.Value);
app.ExtVar.ImpedanceTubeFourMic.Mic4Ch = str2double(app.ExtUI.FourMicFourMicAnechoicendMic4.Value);
app.ExtUI.FourMicFourMicRigidendMic1.Value = app.ExtUI.FourMicFourMicAnechoicendMic1.Value;
app.ExtUI.FourMicFourMicRigidendMic2.Value = app.ExtUI.FourMicFourMicAnechoicendMic2.Value;
app.ExtUI.FourMicFourMicRigidendMic3.Value = app.ExtUI.FourMicFourMicAnechoicendMic3.Value;
app.ExtUI.FourMicFourMicRigidendMic4.Value = app.ExtUI.FourMicFourMicAnechoicendMic4.Value;

function [Outs,Ins] = FourMicFourMicMeasureSystem(app,OutCh,InCh)
% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Measuring...',...
    'Indeterminate','on');

% Refresh devices
audiodevreset;

% Generate signal
[app.ExtVar.ImpedanceTubeFourMic.Output,~] = signalGenerator(app);

% Measure
num = app.Averages;
for i=4:4:num*4
    [Outs,Ins(:,[i-3,i-2,i-1,i])] = audioOutIn(app,app.ExtVar.ImpedanceTubeFourMic.Output,OutCh,InCh,1);
end
InsCH1 = Ins(:,1:4:end);
InsCH2 = Ins(:,2:4:end);
InsCH3 = Ins(:,3:4:end);
InsCH4 = Ins(:,4:4:end);
Ins = [mean(InsCH1,2),mean(InsCH2,2),mean(InsCH3,2),mean(InsCH4,2)];

close(d)

function FourMicFourMicAnechoicEndMeasure(~,~,app)

% Parameters
OutCh = app.ExtVar.ImpedanceTubeFourMic.OutputCh;
InCh = [app.ExtVar.ImpedanceTubeFourMic.Mic1Ch,app.ExtVar.ImpedanceTubeFourMic.Mic2Ch,...
    app.ExtVar.ImpedanceTubeFourMic.Mic3Ch,app.ExtVar.ImpedanceTubeFourMic.Mic4Ch];

% Measure
[Outs,Ins] = FourMicFourMicMeasureSystem(app,OutCh,InCh);

% Store data
app.ExtVar.ImpedanceTubeFourMic.TypeSignal = app.TypeSignal;
app.ExtVar.ImpedanceTubeFourMic.SampleRate = app.SampleRate;
app.ExtVar.ImpedanceTubeFourMic.Mic1a = Ins(:,1);
app.ExtVar.ImpedanceTubeFourMic.Mic2a = Ins(:,2);
app.ExtVar.ImpedanceTubeFourMic.Mic3a = Ins(:,3);
app.ExtVar.ImpedanceTubeFourMic.Mic4a = Ins(:,4);
app.ExtVar.ImpedanceTubeFourMic.Output1a = Outs;
app.ExtVar.ImpedanceTubeFourMic.Output2a = Outs;
app.ExtVar.ImpedanceTubeFourMic.Output3a = Outs;
app.ExtVar.ImpedanceTubeFourMic.Output4a = Outs;

% Plot
FourMicFourMicPlotDoneZone(app)

% Check
FourMicCheckForCalculate(app)

% Disable measure button
app.ExtUI.FourMicFourMicAnechoicendMeasure.Enable = 'off';

function FourMicFourMicRigidEndMeasure(~,~,app)

% Parameters
OutCh = app.ExtVar.ImpedanceTubeFourMic.OutputCh;
InCh = [app.ExtVar.ImpedanceTubeFourMic.Mic1Ch,app.ExtVar.ImpedanceTubeFourMic.Mic2Ch,...
    app.ExtVar.ImpedanceTubeFourMic.Mic3Ch,app.ExtVar.ImpedanceTubeFourMic.Mic4Ch];

% Measure
[Outs,Ins] = FourMicFourMicMeasureSystem(app,OutCh,InCh);

% Store data
app.ExtVar.ImpedanceTubeFourMic.TypeSignal = app.TypeSignal;
app.ExtVar.ImpedanceTubeFourMic.SampleRate = app.SampleRate;
app.ExtVar.ImpedanceTubeFourMic.Mic1b = Ins(:,1);
app.ExtVar.ImpedanceTubeFourMic.Mic2b = Ins(:,2);
app.ExtVar.ImpedanceTubeFourMic.Mic3b = Ins(:,3);
app.ExtVar.ImpedanceTubeFourMic.Mic4b = Ins(:,4);
app.ExtVar.ImpedanceTubeFourMic.Output1b = Outs;
app.ExtVar.ImpedanceTubeFourMic.Output2b = Outs;
app.ExtVar.ImpedanceTubeFourMic.Output3b = Outs;
app.ExtVar.ImpedanceTubeFourMic.Output4b = Outs;

% Plot
FourMicFourMicPlotDoneZone(app)

% Check
FourMicCheckForCalculate(app)

% Disable measure button
app.ExtUI.FourMicFourMicRigidendMeasure.Enable = 'off';

function FourMicFourMicAnechoicEndClearMeasure(~,~,app)
msg = 'Clear measure, are you sure?';
title = 'Clear';
selection = uiconfirm(app.ALabUIFigure,msg,title,...
    'Options',{'Yes','Cancel'},...
    'DefaultOption',2,'CancelOption',2);
if strcmp(selection,'Yes')
    app.ExtVar.ImpedanceTubeFourMic.Mic1a = [];
    app.ExtVar.ImpedanceTubeFourMic.Mic2a = [];
    app.ExtVar.ImpedanceTubeFourMic.Mic3a = [];
    app.ExtVar.ImpedanceTubeFourMic.Mic4a = [];
    app.ExtVar.ImpedanceTubeFourMic.Output1a = [];
    app.ExtVar.ImpedanceTubeFourMic.Output2a = [];
    app.ExtVar.ImpedanceTubeFourMic.Output3a = [];
    app.ExtVar.ImpedanceTubeFourMic.Output4a = [];
    FourMicFourMicPlotDoneZone(app)
    FourMicCheckForCalculate(app)
    % Enable measure button
    app.ExtUI.FourMicFourMicAnechoicendMeasure.Enable = 'on';
end

function FourMicFourMicRigidEndClearMeasure(~,~,app)
msg = 'Clear measure, are you sure?';
title = 'Clear';
selection = uiconfirm(app.ALabUIFigure,msg,title,...
    'Options',{'Yes','Cancel'},...
    'DefaultOption',2,'CancelOption',2);
if strcmp(selection,'Yes')
    app.ExtVar.ImpedanceTubeFourMic.Mic1b = [];
    app.ExtVar.ImpedanceTubeFourMic.Mic2b = [];
    app.ExtVar.ImpedanceTubeFourMic.Mic3b = [];
    app.ExtVar.ImpedanceTubeFourMic.Mic4b = [];
    app.ExtVar.ImpedanceTubeFourMic.Output1b = [];
    app.ExtVar.ImpedanceTubeFourMic.Output2b = [];
    app.ExtVar.ImpedanceTubeFourMic.Output3b = [];
    app.ExtVar.ImpedanceTubeFourMic.Output4b = [];
    FourMicFourMicPlotDoneZone(app)
    FourMicCheckForCalculate(app)
    % Enable measure button
    app.ExtUI.FourMicFourMicRigidendMeasure.Enable = 'on';
end

function FourMicFourMicPlotDoneZone(app)
if ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic1a) && ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic2a) ...
        && ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic3a) && ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic4a)
    zones = [1,2,3,4];
    % Disable measure button
    app.ExtUI.FourMicFourMicAnechoicendMeasure.Enable = 'off';
else
    zones = [];
end
plotTubeFourMicASTM2611(app,app.ExtUI.FourMicFourMicAnechoicAxes,{'Mic';'1'},{'Mic';'2'},{'Mic';'3'},{'Mic';'4'},0,0,0,zones)

if ~app.ExtVar.ImpedanceTubeFourMic.Symmetrical
    if ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic1b) && ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic2b) ...
            && ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic3b) && ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic4b)
        zones = [1,2,3,4];
        % Disable measure button
        app.ExtUI.FourMicFourMicRigidendMeasure.Enable = 'off';
    else
        zones = [];
    end
    plotTubeFourMicASTM2611(app,app.ExtUI.FourMicFourMicRigidAxes,{'Mic';'1'},{'Mic';'2'},{'Mic';'3'},{'Mic';'4'},0,1,0,zones)
end
