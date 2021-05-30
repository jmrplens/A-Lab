function createPanelMeasure(app,column,Row,Col)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Create PanelMeasure
app.ExtUI.MeasurePanel = uipanel(column);
app.ExtUI.MeasurePanel.BorderType = 'none';
app.ExtUI.MeasurePanel.TitlePosition = 'centertop';
app.ExtUI.MeasurePanel.BackgroundColor = [1 1 1];
app.ExtUI.MeasurePanel.Layout.Row = Row;
app.ExtUI.MeasurePanel.Layout.Column = Col;
app.ExtUI.MeasurePanel.FontWeight = 'bold';
app.ExtUI.MeasurePanel.FontSize = 14;

% Create GridMeasure
app.ExtUI.GridMeasure = uigridlayout(app.ExtUI.MeasurePanel);
app.ExtUI.GridMeasure.ColumnWidth = {'1x'};
app.ExtUI.GridMeasure.RowHeight = {'fit'};
app.ExtUI.GridMeasure.Padding = [10 10 10 0];
app.ExtUI.GridMeasure.BackgroundColor = [1 1 1];

% Create StartmeasureButton
app.ExtUI.StartmeasureButton = uibutton(app.ExtUI.GridMeasure, 'push');
app.ExtUI.StartmeasureButton.WordWrap = 'on';
app.ExtUI.StartmeasureButton.BackgroundColor = [0.8588 0 0];
app.ExtUI.StartmeasureButton.FontSize = 18;
app.ExtUI.StartmeasureButton.FontWeight = 'bold';
app.ExtUI.StartmeasureButton.FontColor = [1 1 1];
app.ExtUI.StartmeasureButton.Layout.Row = 1;
app.ExtUI.StartmeasureButton.Layout.Column = 1;
app.ExtUI.StartmeasureButton.Text = 'Start measure';
end