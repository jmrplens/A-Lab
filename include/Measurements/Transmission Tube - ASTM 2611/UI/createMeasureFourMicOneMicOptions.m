function createMeasureFourMicOneMicOptions(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Create FourMicOneMicAnechoicendPanel
app.ExtUI.FourMicOneMicAnechoicendPanel = uipanel(app.ExtUI.GridCenterPanelFourMicTube);
app.ExtUI.FourMicOneMicAnechoicendPanel.TitlePosition = 'centertop';
app.ExtUI.FourMicOneMicAnechoicendPanel.Title = 'Anechoic end';
app.ExtUI.FourMicOneMicAnechoicendPanel.BackgroundColor = [0.9412 0.9412 0.9412];
app.ExtUI.FourMicOneMicAnechoicendPanel.Layout.Row = 2;
app.ExtUI.FourMicOneMicAnechoicendPanel.Layout.Column = 1;
app.ExtUI.FourMicOneMicAnechoicendPanel.FontWeight = 'bold';

% Create FourMicOneMicAnechoicendGrid
app.ExtUI.FourMicOneMicAnechoicendGrid = uigridlayout(app.ExtUI.FourMicOneMicAnechoicendPanel);
app.ExtUI.FourMicOneMicAnechoicendGrid.ColumnWidth = {'1x', '1x', '1x', '1x'};
app.ExtUI.FourMicOneMicAnechoicendGrid.RowHeight = {'1x', 'fit', 'fit'};
app.ExtUI.FourMicOneMicAnechoicendGrid.BackgroundColor = [1 1 1];

% Create FourMicOneMicAnechoicEndMeasureA
app.ExtUI.FourMicOneMicAnechoicEndMeasureA = uibutton(app.ExtUI.FourMicOneMicAnechoicendGrid, 'push');
app.ExtUI.FourMicOneMicAnechoicEndMeasureA.BackgroundColor = [1 1 1];
app.ExtUI.FourMicOneMicAnechoicEndMeasureA.FontWeight = 'bold';
app.ExtUI.FourMicOneMicAnechoicEndMeasureA.Layout.Row = 3;
app.ExtUI.FourMicOneMicAnechoicEndMeasureA.Layout.Column = 1;
app.ExtUI.FourMicOneMicAnechoicEndMeasureA.Text = 'Measure [A]';
app.ExtUI.FourMicOneMicAnechoicEndMeasureA.ButtonPushedFcn = {@FourMicOneMicAnechoicEndMeasureA,app};

% Create FourMicOneMicAnechoicEndMeasureB
app.ExtUI.FourMicOneMicAnechoicEndMeasureB = uibutton(app.ExtUI.FourMicOneMicAnechoicendGrid, 'push');
app.ExtUI.FourMicOneMicAnechoicEndMeasureB.BackgroundColor = [1 1 1];
app.ExtUI.FourMicOneMicAnechoicEndMeasureB.FontWeight = 'bold';
app.ExtUI.FourMicOneMicAnechoicEndMeasureB.Layout.Row = 3;
app.ExtUI.FourMicOneMicAnechoicEndMeasureB.Layout.Column = 2;
app.ExtUI.FourMicOneMicAnechoicEndMeasureB.Text = 'Measure [B]';
app.ExtUI.FourMicOneMicAnechoicEndMeasureB.ButtonPushedFcn = {@FourMicOneMicAnechoicEndMeasureB,app};

% Create FourMicOneMicAnechoicEndMeasureC
app.ExtUI.FourMicOneMicAnechoicEndMeasureC = uibutton(app.ExtUI.FourMicOneMicAnechoicendGrid, 'push');
app.ExtUI.FourMicOneMicAnechoicEndMeasureC.BackgroundColor = [1 1 1];
app.ExtUI.FourMicOneMicAnechoicEndMeasureC.FontWeight = 'bold';
app.ExtUI.FourMicOneMicAnechoicEndMeasureC.Layout.Row = 3;
app.ExtUI.FourMicOneMicAnechoicEndMeasureC.Layout.Column = 3;
app.ExtUI.FourMicOneMicAnechoicEndMeasureC.Text = 'Measure [C]';
app.ExtUI.FourMicOneMicAnechoicEndMeasureC.ButtonPushedFcn = {@FourMicOneMicAnechoicEndMeasureC,app};

% Create FourMicOneMicAnechoicEndMeasureD
app.ExtUI.FourMicOneMicAnechoicEndMeasureD = uibutton(app.ExtUI.FourMicOneMicAnechoicendGrid, 'push');
app.ExtUI.FourMicOneMicAnechoicEndMeasureD.BackgroundColor = [1 1 1];
app.ExtUI.FourMicOneMicAnechoicEndMeasureD.FontWeight = 'bold';
app.ExtUI.FourMicOneMicAnechoicEndMeasureD.Layout.Row = 3;
app.ExtUI.FourMicOneMicAnechoicEndMeasureD.Layout.Column = 4;
app.ExtUI.FourMicOneMicAnechoicEndMeasureD.Text = 'Measure [D]';
app.ExtUI.FourMicOneMicAnechoicEndMeasureD.ButtonPushedFcn = {@FourMicOneMicAnechoicEndMeasureD,app};

% Create FourMicOneMicAnechoicEndClearMeasureA
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureA = uibutton(app.ExtUI.FourMicOneMicAnechoicendGrid, 'push');
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureA.BackgroundColor = [0.651 0.651 0.651];
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureA.FontWeight = 'bold';
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureA.FontColor = [1 1 1];
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureA.Layout.Row = 2;
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureA.Layout.Column = 1;
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureA.Text = 'Clear measure';
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureA.ButtonPushedFcn = {@FourMicOneMicAnechoicEndClearMeasureA,app};

% Create FourMicOneMicAnechoicEndClearMeasureB
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureB = uibutton(app.ExtUI.FourMicOneMicAnechoicendGrid, 'push');
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureB.BackgroundColor = [0.651 0.651 0.651];
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureB.FontWeight = 'bold';
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureB.FontColor = [1 1 1];
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureB.Layout.Row = 2;
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureB.Layout.Column = 2;
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureB.Text = 'Clear measure';
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureB.ButtonPushedFcn = {@FourMicOneMicAnechoicEndClearMeasureB,app};

% Create FourMicOneMicAnechoicEndClearMeasureC
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureC = uibutton(app.ExtUI.FourMicOneMicAnechoicendGrid, 'push');
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureC.BackgroundColor = [0.651 0.651 0.651];
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureC.FontWeight = 'bold';
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureC.FontColor = [1 1 1];
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureC.Layout.Row = 2;
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureC.Layout.Column = 3;
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureC.Text = 'Clear measure';
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureC.ButtonPushedFcn = {@FourMicOneMicAnechoicEndClearMeasureC,app};

% Create FourMicOneMicAnechoicEndClearMeasureD
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureD = uibutton(app.ExtUI.FourMicOneMicAnechoicendGrid, 'push');
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureD.BackgroundColor = [0.651 0.651 0.651];
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureD.FontWeight = 'bold';
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureD.FontColor = [1 1 1];
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureD.Layout.Row = 2;
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureD.Layout.Column = 4;
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureD.Text = 'Clear measure';
app.ExtUI.FourMicOneMicAnechoicEndClearMeasureD.ButtonPushedFcn = {@FourMicOneMicAnechoicEndClearMeasureD,app};

% Create FourMicOneMicAnechoicAxes
app.ExtUI.FourMicOneMicAnechoicAxes = uiaxes(app.ExtUI.FourMicOneMicAnechoicendGrid);
app.ExtUI.FourMicOneMicAnechoicAxes.Layout.Row = 1;
app.ExtUI.FourMicOneMicAnechoicAxes.Layout.Column = [1 4];

% Create FourMicOneMicRigidendPanel
if isfield(app.ExtUI,'FourMicOneMicRigidendPanel')
    delete(findobj(app.ExtUI.GridCenterPanelFourMicTube.Children,'Title','Rigid end'))
end

app.ExtUI.FourMicOneMicRigidendPanel = uipanel(app.ExtUI.GridCenterPanelFourMicTube);
app.ExtUI.FourMicOneMicRigidendPanel.Visible = 'off';
app.ExtUI.FourMicOneMicRigidendPanel.TitlePosition = 'centertop';
app.ExtUI.FourMicOneMicRigidendPanel.Title = 'Rigid end';
app.ExtUI.FourMicOneMicRigidendPanel.BackgroundColor = [0.9412 0.9412 0.9412];
app.ExtUI.FourMicOneMicRigidendPanel.Layout.Row = 3;
app.ExtUI.FourMicOneMicRigidendPanel.Layout.Column = 1;
app.ExtUI.FourMicOneMicRigidendPanel.FontWeight = 'bold';

if ~isempty(app.ExtVar.ImpedanceTubeFourMic.Symmetrical)
    if ~app.ExtVar.ImpedanceTubeFourMic.Symmetrical
        app.ExtUI.FourMicOneMicRigidendPanel.Visible = 'on';
    end
else
    app.ExtVar.ImpedanceTubeFourMic.Symmetrical = true;
end

% Create FourMicOneMicRigidendGrid
app.ExtUI.FourMicOneMicRigidendGrid = uigridlayout(app.ExtUI.FourMicOneMicRigidendPanel);
app.ExtUI.FourMicOneMicRigidendGrid.ColumnWidth = {'1x', '1x', '1x', '1x'};
app.ExtUI.FourMicOneMicRigidendGrid.RowHeight = {'1x', 'fit', 'fit'};
app.ExtUI.FourMicOneMicRigidendGrid.BackgroundColor = [1 1 1];

% Create FourMicOneMicRigidEndMeasureA
app.ExtUI.FourMicOneMicRigidEndMeasureA = uibutton(app.ExtUI.FourMicOneMicRigidendGrid, 'push');
app.ExtUI.FourMicOneMicRigidEndMeasureA.BackgroundColor = [1 1 1];
app.ExtUI.FourMicOneMicRigidEndMeasureA.FontWeight = 'bold';
app.ExtUI.FourMicOneMicRigidEndMeasureA.Layout.Row = 3;
app.ExtUI.FourMicOneMicRigidEndMeasureA.Layout.Column = 1;
app.ExtUI.FourMicOneMicRigidEndMeasureA.Text = 'Measure [A]';
app.ExtUI.FourMicOneMicRigidEndMeasureA.ButtonPushedFcn = {@FourMicOneMicRigidEndMeasureA,app};

% Create FourMicOneMicRigidEndMeasureB
app.ExtUI.FourMicOneMicRigidEndMeasureB = uibutton(app.ExtUI.FourMicOneMicRigidendGrid, 'push');
app.ExtUI.FourMicOneMicRigidEndMeasureB.BackgroundColor = [1 1 1];
app.ExtUI.FourMicOneMicRigidEndMeasureB.FontWeight = 'bold';
app.ExtUI.FourMicOneMicRigidEndMeasureB.Layout.Row = 3;
app.ExtUI.FourMicOneMicRigidEndMeasureB.Layout.Column = 2;
app.ExtUI.FourMicOneMicRigidEndMeasureB.Text = 'Measure [B]';
app.ExtUI.FourMicOneMicRigidEndMeasureB.ButtonPushedFcn = {@FourMicOneMicRigidEndMeasureB,app};

% Create FourMicOneMicRigidEndMeasureC
app.ExtUI.FourMicOneMicRigidEndMeasureC = uibutton(app.ExtUI.FourMicOneMicRigidendGrid, 'push');
app.ExtUI.FourMicOneMicRigidEndMeasureC.BackgroundColor = [1 1 1];
app.ExtUI.FourMicOneMicRigidEndMeasureC.FontWeight = 'bold';
app.ExtUI.FourMicOneMicRigidEndMeasureC.Layout.Row = 3;
app.ExtUI.FourMicOneMicRigidEndMeasureC.Layout.Column = 3;
app.ExtUI.FourMicOneMicRigidEndMeasureC.Text = 'Measure [C]';
app.ExtUI.FourMicOneMicRigidEndMeasureC.ButtonPushedFcn = {@FourMicOneMicRigidEndMeasureC,app};

% Create FourMicOneMicRigidEndMeasureD
app.ExtUI.FourMicOneMicRigidEndMeasureD = uibutton(app.ExtUI.FourMicOneMicRigidendGrid, 'push');
app.ExtUI.FourMicOneMicRigidEndMeasureD.BackgroundColor = [1 1 1];
app.ExtUI.FourMicOneMicRigidEndMeasureD.FontWeight = 'bold';
app.ExtUI.FourMicOneMicRigidEndMeasureD.Layout.Row = 3;
app.ExtUI.FourMicOneMicRigidEndMeasureD.Layout.Column = 4;
app.ExtUI.FourMicOneMicRigidEndMeasureD.Text = 'Measure [D]';
app.ExtUI.FourMicOneMicRigidEndMeasureD.ButtonPushedFcn = {@FourMicOneMicRigidEndMeasureD,app};

% Create FourMicOneMicRigidEndClearMeasureA
app.ExtUI.FourMicOneMicRigidEndClearMeasureA = uibutton(app.ExtUI.FourMicOneMicRigidendGrid, 'push');
app.ExtUI.FourMicOneMicRigidEndClearMeasureA.BackgroundColor = [0.651 0.651 0.651];
app.ExtUI.FourMicOneMicRigidEndClearMeasureA.FontWeight = 'bold';
app.ExtUI.FourMicOneMicRigidEndClearMeasureA.FontColor = [1 1 1];
app.ExtUI.FourMicOneMicRigidEndClearMeasureA.Layout.Row = 2;
app.ExtUI.FourMicOneMicRigidEndClearMeasureA.Layout.Column = 1;
app.ExtUI.FourMicOneMicRigidEndClearMeasureA.Text = 'Clear measure';
app.ExtUI.FourMicOneMicRigidEndClearMeasureA.ButtonPushedFcn = {@FourMicOneMicRigidEndClearMeasureA,app};

% Create FourMicOneMicRigidEndClearMeasureB
app.ExtUI.FourMicOneMicRigidEndClearMeasureB = uibutton(app.ExtUI.FourMicOneMicRigidendGrid, 'push');
app.ExtUI.FourMicOneMicRigidEndClearMeasureB.BackgroundColor = [0.651 0.651 0.651];
app.ExtUI.FourMicOneMicRigidEndClearMeasureB.FontWeight = 'bold';
app.ExtUI.FourMicOneMicRigidEndClearMeasureB.FontColor = [1 1 1];
app.ExtUI.FourMicOneMicRigidEndClearMeasureB.Layout.Row = 2;
app.ExtUI.FourMicOneMicRigidEndClearMeasureB.Layout.Column = 2;
app.ExtUI.FourMicOneMicRigidEndClearMeasureB.Text = 'Clear measure';
app.ExtUI.FourMicOneMicRigidEndClearMeasureB.ButtonPushedFcn = {@FourMicOneMicRigidEndClearMeasureB,app};

% Create FourMicOneMicRigidEndClearMeasureC
app.ExtUI.FourMicOneMicRigidEndClearMeasureC = uibutton(app.ExtUI.FourMicOneMicRigidendGrid, 'push');
app.ExtUI.FourMicOneMicRigidEndClearMeasureC.BackgroundColor = [0.651 0.651 0.651];
app.ExtUI.FourMicOneMicRigidEndClearMeasureC.FontWeight = 'bold';
app.ExtUI.FourMicOneMicRigidEndClearMeasureC.FontColor = [1 1 1];
app.ExtUI.FourMicOneMicRigidEndClearMeasureC.Layout.Row = 2;
app.ExtUI.FourMicOneMicRigidEndClearMeasureC.Layout.Column = 3;
app.ExtUI.FourMicOneMicRigidEndClearMeasureC.Text = 'Clear measure';
app.ExtUI.FourMicOneMicRigidEndClearMeasureC.ButtonPushedFcn = {@FourMicOneMicRigidEndClearMeasureC,app};

% Create FourMicOneMicRigidEndClearMeasureD
app.ExtUI.FourMicOneMicRigidEndClearMeasureD = uibutton(app.ExtUI.FourMicOneMicRigidendGrid, 'push');
app.ExtUI.FourMicOneMicRigidEndClearMeasureD.BackgroundColor = [0.651 0.651 0.651];
app.ExtUI.FourMicOneMicRigidEndClearMeasureD.FontWeight = 'bold';
app.ExtUI.FourMicOneMicRigidEndClearMeasureD.FontColor = [1 1 1];
app.ExtUI.FourMicOneMicRigidEndClearMeasureD.Layout.Row = 2;
app.ExtUI.FourMicOneMicRigidEndClearMeasureD.Layout.Column = 4;
app.ExtUI.FourMicOneMicRigidEndClearMeasureD.Text = 'Clear measure';
app.ExtUI.FourMicOneMicRigidEndClearMeasureD.ButtonPushedFcn = {@FourMicOneMicRigidEndClearMeasureD,app};


% Create FourMicOneMicRigidAxes
app.ExtUI.FourMicOneMicRigidAxes = uiaxes(app.ExtUI.FourMicOneMicRigidendGrid);
app.ExtUI.FourMicOneMicRigidAxes.Layout.Row = 1;
app.ExtUI.FourMicOneMicRigidAxes.Layout.Column = [1 4];

% Plot tubes
aux = app.ExtVar.ImpedanceTubeFourMic.Symmetrical;
app.ExtVar.ImpedanceTubeFourMic.Symmetrical = false;
FourMicOneMicPlotDoneZone(app)
app.ExtVar.ImpedanceTubeFourMic.Symmetrical = aux;

function [Outs,Ins] = FourMicOneMicMeasureSystem(app,OutCh,InCh)
% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Measuring...',...
    'Indeterminate','on');

% Refresh devices
audiodevreset;

% Generate signal
[app.ExtVar.ImpedanceTubeFourMic.Output,~] = signalGenerator(app);

% Measure
num = app.Averages;
for i=1:num
    [Outs,Ins(:,i)] = audioOutIn(app,app.ExtVar.ImpedanceTubeFourMic.Output,OutCh,InCh,1); %#ok<AGROW>
end

Ins = mean(Ins,2);

close(d)

function FourMicOneMicAnechoicEndMeasureA(~,~,app)

% Parameters
OutCh = app.ExtVar.ImpedanceTubeFourMic.OutputCh;
InCh = app.ExtVar.ImpedanceTubeFourMic.Mic1Ch;

% Measure
[Outs,Ins] = FourMicOneMicMeasureSystem(app,OutCh,InCh);

% Store data
app.ExtVar.ImpedanceTubeFourMic.TypeSignal = app.TypeSignal;
app.ExtVar.ImpedanceTubeFourMic.SampleRate = app.SampleRate;
app.ExtVar.ImpedanceTubeFourMic.Mic1a = Ins;
app.ExtVar.ImpedanceTubeFourMic.Output1a = Outs;

% Plot
FourMicOneMicPlotDoneZone(app)

% Check
FourMicCheckForCalculate(app)

% Disable measure button
app.ExtUI.FourMicOneMicAnechoicEndMeasureA.Enable = 'off';

function FourMicOneMicAnechoicEndMeasureB(~,~,app)

% Parameters
OutCh = app.ExtVar.ImpedanceTubeFourMic.OutputCh;
InCh = app.ExtVar.ImpedanceTubeFourMic.Mic1Ch;

% Measure
[Outs,Ins] = FourMicOneMicMeasureSystem(app,OutCh,InCh);

% Store data
app.ExtVar.ImpedanceTubeFourMic.TypeSignal = app.TypeSignal;
app.ExtVar.ImpedanceTubeFourMic.SampleRate = app.SampleRate;
app.ExtVar.ImpedanceTubeFourMic.Mic2a = Ins;
app.ExtVar.ImpedanceTubeFourMic.Output2a = Outs;

% Plot
FourMicOneMicPlotDoneZone(app)

% Check
FourMicCheckForCalculate(app)

% Disable measure button
app.ExtUI.FourMicOneMicAnechoicEndMeasureB.Enable = 'off';

function FourMicOneMicAnechoicEndMeasureC(~,~,app)

% Parameters
OutCh = app.ExtVar.ImpedanceTubeFourMic.OutputCh;
InCh = app.ExtVar.ImpedanceTubeFourMic.Mic1Ch;

% Measure
[Outs,Ins] = FourMicOneMicMeasureSystem(app,OutCh,InCh);

% Store data
app.ExtVar.ImpedanceTubeFourMic.TypeSignal = app.TypeSignal;
app.ExtVar.ImpedanceTubeFourMic.SampleRate = app.SampleRate;
app.ExtVar.ImpedanceTubeFourMic.Mic3a = Ins;
app.ExtVar.ImpedanceTubeFourMic.Output3a = Outs;

% Plot
FourMicOneMicPlotDoneZone(app)

% Check
FourMicCheckForCalculate(app)

% Disable measure button
app.ExtUI.FourMicOneMicAnechoicEndMeasureC.Enable = 'off';

function FourMicOneMicAnechoicEndMeasureD(~,~,app)

% Parameters
OutCh = app.ExtVar.ImpedanceTubeFourMic.OutputCh;
InCh = app.ExtVar.ImpedanceTubeFourMic.Mic1Ch;

% Measure
[Outs,Ins] = FourMicOneMicMeasureSystem(app,OutCh,InCh);

% Store data
app.ExtVar.ImpedanceTubeFourMic.TypeSignal = app.TypeSignal;
app.ExtVar.ImpedanceTubeFourMic.SampleRate = app.SampleRate;
app.ExtVar.ImpedanceTubeFourMic.Mic4a = Ins;
app.ExtVar.ImpedanceTubeFourMic.Output4a = Outs;

% Plot
FourMicOneMicPlotDoneZone(app)

% Check
FourMicCheckForCalculate(app)

% Disable measure button
app.ExtUI.FourMicOneMicAnechoicEndMeasureD.Enable = 'off';

function FourMicOneMicRigidEndMeasureA(~,~,app)

% Parameters
OutCh = app.ExtVar.ImpedanceTubeFourMic.OutputCh;
InCh = app.ExtVar.ImpedanceTubeFourMic.Mic1Ch;

% Measure
[Outs,Ins] = FourMicOneMicMeasureSystem(app,OutCh,InCh);

% Store data
app.ExtVar.ImpedanceTubeFourMic.TypeSignal = app.TypeSignal;
app.ExtVar.ImpedanceTubeFourMic.SampleRate = app.SampleRate;
app.ExtVar.ImpedanceTubeFourMic.Mic1b = Ins;
app.ExtVar.ImpedanceTubeFourMic.Output1b = Outs;

% Plot
FourMicOneMicPlotDoneZone(app)

% Check
FourMicCheckForCalculate(app)

% Disable measure button
app.ExtUI.FourMicOneMicRigidEndMeasureA.Enable = 'off';

function FourMicOneMicRigidEndMeasureB(~,~,app)

% Parameters
OutCh = app.ExtVar.ImpedanceTubeFourMic.OutputCh;
InCh = app.ExtVar.ImpedanceTubeFourMic.Mic1Ch;

% Measure
[Outs,Ins] = FourMicOneMicMeasureSystem(app,OutCh,InCh);

% Store data
app.ExtVar.ImpedanceTubeFourMic.TypeSignal = app.TypeSignal;
app.ExtVar.ImpedanceTubeFourMic.SampleRate = app.SampleRate;
app.ExtVar.ImpedanceTubeFourMic.Mic2b = Ins;
app.ExtVar.ImpedanceTubeFourMic.Output2b = Outs;

% Plot
FourMicOneMicPlotDoneZone(app)

% Check
FourMicCheckForCalculate(app)

% Disable measure button
app.ExtUI.FourMicOneMicRigidEndMeasureB.Enable = 'off';

function FourMicOneMicRigidEndMeasureC(~,~,app)

% Parameters
OutCh = app.ExtVar.ImpedanceTubeFourMic.OutputCh;
InCh = app.ExtVar.ImpedanceTubeFourMic.Mic1Ch;

% Measure
[Outs,Ins] = FourMicOneMicMeasureSystem(app,OutCh,InCh);

% Store data
app.ExtVar.ImpedanceTubeFourMic.TypeSignal = app.TypeSignal;
app.ExtVar.ImpedanceTubeFourMic.SampleRate = app.SampleRate;
app.ExtVar.ImpedanceTubeFourMic.Mic3b = Ins;
app.ExtVar.ImpedanceTubeFourMic.Output3b = Outs;

% Plot
FourMicOneMicPlotDoneZone(app)

% Check
FourMicCheckForCalculate(app)

% Disable measure button
app.ExtUI.FourMicOneMicRigidEndMeasureC.Enable = 'off';

function FourMicOneMicRigidEndMeasureD(~,~,app)

% Parameters
OutCh = app.ExtVar.ImpedanceTubeFourMic.OutputCh;
InCh = app.ExtVar.ImpedanceTubeFourMic.Mic1Ch;

% Measure
[Outs,Ins] = FourMicOneMicMeasureSystem(app,OutCh,InCh);

% Store data
app.ExtVar.ImpedanceTubeFourMic.TypeSignal = app.TypeSignal;
app.ExtVar.ImpedanceTubeFourMic.SampleRate = app.SampleRate;
app.ExtVar.ImpedanceTubeFourMic.Mic4b = Ins;
app.ExtVar.ImpedanceTubeFourMic.Output4b = Outs;

% Plot
FourMicOneMicPlotDoneZone(app)

% Check
FourMicCheckForCalculate(app)

% Disable measure button
app.ExtUI.FourMicOneMicRigidEndMeasureD.Enable = 'off';

function FourMicOneMicAnechoicEndClearMeasureA(~,~,app)
msg = 'Clear measure, are you sure?';
title = 'Clear';
selection = uiconfirm(app.ALabUIFigure,msg,title,...
    'Options',{'Yes','Cancel'},...
    'DefaultOption',2,'CancelOption',2);
if strcmp(selection,'Yes')
    app.ExtVar.ImpedanceTubeFourMic.Mic1a = [];
    app.ExtVar.ImpedanceTubeFourMic.Output1a = [];
    FourMicOneMicPlotDoneZone(app)
    FourMicCheckForCalculate(app)
    % Enable measure button
    app.ExtUI.FourMicOneMicAnechoicEndMeasureA.Enable = 'on';
end

function FourMicOneMicAnechoicEndClearMeasureB(~,~,app)
msg = 'Clear measure, are you sure?';
title = 'Clear';
selection = uiconfirm(app.ALabUIFigure,msg,title,...
    'Options',{'Yes','Cancel'},...
    'DefaultOption',2,'CancelOption',2);
if strcmp(selection,'Yes')
    app.ExtVar.ImpedanceTubeFourMic.Mic2a = [];
    app.ExtVar.ImpedanceTubeFourMic.Output2a = [];
    FourMicOneMicPlotDoneZone(app)
    FourMicCheckForCalculate(app)
    % Enable measure button
    app.ExtUI.FourMicOneMicAnechoicEndMeasureB.Enable = 'on';
end

function FourMicOneMicAnechoicEndClearMeasureC(~,~,app)
msg = 'Clear measure, are you sure?';
title = 'Clear';
selection = uiconfirm(app.ALabUIFigure,msg,title,...
    'Options',{'Yes','Cancel'},...
    'DefaultOption',2,'CancelOption',2);
if strcmp(selection,'Yes')
    app.ExtVar.ImpedanceTubeFourMic.Mic3a = [];
    app.ExtVar.ImpedanceTubeFourMic.Output3a = [];
    FourMicOneMicPlotDoneZone(app)
    FourMicCheckForCalculate(app)
    % Enable measure button
    app.ExtUI.FourMicOneMicAnechoicEndMeasureC.Enable = 'on';
end

function FourMicOneMicAnechoicEndClearMeasureD(~,~,app)
msg = 'Clear measure, are you sure?';
title = 'Clear';
selection = uiconfirm(app.ALabUIFigure,msg,title,...
    'Options',{'Yes','Cancel'},...
    'DefaultOption',2,'CancelOption',2);
if strcmp(selection,'Yes')
    app.ExtVar.ImpedanceTubeFourMic.Mic4a = [];
    app.ExtVar.ImpedanceTubeFourMic.Output4a = [];
    FourMicOneMicPlotDoneZone(app)
    FourMicCheckForCalculate(app)
    % Enable measure button
    app.ExtUI.FourMicOneMicAnechoicEndMeasureD.Enable = 'on';
end

function FourMicOneMicRigidEndClearMeasureA(~,~,app)
msg = 'Clear measure, are you sure?';
title = 'Clear';
selection = uiconfirm(app.ALabUIFigure,msg,title,...
    'Options',{'Yes','Cancel'},...
    'DefaultOption',2,'CancelOption',2);
if strcmp(selection,'Yes')
    app.ExtVar.ImpedanceTubeFourMic.Mic1b = [];
    app.ExtVar.ImpedanceTubeFourMic.Output1b = [];
    FourMicOneMicPlotDoneZone(app)
    FourMicCheckForCalculate(app)
    % Enable measure button
    app.ExtUI.FourMicOneMicRigidEndMeasureA.Enable = 'on';
end

function FourMicOneMicRigidEndClearMeasureB(~,~,app)
msg = 'Clear measure, are you sure?';
title = 'Clear';
selection = uiconfirm(app.ALabUIFigure,msg,title,...
    'Options',{'Yes','Cancel'},...
    'DefaultOption',2,'CancelOption',2);
if strcmp(selection,'Yes')
    app.ExtVar.ImpedanceTubeFourMic.Mic2b = [];
    app.ExtVar.ImpedanceTubeFourMic.Output2b = [];
    FourMicOneMicPlotDoneZone(app)
    FourMicCheckForCalculate(app)
    % Enable measure button
    app.ExtUI.FourMicOneMicRigidEndMeasureB.Enable = 'on';
end

function FourMicOneMicRigidEndClearMeasureC(~,~,app)
msg = 'Clear measure, are you sure?';
title = 'Clear';
selection = uiconfirm(app.ALabUIFigure,msg,title,...
    'Options',{'Yes','Cancel'},...
    'DefaultOption',2,'CancelOption',2);
if strcmp(selection,'Yes')
    app.ExtVar.ImpedanceTubeFourMic.Mic3b = [];
    app.ExtVar.ImpedanceTubeFourMic.Output3b = [];
    FourMicOneMicPlotDoneZone(app)
    FourMicCheckForCalculate(app)
    % Enable measure button
    app.ExtUI.FourMicOneMicRigidEndMeasureC.Enable = 'on';
end

function FourMicOneMicRigidEndClearMeasureD(~,~,app)
msg = 'Clear measure, are you sure?';
title = 'Clear';
selection = uiconfirm(app.ALabUIFigure,msg,title,...
    'Options',{'Yes','Cancel'},...
    'DefaultOption',2,'CancelOption',2);
if strcmp(selection,'Yes')
    app.ExtVar.ImpedanceTubeFourMic.Mic4b = [];
    app.ExtVar.ImpedanceTubeFourMic.Output4b = [];
    FourMicOneMicPlotDoneZone(app)
    FourMicCheckForCalculate(app)
    % Enable measure button
    app.ExtUI.FourMicOneMicRigidEndMeasureD.Enable = 'on';
end

function FourMicOneMicPlotDoneZone(app)
zones = [];
if ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic1a)
    zones = [zones,1];
    % Disable measure button
    app.ExtUI.FourMicOneMicAnechoicEndMeasureA.Enable = 'off';
end
if ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic2a)
    zones = [zones,2];
    % Disable measure button
    app.ExtUI.FourMicOneMicAnechoicEndMeasureB.Enable = 'off';
end
if ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic3a)
    zones = [zones,3];
    % Disable measure button
    app.ExtUI.FourMicOneMicAnechoicEndMeasureC.Enable = 'off';
end
if ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic4a)
    zones = [zones,4];
    % Disable measure button
    app.ExtUI.FourMicOneMicAnechoicEndMeasureD.Enable = 'off';
end
plotTubeFourMicASTM2611(app,app.ExtUI.FourMicOneMicAnechoicAxes,{'Mic';'A'},{'Mic';'B'},{'Mic';'C'},{'Mic';'D'},0,0,0,zones)

if ~app.ExtVar.ImpedanceTubeFourMic.Symmetrical
    zones = [];
    if ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic1b)
        zones = [zones,1];
        % Disable measure button
        app.ExtUI.FourMicOneMicRigidEndMeasureA.Enable = 'off';
    end
    if ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic2b)
        zones = [zones,2];
        % Disable measure button
        app.ExtUI.FourMicOneMicRigidEndMeasureB.Enable = 'off';
    end
    if ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic3b)
        zones = [zones,3];
        % Disable measure button
        app.ExtUI.FourMicOneMicRigidEndMeasureC.Enable = 'off';
    end
    if ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic4b)
        zones = [zones,4];
        % Disable measure button
        app.ExtUI.FourMicOneMicRigidEndMeasureD.Enable = 'off';
    end
    
    plotTubeFourMicASTM2611(app,app.ExtUI.FourMicOneMicRigidAxes,{'Mic';'A'},{'Mic';'B'},{'Mic';'C'},{'Mic';'D'},0,1,0,zones)
end
