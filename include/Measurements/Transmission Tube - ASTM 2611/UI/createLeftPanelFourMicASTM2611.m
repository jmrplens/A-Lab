function createLeftPanelFourMicASTM2611(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Configure Column
column = leftGrid(app,{'1x'},{'fit'});

% Create FourMicASTM2611Panel
app.ExtUI.FourMicASTM2611Panel = uipanel(column);
app.ExtUI.FourMicASTM2611Panel.BorderType = 'none';
app.ExtUI.FourMicASTM2611Panel.TitlePosition = 'centertop';
app.ExtUI.FourMicASTM2611Panel.Title = 'Transmission Tube (ASTM 2611)';
app.ExtUI.FourMicASTM2611Panel.BackgroundColor = [1 1 1];
app.ExtUI.FourMicASTM2611Panel.Layout.Row = 1;
app.ExtUI.FourMicASTM2611Panel.Layout.Column = 1;
app.ExtUI.FourMicASTM2611Panel.FontWeight = 'bold';
app.ExtUI.FourMicASTM2611Panel.FontSize = 14;

% Create GridFourMicASTM2611
app.ExtUI.GridFourMicASTM2611 = uigridlayout(app.ExtUI.FourMicASTM2611Panel);
app.ExtUI.GridFourMicASTM2611.ColumnWidth = {'1x'};
app.ExtUI.GridFourMicASTM2611.RowHeight = {'fit', 'fit', 'fit', 'fit'};
app.ExtUI.GridFourMicASTM2611.BackgroundColor = [1 1 1];

% Create FourMicASTM2611Info
app.ExtUI.FourMicASTM2611Info = uilabel(app.ExtUI.GridFourMicASTM2611);
app.ExtUI.FourMicASTM2611Info.WordWrap = 'on';
app.ExtUI.FourMicASTM2611Info.Layout.Row = 1;
app.ExtUI.FourMicASTM2611Info.Layout.Column = 1;
app.ExtUI.FourMicASTM2611Info.Text = {'· This method calculates the transmission, reflection, absorption and others according to the standard ASTM 2611.'; '· The measurement can be performed with one, two or four microphones.'; '· The signals available for this method are MLS and Sweep.'};

% Create FourMicASTM2611MeasureTypePanel
app.ExtUI.FourMicASTM2611MeasureTypePanel = uipanel(app.ExtUI.GridFourMicASTM2611);
app.ExtUI.FourMicASTM2611MeasureTypePanel.ForegroundColor = [1 1 1];
app.ExtUI.FourMicASTM2611MeasureTypePanel.Title = 'Measurement';
app.ExtUI.FourMicASTM2611MeasureTypePanel.BackgroundColor = [0 0 0];
app.ExtUI.FourMicASTM2611MeasureTypePanel.Layout.Row = 3;
app.ExtUI.FourMicASTM2611MeasureTypePanel.Layout.Column = 1;
app.ExtUI.FourMicASTM2611MeasureTypePanel.FontAngle = 'italic';
app.ExtUI.FourMicASTM2611MeasureTypePanel.FontWeight = 'bold';

% Create GridFourMicASTM2611MeasureType
app.ExtUI.GridFourMicASTM2611MeasureType = uigridlayout(app.ExtUI.FourMicASTM2611MeasureTypePanel);
app.ExtUI.GridFourMicASTM2611MeasureType.ColumnWidth = {'1x'};
app.ExtUI.GridFourMicASTM2611MeasureType.RowHeight = {'fit', 'fit', 'fit'};
app.ExtUI.GridFourMicASTM2611MeasureType.BackgroundColor = [1 1 1];

% Create FourMicASTM2611OnemicrophoneButton
app.ExtUI.FourMicASTM2611OnemicrophoneButton = uibutton(app.ExtUI.GridFourMicASTM2611MeasureType, 'push');
app.ExtUI.FourMicASTM2611OnemicrophoneButton.BackgroundColor = [1 1 1];
app.ExtUI.FourMicASTM2611OnemicrophoneButton.Layout.Row = 1;
app.ExtUI.FourMicASTM2611OnemicrophoneButton.Layout.Column = 1;
app.ExtUI.FourMicASTM2611OnemicrophoneButton.Text = 'One microphone';
app.ExtUI.FourMicASTM2611OnemicrophoneButton.ButtonPushedFcn = {@fourmicASTM2611onemicpushed,app};

% Create FourMicASTM2611TwomicrophoneButton
app.ExtUI.FourMicASTM2611TwomicrophoneButton = uibutton(app.ExtUI.GridFourMicASTM2611MeasureType, 'push');
app.ExtUI.FourMicASTM2611TwomicrophoneButton.BackgroundColor = [1 1 1];
app.ExtUI.FourMicASTM2611TwomicrophoneButton.Layout.Row = 2;
app.ExtUI.FourMicASTM2611TwomicrophoneButton.Layout.Column = 1;
app.ExtUI.FourMicASTM2611TwomicrophoneButton.Text = 'Two microphone';
app.ExtUI.FourMicASTM2611TwomicrophoneButton.ButtonPushedFcn = {@fourmicASTM2611twomicpushed,app};

% Create FourMicASTM2611FourmicrophoneButton
app.ExtUI.FourMicASTM2611FourmicrophoneButton = uibutton(app.ExtUI.GridFourMicASTM2611MeasureType, 'push');
app.ExtUI.FourMicASTM2611FourmicrophoneButton.BackgroundColor = [1 1 1];
app.ExtUI.FourMicASTM2611FourmicrophoneButton.Layout.Row = 3;
app.ExtUI.FourMicASTM2611FourmicrophoneButton.Layout.Column = 1;
app.ExtUI.FourMicASTM2611FourmicrophoneButton.Text = 'Four microphone';
app.ExtUI.FourMicASTM2611FourmicrophoneButton.ButtonPushedFcn = {@fourmicASTM2611fourmicpushed,app};

% Create FourMicASTM2611InformationPanel
app.ExtUI.FourMicASTM2611InformationPanel = uipanel(app.ExtUI.GridFourMicASTM2611);
app.ExtUI.FourMicASTM2611InformationPanel.ForegroundColor = [1 1 1];
app.ExtUI.FourMicASTM2611InformationPanel.Title = 'Measure information';
app.ExtUI.FourMicASTM2611InformationPanel.BackgroundColor = [1 0.4118 0.1608];
app.ExtUI.FourMicASTM2611InformationPanel.Layout.Row = 4;
app.ExtUI.FourMicASTM2611InformationPanel.Layout.Column = 1;
app.ExtUI.FourMicASTM2611InformationPanel.FontAngle = 'italic';
app.ExtUI.FourMicASTM2611InformationPanel.FontWeight = 'bold';

% Create GridFourMicASTM2611Information
app.ExtUI.GridFourMicASTM2611Information = uigridlayout(app.ExtUI.FourMicASTM2611InformationPanel);
app.ExtUI.GridFourMicASTM2611Information.ColumnWidth = {'1x'};
app.ExtUI.GridFourMicASTM2611Information.RowHeight = {'fit'};
app.ExtUI.GridFourMicASTM2611Information.BackgroundColor = [1 1 1];

% Create FourMicASTM2611ViewinformationButton
app.ExtUI.FourMicASTM2611ViewinformationButton = uibutton(app.ExtUI.GridFourMicASTM2611Information, 'push');
app.ExtUI.FourMicASTM2611ViewinformationButton.BackgroundColor = [1 1 1];
app.ExtUI.FourMicASTM2611ViewinformationButton.Layout.Row = 1;
app.ExtUI.FourMicASTM2611ViewinformationButton.Layout.Column = 1;
app.ExtUI.FourMicASTM2611ViewinformationButton.Text = 'View information';
app.ExtUI.FourMicASTM2611ViewinformationButton.ButtonPushedFcn = {@fourmicASTM2611informationpushed,app};

% Create FourMicASTM2611TubeParamsPanel
app.ExtUI.FourMicASTM2611TubeParamsPanel = uipanel(app.ExtUI.GridFourMicASTM2611);
app.ExtUI.FourMicASTM2611TubeParamsPanel.ForegroundColor = [1 1 1];
app.ExtUI.FourMicASTM2611TubeParamsPanel.Title = 'Tube parameters';
app.ExtUI.FourMicASTM2611TubeParamsPanel.BackgroundColor = [0 0 0];
app.ExtUI.FourMicASTM2611TubeParamsPanel.Layout.Row = 2;
app.ExtUI.FourMicASTM2611TubeParamsPanel.Layout.Column = 1;
app.ExtUI.FourMicASTM2611TubeParamsPanel.FontAngle = 'italic';
app.ExtUI.FourMicASTM2611TubeParamsPanel.FontWeight = 'bold';

% Create FourMicASTM2611TubeParamsGrid
app.ExtUI.FourMicASTM2611TubeParamsGrid = uigridlayout(app.ExtUI.FourMicASTM2611TubeParamsPanel);
app.ExtUI.FourMicASTM2611TubeParamsGrid.ColumnWidth = {'1x'};
app.ExtUI.FourMicASTM2611TubeParamsGrid.RowHeight = {'fit'};
app.ExtUI.FourMicASTM2611TubeParamsGrid.BackgroundColor = [1 1 1];

% Create FourMicASTM2611SettubeparametersButton
app.ExtUI.FourMicASTM2611SettubeparametersButton = uibutton(app.ExtUI.FourMicASTM2611TubeParamsGrid, 'push');
app.ExtUI.FourMicASTM2611SettubeparametersButton.BackgroundColor = [1 1 1];
app.ExtUI.FourMicASTM2611SettubeparametersButton.Layout.Row = 1;
app.ExtUI.FourMicASTM2611SettubeparametersButton.Layout.Column = 1;
app.ExtUI.FourMicASTM2611SettubeparametersButton.Text = 'Set tube parameters';
app.ExtUI.FourMicASTM2611SettubeparametersButton.ButtonPushedFcn = {@fourmicASTM2611tubeparampushed,app};

function fourmicASTM2611informationpushed(~,~,app)
% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
     'Indeterminate','on');
createCenterPanelInformationFourMic(app)
pause(0.5)
close(d)

function fourmicASTM2611onemicpushed(~,~,app)
% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
     'Indeterminate','on');
app.ExtVar.ImpedanceTubeFourMic.NumMics = 1;
createCenterPanelMeasureFourMicASTM2611(app)
pause(0.5)
close(d)

function fourmicASTM2611twomicpushed(~,~,app)
% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
     'Indeterminate','on');
 app.ExtVar.ImpedanceTubeFourMic.NumMics = 2;
createCenterPanelMeasureFourMicASTM2611(app)
pause(0.5)
close(d)

function fourmicASTM2611fourmicpushed(~,~,app)
d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
     'Indeterminate','on');
 app.ExtVar.ImpedanceTubeFourMic.NumMics = 4;
createCenterPanelMeasureFourMicASTM2611(app)
pause(0.5)
close(d)

function fourmicASTM2611tubeparampushed(~,~,app)
% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
     'Indeterminate','on');
createCenterPanelFourMicTubeParams(app);
pause(0.5)
close(d)