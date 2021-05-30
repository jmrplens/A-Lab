function createPanelWhiteNoise(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Initialize
if ~isfield(app.SignalParameter,'WhiteNoise')
    app.SignalParameter.WhiteNoise = struct('Dur',[]);
end

app.ExtUI.SignalSelectedPanel.Title = 'White noise';

% Create GridWhiteNoise
app.ExtUI.GridWhiteNoise = uigridlayout(app.ExtUI.SignalSelectedPanel);
app.ExtUI.GridWhiteNoise.RowHeight = {'fit'};
app.ExtUI.GridWhiteNoise.ColumnWidth = {'1x'};
app.ExtUI.GridWhiteNoise.BackgroundColor = [1 1 1];

% Create DurationsLabel
app.ExtUI.WhiteDurationsLabel = uilabel(app.ExtUI.GridWhiteNoise);
app.ExtUI.WhiteDurationsLabel.HorizontalAlignment = 'right';
app.ExtUI.WhiteDurationsLabel.WordWrap = 'on';
app.ExtUI.WhiteDurationsLabel.Layout.Row = 1;
app.ExtUI.WhiteDurationsLabel.Layout.Column = 1;
app.ExtUI.WhiteDurationsLabel.Text = 'Duration (s)';

% Create WhiteNoiseDurationEditField
app.ExtUI.WhiteNoiseDurationEditField = uieditfield(app.ExtUI.GridWhiteNoise, 'numeric');
app.ExtUI.WhiteNoiseDurationEditField.ValueChangedFcn = {@WhiteNoiseParameterChanged,app};
app.ExtUI.WhiteNoiseDurationEditField.Limits = [0.1 Inf];
app.ExtUI.WhiteNoiseDurationEditField.Layout.Row = 1;
app.ExtUI.WhiteNoiseDurationEditField.Layout.Column = 2;
app.ExtUI.WhiteNoiseDurationEditField.Value = 1;
if isempty(app.SignalParameter.WhiteNoise.Dur)
    app.SignalParameter.WhiteNoise.Dur = app.ExtUI.WhiteNoiseDurationEditField.Value;
else
    app.ExtUI.WhiteNoiseDurationEditField.Value = app.SignalParameter.WhiteNoise.Dur;
end

end
function WhiteNoiseParameterChanged(~,~,app)
app.SignalParameter.WhiteNoise.Dur = app.ExtUI.WhiteNoiseDurationEditField.Value;
end