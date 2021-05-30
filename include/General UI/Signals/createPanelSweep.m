function createPanelSweep(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Initialize
if ~isfield(app.SignalParameter,'Sweep')
    app.SignalParameter.Sweep = struct('swDur',[],'silDur',[],'init',[],'end',[]);
end

app.ExtUI.SignalSelectedPanel.Title = 'Sweep';

% Create GridSweep
app.ExtUI.GridSweep = uigridlayout(app.ExtUI.SignalSelectedPanel);
app.ExtUI.GridSweep.RowHeight = {'fit', 'fit', 'fit', 'fit'};
app.ExtUI.GridSweep.BackgroundColor = [1 1 1];

% Create DurationsEditFieldLabel
app.ExtUI.DurationsEditFieldLabel = uilabel(app.ExtUI.GridSweep);
app.ExtUI.DurationsEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.DurationsEditFieldLabel.WordWrap = 'on';
app.ExtUI.DurationsEditFieldLabel.Layout.Row = 1;
app.ExtUI.DurationsEditFieldLabel.Layout.Column = 1;
app.ExtUI.DurationsEditFieldLabel.Text = 'Duration (s)';

% Create SweepDurationsEditField
app.ExtUI.SweepDurationsEditField = uieditfield(app.ExtUI.GridSweep, 'numeric');
app.ExtUI.SweepDurationsEditField.ValueChangedFcn = {@SweepParameterChanged,app};
app.ExtUI.SweepDurationsEditField.Limits = [0.5 15];
app.ExtUI.SweepDurationsEditField.Layout.Row = 1;
app.ExtUI.SweepDurationsEditField.Layout.Column = 2;
app.ExtUI.SweepDurationsEditField.Value = 1;
if isempty(app.SignalParameter.Sweep.swDur)
    app.SignalParameter.Sweep.swDur = app.ExtUI.SweepDurationsEditField.Value;
else
    app.ExtUI.SweepDurationsEditField.Value = app.SignalParameter.Sweep.swDur;
end

% Create DurationofsilencesEditFieldLabel
app.ExtUI.DurationofsilencesEditFieldLabel = uilabel(app.ExtUI.GridSweep);
app.ExtUI.DurationofsilencesEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.DurationofsilencesEditFieldLabel.WordWrap = 'on';
app.ExtUI.DurationofsilencesEditFieldLabel.Layout.Row = 2;
app.ExtUI.DurationofsilencesEditFieldLabel.Layout.Column = 1;
app.ExtUI.DurationofsilencesEditFieldLabel.Text = 'Duration of silence (s)';

% Create SweepDurationofsilencesEditField
app.ExtUI.SweepDurationofsilencesEditField = uieditfield(app.ExtUI.GridSweep, 'numeric');
app.ExtUI.SweepDurationofsilencesEditField.ValueChangedFcn = {@SweepParameterChanged,app};
app.ExtUI.SweepDurationofsilencesEditField.Limits = [0 14.5];
app.ExtUI.SweepDurationofsilencesEditField.Layout.Row = 2;
app.ExtUI.SweepDurationofsilencesEditField.Layout.Column = 2;
app.ExtUI.SweepDurationofsilencesEditField.Value = 0.5;
if isempty(app.SignalParameter.Sweep.silDur)
    app.SignalParameter.Sweep.silDur = app.ExtUI.SweepDurationofsilencesEditField.Value;
else
    app.ExtUI.SweepDurationofsilencesEditField.Value = app.SignalParameter.Sweep.silDur;
end

% Create InitialfrequencyHzEditFieldLabel
app.ExtUI.InitialfrequencyHzEditFieldLabel = uilabel(app.ExtUI.GridSweep);
app.ExtUI.InitialfrequencyHzEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.InitialfrequencyHzEditFieldLabel.WordWrap = 'on';
app.ExtUI.InitialfrequencyHzEditFieldLabel.Layout.Row = 3;
app.ExtUI.InitialfrequencyHzEditFieldLabel.Layout.Column = 1;
app.ExtUI.InitialfrequencyHzEditFieldLabel.Text = 'Initial frequency (Hz)';

% Create SweepInitialfrequencyHzEditField
app.ExtUI.SweepInitialfrequencyHzEditField = uieditfield(app.ExtUI.GridSweep, 'numeric');
app.ExtUI.SweepInitialfrequencyHzEditField.ValueChangedFcn = {@SweepParameterChanged,app};
app.ExtUI.SweepInitialfrequencyHzEditField.Limits = [10 Inf];
app.ExtUI.SweepInitialfrequencyHzEditField.RoundFractionalValues = 'on';
app.ExtUI.SweepInitialfrequencyHzEditField.ValueDisplayFormat = '%d';
app.ExtUI.SweepInitialfrequencyHzEditField.Layout.Row = 4;
app.ExtUI.SweepInitialfrequencyHzEditField.Layout.Column = 1;
app.ExtUI.SweepInitialfrequencyHzEditField.Value = 10;
if isempty(app.SignalParameter.Sweep.init)
    app.SignalParameter.Sweep.init = app.ExtUI.SweepInitialfrequencyHzEditField.Value;
else
    app.ExtUI.SweepInitialfrequencyHzEditField.Value = app.SignalParameter.Sweep.init;
end

% Create EndfrequencyHzEditFieldLabel
app.ExtUI.EndfrequencyHzEditFieldLabel = uilabel(app.ExtUI.GridSweep);
app.ExtUI.EndfrequencyHzEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.EndfrequencyHzEditFieldLabel.WordWrap = 'on';
app.ExtUI.EndfrequencyHzEditFieldLabel.Layout.Row = 3;
app.ExtUI.EndfrequencyHzEditFieldLabel.Layout.Column = 2;
app.ExtUI.EndfrequencyHzEditFieldLabel.Text = 'End frequency (Hz)';

% Create SweepEndfrequencyHzEditField
app.ExtUI.SweepEndfrequencyHzEditField = uieditfield(app.ExtUI.GridSweep, 'numeric');
app.ExtUI.SweepEndfrequencyHzEditField.ValueChangedFcn = {@SweepParameterChanged,app};
app.ExtUI.SweepEndfrequencyHzEditField.Limits = [10 Inf];
app.ExtUI.SweepEndfrequencyHzEditField.RoundFractionalValues = 'on';
app.ExtUI.SweepEndfrequencyHzEditField.ValueDisplayFormat = '%d';
app.ExtUI.SweepEndfrequencyHzEditField.Layout.Row = 4;
app.ExtUI.SweepEndfrequencyHzEditField.Layout.Column = 2;
app.ExtUI.SweepEndfrequencyHzEditField.Value = 22000;
if isempty(app.SignalParameter.Sweep.end)
    app.SignalParameter.Sweep.end = app.ExtUI.SweepEndfrequencyHzEditField.Value;
else
    app.ExtUI.SweepEndfrequencyHzEditField.Value = app.SignalParameter.Sweep.end;
end


end
function SweepParameterChanged(~,~,app)
app.SignalParameter.Sweep.swDur = app.ExtUI.SweepDurationsEditField.Value;
app.SignalParameter.Sweep.silDur = app.ExtUI.SweepDurationofsilencesEditField.Value;
app.SignalParameter.Sweep.init = app.ExtUI.SweepInitialfrequencyHzEditField.Value;
app.SignalParameter.Sweep.end = app.ExtUI.SweepEndfrequencyHzEditField.Value;

end