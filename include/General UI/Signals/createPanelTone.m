function createPanelTone(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Initialize
if ~isfield(app.SignalParameter,'Tone')
    app.SignalParameter.Tone = struct('Dur',[],'freq',[]);
end

app.ExtUI.SignalSelectedPanel.Title = 'Tone';

% Create GridTone
app.ExtUI.GridTone = uigridlayout(app.ExtUI.SignalSelectedPanel);
app.ExtUI.GridTone.RowHeight = {'fit', 'fit'};
app.ExtUI.GridTone.BackgroundColor = [1 1 1];

% Create DurationsLabel
app.ExtUI.ToneDurationsLabel = uilabel(app.ExtUI.GridTone);
app.ExtUI.ToneDurationsLabel.HorizontalAlignment = 'right';
app.ExtUI.ToneDurationsLabel.WordWrap = 'on';
app.ExtUI.ToneDurationsLabel.Layout.Row = 1;
app.ExtUI.ToneDurationsLabel.Layout.Column = 1;
app.ExtUI.ToneDurationsLabel.Text = 'Duration (s)';

% Create ToneDurationEditField
app.ExtUI.ToneDurationEditField = uieditfield(app.ExtUI.GridTone, 'numeric');
app.ExtUI.ToneDurationEditField.ValueChangedFcn = {@ToneParameterChanged,app};
app.ExtUI.ToneDurationEditField.Limits = [0.1 Inf];
app.ExtUI.ToneDurationEditField.Layout.Row = 1;
app.ExtUI.ToneDurationEditField.Layout.Column = 2;
app.ExtUI.ToneDurationEditField.Value = 1;
if isempty(app.SignalParameter.Tone.Dur)
    app.SignalParameter.Tone.Dur = app.ExtUI.ToneDurationEditField.Value;
else
    app.ExtUI.ToneDurationEditField.Value = app.SignalParameter.Tone.Dur;
end

% Create FrequencyHzEditFieldLabel
app.ExtUI.ToneFrequencyHzEditFieldLabel = uilabel(app.ExtUI.GridTone);
app.ExtUI.ToneFrequencyHzEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.ToneFrequencyHzEditFieldLabel.Layout.Row = 2;
app.ExtUI.ToneFrequencyHzEditFieldLabel.Layout.Column = 1;
app.ExtUI.ToneFrequencyHzEditFieldLabel.Text = 'Frequency (Hz)';

% Create ToneFrequencyHzEditField
app.ExtUI.ToneFrequencyHzEditField = uieditfield(app.ExtUI.GridTone, 'numeric');
app.ExtUI.ToneFrequencyHzEditField.ValueChangedFcn = {@ToneParameterChanged,app};
app.ExtUI.ToneFrequencyHzEditField.Limits = [1 Inf];
app.ExtUI.ToneFrequencyHzEditField.RoundFractionalValues = 'on';
app.ExtUI.ToneFrequencyHzEditField.ValueDisplayFormat = '%d';
app.ExtUI.ToneFrequencyHzEditField.Layout.Row = 2;
app.ExtUI.ToneFrequencyHzEditField.Layout.Column = 2;
app.ExtUI.ToneFrequencyHzEditField.Value = 1000;
if isempty(app.SignalParameter.Tone.freq)
    app.SignalParameter.Tone.freq = app.ExtUI.ToneFrequencyHzEditField.Value;
else
    app.ExtUI.ToneFrequencyHzEditField.Value = app.SignalParameter.Tone.freq;
end

end
function ToneParameterChanged(~,~,app)
app.SignalParameter.Tone.Dur = app.ExtUI.ToneDurationEditField.Value;
app.SignalParameter.Tone.freq = app.ExtUI.ToneFrequencyHzEditField.Value;
end