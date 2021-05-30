function createLeftPanelTwoMicISO10534(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Configure Column
column = leftGrid(app,{'1x'},{'fit'});

% Create TwoMicISO10534Panel
app.ExtUI.TwoMicISO10534Panel = uipanel(column);
app.ExtUI.TwoMicISO10534Panel.BorderType = 'none';
app.ExtUI.TwoMicISO10534Panel.TitlePosition = 'centertop';
app.ExtUI.TwoMicISO10534Panel.Title = 'Impedance Tube (ISO 10534-2)';
app.ExtUI.TwoMicISO10534Panel.BackgroundColor = [1 1 1];
app.ExtUI.TwoMicISO10534Panel.Layout.Row = 1;
app.ExtUI.TwoMicISO10534Panel.Layout.Column = 1;
app.ExtUI.TwoMicISO10534Panel.FontWeight = 'bold';
app.ExtUI.TwoMicISO10534Panel.FontSize = 14;

% Create GridTwoMicISO10534
app.ExtUI.GridTwoMicISO10534 = uigridlayout(app.ExtUI.TwoMicISO10534Panel);
app.ExtUI.GridTwoMicISO10534.ColumnWidth = {'1x'};
app.ExtUI.GridTwoMicISO10534.RowHeight = {'fit', 'fit', 'fit', 'fit'};
app.ExtUI.GridTwoMicISO10534.BackgroundColor = [1 1 1];

% Create TwoMicISO10534Info
app.ExtUI.TwoMicISO10534Info = uilabel(app.ExtUI.GridTwoMicISO10534);
app.ExtUI.TwoMicISO10534Info.WordWrap = 'on';
app.ExtUI.TwoMicISO10534Info.Layout.Row = 1;
app.ExtUI.TwoMicISO10534Info.Layout.Column = 1;
app.ExtUI.TwoMicISO10534Info.Text = {'· This method calculates the reflection, absorption and acoustic impedance according to the standard ISO 10534-2.'; '· The measurement can be performed with one or two microphones.'; '· The signals available for this method are MLS and Sweep.'};

% Create TwoMicISO10534MeasureTypePanel
app.ExtUI.TwoMicISO10534MeasureTypePanel = uipanel(app.ExtUI.GridTwoMicISO10534);
app.ExtUI.TwoMicISO10534MeasureTypePanel.ForegroundColor = [1 1 1];
app.ExtUI.TwoMicISO10534MeasureTypePanel.Title = 'Measurement';
app.ExtUI.TwoMicISO10534MeasureTypePanel.BackgroundColor = [0 0 0];
app.ExtUI.TwoMicISO10534MeasureTypePanel.Layout.Row = 3;
app.ExtUI.TwoMicISO10534MeasureTypePanel.Layout.Column = 1;
app.ExtUI.TwoMicISO10534MeasureTypePanel.FontAngle = 'italic';
app.ExtUI.TwoMicISO10534MeasureTypePanel.FontWeight = 'bold';

% Create GridTwoMicISO10534MeasureType
app.ExtUI.GridTwoMicISO10534MeasureType = uigridlayout(app.ExtUI.TwoMicISO10534MeasureTypePanel);
app.ExtUI.GridTwoMicISO10534MeasureType.ColumnWidth = {'1x'};
app.ExtUI.GridTwoMicISO10534MeasureType.RowHeight = {'fit', 'fit'};
app.ExtUI.GridTwoMicISO10534MeasureType.BackgroundColor = [1 1 1];

% Create TwoMicISO10534OnemicrophoneButton
app.ExtUI.TwoMicISO10534OnemicrophoneButton = uibutton(app.ExtUI.GridTwoMicISO10534MeasureType, 'push');
app.ExtUI.TwoMicISO10534OnemicrophoneButton.BackgroundColor = [1 1 1];
app.ExtUI.TwoMicISO10534OnemicrophoneButton.Layout.Row = 1;
app.ExtUI.TwoMicISO10534OnemicrophoneButton.Layout.Column = 1;
app.ExtUI.TwoMicISO10534OnemicrophoneButton.Text = 'One microphone';
app.ExtUI.TwoMicISO10534OnemicrophoneButton.ButtonPushedFcn = {@twomicISO10534onemicmeasurepushed,app};

% Create TwoMicISO10534TwomicrophoneButton
app.ExtUI.TwoMicISO10534TwomicrophoneButton = uibutton(app.ExtUI.GridTwoMicISO10534MeasureType, 'push');
app.ExtUI.TwoMicISO10534TwomicrophoneButton.BackgroundColor = [1 1 1];
app.ExtUI.TwoMicISO10534TwomicrophoneButton.Layout.Row = 2;
app.ExtUI.TwoMicISO10534TwomicrophoneButton.Layout.Column = 1;
app.ExtUI.TwoMicISO10534TwomicrophoneButton.Text = 'Two microphone';
app.ExtUI.TwoMicISO10534TwomicrophoneButton.ButtonPushedFcn = {@twomicISO10534twomicmeasurepushed,app};

% Create TwoMicISO10534InformationPanel
app.ExtUI.TwoMicISO10534InformationPanel = uipanel(app.ExtUI.GridTwoMicISO10534);
app.ExtUI.TwoMicISO10534InformationPanel.ForegroundColor = [1 1 1];
app.ExtUI.TwoMicISO10534InformationPanel.Title = 'Measure information';
app.ExtUI.TwoMicISO10534InformationPanel.BackgroundColor = [1 0.4118 0.1608];
app.ExtUI.TwoMicISO10534InformationPanel.Layout.Row = 4;
app.ExtUI.TwoMicISO10534InformationPanel.Layout.Column = 1;
app.ExtUI.TwoMicISO10534InformationPanel.FontAngle = 'italic';
app.ExtUI.TwoMicISO10534InformationPanel.FontWeight = 'bold';

% Create GridTwoMicISO10534Information
app.ExtUI.GridTwoMicISO10534Information = uigridlayout(app.ExtUI.TwoMicISO10534InformationPanel);
app.ExtUI.GridTwoMicISO10534Information.ColumnWidth = {'1x'};
app.ExtUI.GridTwoMicISO10534Information.RowHeight = {'fit'};
app.ExtUI.GridTwoMicISO10534Information.BackgroundColor = [1 1 1];

% Create TwoMicISO10534ViewinformationButton
app.ExtUI.TwoMicISO10534ViewinformationButton = uibutton(app.ExtUI.GridTwoMicISO10534Information, 'push');
app.ExtUI.TwoMicISO10534ViewinformationButton.BackgroundColor = [1 1 1];
app.ExtUI.TwoMicISO10534ViewinformationButton.Layout.Row = 1;
app.ExtUI.TwoMicISO10534ViewinformationButton.Layout.Column = 1;
app.ExtUI.TwoMicISO10534ViewinformationButton.Text = 'View information';
app.ExtUI.TwoMicISO10534ViewinformationButton.ButtonPushedFcn = {@twomicISO10534informationpushed,app};

% Create TwoMicISO10534TubeParamsPanel
app.ExtUI.TwoMicISO10534TubeParamsPanel = uipanel(app.ExtUI.GridTwoMicISO10534);
app.ExtUI.TwoMicISO10534TubeParamsPanel.ForegroundColor = [1 1 1];
app.ExtUI.TwoMicISO10534TubeParamsPanel.Title = 'Tube parameters';
app.ExtUI.TwoMicISO10534TubeParamsPanel.BackgroundColor = [0 0 0];
app.ExtUI.TwoMicISO10534TubeParamsPanel.Layout.Row = 2;
app.ExtUI.TwoMicISO10534TubeParamsPanel.Layout.Column = 1;
app.ExtUI.TwoMicISO10534TubeParamsPanel.FontAngle = 'italic';
app.ExtUI.TwoMicISO10534TubeParamsPanel.FontWeight = 'bold';

% Create TwoMicISO10534TubeParamsGrid
app.ExtUI.TwoMicISO10534TubeParamsGrid = uigridlayout(app.ExtUI.TwoMicISO10534TubeParamsPanel);
app.ExtUI.TwoMicISO10534TubeParamsGrid.ColumnWidth = {'1x'};
app.ExtUI.TwoMicISO10534TubeParamsGrid.RowHeight = {'fit'};
app.ExtUI.TwoMicISO10534TubeParamsGrid.BackgroundColor = [1 1 1];

% Create TwoMicISO10534SettubeparametersButton
app.ExtUI.TwoMicISO10534SettubeparametersButton = uibutton(app.ExtUI.TwoMicISO10534TubeParamsGrid, 'push');
app.ExtUI.TwoMicISO10534SettubeparametersButton.BackgroundColor = [1 1 1];
app.ExtUI.TwoMicISO10534SettubeparametersButton.Layout.Row = 1;
app.ExtUI.TwoMicISO10534SettubeparametersButton.Layout.Column = 1;
app.ExtUI.TwoMicISO10534SettubeparametersButton.Text = 'Set tube parameters';
app.ExtUI.TwoMicISO10534SettubeparametersButton.ButtonPushedFcn = {@twomicISO10534settubepushed,app};

function twomicISO10534informationpushed(~,~,app)
% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
     'Indeterminate','on');
createCenterPanelInformationTwoMic(app)
pause(0.5)
close(d)

function twomicISO10534settubepushed(~,~,app)
% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
     'Indeterminate','on');
createCenterPanelTwoMicTubeParams(app)
pause(0.5)
close(d)

function twomicISO10534twomicmeasurepushed(~,~,app)
app.ExtVar.ImpedanceTubeTwoMic.NumMics = 2;
% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
     'Indeterminate','on');
createCenterPanelMeasureTwoMicISO10534(app)
pause(0.5)
close(d)

function twomicISO10534onemicmeasurepushed(~,~,app)
app.ExtVar.ImpedanceTubeTwoMic.NumMics = 1;
% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
     'Indeterminate','on');
createCenterPanelMeasureTwoMicISO10534(app)
pause(0.5)
close(d)