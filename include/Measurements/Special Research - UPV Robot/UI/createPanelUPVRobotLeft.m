function createPanelUPVRobotLeft(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Left column
column = leftGrid(app,{'1x'},{'1x'});

% Create UPVRobotLeftPanel
app.ExtUI.UPVRobotLeftPanel = uipanel(column);
app.ExtUI.UPVRobotLeftPanel.BorderType = 'none';
app.ExtUI.UPVRobotLeftPanel.TitlePosition = 'centertop';
app.ExtUI.UPVRobotLeftPanel.Title = 'Anechoic chamber - (X,Y,Z) Robot';
app.ExtUI.UPVRobotLeftPanel.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotLeftPanel.Layout.Row = 1;
app.ExtUI.UPVRobotLeftPanel.Layout.Column = 1;
app.ExtUI.UPVRobotLeftPanel.FontWeight = 'bold';
app.ExtUI.UPVRobotLeftPanel.FontSize = 14;

% Create GridUPVRobotLeftPanel
app.ExtUI.GridUPVRobotLeftPanel = uigridlayout(app.ExtUI.UPVRobotLeftPanel);
app.ExtUI.GridUPVRobotLeftPanel.ColumnWidth = {'1x'};
app.ExtUI.GridUPVRobotLeftPanel.RowHeight = {'fit', 'fit', 'fit', 'fit', 'fit'};
app.ExtUI.GridUPVRobotLeftPanel.RowSpacing = 8;
app.ExtUI.GridUPVRobotLeftPanel.BackgroundColor = [1 1 1];

% Create UPVRobotInfo
app.ExtUI.UPVRobotInfo = uilabel(app.ExtUI.GridUPVRobotLeftPanel);
app.ExtUI.UPVRobotInfo.WordWrap = 'on';
app.ExtUI.UPVRobotInfo.Layout.Row = 1;
app.ExtUI.UPVRobotInfo.Layout.Column = 1;
app.ExtUI.UPVRobotInfo.Text = {'· This method uses a 3-axis robot located in the anechoic chamber of the Higher Polytechnic School of Gandia.';...
    '· A map of measurement points is generated to obtain the impulse response at each point.';...
    '· Impulse responses and all coordinates are stored in text files at the chosen location.';...
    '· Limitation of this robot: It cannot measure points in Z above the restricted area.'};

% Create UPVRobotPathtosavedataPanel
app.ExtUI.UPVRobotPathtosavedataPanel = uipanel(app.ExtUI.GridUPVRobotLeftPanel);
app.ExtUI.UPVRobotPathtosavedataPanel.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPathtosavedataPanel.Title = 'Project folder';
app.ExtUI.UPVRobotPathtosavedataPanel.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotPathtosavedataPanel.Layout.Row = 2;
app.ExtUI.UPVRobotPathtosavedataPanel.Layout.Column = 1;
app.ExtUI.UPVRobotPathtosavedataPanel.FontAngle = 'italic';
app.ExtUI.UPVRobotPathtosavedataPanel.FontWeight = 'bold';

% Create GridUPVRobotPathtosavedataPanel
app.ExtUI.GridUPVRobotPathtosavedataPanel = uigridlayout(app.ExtUI.UPVRobotPathtosavedataPanel);
app.ExtUI.GridUPVRobotPathtosavedataPanel.ColumnWidth = {'1x'};
app.ExtUI.GridUPVRobotPathtosavedataPanel.RowHeight = {'fit', '1x'};
app.ExtUI.GridUPVRobotPathtosavedataPanel.BackgroundColor = [0.9412 0.9412 0.9412];

% Create UPVRobotPathtosavedataPanelSelectbutton
app.ExtUI.UPVRobotPathtosavedataPanelSelectbutton = uibutton(app.ExtUI.GridUPVRobotPathtosavedataPanel, 'push');
app.ExtUI.UPVRobotPathtosavedataPanelSelectbutton.ButtonPushedFcn = {@UPVRobotPathpushed,app};
app.ExtUI.UPVRobotPathtosavedataPanelSelectbutton.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPathtosavedataPanelSelectbutton.FontWeight = 'bold';
app.ExtUI.UPVRobotPathtosavedataPanelSelectbutton.Layout.Row = 1;
app.ExtUI.UPVRobotPathtosavedataPanelSelectbutton.Layout.Column = 1;
app.ExtUI.UPVRobotPathtosavedataPanelSelectbutton.Text = 'Select path';

% Create UPVRobotPathtosavedataPanelPathlabel
app.ExtUI.UPVRobotPathtosavedataPanelPathlabel = uilabel(app.ExtUI.GridUPVRobotPathtosavedataPanel);
app.ExtUI.UPVRobotPathtosavedataPanelPathlabel.Layout.Row = 2;
app.ExtUI.UPVRobotPathtosavedataPanelPathlabel.Layout.Column = 1;
app.ExtUI.UPVRobotPathtosavedataPanelPathlabel.Text = 'Please select a folder';

% Create UPVRobotDevicechannelsPanel
app.ExtUI.UPVRobotDevicechannelsPanel = uipanel(app.ExtUI.GridUPVRobotLeftPanel);
app.ExtUI.UPVRobotDevicechannelsPanel.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotDevicechannelsPanel.BorderType = 'none';
app.ExtUI.UPVRobotDevicechannelsPanel.Title = 'Audio device channels';
app.ExtUI.UPVRobotDevicechannelsPanel.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotDevicechannelsPanel.Layout.Row = 3;
app.ExtUI.UPVRobotDevicechannelsPanel.Layout.Column = 1;
app.ExtUI.UPVRobotDevicechannelsPanel.FontAngle = 'italic';
app.ExtUI.UPVRobotDevicechannelsPanel.FontWeight = 'bold';

% Create GridUPVRobotDevicechannelsPanel
app.ExtUI.GridUPVRobotDevicechannelsPanel = uigridlayout(app.ExtUI.UPVRobotDevicechannelsPanel);
app.ExtUI.GridUPVRobotDevicechannelsPanel.RowHeight = {'fit'};
app.ExtUI.GridUPVRobotDevicechannelsPanel.Padding = [10 5 10 10];
app.ExtUI.GridUPVRobotDevicechannelsPanel.BackgroundColor = [1 1 1];

% Create UPVRobotOutputChPanel
app.ExtUI.UPVRobotOutputChPanel = uipanel(app.ExtUI.GridUPVRobotDevicechannelsPanel);
app.ExtUI.UPVRobotOutputChPanel.Title = 'Output channel';
app.ExtUI.UPVRobotOutputChPanel.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotOutputChPanel.Layout.Row = 1;
app.ExtUI.UPVRobotOutputChPanel.Layout.Column = 1;

% Create UPVRobotOutputChGrid
app.ExtUI.UPVRobotOutputChGrid = uigridlayout(app.ExtUI.UPVRobotOutputChPanel);
app.ExtUI.UPVRobotOutputChGrid.ColumnWidth = {'1x'};
app.ExtUI.UPVRobotOutputChGrid.RowHeight = {'fit'};
app.ExtUI.UPVRobotOutputChGrid.BackgroundColor = [1 1 1];

% Get channels
if isempty(app.Device)
    delete(app.RightPanel.Children);
    errordlg('Please, select the audio device first.')
    return;
else
    [Nin,Nout] = getAvailableChannels(app);
end

% Create UPVRobotSpeakerDropDown
app.ExtUI.UPVRobotSpeakerDropDown = uidropdown(app.ExtUI.UPVRobotOutputChGrid);
app.ExtUI.UPVRobotSpeakerDropDown.ValueChangedFcn = {@UPVRobotParameterChanged,app};
app.ExtUI.UPVRobotSpeakerDropDown.Items = string(1:Nout);
app.ExtUI.UPVRobotSpeakerDropDown.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotSpeakerDropDown.Layout.Row = 1;
app.ExtUI.UPVRobotSpeakerDropDown.Layout.Column = 1;
app.ExtUI.UPVRobotSpeakerDropDown.Value = '1';
if ~isempty(app.ExtVar.UPVRobot.OutCh)
    app.ExtUI.UPVRobotSpeakerDropDown.Value = num2str(app.ExtVar.UPVRobot.OutCh);
else
    app.ExtVar.UPVRobot.OutCh = str2double(app.ExtUI.UPVRobotSpeakerDropDown.Value);
end

% Create UPVRobotInputChPanel
app.ExtUI.UPVRobotInputChPanel = uipanel(app.ExtUI.GridUPVRobotDevicechannelsPanel);
app.ExtUI.UPVRobotInputChPanel.Title = 'Input Channel';
app.ExtUI.UPVRobotInputChPanel.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotInputChPanel.Layout.Row = 1;
app.ExtUI.UPVRobotInputChPanel.Layout.Column = 2;

% Create UPVRobotInputChGrid
app.ExtUI.UPVRobotInputChGrid = uigridlayout(app.ExtUI.UPVRobotInputChPanel);
app.ExtUI.UPVRobotInputChGrid.ColumnWidth = {'1x'};
app.ExtUI.UPVRobotInputChGrid.RowHeight = {'fit'};
app.ExtUI.UPVRobotInputChGrid.BackgroundColor = [1 1 1];

% Create UPVRobotMicDropDown
app.ExtUI.UPVRobotMicDropDown = uidropdown(app.ExtUI.UPVRobotInputChGrid);
app.ExtUI.UPVRobotMicDropDown.ValueChangedFcn = {@UPVRobotParameterChanged,app};
app.ExtUI.UPVRobotMicDropDown.Items = string(1:Nin);
app.ExtUI.UPVRobotMicDropDown.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotMicDropDown.Layout.Row = 1;
app.ExtUI.UPVRobotMicDropDown.Layout.Column = 1;
app.ExtUI.UPVRobotMicDropDown.Value = '1';
if ~isempty(app.ExtVar.UPVRobot.InCh)
    app.ExtUI.UPVRobotMicDropDown.Value = num2str(app.ExtVar.UPVRobot.InCh);
else
    app.ExtVar.UPVRobot.InCh = str2double(app.ExtUI.UPVRobotMicDropDown.Value);
end

% =================================================================================
% Create panel for make coords
createPanelCoordsUPVRobot(app)

% Create UPVRobotUPVRobotGeneratemeasurementpointsButton
app.ExtUI.UPVRobotGeneratemeasurementpointsButton = uibutton(app.ExtUI.GridUPVRobotLeftPanel, 'push');
app.ExtUI.UPVRobotGeneratemeasurementpointsButton.FontWeight = 'bold';
app.ExtUI.UPVRobotGeneratemeasurementpointsButton.ButtonPushedFcn = {@UPVRobotcallgenerate,app};
app.ExtUI.UPVRobotGeneratemeasurementpointsButton.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotGeneratemeasurementpointsButton.Layout.Row = 5;
app.ExtUI.UPVRobotGeneratemeasurementpointsButton.Layout.Column = 1;
app.ExtUI.UPVRobotGeneratemeasurementpointsButton.Text = 'Generate measurement points';
app.ExtUI.UPVRobotGeneratemeasurementpointsButton.Enable = 'off';

% Logic for path
if ~isempty(app.ExtVar.UPVRobot.FolderPath) % If path
    if exist(app.ExtVar.UPVRobot.FolderPath,'dir')
        folders=regexp(app.ExtVar.UPVRobot.FolderPath,filesep,'split');
        app.ExtUI.UPVRobotPathtosavedataPanelPathlabel.Text = ['Path: ..',filesep,folders{end},filesep];
        app.ExtUI.UPVRobotGeneratemeasurementpointsButton.Enable = 'on';
    end
end

function UPVRobotcallgenerate(~,~,app)
app.ExtVar.UPVRobot.Resumed = 0;
UPVRobotGenerateMeasurementPoints(app)


function UPVRobotParameterChanged(~,~,app)
% Channels
app.ExtVar.UPVRobot.InCh = str2double(app.ExtUI.UPVRobotMicDropDown.Value);
app.ExtVar.UPVRobot.OutCh = str2double(app.ExtUI.UPVRobotSpeakerDropDown.Value);


function UPVRobotPathpushed(~,~,app)
selpath = uigetdir(app.RootPath,'Project folder');
if selpath~=0
    folders=regexp(selpath,filesep,'split');
    app.ExtUI.UPVRobotPathtosavedataPanelPathlabel.Text = ['Path: ..',filesep,folders{end},filesep];
    app.ExtVar.UPVRobot.FolderPath = selpath;
    app.ExtUI.UPVRobotGeneratemeasurementpointsButton.Enable = 'on';
    app.ExtUI.UPVRobotRestrictCheckBox.Enable = 'on';
    
    % Check and load if exist a previous measure
    UPVRobotResumeMeasure(app);
end


