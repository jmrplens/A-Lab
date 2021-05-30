function UPVRobotPostProcessResultsFor(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Load
if ~isempty(app.ExtVar.UPVRobotPostProcess.ResultType)
    % Loading info
    d = uiprogressdlg(app.ALabUIFigure,'Title','Loading',...
        'Indeterminate','on');
    
    switch lower(app.ExtVar.UPVRobotPostProcess.ResultType)
        case 'frequency'
            createPanelUPVRobotPostProcessFrequencyTabs(app)
        case 'time'
            createPanelUPVRobotPostProcessTimeTabs(app)
        case 'directivity'
            createPanelUPVRobotPostProcessDirectivityTabs(app)
    end
    
    % Close info
    pause(0.5)
    close(d)
end

