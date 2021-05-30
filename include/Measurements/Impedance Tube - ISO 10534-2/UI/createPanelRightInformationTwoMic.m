function createPanelRightInformationTwoMic(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Create GridTubeTwoMicRightInfo
app.ExtUI.GridTubeTwoMicRightInfo = uigridlayout(app.ExtUI.GridRightMain);
app.ExtUI.GridTubeTwoMicRightInfo.ColumnWidth = {'1x'};
app.ExtUI.GridTubeTwoMicRightInfo.RowHeight = {'fit'};
app.ExtUI.GridTubeTwoMicRightInfo.Padding = [0 0 0 0];
app.ExtUI.GridTubeTwoMicRightInfo.Layout.Row = 3;
app.ExtUI.GridTubeTwoMicRightInfo.Layout.Column = 1;
app.ExtUI.GridTubeTwoMicRightInfo.BackgroundColor = [1 1 1];

% Create PanelTubeTwoMicRightInfo
app.ExtUI.PanelTubeTwoMicRightInfo = uipanel(app.ExtUI.GridTubeTwoMicRightInfo);
app.ExtUI.PanelTubeTwoMicRightInfo.ForegroundColor = [1 1 1];
app.ExtUI.PanelTubeTwoMicRightInfo.Title = 'Tube information';
app.ExtUI.PanelTubeTwoMicRightInfo.BackgroundColor = [0.502 0.502 0.502];
app.ExtUI.PanelTubeTwoMicRightInfo.Layout.Row = 1;
app.ExtUI.PanelTubeTwoMicRightInfo.Layout.Column = 1;
app.ExtUI.PanelTubeTwoMicRightInfo.FontAngle = 'italic';
app.ExtUI.PanelTubeTwoMicRightInfo.FontWeight = 'bold';

% Create PanelTubeTwoMicRightInfoGrid
app.ExtUI.PanelTubeTwoMicRightInfoGrid = uigridlayout(app.ExtUI.PanelTubeTwoMicRightInfo);
app.ExtUI.PanelTubeTwoMicRightInfoGrid.ColumnWidth = {'fit', '1x'};
app.ExtUI.PanelTubeTwoMicRightInfoGrid.RowHeight = {'fit', 'fit', 'fit'};
app.ExtUI.PanelTubeTwoMicRightInfoGrid.BackgroundColor = [1 1 1];

% Create PanelTubeTwoMicRightInfoLFreq
app.ExtUI.PanelTubeTwoMicRightInfoLFreq = uilabel(app.ExtUI.PanelTubeTwoMicRightInfoGrid);
app.ExtUI.PanelTubeTwoMicRightInfoLFreq.Layout.Row = 1;
app.ExtUI.PanelTubeTwoMicRightInfoLFreq.Layout.Column = 1;
app.ExtUI.PanelTubeTwoMicRightInfoLFreq.Text = 'Lower frequency';

% Create PanelTubeTwoMicRightInfoUFreq
app.ExtUI.PanelTubeTwoMicRightInfoUFreq = uilabel(app.ExtUI.PanelTubeTwoMicRightInfoGrid);
app.ExtUI.PanelTubeTwoMicRightInfoUFreq.Layout.Row = 2;
app.ExtUI.PanelTubeTwoMicRightInfoUFreq.Layout.Column = 1;
app.ExtUI.PanelTubeTwoMicRightInfoUFreq.Text = 'Upper frequency';

% Create PanelTubeTwoMicRightInfoLFreqlabel
app.ExtUI.PanelTubeTwoMicRightInfoLFreqlabel = uilabel(app.ExtUI.PanelTubeTwoMicRightInfoGrid);
app.ExtUI.PanelTubeTwoMicRightInfoLFreqlabel.Layout.Row = 1;
app.ExtUI.PanelTubeTwoMicRightInfoLFreqlabel.Layout.Column = 2;
app.ExtUI.PanelTubeTwoMicRightInfoLFreqlabel.Text = '100 Hz';

% Create PanelTubeTwoMicRightInfoUFreqlabel
app.ExtUI.PanelTubeTwoMicRightInfoUFreqlabel = uilabel(app.ExtUI.PanelTubeTwoMicRightInfoGrid);
app.ExtUI.PanelTubeTwoMicRightInfoUFreqlabel.Layout.Row = 2;
app.ExtUI.PanelTubeTwoMicRightInfoUFreqlabel.Layout.Column = 2;
app.ExtUI.PanelTubeTwoMicRightInfoUFreqlabel.Text = '3000 Hz';

% Create PanelTubeTwoMicRightInfoTubeCal
app.ExtUI.PanelTubeTwoMicRightInfoTubeCal = uilabel(app.ExtUI.PanelTubeTwoMicRightInfoGrid);
app.ExtUI.PanelTubeTwoMicRightInfoTubeCal.Layout.Row = 3;
app.ExtUI.PanelTubeTwoMicRightInfoTubeCal.Layout.Column = 1;
app.ExtUI.PanelTubeTwoMicRightInfoTubeCal.Text = 'Tube calibrated';

% Create PanelTubeTwoMicRightInfoTubeCalLabel
app.ExtUI.PanelTubeTwoMicRightInfoTubeCalLabel = uilabel(app.ExtUI.PanelTubeTwoMicRightInfoGrid);
app.ExtUI.PanelTubeTwoMicRightInfoTubeCalLabel.Layout.Row = 3;
app.ExtUI.PanelTubeTwoMicRightInfoTubeCalLabel.Layout.Column = 2;
app.ExtUI.PanelTubeTwoMicRightInfoTubeCalLabel.Text = 'No';

% Calculations
[freqMin,freqMax] = TwoMicCalculateTubeLimits(app);
app.ExtUI.PanelTubeTwoMicRightInfoUFreqlabel.Text = sprintf('%.1f Hz',freqMax);
app.ExtUI.PanelTubeTwoMicRightInfoLFreqlabel.Text = sprintf('%.1f Hz',freqMin);

if app.ExtVar.ImpedanceTubeTwoMic.Calibrated
        app.ExtUI.PanelTubeTwoMicRightInfoTubeCalLabel.Text = 'Yes';
end
    
drawnow