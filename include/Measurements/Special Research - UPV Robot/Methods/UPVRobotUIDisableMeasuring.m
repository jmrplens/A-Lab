function UPVRobotUIDisableMeasuring(app,state)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

if state == 1
    status = 'on';
else
    status = 'off';
end
% Folder
app.ExtUI.UPVRobotPathtosavedataPanel.Enable = status;
% Device
app.ExtUI.UPVRobotDevicechannelsPanel.Enable = status;
% Coords
app.ExtUI.UPVRobotLeftPanelMeasurementPoints.Enable = status;
% Gen Coords
app.ExtUI.UPVRobotGeneratemeasurementpointsButton.Enable = status;
% Route buttons
app.ExtUI.UPVRobotViewrobotrouteButton.Enable = status;
app.ExtUI.UPVRobotOptimizerouteButton.Enable = status;
% Restricted area panel
app.ExtUI.UPVRobotRestrictedareaPanel.Enable = status;
% Signal panel
app.ExtUI.SignalparametersPanel.Enable = status;