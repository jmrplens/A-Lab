function createCenterPanelMeasureTwoMicISO10534(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
    'Indeterminate','on');

% Grid
existpanel = 1;
if isfield(app.ExtUI,'CenterMainPanelTwoMic')
    if  ~isvalid(app.ExtUI.CenterMainPanelTwoMic)
        existpanel = 0;
    end
else
    existpanel = 0;
end

if existpanel == 0
    column = centerGrid(app,{'1x'},{'1x'});
    
    % Create CenterMainPanelTwoMic
    app.ExtUI.CenterMainPanelTwoMic = uipanel(column);
    app.ExtUI.CenterMainPanelTwoMic.TitlePosition = 'centertop';
    app.ExtUI.CenterMainPanelTwoMic.Title = '2-Mic measurement';
    app.ExtUI.CenterMainPanelTwoMic.BackgroundColor = [1 1 1];
    app.ExtUI.CenterMainPanelTwoMic.Layout.Row = 1;
    app.ExtUI.CenterMainPanelTwoMic.Layout.Column = 1;
    app.ExtUI.CenterMainPanelTwoMic.FontAngle = 'italic';
    
    % Create GridCenterPanelTwoMic
    app.ExtUI.GridCenterPanelTwoMic = uigridlayout(app.ExtUI.CenterMainPanelTwoMic);
    app.ExtUI.GridCenterPanelTwoMic.ColumnWidth = {'1x'};
    app.ExtUI.GridCenterPanelTwoMic.RowHeight = {'fit', '1x', '1x'};
    app.ExtUI.GridCenterPanelTwoMic.BackgroundColor = [1 1 1];
    
    % Create TwoMicInfoAndOutputGrid
    app.ExtUI.TwoMicInfoAndOutputGrid = uigridlayout(app.ExtUI.GridCenterPanelTwoMic);
    app.ExtUI.TwoMicInfoAndOutputGrid.ColumnWidth = {'1x', 'fit', 'fit', 'fit', 'fit', '1x'};
    app.ExtUI.TwoMicInfoAndOutputGrid.RowHeight = {'fit', 'fit'};
    app.ExtUI.TwoMicInfoAndOutputGrid.Layout.Row = 1;
    app.ExtUI.TwoMicInfoAndOutputGrid.Layout.Column = 1;
    app.ExtUI.TwoMicInfoAndOutputGrid.BackgroundColor = [1 1 1];
    
    % Create OutputChannelDropDownLabel
    app.ExtUI.OutputChannelDropDownLabel = uilabel(app.ExtUI.TwoMicInfoAndOutputGrid);
    app.ExtUI.OutputChannelDropDownLabel.HorizontalAlignment = 'right';
    app.ExtUI.OutputChannelDropDownLabel.FontWeight = 'bold';
    app.ExtUI.OutputChannelDropDownLabel.Layout.Row = 2;
    app.ExtUI.OutputChannelDropDownLabel.Layout.Column = 3;
    app.ExtUI.OutputChannelDropDownLabel.Text = 'Output Channel';
    
    [~,Nout] = getAvailableChannels(app);
    
    % Create TwoMicMeasureOutputChannelDropDown
    app.ExtUI.TwoMicMeasureOutputChannelDropDown = uidropdown(app.ExtUI.TwoMicInfoAndOutputGrid);
    app.ExtUI.TwoMicMeasureOutputChannelDropDown.Items = string(1:Nout);
    app.ExtUI.TwoMicMeasureOutputChannelDropDown.FontWeight = 'bold';
    app.ExtUI.TwoMicMeasureOutputChannelDropDown.BackgroundColor = [1 1 1];
    app.ExtUI.TwoMicMeasureOutputChannelDropDown.Layout.Row = 2;
    app.ExtUI.TwoMicMeasureOutputChannelDropDown.Layout.Column = 4;
    app.ExtUI.TwoMicMeasureOutputChannelDropDown.Value = '1';
    app.ExtUI.TwoMicMeasureOutputChannelDropDown.ValueChangedFcn = {@TwoMicTubeOutputChanged,app};
    if isempty(app.ExtVar.ImpedanceTubeTwoMic.OutputCh) || app.ExtVar.ImpedanceTubeTwoMic.OutputCh > Nout
        app.ExtVar.ImpedanceTubeTwoMic.OutputCh = str2double(app.ExtUI.TwoMicMeasureOutputChannelDropDown.Value);
    else
        app.ExtUI.TwoMicMeasureOutputChannelDropDown.Value = num2str(app.ExtVar.ImpedanceTubeTwoMic.OutputCh,'%d');
    end
    
    % Create TwoMicMeasureInfo
    app.ExtUI.TwoMicMeasureInfo = uilabel(app.ExtUI.TwoMicInfoAndOutputGrid);
    app.ExtUI.TwoMicMeasureInfo.WordWrap = 'on';
    app.ExtUI.TwoMicMeasureInfo.Layout.Row = 1;
    app.ExtUI.TwoMicMeasureInfo.Layout.Column = [1 6];
    app.ExtUI.TwoMicMeasureInfo.Text = 'When you finish the measurements, click on the <Calculate results> button (red button in the right column) to get the results.';
    
    % Create TwoMicCalibrateButtonGrid
    app.ExtUI.TwoMicCalibrateButtonGrid = uigridlayout(app.ExtUI.TwoMicInfoAndOutputGrid);
    app.ExtUI.TwoMicCalibrateButtonGrid.ColumnWidth = {'1x', 'fit'};
    app.ExtUI.TwoMicCalibrateButtonGrid.RowHeight = {'1x'};
    app.ExtUI.TwoMicCalibrateButtonGrid.Padding = [0 0 0 0];
    app.ExtUI.TwoMicCalibrateButtonGrid.Layout.Row = 2;
    app.ExtUI.TwoMicCalibrateButtonGrid.Layout.Column = 6;
    app.ExtUI.TwoMicCalibrateButtonGrid.BackgroundColor = [1 1 1];
    
    % Create TwoMicCalibrateButton
    app.ExtUI.TwoMicCalibrateButton = uibutton(app.ExtUI.TwoMicCalibrateButtonGrid, 'push');
    app.ExtUI.TwoMicCalibrateButton.BackgroundColor = [1 1 1];
    app.ExtUI.TwoMicCalibrateButton.FontWeight = 'bold';
    app.ExtUI.TwoMicCalibrateButton.Layout.Row = 1;
    app.ExtUI.TwoMicCalibrateButton.Layout.Column = 2;
    app.ExtUI.TwoMicCalibrateButton.Text = 'Calibrate (optional)';
    app.ExtUI.TwoMicCalibrateButton.ButtonPushedFcn = {@TwoMicOneMicCalibratePushed,app};
    
end


% Select measure type
switch  app.ExtVar.ImpedanceTubeTwoMic.NumMics 
    case 1
        app.ExtUI.TwoMicCalibrateButton.Visible = 'off';
        createMeasureTwoMicOneMicOptions(app)
    case 2
        app.ExtUI.TwoMicCalibrateButton.Visible = 'on';
        createMeasureTwoMicTwoMicOptions(app)
end

% Close progress bar
drawnow
pause(0.5)
close(d)


function TwoMicTubeOutputChanged(~,~,app)
app.ExtVar.ImpedanceTubeTwoMic.OutputCh = str2double(app.ExtUI.TwoMicMeasureOutputChannelDropDown.Value);

function TwoMicOneMicCalibratePushed(~,~,app)
createCenterPanelCalibrationTwoMicISO10534(app)