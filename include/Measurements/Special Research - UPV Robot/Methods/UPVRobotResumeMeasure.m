function UPVRobotResumeMeasure(app)
% This function check if exist a previous measure for resume
%
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Iteration file
pathIter = [app.ExtVar.UPVRobot.FolderPath,filesep,'iter.bak'];

% Configuration/info measure file
pathConf = [app.ExtVar.UPVRobot.FolderPath,filesep,'measure.dat'];


if exist(pathIter,'file') && exist(pathConf,'file')
    
    msg = 'A previous unfinished measurement has been found in the folder, do you want to take it back?';
    title = 'Resume measure';
    selection = uiconfirm(app.ALabUIFigure,msg,title,...
        'Options',{'Yes','Cancel'},...
        'DefaultOption',2,'CancelOption',2);
    if strcmp(selection,'Cancel')
        app.ExtVar.UPVRobot.Resumed = 0;
        return; 
    end
    
    % Loading info
    d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
        'Indeterminate','on');
    
    UPVRobotMeasureInfo(app,'load');
    app.ExtVar.UPVRobot.Resumed = 1;
    
    % ====================================================
    % Load measure with imported parameters
    % Left
    %delete(app.LeftPanel.Children);
    createPanelUPVRobotLeft(app)
    % Center
    %delete(app.CenterPanel.Children);
    createPanelUPVRobotCenter(app)
    % Set signal
    app.ExtUI.SignaltypeDropDown.Value = app.TypeSignal;
    switchSignal(app)
    % Add Robot info panel
    createPanelInfoUPVRobot(app)
    
    % Others
    app.ExtUI.UPVRobotGeneratemeasurementpointsButton.Enable = 'on';
    app.ExtUI.UPVRobotRestrictCheckBox.Enable = 'on';
    UPVRobotGenerateMeasurementPoints(app)
    app.ExtUI.StartmeasureButton.Enable = 'on';
    app.ExtUI.StartmeasureButton.Text = 'Resume measure';
    
    drawnow
    % =======================================================
    % Check connection with robot
    UPVRobotCheckConnection(app);
    
    pause(0.5)
    close(d)
    
else
    app.ExtVar.UPVRobot.Resumed = 0;
    app.ExtUI.StartmeasureButton.Text = 'Start measure';
end


