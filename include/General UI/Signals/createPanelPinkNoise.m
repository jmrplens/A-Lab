function createPanelPinkNoise(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Initialize
if ~isfield(app.SignalParameter,'PinkNoise')
    app.SignalParameter.PinkNoise = struct('Dur',[]);
end

app.ExtUI.SignalSelectedPanel.Title = 'Pink noise';

% Create GridPinkNoise
app.ExtUI.GridPinkNoise = uigridlayout(app.ExtUI.SignalSelectedPanel);
app.ExtUI.GridPinkNoise.RowHeight = {'fit'};
app.ExtUI.GridPinkNoise.BackgroundColor = [1 1 1];

% Create DurationsLabel
app.ExtUI.PinkDurationsLabel = uilabel(app.ExtUI.GridPinkNoise);
app.ExtUI.PinkDurationsLabel.HorizontalAlignment = 'right';
app.ExtUI.PinkDurationsLabel.WordWrap = 'on';
app.ExtUI.PinkDurationsLabel.Layout.Row = 1;
app.ExtUI.PinkDurationsLabel.Layout.Column = 1;
app.ExtUI.PinkDurationsLabel.Text = 'Duration (s)';

% Create PinkNoiseDurationEditField
app.ExtUI.PinkNoiseDurationEditField = uieditfield(app.ExtUI.GridPinkNoise, 'numeric');
app.ExtUI.PinkNoiseDurationEditField.ValueChangedFcn = {@PinkNoiseParameterChanged,app};
app.ExtUI.PinkNoiseDurationEditField.Limits = [0.1 Inf];
app.ExtUI.PinkNoiseDurationEditField.Layout.Row = 1;
app.ExtUI.PinkNoiseDurationEditField.Layout.Column = 2;
app.ExtUI.PinkNoiseDurationEditField.Value = 1;
if isempty(app.SignalParameter.PinkNoise.Dur)
    app.SignalParameter.PinkNoise.Dur = app.ExtUI.PinkNoiseDurationEditField.Value;
else
    app.ExtUI.PinkNoiseDurationEditField.Value = app.SignalParameter.PinkNoise.Dur;
end

end
function PinkNoiseParameterChanged(~,~,app)
app.SignalParameter.PinkNoise.Dur = app.ExtUI.PinkNoiseDurationEditField.Value;
end
