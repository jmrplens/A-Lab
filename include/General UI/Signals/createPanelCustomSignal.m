function createPanelCustomSignal(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Initialize
if ~isfield(app.SignalParameter,'Custom')
    app.SignalParameter.Custom = struct('Path',[]);
end

app.ExtUI.SignalSelectedPanel.Title = 'Custom Signal';

% Create GridCustomSignal
app.ExtUI.GridCustomSignal = uigridlayout(app.ExtUI.SignalSelectedPanel);
app.ExtUI.GridCustomSignal.ColumnWidth = {'1x', '1x', '1x'};
app.ExtUI.GridCustomSignal.RowHeight = {'fit', 'fit', 'fit'};
app.ExtUI.GridCustomSignal.BackgroundColor = [1 1 1];

% Create CustomSignalInfo
app.ExtUI.CustomSignalInfo = uilabel(app.ExtUI.GridCustomSignal);
app.ExtUI.CustomSignalInfo.WordWrap = 'on';
app.ExtUI.CustomSignalInfo.Layout.Row = 1;
app.ExtUI.CustomSignalInfo.Layout.Column = [1 3];
app.ExtUI.CustomSignalInfo.Text = 'Select a text file that contains the signal in one column.';

% Create CustomSignalSelectButton
app.ExtUI.CustomSignalSelectButton = uibutton(app.ExtUI.GridCustomSignal, 'push');
app.ExtUI.CustomSignalSelectButton.ButtonPushedFcn = {@customSignalSelectedButton,app};
app.ExtUI.CustomSignalSelectButton.Layout.Row = 2;
app.ExtUI.CustomSignalSelectButton.Layout.Column = 1;
app.ExtUI.CustomSignalSelectButton.Text = 'Select';

% Create CustomSignalPathLabel
app.ExtUI.CustomSignalPathLabel = uilabel(app.ExtUI.GridCustomSignal);
app.ExtUI.CustomSignalPathLabel.Layout.Row = 2;
app.ExtUI.CustomSignalPathLabel.WordWrap = 'on';
app.ExtUI.CustomSignalPathLabel.Layout.Column = [2 3];
app.ExtUI.CustomSignalPathLabel.Text = '//Path';
if isempty(app.SignalParameter.Custom.Path)
    app.ExtUI.CustomSignalPathLabel.Text = 'Not selected';
else
    app.ExtUI.CustomSignalPathLabel.Text = app.SignalParameter.Custom.Path;
end

% Create CustomSignalWarningLabel
app.ExtUI.CustomSignalWarningLabel = uilabel(app.ExtUI.GridCustomSignal);
app.ExtUI.CustomSignalWarningLabel.Layout.Row = 3;
app.ExtUI.CustomSignalWarningLabel.Layout.Column = [1 3];
if isempty(app.SignalParameter.Custom.Path)
    app.ExtUI.CustomSignalWarningLabel.Text = '';
else
    % Load for get duration
    folders=regexp(app.SignalParameter.Custom.Path,filesep,'split');
    app.ExtUI.CustomSignalPathLabel.Text = ['Path: ..',filesep,folders{end-1},filesep,folders{end}];
    try
        signal = load(app.SignalParameter.Custom.Path);
        signal = signal{:,1};
    catch
        try
            signal = readtable(app.SignalParameter.Custom.Path);
            signal = signal{:,1};
        catch
            app.ExtUI.CustomSignalPathLabel.Text = ['[ERROR] ',app.SignalParameter.Custom.Path];
            app.ExtUI.CustomSignalWarningLabel.Text = 'Please, select a file that contains the signal in one column.';
            return;
        end
    end
    if ~isnumeric(signal)
        app.ExtUI.CustomSignalPathLabel.Text = ['[ERROR] ',app.SignalParameter.Custom.Path];
        app.ExtUI.CustomSignalWarningLabel.Text = 'The column inside text is not numeric, select another file.';
        return;
    end
    time = (length(signal)+1)/app.SampleRate;
    app.ExtUI.CustomSignalWarningLabel.Text = sprintf('Signal samples: %d. Signal duration: %.1f s.',length(signal),time);
end

function customSignalSelectedButton(~,~,app)

% Select file
[FileName,PathName] = uigetfile({[app.RootPath,filesep,'*.txt']},'Select text file (.txt)');

% File path
app.SignalParameter.Custom.Path = [PathName,FileName];

% Print path
folders=regexp(PathName(1:end-1),filesep,'split');
app.ExtUI.CustomSignalPathLabel.Text = ['Path: ..',filesep,folders{end},filesep,FileName];

% Load for get duration
try
    signal = load([PathName,FileName]);
    signal = signal{:,1};
catch
    try
        signal = readtable([PathName,FileName]);
        signal = signal{:,1};
    catch
        app.ExtUI.CustomSignalPathLabel.Text = ['[ERROR] ',app.SignalParameter.Custom.Path];
        app.ExtUI.CustomSignalWarningLabel.Text = 'Please, select a file that contains the signal in one column.';
        return;
    end
end
if ~isnumeric(signal)
    app.ExtUI.CustomSignalPathLabel.Text = ['[ERROR] ',app.SignalParameter.Custom.Path];
    app.ExtUI.CustomSignalWarningLabel.Text = 'The column inside text is not numeric, select another file.';
    return;
end
time = (length(signal)+1)/app.SampleRate;
app.ExtUI.CustomSignalWarningLabel.Text = sprintf('Signal samples: %d. Signal duration: %.1f s.',length(signal),time);