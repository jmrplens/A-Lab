function createPanelRightMeasureType(app)

% Create MeasureTypeGrid
app.ExtUI.MeasureTypeGrid = uigridlayout(app.ExtUI.GridRightMain);
app.ExtUI.MeasureTypeGrid.ColumnWidth = {'1x'};
app.ExtUI.MeasureTypeGrid.RowHeight = {'fit'};
app.ExtUI.MeasureTypeGrid.Padding = [0 10 0 10];
app.ExtUI.MeasureTypeGrid.Layout.Row = 3;
app.ExtUI.MeasureTypeGrid.Layout.Column = 1;
app.ExtUI.MeasureTypeGrid.BackgroundColor = [1 1 1];

% Create MeasurementtypePanel
app.ExtUI.MeasurementtypePanel = uipanel(app.ExtUI.MeasureTypeGrid);
app.ExtUI.MeasurementtypePanel.ForegroundColor = [1 1 1];
app.ExtUI.MeasurementtypePanel.Title = 'Measurement type';
app.ExtUI.MeasurementtypePanel.BackgroundColor = [0 0 0];
app.ExtUI.MeasurementtypePanel.Layout.Row = 1;
app.ExtUI.MeasurementtypePanel.Layout.Column = 1;
app.ExtUI.MeasurementtypePanel.FontAngle = 'italic';
app.ExtUI.MeasurementtypePanel.FontWeight = 'bold';

% Create GridMeasurementtypePanel
app.ExtUI.GridMeasurementtypePanel = uigridlayout(app.ExtUI.MeasurementtypePanel);
app.ExtUI.GridMeasurementtypePanel.ColumnWidth = {'fit', 'fit', '1x'};
app.ExtUI.GridMeasurementtypePanel.RowHeight = {'1x'};
app.ExtUI.GridMeasurementtypePanel.BackgroundColor = [1 1 1];

% % Create ContinuousLabel
% app.ExtUI.ContinuousLabel = uilabel(app.ExtUI.GridMeasurementtypePanel);
% app.ExtUI.ContinuousLabel.Layout.Row = 1;
% app.ExtUI.ContinuousLabel.Layout.Column = 1;
% app.ExtUI.ContinuousLabel.Text = 'Continuous?';
% 
% % Create ContinuousCheckBox
% app.ExtUI.ContinuousCheckBox = uicheckbox(app.ExtUI.GridMeasurementtypePanel);
% app.ExtUI.ContinuousCheckBox.Text = '';
% app.ExtUI.ContinuousCheckBox.Layout.Row = 1;
% app.ExtUI.ContinuousCheckBox.Layout.Column = 2;

% Create CorrelatedLabel
app.ExtUI.CorrelatedLabel = uilabel(app.ExtUI.GridMeasurementtypePanel);
app.ExtUI.CorrelatedLabel.Layout.Row = 1;
app.ExtUI.CorrelatedLabel.Layout.Column = 1;
app.ExtUI.CorrelatedLabel.Text = 'Correlated (Freq. Resp.)?';

% Create CorrelatedCheckBox
app.ExtUI.CorrelatedCheckBox = uicheckbox(app.ExtUI.GridMeasurementtypePanel);
app.ExtUI.CorrelatedCheckBox.ValueChangedFcn = {@CorrelatedCheckChanged,app};
app.ExtUI.CorrelatedCheckBox.Text = '';
app.ExtUI.CorrelatedCheckBox.Layout.Row = 1;
app.ExtUI.CorrelatedCheckBox.Layout.Column = 2;
app.ExtUI.CorrelatedCheckBox.Value = 1;
if isempty(app.ExtVar.Aeroacoustics.correlatedmeas)
    app.ExtVar.Aeroacoustics.correlatedmeas = 1;
else
    app.ExtUI.CorrelatedCheckBox.Value = app.ExtVar.Aeroacoustics.correlatedmeas;
end

function CorrelatedCheckChanged(~,~,app)
app.ExtVar.Aeroacoustics.correlatedmeas = app.ExtUI.CorrelatedCheckBox.Value;