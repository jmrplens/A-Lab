function createPanelRightInformationFourMic(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Create GridTubeFourMicRightInfo
app.ExtUI.GridTubeFourMicRightInfo = uigridlayout(app.ExtUI.GridRightMain);
app.ExtUI.GridTubeFourMicRightInfo.ColumnWidth = {'1x'};
app.ExtUI.GridTubeFourMicRightInfo.RowHeight = {'fit'};
app.ExtUI.GridTubeFourMicRightInfo.Padding = [0 0 0 0];
app.ExtUI.GridTubeFourMicRightInfo.Layout.Row = 3;
app.ExtUI.GridTubeFourMicRightInfo.Layout.Column = 1;
app.ExtUI.GridTubeFourMicRightInfo.BackgroundColor = [1 1 1];

% Create PanelTubeFourMicRightInfo
app.ExtUI.PanelTubeFourMicRightInfo = uipanel(app.ExtUI.GridTubeFourMicRightInfo);
app.ExtUI.PanelTubeFourMicRightInfo.ForegroundColor = [1 1 1];
app.ExtUI.PanelTubeFourMicRightInfo.Title = 'Tube information';
app.ExtUI.PanelTubeFourMicRightInfo.BackgroundColor = [0.502 0.502 0.502];
app.ExtUI.PanelTubeFourMicRightInfo.Layout.Row = 1;
app.ExtUI.PanelTubeFourMicRightInfo.Layout.Column = 1;
app.ExtUI.PanelTubeFourMicRightInfo.FontAngle = 'italic';
app.ExtUI.PanelTubeFourMicRightInfo.FontWeight = 'bold';

% Create PanelTubeFourMicRightInfoGrid
app.ExtUI.PanelTubeFourMicRightInfoGrid = uigridlayout(app.ExtUI.PanelTubeFourMicRightInfo);
app.ExtUI.PanelTubeFourMicRightInfoGrid.ColumnWidth = {'fit', '1x'};
app.ExtUI.PanelTubeFourMicRightInfoGrid.RowHeight = {'fit', 'fit', 'fit'};
app.ExtUI.PanelTubeFourMicRightInfoGrid.BackgroundColor = [1 1 1];

% Create PanelTubeFourMicRightInfoLFreq
app.ExtUI.PanelTubeFourMicRightInfoLFreq = uilabel(app.ExtUI.PanelTubeFourMicRightInfoGrid);
app.ExtUI.PanelTubeFourMicRightInfoLFreq.Layout.Row = 1;
app.ExtUI.PanelTubeFourMicRightInfoLFreq.Layout.Column = 1;
app.ExtUI.PanelTubeFourMicRightInfoLFreq.Text = 'Lower frequency';

% Create PanelTubeFourMicRightInfoUFreq
app.ExtUI.PanelTubeFourMicRightInfoUFreq = uilabel(app.ExtUI.PanelTubeFourMicRightInfoGrid);
app.ExtUI.PanelTubeFourMicRightInfoUFreq.Layout.Row = 2;
app.ExtUI.PanelTubeFourMicRightInfoUFreq.Layout.Column = 1;
app.ExtUI.PanelTubeFourMicRightInfoUFreq.Text = 'Upper frequency';

% Create PanelTubeTwoMicRightInfoTubeCal
app.ExtUI.PanelTubeFourMicRightInfoTubeCal = uilabel(app.ExtUI.PanelTubeFourMicRightInfoGrid);
app.ExtUI.PanelTubeFourMicRightInfoTubeCal.Layout.Row = 3;
app.ExtUI.PanelTubeFourMicRightInfoTubeCal.Layout.Column = 1;
app.ExtUI.PanelTubeFourMicRightInfoTubeCal.Text = 'Tube calibrated';

% Create PanelTubeTwoMicRightInfoTubeCalLabel
app.ExtUI.PanelTubeFourMicRightInfoTubeCalLabel = uilabel(app.ExtUI.PanelTubeFourMicRightInfoGrid);
app.ExtUI.PanelTubeFourMicRightInfoTubeCalLabel.Layout.Row = 3;
app.ExtUI.PanelTubeFourMicRightInfoTubeCalLabel.Layout.Column = 2;
if app.ExtVar.ImpedanceTubeFourMic.Calibrated
    app.ExtUI.PanelTubeFourMicRightInfoTubeCalLabel.Text = 'Yes';
else
    app.ExtUI.PanelTubeFourMicRightInfoTubeCalLabel.Text = 'No';
end

% Frequency limits (ASTM 2611-19, equation (1,2))
[freqMin,freqMax] = FourMicCalculateTubeLimits(app);

% Create PanelTubeFourMicRightInfoLFreqlabel
app.ExtUI.PanelTubeFourMicRightInfoLFreqlabel = uilabel(app.ExtUI.PanelTubeFourMicRightInfoGrid);
app.ExtUI.PanelTubeFourMicRightInfoLFreqlabel.Layout.Row = 1;
app.ExtUI.PanelTubeFourMicRightInfoLFreqlabel.Layout.Column = 2;
app.ExtUI.PanelTubeFourMicRightInfoLFreqlabel.Text = sprintf('%.1f Hz',freqMin);

% Create PanelTubeFourMicRightInfoUFreqlabel
app.ExtUI.PanelTubeFourMicRightInfoUFreqlabel = uilabel(app.ExtUI.PanelTubeFourMicRightInfoGrid);
app.ExtUI.PanelTubeFourMicRightInfoUFreqlabel.Layout.Row = 2;
app.ExtUI.PanelTubeFourMicRightInfoUFreqlabel.Layout.Column = 2;
app.ExtUI.PanelTubeFourMicRightInfoUFreqlabel.Text = sprintf('%.1f Hz',freqMax);