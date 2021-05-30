function createPanelInfoUPVRobot(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Create UPVRobotandmeasuredetailsPanel
app.ExtUI.UPVRobotandmeasuredetailsPanel = uipanel(app.ExtUI.GridRightMain);
app.ExtUI.UPVRobotandmeasuredetailsPanel.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotandmeasuredetailsPanel.Title = 'Robot and measure details';
app.ExtUI.UPVRobotandmeasuredetailsPanel.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotandmeasuredetailsPanel.Layout.Row = 3;
app.ExtUI.UPVRobotandmeasuredetailsPanel.Layout.Column = 1;
app.ExtUI.UPVRobotandmeasuredetailsPanel.FontAngle = 'italic';
app.ExtUI.UPVRobotandmeasuredetailsPanel.FontWeight = 'bold';

% Create UPVGridInformation
app.ExtUI.UPVGridInformation = uigridlayout(app.ExtUI.UPVRobotandmeasuredetailsPanel);
app.ExtUI.UPVGridInformation.ColumnWidth = {'fit', '1x'};
app.ExtUI.UPVGridInformation.RowHeight = {'fit', '1x', '1x', 'fit', 'fit'};
app.ExtUI.UPVGridInformation.ColumnSpacing = 5;
app.ExtUI.UPVGridInformation.RowSpacing = 5;
app.ExtUI.UPVGridInformation.Padding = [5 5 5 5];
app.ExtUI.UPVGridInformation.BackgroundColor = [1 1 1];

% Create UPVRobotButtonPanelInfo
app.ExtUI.UPVRobotButtonPanelInfo = uibutton(app.ExtUI.UPVGridInformation, 'push');
app.ExtUI.UPVRobotButtonPanelInfo.Visible = 'off';
app.ExtUI.UPVRobotButtonPanelInfo.BackgroundColor = [0 0 1];
app.ExtUI.UPVRobotButtonPanelInfo.FontWeight = 'bold';
app.ExtUI.UPVRobotButtonPanelInfo.FontAngle = 'italic';
app.ExtUI.UPVRobotButtonPanelInfo.FontColor = [1 1 1];
app.ExtUI.UPVRobotButtonPanelInfo.Layout.Row = 1;
app.ExtUI.UPVRobotButtonPanelInfo.Layout.Column = [1 2];
app.ExtUI.UPVRobotButtonPanelInfo.Text = 'Retry connection with robot';
app.ExtUI.UPVRobotButtonPanelInfo.ButtonPushedFcn = {@UPVRobotCallButtonPanelInfo,app};

% Create UPVRobotMeasureTimeTotalInfoLabel
app.ExtUI.UPVRobotMeasureTimeTotalInfoLabel = uilabel(app.ExtUI.UPVGridInformation);
app.ExtUI.UPVRobotMeasureTimeTotalInfoLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotMeasureTimeTotalInfoLabel.FontColor = [0.6353 0.0784 0.1843];
app.ExtUI.UPVRobotMeasureTimeTotalInfoLabel.Layout.Row = 5;
app.ExtUI.UPVRobotMeasureTimeTotalInfoLabel.Layout.Column = 1;
app.ExtUI.UPVRobotMeasureTimeTotalInfoLabel.Text = 'Measurement time (total)';

% Create UPVRobotMeasureTimeEachInfoLabel
app.ExtUI.UPVRobotMeasureTimeEachInfoLabel = uilabel(app.ExtUI.UPVGridInformation);
app.ExtUI.UPVRobotMeasureTimeEachInfoLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotMeasureTimeEachInfoLabel.FontColor = [0.6353 0.0784 0.1843];
app.ExtUI.UPVRobotMeasureTimeEachInfoLabel.Layout.Row = 4;
app.ExtUI.UPVRobotMeasureTimeEachInfoLabel.Layout.Column = 1;
app.ExtUI.UPVRobotMeasureTimeEachInfoLabel.Text = 'Measurement time (each)';

% Create UPVRobotMeasureTimeEachInfo
app.ExtUI.UPVRobotMeasureTimeEachInfo = uilabel(app.ExtUI.UPVGridInformation);
app.ExtUI.UPVRobotMeasureTimeEachInfo.FontWeight = 'bold';
app.ExtUI.UPVRobotMeasureTimeEachInfo.Layout.Row = 4;
app.ExtUI.UPVRobotMeasureTimeEachInfo.Layout.Column = 2;
app.ExtUI.UPVRobotMeasureTimeEachInfo.Text = '~';

% Create UPVRobotMeasureTimeTotalInfo
app.ExtUI.UPVRobotMeasureTimeTotalInfo = uilabel(app.ExtUI.UPVGridInformation);
app.ExtUI.UPVRobotMeasureTimeTotalInfo.FontWeight = 'bold';
app.ExtUI.UPVRobotMeasureTimeTotalInfo.Layout.Row = 5;
app.ExtUI.UPVRobotMeasureTimeTotalInfo.Layout.Column = 2;
app.ExtUI.UPVRobotMeasureTimeTotalInfo.Text = '~';

% Create UPVRobotWarningsAndErrors
app.ExtUI.UPVRobotWarningsAndErrors = uilabel(app.ExtUI.UPVGridInformation);
app.ExtUI.UPVRobotWarningsAndErrors.FontWeight = 'bold';
app.ExtUI.UPVRobotWarningsAndErrors.FontSize = 11;
app.ExtUI.UPVRobotWarningsAndErrors.WordWrap = 'on';
app.ExtUI.UPVRobotWarningsAndErrors.FontColor = [0.4667 0.6745 0.1882];
app.ExtUI.UPVRobotWarningsAndErrors.BackgroundColor = 'none';
app.ExtUI.UPVRobotWarningsAndErrors.Layout.Row = [2 3];
app.ExtUI.UPVRobotWarningsAndErrors.Layout.Column = [1 2];
app.ExtUI.UPVRobotWarningsAndErrors.Text = 'Without errors.';


function UPVRobotCallButtonPanelInfo(~,~,app)
% Disable emergency
UPVRobotEmergency(app,0);
UPVRobotCheckConnection(app);
% Check if it is and interrupted measure
if app.ExtVar.UPVRobot.Resumed == 0 % To avoid unnecessary reload
    UPVRobotResumeMeasure(app)
end
app.ExtUI.StartmeasureButton.Enable = 'on';
