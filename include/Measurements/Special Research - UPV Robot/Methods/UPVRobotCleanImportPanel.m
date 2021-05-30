function UPVRobotCleanImportPanel(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

app.ExtUI.UPVRobotImportFileNameLabel.Text = '';
app.ExtUI.UPVRobotImportCheckErrorInfo.Text = '';

app.ExtUI.UPVRobotImportXmin.Value = 0;
app.ExtUI.UPVRobotImportYmin.Value = 0;
app.ExtUI.UPVRobotImportZmin.Value = 0;

app.ExtUI.UPVRobotImportXmax.Value = 0;
app.ExtUI.UPVRobotImportYmax.Value = 0;
app.ExtUI.UPVRobotImportZmax.Value = 0;