function createPanelSignal(app,column,Row,Col,Items)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Create SignalparametersPanel
app.ExtUI.SignalparametersPanel = uipanel(column);
app.ExtUI.SignalparametersPanel.BorderType = 'none';
app.ExtUI.SignalparametersPanel.TitlePosition = 'centertop';
app.ExtUI.SignalparametersPanel.Title = 'Signal parameters';
app.ExtUI.SignalparametersPanel.BackgroundColor = [1 1 1];
app.ExtUI.SignalparametersPanel.Layout.Row = Row;
app.ExtUI.SignalparametersPanel.Layout.Column = Col;
app.ExtUI.SignalparametersPanel.FontWeight = 'bold';
app.ExtUI.SignalparametersPanel.FontSize = 14;

% Create GridSignalParameters
app.ExtUI.GridSignalParameters = uigridlayout(app.ExtUI.SignalparametersPanel);
app.ExtUI.GridSignalParameters.ColumnWidth = {'1x'};
app.ExtUI.GridSignalParameters.RowHeight = {'fit', 'fit','fit'};
app.ExtUI.GridSignalParameters.BackgroundColor = [1 1 1];

% Create GridSignalType
app.ExtUI.GridSignalType = uigridlayout(app.ExtUI.GridSignalParameters);
app.ExtUI.GridSignalType.RowHeight = {'fit'};
app.ExtUI.GridSignalType.Layout.Row = 1;
app.ExtUI.GridSignalType.Layout.Column = 1;
app.ExtUI.GridSignalType.BackgroundColor = [1 1 1];
app.ExtUI.GridSignalType.Padding = [0 0 0 0];

% Create SignaltypeDropDownLabel
app.ExtUI.SignaltypeDropDownLabel = uilabel(app.ExtUI.GridSignalType);
app.ExtUI.SignaltypeDropDownLabel.BackgroundColor = [1 1 1];
app.ExtUI.SignaltypeDropDownLabel.HorizontalAlignment = 'right';
app.ExtUI.SignaltypeDropDownLabel.WordWrap = 'on';
app.ExtUI.SignaltypeDropDownLabel.Layout.Row = 1;
app.ExtUI.SignaltypeDropDownLabel.Layout.Column = 1;
app.ExtUI.SignaltypeDropDownLabel.Text = 'Signal type';

% Create SignaltypeDropDown
app.ExtUI.SignaltypeDropDown = uidropdown(app.ExtUI.GridSignalType);
app.ExtUI.SignaltypeDropDown.ValueChangedFcn = {@SignaltypeDropDownValueChanged,app};
app.ExtUI.SignaltypeDropDown.Items = Items;
app.ExtUI.SignaltypeDropDown.BackgroundColor = [1 1 1];
app.ExtUI.SignaltypeDropDown.Layout.Row = 1;
app.ExtUI.SignaltypeDropDown.Layout.Column = 2;
app.ExtUI.SignaltypeDropDown.Value = Items{1};
if isempty(app.TypeSignal)
    app.TypeSignal = app.ExtUI.SignaltypeDropDown.Value;
else
    app.ExtUI.SignaltypeDropDown.Value = app.TypeSignal;
end

% Create panel of selectec signal
app.ExtUI.SignalSelectedPanel = uipanel(app.ExtUI.GridSignalParameters);
app.ExtUI.SignalSelectedPanel.ForegroundColor = [1 1 1];
app.ExtUI.SignalSelectedPanel.Title = ' ';
app.ExtUI.SignalSelectedPanel.BackgroundColor = [1 0.4118 0.1608];
app.ExtUI.SignalSelectedPanel.Layout.Row = 2;
app.ExtUI.SignalSelectedPanel.Layout.Column = 1;
app.ExtUI.SignalSelectedPanel.FontAngle = 'italic';
app.ExtUI.SignalSelectedPanel.FontWeight = 'bold';

switchSignal(app)

% Create GridAveragesMeas
app.ExtUI.GridAveragesMeas = uigridlayout(app.ExtUI.GridSignalParameters);
app.ExtUI.GridAveragesMeas.ColumnWidth = {'1x', '0.25x'};
app.ExtUI.GridAveragesMeas.RowHeight = {'fit'};
app.ExtUI.GridAveragesMeas.Layout.Row = 3;
app.ExtUI.GridAveragesMeas.Layout.Column = 1;
app.ExtUI.GridAveragesMeas.Padding = [0 0 0 0];
app.ExtUI.GridAveragesMeas.BackgroundColor = [1 1 1];

% Create MeasureaveragesEditFieldLabel
app.ExtUI.MeasureaveragesEditFieldLabel = uilabel(app.ExtUI.GridAveragesMeas);
app.ExtUI.MeasureaveragesEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.MeasureaveragesEditFieldLabel.WordWrap = 'on';
app.ExtUI.MeasureaveragesEditFieldLabel.FontWeight = 'bold';
app.ExtUI.MeasureaveragesEditFieldLabel.Layout.Row = 1;
app.ExtUI.MeasureaveragesEditFieldLabel.Layout.Column = 1;
app.ExtUI.MeasureaveragesEditFieldLabel.Text = 'Measure averages';

% Create MeasureaveragesEditField
app.ExtUI.MeasureaveragesEditField = uieditfield(app.ExtUI.GridAveragesMeas, 'numeric');
app.ExtUI.MeasureaveragesEditField.ValueChangedFcn = {@AveragesParameterChanged,app};
app.ExtUI.MeasureaveragesEditField.Limits = [1 Inf];
app.ExtUI.MeasureaveragesEditField.RoundFractionalValues = 'on';
app.ExtUI.MeasureaveragesEditField.ValueDisplayFormat = '%.0f';
app.ExtUI.MeasureaveragesEditField.Layout.Row = 1;
app.ExtUI.MeasureaveragesEditField.Layout.Column = 2;
app.ExtUI.MeasureaveragesEditField.Value = 1;
if isempty(app.Averages)
    app.Averages = app.ExtUI.MeasureaveragesEditField.Value;
else
    app.ExtUI.MeasureaveragesEditField.Value = app.Averages;
end


end

function SignaltypeDropDownValueChanged(~,~,app)
app.TypeSignal = app.ExtUI.SignaltypeDropDown.Value;
switchSignal(app)
end

function AveragesParameterChanged(~,~,app)
app.Averages = app.ExtUI.MeasureaveragesEditField.Value;
end
