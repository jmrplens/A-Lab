function createPanelMLS(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Initialize
if ~isfield(app.SignalParameter,'MLS')
    app.SignalParameter.MLS = struct('Dur',[],'nseq',[]);
end

app.ExtUI.SignalSelectedPanel.Title = 'MLS';

% Create GridMLS
app.ExtUI.GridMLS = uigridlayout(app.ExtUI.SignalSelectedPanel);
app.ExtUI.GridMLS.RowHeight = {'fit', 'fit', 'fit'};
app.ExtUI.GridMLS.BackgroundColor = [1 1 1];

% Create DurationsonesequenceLabel
app.ExtUI.DurationsonesequenceLabel = uilabel(app.ExtUI.GridMLS);
app.ExtUI.DurationsonesequenceLabel.HorizontalAlignment = 'right';
app.ExtUI.DurationsonesequenceLabel.WordWrap = 'on';
app.ExtUI.DurationsonesequenceLabel.Layout.Row = 1;
app.ExtUI.DurationsonesequenceLabel.Layout.Column = 1;
app.ExtUI.DurationsonesequenceLabel.Text = {'Duration (s)'; '(one sequence)'};

% Create MLSDurationEditField
app.ExtUI.MLSDurationEditField = uieditfield(app.ExtUI.GridMLS, 'numeric');
app.ExtUI.MLSDurationEditField.ValueChangedFcn = {@MLSParameterChanged,app};
app.ExtUI.MLSDurationEditField.Limits = [0.5 536870912];
app.ExtUI.MLSDurationEditField.Layout.Row = 1;
app.ExtUI.MLSDurationEditField.Layout.Column = 2;
app.ExtUI.MLSDurationEditField.Value = 1;
if isempty(app.SignalParameter.MLS.Dur)
    app.SignalParameter.MLS.Dur = app.ExtUI.MLSDurationEditField.Value;
else
    app.ExtUI.MLSDurationEditField.Value = app.SignalParameter.MLS.Dur;
end

% Create SequencesLabel
app.ExtUI.SequencesLabel = uilabel(app.ExtUI.GridMLS);
app.ExtUI.SequencesLabel.HorizontalAlignment = 'right';
app.ExtUI.SequencesLabel.WordWrap = 'on';
app.ExtUI.SequencesLabel.Layout.Row = 2;
app.ExtUI.SequencesLabel.Layout.Column = 1;
app.ExtUI.SequencesLabel.Text = 'Sequences';

% Create MLSSequencesEditField
app.ExtUI.MLSSequencesEditField = uieditfield(app.ExtUI.GridMLS, 'numeric');
app.ExtUI.MLSSequencesEditField.ValueChangedFcn = {@MLSParameterChanged,app};
app.ExtUI.MLSSequencesEditField.Limits = [2 Inf];
app.ExtUI.MLSSequencesEditField.RoundFractionalValues = 'on';
app.ExtUI.MLSSequencesEditField.ValueDisplayFormat = '%d';
app.ExtUI.MLSSequencesEditField.Layout.Row = 2;
app.ExtUI.MLSSequencesEditField.Layout.Column = 2;
app.ExtUI.MLSSequencesEditField.Value = 3;
if isempty(app.SignalParameter.MLS.nseq)
    app.SignalParameter.MLS.nseq = app.ExtUI.MLSSequencesEditField.Value;
else
    app.ExtUI.MLSSequencesEditField.Value = app.SignalParameter.MLS.nseq;
end

% Create AsilenceofthedurationofasequenceisaddedtotheendofthesignalLabel
app.ExtUI.AsilenceofthedurationofasequenceisaddedtotheendofthesignalLabel = uilabel(app.ExtUI.GridMLS);
app.ExtUI.AsilenceofthedurationofasequenceisaddedtotheendofthesignalLabel.WordWrap = 'on';
app.ExtUI.AsilenceofthedurationofasequenceisaddedtotheendofthesignalLabel.FontSize = 10;
app.ExtUI.AsilenceofthedurationofasequenceisaddedtotheendofthesignalLabel.Layout.Row = 3;
app.ExtUI.AsilenceofthedurationofasequenceisaddedtotheendofthesignalLabel.Layout.Column = [1 2];
app.ExtUI.AsilenceofthedurationofasequenceisaddedtotheendofthesignalLabel.Text = '*A silence of the duration of a sequence is added to the end of the signal.';

end
function MLSParameterChanged(~,~,app)
app.SignalParameter.MLS.Dur = app.ExtUI.MLSDurationEditField.Value;
app.SignalParameter.MLS.nseq = app.ExtUI.MLSSequencesEditField.Value;

end