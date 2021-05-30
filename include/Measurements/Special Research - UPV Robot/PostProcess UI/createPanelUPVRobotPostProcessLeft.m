function createPanelUPVRobotPostProcessLeft(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Left column
column = leftGrid(app,{'1x'},{'1x'});

% Create UPVRobotPostProcessLeftPanel
app.ExtUI.UPVRobotPostProcessLeftPanel = uipanel(column);
app.ExtUI.UPVRobotPostProcessLeftPanel.BorderType = 'none';
app.ExtUI.UPVRobotPostProcessLeftPanel.TitlePosition = 'centertop';
app.ExtUI.UPVRobotPostProcessLeftPanel.Title = '(X,Y,Z) Robot - Postprocessing';
app.ExtUI.UPVRobotPostProcessLeftPanel.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessLeftPanel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessLeftPanel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessLeftPanel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessLeftPanel.FontSize = 14;

% Create GridUPVRobotPostProcessLeftPanel
app.ExtUI.GridUPVRobotPostProcessLeftPanel = uigridlayout(app.ExtUI.UPVRobotPostProcessLeftPanel);
app.ExtUI.GridUPVRobotPostProcessLeftPanel.ColumnWidth = {'1x'};
app.ExtUI.GridUPVRobotPostProcessLeftPanel.RowHeight = {'fit', 'fit', 'fit', 'fit', 'fit', 'fit'};
app.ExtUI.GridUPVRobotPostProcessLeftPanel.BackgroundColor = [1 1 1];

% Create UPVRoboPostProcesstInfo
app.ExtUI.UPVRoboPostProcesstInfo = uilabel(app.ExtUI.GridUPVRobotPostProcessLeftPanel);
app.ExtUI.UPVRoboPostProcesstInfo.WordWrap = 'on';
app.ExtUI.UPVRoboPostProcesstInfo.Layout.Row = 1;
app.ExtUI.UPVRoboPostProcesstInfo.Layout.Column = 1;
app.ExtUI.UPVRoboPostProcesstInfo.Text = '· Postprocessing robot measure';

% ================================================================================================
% Folder panel
% Create UPVRobotPostProcessFolderPanel
app.ExtUI.UPVRobotPostProcessFolderPanel = uipanel(app.ExtUI.GridUPVRobotPostProcessLeftPanel);
app.ExtUI.UPVRobotPostProcessFolderPanel.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessFolderPanel.Title = 'Project folder';
app.ExtUI.UPVRobotPostProcessFolderPanel.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotPostProcessFolderPanel.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessFolderPanel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessFolderPanel.FontAngle = 'italic';
app.ExtUI.UPVRobotPostProcessFolderPanel.FontWeight = 'bold';

% Create UPVRobotPostProcessFolderGrid
app.ExtUI.UPVRobotPostProcessFolderGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessFolderPanel);
app.ExtUI.UPVRobotPostProcessFolderGrid.ColumnWidth = {'1x'};
app.ExtUI.UPVRobotPostProcessFolderGrid.RowHeight = {'fit', '1x'};
app.ExtUI.UPVRobotPostProcessFolderGrid.BackgroundColor = [0.9412 0.9412 0.9412];

% Create UPVRobotPostProcessFolderButton
app.ExtUI.UPVRobotPostProcessFolderButton = uibutton(app.ExtUI.UPVRobotPostProcessFolderGrid, 'push');
app.ExtUI.UPVRobotPostProcessFolderButton.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessFolderButton.ButtonPushedFcn = {@UPVRobotPostProcessPathpushed,app};
app.ExtUI.UPVRobotPostProcessFolderButton.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessFolderButton.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFolderButton.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessFolderButton.Text = 'Select folder';

% Create UPVRobotPostProcessFolderLabel
app.ExtUI.UPVRobotPostProcessFolderLabel = uilabel(app.ExtUI.UPVRobotPostProcessFolderGrid);
app.ExtUI.UPVRobotPostProcessFolderLabel.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessFolderLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessFolderLabel.Text = 'Please select a folder';

% ================================================================================================
% Show results panel
% Create UPVRobotPostProcessShowResultsPanel
app.ExtUI.UPVRobotPostProcessShowResultsPanel = uipanel(app.ExtUI.GridUPVRobotPostProcessLeftPanel);
app.ExtUI.UPVRobotPostProcessShowResultsPanel.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessShowResultsPanel.Title = 'Show results for:';
app.ExtUI.UPVRobotPostProcessShowResultsPanel.BackgroundColor = [1 0.4118 0.1608];
app.ExtUI.UPVRobotPostProcessShowResultsPanel.Layout.Row = 5;
app.ExtUI.UPVRobotPostProcessShowResultsPanel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessShowResultsPanel.FontAngle = 'italic';
app.ExtUI.UPVRobotPostProcessShowResultsPanel.FontWeight = 'bold';

% Create UPVRobotPostProcessShowResultsGrid
app.ExtUI.UPVRobotPostProcessShowResultsGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessShowResultsPanel);
app.ExtUI.UPVRobotPostProcessShowResultsGrid.ColumnWidth = {'1x', 'fit', '1x'};
app.ExtUI.UPVRobotPostProcessShowResultsGrid.RowHeight = {'fit', 'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessShowResultsGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessFrequencydomainButton
app.ExtUI.UPVRobotPostProcessFrequencydomainButton = uibutton(app.ExtUI.UPVRobotPostProcessShowResultsGrid, 'push');
app.ExtUI.UPVRobotPostProcessFrequencydomainButton.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessFrequencydomainButton.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessFrequencydomainButton.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFrequencydomainButton.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessFrequencydomainButton.Text = 'Frequency domain';
app.ExtUI.UPVRobotPostProcessFrequencydomainButton.ButtonPushedFcn = {@UPVRobotPostProcessFreqDomainpushed,app};

% Create UPVRobotPostProcessTimedomainButton
app.ExtUI.UPVRobotPostProcessTimedomainButton = uibutton(app.ExtUI.UPVRobotPostProcessShowResultsGrid, 'push');
app.ExtUI.UPVRobotPostProcessTimedomainButton.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessTimedomainButton.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessTimedomainButton.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessTimedomainButton.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessTimedomainButton.Text = 'Time domain';
app.ExtUI.UPVRobotPostProcessTimedomainButton.ButtonPushedFcn = {@UPVRobotPostProcessTimeDomainpushed,app};

% Create UPVRobotPostProcessDirectivityButton
app.ExtUI.UPVRobotPostProcessDirectivityButton = uibutton(app.ExtUI.UPVRobotPostProcessShowResultsGrid, 'push');
app.ExtUI.UPVRobotPostProcessDirectivityButton.ButtonPushedFcn = {@UPVRobotPostProcessDirectivitypushed,app};
app.ExtUI.UPVRobotPostProcessDirectivityButton.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessDirectivityButton.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessDirectivityButton.Visible = 'on';
app.ExtUI.UPVRobotPostProcessDirectivityButton.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessDirectivityButton.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessDirectivityButton.Text = 'Directivity';

app.ExtUI.UPVRobotPostProcessFrequencydomainButton.Enable = 'off';
app.ExtUI.UPVRobotPostProcessTimedomainButton.Enable = 'off';
app.ExtUI.UPVRobotPostProcessDirectivityButton.Enable = 'off';

% ================================================================================================
% Parallel panel
% Create UPVRobotPostProcessParallelcomputingPanel
app.ExtUI.UPVRobotPostProcessParallelcomputingPanel = uipanel(app.ExtUI.GridUPVRobotPostProcessLeftPanel);
app.ExtUI.UPVRobotPostProcessParallelcomputingPanel.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessParallelcomputingPanel.Title = 'Parallel computing';
app.ExtUI.UPVRobotPostProcessParallelcomputingPanel.BackgroundColor = [0.6353 0.0784 0.1843];
app.ExtUI.UPVRobotPostProcessParallelcomputingPanel.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessParallelcomputingPanel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessParallelcomputingPanel.FontAngle = 'italic';
app.ExtUI.UPVRobotPostProcessParallelcomputingPanel.FontWeight = 'bold';

% Create UPVRobotPostProcessParallelcomputingGrid
app.ExtUI.UPVRobotPostProcessParallelcomputingGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessParallelcomputingPanel);
app.ExtUI.UPVRobotPostProcessParallelcomputingGrid.ColumnWidth = {'1x'};
app.ExtUI.UPVRobotPostProcessParallelcomputingGrid.RowHeight = {'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessParallelcomputingGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessUsemullticoreparallelCheckBox
app.ExtUI.UPVRobotPostProcessUsemullticoreparallelCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessParallelcomputingGrid);
app.ExtUI.UPVRobotPostProcessUsemullticoreparallelCheckBox.Text = 'Use multicore / parallel';
app.ExtUI.UPVRobotPostProcessUsemullticoreparallelCheckBox.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessUsemullticoreparallelCheckBox.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessUsemullticoreparallelCheckBox.Value = 0;
app.ExtUI.UPVRobotPostProcessUsemullticoreparallelCheckBox.ValueChangedFcn = {@UPVRobotPostProcessParallelChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.Multicore)
    app.ExtUI.UPVRobotPostProcessUsemullticoreparallelCheckBox.Value = app.ExtVar.UPVRobotPostProcess.Multicore;
else
    app.ExtVar.UPVRobotPostProcess.Multicore = app.ExtUI.UPVRobotPostProcessUsemullticoreparallelCheckBox.Value;
end
% Create UPVRobotPostProcessParallelcomputingLabel
app.ExtUI.UPVRobotPostProcessParallelcomputingLabel = uilabel(app.ExtUI.UPVRobotPostProcessParallelcomputingGrid);
app.ExtUI.UPVRobotPostProcessParallelcomputingLabel.WordWrap = 'on';
app.ExtUI.UPVRobotPostProcessParallelcomputingLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessParallelcomputingLabel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessParallelcomputingLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessParallelcomputingLabel.Text = 'Use parallel for calculations and graphics';


% ================================================================================================
% Process data panel
% Create UPVRobotPostProcessProcessDataPanel
app.ExtUI.UPVRobotPostProcessProcessDataPanel = uipanel(app.ExtUI.GridUPVRobotPostProcessLeftPanel);
app.ExtUI.UPVRobotPostProcessProcessDataPanel.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessProcessDataPanel.Title = 'Process data';
app.ExtUI.UPVRobotPostProcessProcessDataPanel.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotPostProcessProcessDataPanel.Layout.Row = 4;
app.ExtUI.UPVRobotPostProcessProcessDataPanel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessProcessDataPanel.FontAngle = 'italic';
app.ExtUI.UPVRobotPostProcessProcessDataPanel.FontWeight = 'bold';

% Create UPVRobotPostProcessProcessDataGrid
app.ExtUI.UPVRobotPostProcessProcessDataGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessProcessDataPanel);
app.ExtUI.UPVRobotPostProcessProcessDataGrid.ColumnWidth = {'1x'};
app.ExtUI.UPVRobotPostProcessProcessDataGrid.RowHeight = {'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessProcessDataGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessProcessButton
app.ExtUI.UPVRobotPostProcessProcessButton = uibutton(app.ExtUI.UPVRobotPostProcessProcessDataGrid, 'push');
app.ExtUI.UPVRobotPostProcessProcessButton.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessProcessButton.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessProcessButton.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessProcessButton.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessProcessButton.Text = 'Process';
app.ExtUI.UPVRobotPostProcessProcessButton.Enable = 'off';
app.ExtUI.UPVRobotPostProcessProcessButton.ButtonPushedFcn = {@UPVRobotPostProcessProcesspushed,app};

% Create UPVRobotPostProcessRunInfo
app.ExtUI.UPVRobotPostProcessRunInfo = uilabel(app.ExtUI.UPVRobotPostProcessProcessDataGrid);
app.ExtUI.UPVRobotPostProcessRunInfo.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessRunInfo.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessRunInfo.FontColor = [0 0 0];
app.ExtUI.UPVRobotPostProcessRunInfo.Text = ' ';


% Logic for path
if ~isempty(app.ExtVar.UPVRobotPostProcess.FolderPath) % If path
    if exist(app.ExtVar.UPVRobotPostProcess.FolderPath,'dir')
        folders=regexp(app.ExtVar.UPVRobotPostProcess.FolderPath,filesep,'split');
        app.ExtUI.UPVRobotPostProcessFolderLabel.Text = ['Path: ..',filesep,folders{end},filesep];
        
        if exist([app.ExtVar.UPVRobotPostProcess.FolderPath,filesep,'measure.dat'],'file')
            app.ExtUI.UPVRobotPostProcessRunInfo.Text = 'Measurement data found.';
            app.ExtUI.UPVRobotPostProcessRunInfo.FontColor = [0,0.6,0];
            app.ExtUI.UPVRobotPostProcessProcessButton.Enable = 'on';
            UPVRobotMeasureInfo(app,'loadpostpro');
        else
            app.ExtUI.UPVRobotPostProcessRunInfo.Text = 'Measurement data NOT found.';
            app.ExtUI.UPVRobotPostProcessRunInfo.FontColor = [0.6,0,0];
            app.ExtUI.UPVRobotPostProcessProcessButton.Enable = 'off';
        end
    end
end

function UPVRobotPostProcessPathpushed(~,~,app)
selpath = uigetdir(app.RootPath,'Project folder');
if selpath~=0
    folders=regexp(selpath,filesep,'split');
    app.ExtUI.UPVRobotPostProcessFolderLabel.Text = ['Path: ..',filesep,folders{end},filesep];
    app.ExtVar.UPVRobotPostProcess.FolderPath = selpath;
    
    if exist([app.ExtVar.UPVRobotPostProcess.FolderPath,filesep,'measure.dat'],'file')
        app.ExtUI.UPVRobotPostProcessRunInfo.Text = 'Measurement data found.';
        app.ExtUI.UPVRobotPostProcessRunInfo.FontColor = [0,0.6,0];
        app.ExtUI.UPVRobotPostProcessProcessButton.Enable = 'on';
        UPVRobotMeasureInfo(app,'loadpostpro');
    else
        app.ExtUI.UPVRobotPostProcessRunInfo.Text = 'Measurement data NOT found.';
        app.ExtUI.UPVRobotPostProcessRunInfo.FontColor = [0.6,0,0];
        app.ExtUI.UPVRobotPostProcessProcessButton.Enable = 'off';
    end
end

function UPVRobotPostProcessProcesspushed(~,~,app)
UPVRobotPostProcessData(app)
% Clear plot data
app.ExtVar.UPVRobotPostProcess.PointsSPL_SingleFreq = [];
% Domain
UPVRobotPostProcessResultsFor(app)

function UPVRobotPostProcessFreqDomainpushed(~,~,app)
app.ExtVar.UPVRobotPostProcess.ResultType = 'Frequency';
UPVRobotPostProcessResultsFor(app)

function UPVRobotPostProcessTimeDomainpushed(~,~,app)
app.ExtVar.UPVRobotPostProcess.ResultType = 'Time';
UPVRobotPostProcessResultsFor(app)

function UPVRobotPostProcessDirectivitypushed(~,~,app)
app.ExtVar.UPVRobotPostProcess.ResultType = 'Directivity';
UPVRobotPostProcessResultsFor(app)

function UPVRobotPostProcessParallelChanged(~,~,app)
app.ExtVar.UPVRobotPostProcess.Multicore = app.ExtUI.UPVRobotPostProcessUsemullticoreparallelCheckBox.Value;
    p = gcp('nocreate');
if app.ExtVar.UPVRobotPostProcess.Multicore
    if ~isempty(p)
        return;
    else
        % Loading info
        d = uiprogressdlg(app.ALabUIFigure,'Title','Initializing...',...
            'Indeterminate','on');

        d.Title = 'Creating new parallel pool...';
        
        % Create parallel
        parpool('IdleTimeout',600);
        
        close(d)
    end
else
    if isempty(p)
        return;
    else
        % Loading info
        d = uiprogressdlg(app.ALabUIFigure,'Title','Stopping...',...
            'Indeterminate','on');
        % Stop parallel
        delete(gcp('nocreate'))
        
        close(d)
    end
    
end