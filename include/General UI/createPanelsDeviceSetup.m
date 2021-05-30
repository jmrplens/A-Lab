function createPanelsDeviceSetup(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Delete content
delete(app.LeftPanel.Children)
delete(app.CenterPanel.Children)
delete(app.RightPanel.Children)

% Create content
createPanelHardware(app)
createPanelLatencyCalibration(app)
createPanelCalibration(app)

createPanelInformation(app,app.ExtUI.RightMainPanelCalibration.Parent,4,1)
end