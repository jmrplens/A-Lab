function createCenterPanelFourMicCalibration(~,~,app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

column = centerGrid(app,{'1x'},{'1x'});

% Create CenterCalibrationPanelFourMic
app.ExtUI.CenterCalibrationPanelFourMic = uipanel(column);
app.ExtUI.CenterCalibrationPanelFourMic.TitlePosition = 'centertop';
app.ExtUI.CenterCalibrationPanelFourMic.Title = 'Calibration system for ASTM 2611';
app.ExtUI.CenterCalibrationPanelFourMic.BackgroundColor = [1 1 1];
app.ExtUI.CenterCalibrationPanelFourMic.Layout.Row = 1;
app.ExtUI.CenterCalibrationPanelFourMic.Layout.Column = 1;
app.ExtUI.CenterCalibrationPanelFourMic.FontAngle = 'italic';

% Create GridCenterPanelFourMicTubeCalibration
app.ExtUI.GridCenterPanelFourMicTubeCalibration = uigridlayout(app.ExtUI.CenterCalibrationPanelFourMic);
app.ExtUI.GridCenterPanelFourMicTubeCalibration.ColumnWidth = {'1x'};
app.ExtUI.GridCenterPanelFourMicTubeCalibration.RowHeight = {'fit', '1x', '1x', 'fit'};
app.ExtUI.GridCenterPanelFourMicTubeCalibration.BackgroundColor = [1 1 1];

% Create FourMicTubeCalibrationMeasurementPanel
app.ExtUI.FourMicTubeCalibrationMeasurementPanel = uipanel(app.ExtUI.GridCenterPanelFourMicTubeCalibration);
app.ExtUI.FourMicTubeCalibrationMeasurementPanel.TitlePosition = 'centertop';
app.ExtUI.FourMicTubeCalibrationMeasurementPanel.Title = 'Measurement position';
app.ExtUI.FourMicTubeCalibrationMeasurementPanel.BackgroundColor = [0.9412 0.9412 0.9412];
app.ExtUI.FourMicTubeCalibrationMeasurementPanel.Layout.Row = 2;
app.ExtUI.FourMicTubeCalibrationMeasurementPanel.Layout.Column = 1;
app.ExtUI.FourMicTubeCalibrationMeasurementPanel.FontWeight = 'bold';

% Create FourMicTubeCalibrationMeasurementGrid
app.ExtUI.FourMicTubeCalibrationMeasurementGrid = uigridlayout(app.ExtUI.FourMicTubeCalibrationMeasurementPanel);
app.ExtUI.FourMicTubeCalibrationMeasurementGrid.ColumnWidth = {'fit', 'fit', 'fit', 'fit', '0.2x', '1x'};
app.ExtUI.FourMicTubeCalibrationMeasurementGrid.RowHeight = {'1x', 'fit', 'fit'};
app.ExtUI.FourMicTubeCalibrationMeasurementGrid.BackgroundColor = [1 1 1];

% Create FourMicCalibrationMeasurementButton
app.ExtUI.FourMicCalibrationMeasurementButton = uibutton(app.ExtUI.FourMicTubeCalibrationMeasurementGrid, 'push');
app.ExtUI.FourMicCalibrationMeasurementButton.WordWrap = 'on';
app.ExtUI.FourMicCalibrationMeasurementButton.BackgroundColor = [1 1 1];
app.ExtUI.FourMicCalibrationMeasurementButton.FontWeight = 'bold';
app.ExtUI.FourMicCalibrationMeasurementButton.Layout.Row = [2 3];
app.ExtUI.FourMicCalibrationMeasurementButton.Layout.Column = 6;
app.ExtUI.FourMicCalibrationMeasurementButton.Text = 'Get first values';
app.ExtUI.FourMicCalibrationMeasurementButton.ButtonPushedFcn = {@FourMicCalibrationMeasure,app};

% Create InputChannel1Label
app.ExtUI.InputChannel1Label = uilabel(app.ExtUI.FourMicTubeCalibrationMeasurementGrid);
app.ExtUI.InputChannel1Label.BackgroundColor = [1 1 1];
app.ExtUI.InputChannel1Label.HorizontalAlignment = 'right';
app.ExtUI.InputChannel1Label.WordWrap = 'on';
app.ExtUI.InputChannel1Label.Layout.Row = 2;
app.ExtUI.InputChannel1Label.Layout.Column = 1;
app.ExtUI.InputChannel1Label.Text = 'Input Channel 1';

[Nin,Nout] = getAvailableChannels(app);

% Create FourMicCalibrationMic1
app.ExtUI.FourMicCalibrationMic1 = uidropdown(app.ExtUI.FourMicTubeCalibrationMeasurementGrid);
app.ExtUI.FourMicCalibrationMic1.ValueChangedFcn = {@FourMicCalibrationTubeParameterChanged,app};
app.ExtUI.FourMicCalibrationMic1.Items = string(1:Nin);
app.ExtUI.FourMicCalibrationMic1.BackgroundColor = [1 1 1];
app.ExtUI.FourMicCalibrationMic1.Layout.Row = 2;
app.ExtUI.FourMicCalibrationMic1.Layout.Column = 2;
app.ExtUI.FourMicCalibrationMic1.Value = '1';
if isempty(app.ExtVar.ImpedanceTubeFourMic.Mic1Ch) || app.ExtVar.ImpedanceTubeFourMic.Mic1Ch > Nin
    app.ExtVar.ImpedanceTubeFourMic.Mic1Ch = str2double(app.ExtUI.FourMicCalibrationMic1.Value);
else
    app.ExtUI.FourMicCalibrationMic1.Value = num2str(app.ExtVar.ImpedanceTubeFourMic.Mic1Ch,'%d');
end

% Create InputChannel2Label
app.ExtUI.InputChannel2Label = uilabel(app.ExtUI.FourMicTubeCalibrationMeasurementGrid);
app.ExtUI.InputChannel2Label.BackgroundColor = [1 1 1];
app.ExtUI.InputChannel2Label.HorizontalAlignment = 'right';
app.ExtUI.InputChannel2Label.WordWrap = 'on';
app.ExtUI.InputChannel2Label.Layout.Row = 3;
app.ExtUI.InputChannel2Label.Layout.Column = 1;
app.ExtUI.InputChannel2Label.Text = 'Input Channel 2';

% Create FourMicCalibrationMic2
app.ExtUI.FourMicCalibrationMic2 = uidropdown(app.ExtUI.FourMicTubeCalibrationMeasurementGrid);
app.ExtUI.FourMicCalibrationMic2.ValueChangedFcn = {@FourMicCalibrationTubeParameterChanged,app};
app.ExtUI.FourMicCalibrationMic2.Items = string(1:Nin);
app.ExtUI.FourMicCalibrationMic2.BackgroundColor = [1 1 1];
app.ExtUI.FourMicCalibrationMic2.Layout.Row = 3;
app.ExtUI.FourMicCalibrationMic2.Layout.Column = 2;
if Nin <= 1
    app.ExtUI.FourMicCalibrationMic2.Value = '1';
else
    app.ExtUI.FourMicCalibrationMic2.Value = '2';
end
if isempty(app.ExtVar.ImpedanceTubeFourMic.Mic2Ch) || app.ExtVar.ImpedanceTubeFourMic.Mic2Ch > Nin
    app.ExtVar.ImpedanceTubeFourMic.Mic2Ch = str2double(app.ExtUI.FourMicCalibrationMic2.Value);
else
    app.ExtUI.FourMicCalibrationMic2.Value = num2str(app.ExtVar.ImpedanceTubeFourMic.Mic2Ch,'%d');
end

% Create InputChannel3Label
app.ExtUI.InputChannel3Label = uilabel(app.ExtUI.FourMicTubeCalibrationMeasurementGrid);
app.ExtUI.InputChannel3Label.BackgroundColor = [1 1 1];
app.ExtUI.InputChannel3Label.HorizontalAlignment = 'right';
app.ExtUI.InputChannel3Label.WordWrap = 'on';
app.ExtUI.InputChannel3Label.Layout.Row = 2;
app.ExtUI.InputChannel3Label.Layout.Column = 3;
app.ExtUI.InputChannel3Label.Text = 'Input Channel 3';

% Create FourMicCalibrationMic3
app.ExtUI.FourMicCalibrationMic3 = uidropdown(app.ExtUI.FourMicTubeCalibrationMeasurementGrid);
app.ExtUI.FourMicCalibrationMic3.ValueChangedFcn = {@FourMicCalibrationTubeParameterChanged,app};
app.ExtUI.FourMicCalibrationMic3.Items = string(1:Nin);
app.ExtUI.FourMicCalibrationMic3.BackgroundColor = [1 1 1];
app.ExtUI.FourMicCalibrationMic3.Layout.Row = 2;
app.ExtUI.FourMicCalibrationMic3.Layout.Column = 4;
if Nin <= 2
    app.ExtUI.FourMicCalibrationMic3.Value = '1';
else
    app.ExtUI.FourMicCalibrationMic3.Value = '3';
end
if isempty(app.ExtVar.ImpedanceTubeFourMic.Mic3Ch) || app.ExtVar.ImpedanceTubeFourMic.Mic3Ch > Nin
    app.ExtVar.ImpedanceTubeFourMic.Mic3Ch = str2double(app.ExtUI.FourMicCalibrationMic3.Value);
else
    app.ExtUI.FourMicCalibrationMic3.Value = num2str(app.ExtVar.ImpedanceTubeFourMic.Mic3Ch,'%d');
end

% Create InputChannel4Label
app.ExtUI.InputChannel4Label = uilabel(app.ExtUI.FourMicTubeCalibrationMeasurementGrid);
app.ExtUI.InputChannel4Label.BackgroundColor = [1 1 1];
app.ExtUI.InputChannel4Label.HorizontalAlignment = 'right';
app.ExtUI.InputChannel4Label.WordWrap = 'on';
app.ExtUI.InputChannel4Label.Layout.Row = 3;
app.ExtUI.InputChannel4Label.Layout.Column = 3;
app.ExtUI.InputChannel4Label.Text = 'Input Channel 4';

% Create FourMicCalibrationMic4
app.ExtUI.FourMicCalibrationMic4 = uidropdown(app.ExtUI.FourMicTubeCalibrationMeasurementGrid);
app.ExtUI.FourMicCalibrationMic4.ValueChangedFcn = {@FourMicCalibrationTubeParameterChanged,app};
app.ExtUI.FourMicCalibrationMic4.Items = string(1:Nin);
app.ExtUI.FourMicCalibrationMic4.BackgroundColor = [1 1 1];
app.ExtUI.FourMicCalibrationMic4.Layout.Row = 3;
app.ExtUI.FourMicCalibrationMic4.Layout.Column = 4;
if Nin <= 3
    app.ExtUI.FourMicCalibrationMic4.Value = '1';
else
    app.ExtUI.FourMicCalibrationMic4.Value = '4';
end
if isempty(app.ExtVar.ImpedanceTubeFourMic.Mic4Ch) || app.ExtVar.ImpedanceTubeFourMic.Mic4Ch > Nin
    app.ExtVar.ImpedanceTubeFourMic.Mic4Ch = str2double(app.ExtUI.FourMicCalibrationMic4.Value);
else
    app.ExtUI.FourMicCalibrationMic4.Value = num2str(app.ExtVar.ImpedanceTubeFourMic.Mic4Ch,'%d');
end

% Create FourMicCalibrationMeasurementAxes
app.ExtUI.FourMicCalibrationMeasurementAxes = uiaxes(app.ExtUI.FourMicTubeCalibrationMeasurementGrid);
app.ExtUI.FourMicCalibrationMeasurementAxes.Layout.Row = 1;
app.ExtUI.FourMicCalibrationMeasurementAxes.Layout.Column = [1 6];

% Create FourMicTubeCalibrationSwappedPanel
app.ExtUI.FourMicTubeCalibrationSwappedPanel = uipanel(app.ExtUI.GridCenterPanelFourMicTubeCalibration);
app.ExtUI.FourMicTubeCalibrationSwappedPanel.TitlePosition = 'centertop';
app.ExtUI.FourMicTubeCalibrationSwappedPanel.Title = 'Swapped position';
app.ExtUI.FourMicTubeCalibrationSwappedPanel.BackgroundColor = [0.9412 0.9412 0.9412];
app.ExtUI.FourMicTubeCalibrationSwappedPanel.Layout.Row = 3;
app.ExtUI.FourMicTubeCalibrationSwappedPanel.Layout.Column = 1;
app.ExtUI.FourMicTubeCalibrationSwappedPanel.FontWeight = 'bold';

% Create FourMicTubeCalibrationSwappedGrid
app.ExtUI.FourMicTubeCalibrationSwappedGrid = uigridlayout(app.ExtUI.FourMicTubeCalibrationSwappedPanel);
app.ExtUI.FourMicTubeCalibrationSwappedGrid.ColumnWidth = {'1x'};
app.ExtUI.FourMicTubeCalibrationSwappedGrid.RowHeight = {'1x'};
app.ExtUI.FourMicTubeCalibrationSwappedGrid.Padding = [0 0 0 0];
app.ExtUI.FourMicTubeCalibrationSwappedGrid.BackgroundColor = [1 1 1];

% Create FourMicTubeCalibrationSwappedTabs
app.ExtUI.FourMicTubeCalibrationSwappedTabs = uitabgroup(app.ExtUI.FourMicTubeCalibrationSwappedGrid);
app.ExtUI.FourMicTubeCalibrationSwappedTabs.Layout.Row = 1;
app.ExtUI.FourMicTubeCalibrationSwappedTabs.Layout.Column = 1;

% Create FourMicTubeCalibrationSwappedMic2
app.ExtUI.FourMicTubeCalibrationSwappedMic2 = uitab(app.ExtUI.FourMicTubeCalibrationSwappedTabs);
app.ExtUI.FourMicTubeCalibrationSwappedMic2.Title = 'Calibrate Mic 2';
app.ExtUI.FourMicTubeCalibrationSwappedMic2.BackgroundColor = [1 1 1];

% Create FourMicTubeCalibrationSwappedMic2Grid
app.ExtUI.FourMicTubeCalibrationSwappedMic2Grid = uigridlayout(app.ExtUI.FourMicTubeCalibrationSwappedMic2);
app.ExtUI.FourMicTubeCalibrationSwappedMic2Grid.ColumnWidth = {'1x', '1x', '1x'};
app.ExtUI.FourMicTubeCalibrationSwappedMic2Grid.RowHeight = {'1x', 'fit'};
app.ExtUI.FourMicTubeCalibrationSwappedMic2Grid.BackgroundColor = [1 1 1];

% Create FourMicTubeCalibrationSwappedMic2Button
app.ExtUI.FourMicTubeCalibrationSwappedMic2Button = uibutton(app.ExtUI.FourMicTubeCalibrationSwappedMic2Grid, 'push');
app.ExtUI.FourMicTubeCalibrationSwappedMic2Button.WordWrap = 'on';
app.ExtUI.FourMicTubeCalibrationSwappedMic2Button.BackgroundColor = [1 1 1];
app.ExtUI.FourMicTubeCalibrationSwappedMic2Button.FontWeight = 'bold';
app.ExtUI.FourMicTubeCalibrationSwappedMic2Button.Layout.Row = 2;
app.ExtUI.FourMicTubeCalibrationSwappedMic2Button.Layout.Column = 2;
app.ExtUI.FourMicTubeCalibrationSwappedMic2Button.Text = 'Measure ''21''';
app.ExtUI.FourMicTubeCalibrationSwappedMic2Button.ButtonPushedFcn = {@FourMicCalibration2,app};

% Create FourMicTubeCalibrationSwappedMic2axes
app.ExtUI.FourMicTubeCalibrationSwappedMic2axes = uiaxes(app.ExtUI.FourMicTubeCalibrationSwappedMic2Grid);
app.ExtUI.FourMicTubeCalibrationSwappedMic2axes.Layout.Row = 1;
app.ExtUI.FourMicTubeCalibrationSwappedMic2axes.Layout.Column = [1 3];

% Create FourMicTubeCalibrationSwappedMic3
app.ExtUI.FourMicTubeCalibrationSwappedMic3 = uitab(app.ExtUI.FourMicTubeCalibrationSwappedTabs);
app.ExtUI.FourMicTubeCalibrationSwappedMic3.Title = 'Calibrate Mic 3';
app.ExtUI.FourMicTubeCalibrationSwappedMic3.BackgroundColor = [1 1 1];

% Create FourMicTubeCalibrationSwappedMic3Grid
app.ExtUI.FourMicTubeCalibrationSwappedMic3Grid = uigridlayout(app.ExtUI.FourMicTubeCalibrationSwappedMic3);
app.ExtUI.FourMicTubeCalibrationSwappedMic3Grid.ColumnWidth = {'1x', '1x', '1x'};
app.ExtUI.FourMicTubeCalibrationSwappedMic3Grid.RowHeight = {'1x', 'fit'};
app.ExtUI.FourMicTubeCalibrationSwappedMic3Grid.BackgroundColor = [1 1 1];

% Create FourMicTubeCalibrationSwappedMic3Button
app.ExtUI.FourMicTubeCalibrationSwappedMic3Button = uibutton(app.ExtUI.FourMicTubeCalibrationSwappedMic3Grid, 'push');
app.ExtUI.FourMicTubeCalibrationSwappedMic3Button.WordWrap = 'on';
app.ExtUI.FourMicTubeCalibrationSwappedMic3Button.BackgroundColor = [1 1 1];
app.ExtUI.FourMicTubeCalibrationSwappedMic3Button.FontWeight = 'bold';
app.ExtUI.FourMicTubeCalibrationSwappedMic3Button.Layout.Row = 2;
app.ExtUI.FourMicTubeCalibrationSwappedMic3Button.Layout.Column = 2;
app.ExtUI.FourMicTubeCalibrationSwappedMic3Button.Text = 'Measure ''31''';
app.ExtUI.FourMicTubeCalibrationSwappedMic3Button.ButtonPushedFcn = {@FourMicCalibration3,app};

% Create FourMicTubeCalibrationSwappedMic3axes
app.ExtUI.FourMicTubeCalibrationSwappedMic3axes = uiaxes(app.ExtUI.FourMicTubeCalibrationSwappedMic3Grid);
app.ExtUI.FourMicTubeCalibrationSwappedMic3axes.Layout.Row = 1;
app.ExtUI.FourMicTubeCalibrationSwappedMic3axes.Layout.Column = [1 3];

% Create FourMicTubeCalibrationSwappedMic4
app.ExtUI.FourMicTubeCalibrationSwappedMic4 = uitab(app.ExtUI.FourMicTubeCalibrationSwappedTabs);
app.ExtUI.FourMicTubeCalibrationSwappedMic4.Title = 'Calibrate Mic 4';
app.ExtUI.FourMicTubeCalibrationSwappedMic4.BackgroundColor = [1 1 1];

% Create FourMicTubeCalibrationSwappedMic4Grid
app.ExtUI.FourMicTubeCalibrationSwappedMic4Grid = uigridlayout(app.ExtUI.FourMicTubeCalibrationSwappedMic4);
app.ExtUI.FourMicTubeCalibrationSwappedMic4Grid.ColumnWidth = {'1x', '1x', '1x'};
app.ExtUI.FourMicTubeCalibrationSwappedMic4Grid.RowHeight = {'1x', 'fit'};
app.ExtUI.FourMicTubeCalibrationSwappedMic4Grid.BackgroundColor = [1 1 1];

% Create FourMicTubeCalibrationSwappedMic4Button
app.ExtUI.FourMicTubeCalibrationSwappedMic4Button = uibutton(app.ExtUI.FourMicTubeCalibrationSwappedMic4Grid, 'push');
app.ExtUI.FourMicTubeCalibrationSwappedMic4Button.WordWrap = 'on';
app.ExtUI.FourMicTubeCalibrationSwappedMic4Button.BackgroundColor = [1 1 1];
app.ExtUI.FourMicTubeCalibrationSwappedMic4Button.FontWeight = 'bold';
app.ExtUI.FourMicTubeCalibrationSwappedMic4Button.Layout.Row = 2;
app.ExtUI.FourMicTubeCalibrationSwappedMic4Button.Layout.Column = 2;
app.ExtUI.FourMicTubeCalibrationSwappedMic4Button.Text = 'Measure ''41''';
app.ExtUI.FourMicTubeCalibrationSwappedMic4Button.ButtonPushedFcn = {@FourMicCalibration4,app};

% Create FourMicTubeCalibrationSwappedMic4axes
app.ExtUI.FourMicTubeCalibrationSwappedMic4axes = uiaxes(app.ExtUI.FourMicTubeCalibrationSwappedMic4Grid);
app.ExtUI.FourMicTubeCalibrationSwappedMic4axes.Layout.Row = 1;
app.ExtUI.FourMicTubeCalibrationSwappedMic4axes.Layout.Column = [1 3];

% Create FourMicTubeCalibrationInfoGrid
app.ExtUI.FourMicTubeCalibrationInfoGrid = uigridlayout(app.ExtUI.GridCenterPanelFourMicTubeCalibration);
app.ExtUI.FourMicTubeCalibrationInfoGrid.ColumnWidth = {'fit', 'fit', 'fit', '1x', 'fit', 'fit', '1x', 'fit'};
app.ExtUI.FourMicTubeCalibrationInfoGrid.RowHeight = {'fit', 'fit', 'fit'};
app.ExtUI.FourMicTubeCalibrationInfoGrid.Layout.Row = 1;
app.ExtUI.FourMicTubeCalibrationInfoGrid.Layout.Column = 1;
app.ExtUI.FourMicTubeCalibrationInfoGrid.BackgroundColor = [1 1 1];

% Create OutputChannelDropDownLabel
app.ExtUI.OutputChannelDropDownLabel = uilabel(app.ExtUI.FourMicTubeCalibrationInfoGrid);
app.ExtUI.OutputChannelDropDownLabel.HorizontalAlignment = 'right';
app.ExtUI.OutputChannelDropDownLabel.WordWrap = 'on';
app.ExtUI.OutputChannelDropDownLabel.FontWeight = 'bold';
app.ExtUI.OutputChannelDropDownLabel.Layout.Row = 3;
app.ExtUI.OutputChannelDropDownLabel.Layout.Column = 1;
app.ExtUI.OutputChannelDropDownLabel.Text = 'Output Channel';

% Create FourMicTubeCalibrationOutputChannelDropDown
app.ExtUI.FourMicTubeCalibrationOutputChannelDropDown = uidropdown(app.ExtUI.FourMicTubeCalibrationInfoGrid);
app.ExtUI.FourMicTubeCalibrationOutputChannelDropDown.Items = string(1:Nout);
app.ExtUI.FourMicTubeCalibrationOutputChannelDropDown.FontWeight = 'bold';
app.ExtUI.FourMicTubeCalibrationOutputChannelDropDown.BackgroundColor = [1 1 1];
app.ExtUI.FourMicTubeCalibrationOutputChannelDropDown.Layout.Row = 3;
app.ExtUI.FourMicTubeCalibrationOutputChannelDropDown.Layout.Column = 2;
app.ExtUI.FourMicTubeCalibrationOutputChannelDropDown.Value = '1';
if isempty(app.ExtVar.ImpedanceTubeFourMic.OutputCh) || app.ExtVar.ImpedanceTubeFourMic.OutputCh > Nout
    app.ExtVar.ImpedanceTubeFourMic.OutputCh = str2double(app.ExtUI.FourMicTubeCalibrationOutputChannelDropDown.Value);
else
    app.ExtUI.FourMicTubeCalibrationOutputChannelDropDown.Value = num2str(app.ExtVar.ImpedanceTubeFourMic.OutputCh,'%d');
end

% Create FourMicTubeCalibrationInfo1
app.ExtUI.FourMicTubeCalibrationInfo1 = uilabel(app.ExtUI.FourMicTubeCalibrationInfoGrid);
app.ExtUI.FourMicTubeCalibrationInfo1.WordWrap = 'on';
app.ExtUI.FourMicTubeCalibrationInfo1.Layout.Row = 1;
app.ExtUI.FourMicTubeCalibrationInfo1.Layout.Column = [1 8];
app.ExtUI.FourMicTubeCalibrationInfo1.Text = 'Place the microphones in their measurement position and do not put any sample in the tube.';

% Create FourMicTubeCalibrationInfo2
app.ExtUI.FourMicTubeCalibrationInfo2 = uilabel(app.ExtUI.FourMicTubeCalibrationInfoGrid);
app.ExtUI.FourMicTubeCalibrationInfo2.WordWrap = 'on';
app.ExtUI.FourMicTubeCalibrationInfo2.Layout.Row = 2;
app.ExtUI.FourMicTubeCalibrationInfo2.Layout.Column = [1 8];
app.ExtUI.FourMicTubeCalibrationInfo2.Text = 'Take a measurement first with the standard microphone positions. Then swap the positions as indicated in the images for each microphone and obtain the correction.';

% Create FourMicTubeCalibrationBottomButtonsGrid
app.ExtUI.FourMicTubeCalibrationBottomButtonsGrid = uigridlayout(app.ExtUI.GridCenterPanelFourMicTubeCalibration);
app.ExtUI.FourMicTubeCalibrationBottomButtonsGrid.ColumnWidth = {'1x', 'fit', '0.5x', 'fit', '1x'};
app.ExtUI.FourMicTubeCalibrationBottomButtonsGrid.RowHeight = {'1x'};
app.ExtUI.FourMicTubeCalibrationBottomButtonsGrid.Padding = [0 0 0 0];
app.ExtUI.FourMicTubeCalibrationBottomButtonsGrid.Layout.Row = 4;
app.ExtUI.FourMicTubeCalibrationBottomButtonsGrid.Layout.Column = 1;
app.ExtUI.FourMicTubeCalibrationBottomButtonsGrid.BackgroundColor = [1 1 1];

% Create FourMicTubeCalibrationDoneButton
app.ExtUI.FourMicTubeCalibrationDoneButton = uibutton(app.ExtUI.FourMicTubeCalibrationBottomButtonsGrid, 'push');
app.ExtUI.FourMicTubeCalibrationDoneButton.BackgroundColor = [1 1 1];
app.ExtUI.FourMicTubeCalibrationDoneButton.FontWeight = 'bold';
app.ExtUI.FourMicTubeCalibrationDoneButton.Enable = 'off';
app.ExtUI.FourMicTubeCalibrationDoneButton.Layout.Row = 1;
app.ExtUI.FourMicTubeCalibrationDoneButton.Layout.Column = 2;
app.ExtUI.FourMicTubeCalibrationDoneButton.Text = 'Done';
app.ExtUI.FourMicTubeCalibrationDoneButton.ButtonPushedFcn = {@FourMicCalibrationDone,app};

% Create FourMicTubeCalibrationCancelCleanButton
app.ExtUI.FourMicTubeCalibrationCancelCleanButton = uibutton(app.ExtUI.FourMicTubeCalibrationBottomButtonsGrid, 'push');
app.ExtUI.FourMicTubeCalibrationCancelCleanButton.BackgroundColor = [1 1 1];
app.ExtUI.FourMicTubeCalibrationCancelCleanButton.FontWeight = 'bold';
app.ExtUI.FourMicTubeCalibrationCancelCleanButton.Layout.Row = 1;
app.ExtUI.FourMicTubeCalibrationCancelCleanButton.Layout.Column = 4;
app.ExtUI.FourMicTubeCalibrationCancelCleanButton.Text = 'Cancel/Clean';
app.ExtUI.FourMicTubeCalibrationCancelCleanButton.ButtonPushedFcn = {@FourMicCalibrationReturnClean,app};

% Plots
FourMicCalibrationMeasurePlotDoneZone(app)
FourMicCalibrationCal2PlotDoneZone(app)
FourMicCalibrationCal3PlotDoneZone(app)
FourMicCalibrationCal4PlotDoneZone(app)

% Check
FourMicCheckForDoneCalibration(app)


function FourMicCalibrationTubeParameterChanged(~,~,app)
app.ExtVar.ImpedanceTubeFourMic.Mic1Ch = str2double(app.ExtUI.FourMicCalibrationMic1.Value);
app.ExtVar.ImpedanceTubeFourMic.Mic2Ch = str2double(app.ExtUI.FourMicCalibrationMic2.Value);
app.ExtVar.ImpedanceTubeFourMic.Mic3Ch = str2double(app.ExtUI.FourMicCalibrationMic3.Value);
app.ExtVar.ImpedanceTubeFourMic.Mic4Ch = str2double(app.ExtUI.FourMicCalibrationMic4.Value);

function FourMicCalibrationDone(~,~,app)
createCenterPanelMeasureFourMicASTM2611(app)

function FourMicCalibrationReturnClean(~,~,app)
app.ExtVar.ImpedanceTubeFourMic.OutputI = [];
app.ExtVar.ImpedanceTubeFourMic.OutputII2 = [];
app.ExtVar.ImpedanceTubeFourMic.OutputII3 = [];
app.ExtVar.ImpedanceTubeFourMic.OutputII4 = [];
app.ExtVar.ImpedanceTubeFourMic.Mic1I = [];
app.ExtVar.ImpedanceTubeFourMic.Mic2I = [];
app.ExtVar.ImpedanceTubeFourMic.Mic3I = [];
app.ExtVar.ImpedanceTubeFourMic.Mic4I = [];
app.ExtVar.ImpedanceTubeFourMic.Mic1II2 = [];
app.ExtVar.ImpedanceTubeFourMic.Mic1II3 = [];
app.ExtVar.ImpedanceTubeFourMic.Mic1II4 = [];
app.ExtVar.ImpedanceTubeFourMic.Mic2II = [];
app.ExtVar.ImpedanceTubeFourMic.Mic3II = [];
app.ExtVar.ImpedanceTubeFourMic.Mic4II = [];
FourMicCheckForDoneCalibration(app)
createCenterPanelMeasureFourMicASTM2611(app)

function [Outs,Ins] = FourMicCalibrateMeasureSystem(app,OutCh,InCh)
% Refresh devices
audiodevreset;

% Generate signal
[app.ExtVar.ImpedanceTubeFourMic.Output,~] = signalGenerator(app);

% Measure
num = app.Averages;
for i=4:4:num*4
    [Outs,Ins(:,[i-3,i-2,i-1,i])] = audioOutIn(app,app.ExtVar.ImpedanceTubeFourMic.Output,OutCh,InCh,1);
end
InsCH1 = Ins(:,1:4:end);
InsCH2 = Ins(:,2:4:end);
InsCH3 = Ins(:,3:4:end);
InsCH4 = Ins(:,4:4:end);
Ins = [mean(InsCH1,2),mean(InsCH2,2),mean(InsCH3,2),mean(InsCH4,2)];

function [Outs,Ins] = FourMicCalibratePairMeasureSystem(app,OutCh,InCh)
% Refresh devices
audiodevreset;

% Generate signal
[app.ExtVar.ImpedanceTubeFourMic.Output,~] = signalGenerator(app);

% Measure
num = app.Averages;
for i=2:2:num*2
    [Outs,Ins(:,[i-1,i])] = audioOutIn(app,app.ExtVar.ImpedanceTubeFourMic.Output,OutCh,InCh,1);
end
InsCH1 = Ins(:,1:2:end);
InsCH2 = Ins(:,2:2:end);
Ins = [mean(InsCH1,2),mean(InsCH2,2)];

function FourMicCalibrationMeasure(~,~,app)

if ~isempty(app.ExtVar.ImpedanceTubeFourMic.OutputI)
    msg = 'Repeat measure, are you sure?';
    title = 'Repeat measure';
    selection = uiconfirm(app.ALabUIFigure,msg,title,...
        'Options',{'Yes','Cancel'},...
        'DefaultOption',2,'CancelOption',2);
    if strcmp(selection,'Cancel'); return; end
end


% Parameters
OutCh = app.ExtVar.ImpedanceTubeFourMic.OutputCh;
InCh = [app.ExtVar.ImpedanceTubeFourMic.Mic1Ch,app.ExtVar.ImpedanceTubeFourMic.Mic2Ch,...
    app.ExtVar.ImpedanceTubeFourMic.Mic3Ch,app.ExtVar.ImpedanceTubeFourMic.Mic4Ch];

% Measure
[Outs,Ins] = FourMicCalibrateMeasureSystem(app,OutCh,InCh);

% Store data
app.ExtVar.ImpedanceTubeFourMic.TypeSignal = app.TypeSignal;
app.ExtVar.ImpedanceTubeFourMic.SampleRate = app.SampleRate;
app.ExtVar.ImpedanceTubeFourMic.Mic1I = Ins(:,1);
app.ExtVar.ImpedanceTubeFourMic.Mic2I = Ins(:,2);
app.ExtVar.ImpedanceTubeFourMic.Mic3I = Ins(:,3);
app.ExtVar.ImpedanceTubeFourMic.Mic4I = Ins(:,4);
app.ExtVar.ImpedanceTubeFourMic.OutputI = Outs;

% Plot
FourMicCalibrationMeasurePlotDoneZone(app)

% Check
FourMicCheckForDoneCalibration(app)

function FourMicCalibration2(~,~,app)

if ~isempty(app.ExtVar.ImpedanceTubeFourMic.OutputII2)
    msg = 'Repeat measure, are you sure?';
    title = 'Repeat measure';
    selection = uiconfirm(app.ALabUIFigure,msg,title,...
        'Options',{'Yes','Cancel'},...
        'DefaultOption',2,'CancelOption',2);
    if strcmp(selection,'Cancel'); return; end
end

% Parameters
OutCh = app.ExtVar.ImpedanceTubeFourMic.OutputCh;
InCh = [app.ExtVar.ImpedanceTubeFourMic.Mic1Ch,app.ExtVar.ImpedanceTubeFourMic.Mic2Ch];

% Measure
[Outs,Ins] = FourMicCalibratePairMeasureSystem(app,OutCh,InCh);

% Store data
app.ExtVar.ImpedanceTubeFourMic.TypeSignal = app.TypeSignal;
app.ExtVar.ImpedanceTubeFourMic.SampleRate = app.SampleRate;
app.ExtVar.ImpedanceTubeFourMic.Mic1II2 = Ins(:,1);
app.ExtVar.ImpedanceTubeFourMic.Mic2II = Ins(:,2);
app.ExtVar.ImpedanceTubeFourMic.OutputII2 = Outs;

% Plot
FourMicCalibrationCal2PlotDoneZone(app)

% Check
FourMicCheckForDoneCalibration(app)

function FourMicCalibration3(~,~,app)

if ~isempty(app.ExtVar.ImpedanceTubeFourMic.OutputII3)
    msg = 'Repeat measure, are you sure?';
    title = 'Repeat measure';
    selection = uiconfirm(app.ALabUIFigure,msg,title,...
        'Options',{'Yes','Cancel'},...
        'DefaultOption',2,'CancelOption',2);
    if strcmp(selection,'Cancel'); return; end
end

% Parameters
OutCh = app.ExtVar.ImpedanceTubeFourMic.OutputCh;
InCh = [app.ExtVar.ImpedanceTubeFourMic.Mic1Ch,app.ExtVar.ImpedanceTubeFourMic.Mic3Ch];

% Measure
[Outs,Ins] = FourMicCalibratePairMeasureSystem(app,OutCh,InCh);

% Store data
app.ExtVar.ImpedanceTubeFourMic.TypeSignal = app.TypeSignal;
app.ExtVar.ImpedanceTubeFourMic.SampleRate = app.SampleRate;
app.ExtVar.ImpedanceTubeFourMic.Mic1II3 = Ins(:,1);
app.ExtVar.ImpedanceTubeFourMic.Mic3II = Ins(:,2);
app.ExtVar.ImpedanceTubeFourMic.OutputII3 = Outs;

% Plot
FourMicCalibrationCal3PlotDoneZone(app)

% Check
FourMicCheckForDoneCalibration(app)

function FourMicCalibration4(~,~,app)

if ~isempty(app.ExtVar.ImpedanceTubeFourMic.OutputII4)
    msg = 'Repeat measure, are you sure?';
    title = 'Repeat measure';
    selection = uiconfirm(app.ALabUIFigure,msg,title,...
        'Options',{'Yes','Cancel'},...
        'DefaultOption',2,'CancelOption',2);
    if strcmp(selection,'Cancel'); return; end
end

% Parameters
OutCh = app.ExtVar.ImpedanceTubeFourMic.OutputCh;
InCh = [app.ExtVar.ImpedanceTubeFourMic.Mic1Ch,app.ExtVar.ImpedanceTubeFourMic.Mic4Ch];

% Measure
[Outs,Ins] = FourMicCalibratePairMeasureSystem(app,OutCh,InCh);

% Store data
app.ExtVar.ImpedanceTubeFourMic.TypeSignal = app.TypeSignal;
app.ExtVar.ImpedanceTubeFourMic.SampleRate = app.SampleRate;
app.ExtVar.ImpedanceTubeFourMic.Mic1II4 = Ins(:,1);
app.ExtVar.ImpedanceTubeFourMic.Mic4II = Ins(:,2);
app.ExtVar.ImpedanceTubeFourMic.OutputII4 = Outs;

% Plot
FourMicCalibrationCal4PlotDoneZone(app)

% Check
FourMicCheckForDoneCalibration(app)

function FourMicCalibrationMeasurePlotDoneZone(app)

if ~isempty(app.ExtVar.ImpedanceTubeFourMic.OutputI)
    zones = [1,2,3,4];
else
    zones = [];
end

aux = app.ExtVar.ImpedanceTubeFourMic.d;
app.ExtVar.ImpedanceTubeFourMic.d = 0;
plotTubeFourMicASTM2611(app,app.ExtUI.FourMicCalibrationMeasurementAxes,{'Mic';'1'},{'Mic';'2'},{'Mic';'3'},{'Mic';'4'},0,0,0,zones)
app.ExtVar.ImpedanceTubeFourMic.d = aux;

function FourMicCalibrationCal2PlotDoneZone(app)

if ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic2II)
    zones = [1,2,3,4];
else
    zones = [];
end

aux = app.ExtVar.ImpedanceTubeFourMic.d;
app.ExtVar.ImpedanceTubeFourMic.d = 0;
plotTubeFourMicASTM2611(app,app.ExtUI.FourMicTubeCalibrationSwappedMic2axes,{'Mic';'2'},{'Mic';'1'},{'';''},{'';''},0,0,0,zones)
app.ExtVar.ImpedanceTubeFourMic.d = aux;

function FourMicCalibrationCal3PlotDoneZone(app)

if ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic3II)
    zones = [1,2,3,4];
else
    zones = [];
end

aux = app.ExtVar.ImpedanceTubeFourMic.d;
app.ExtVar.ImpedanceTubeFourMic.d = 0;
plotTubeFourMicASTM2611(app,app.ExtUI.FourMicTubeCalibrationSwappedMic3axes,{'Mic';'3'},{'';''},{'Mic';'1'},{'';''},0,0,0,zones)
app.ExtVar.ImpedanceTubeFourMic.d = aux;

function FourMicCalibrationCal4PlotDoneZone(app)

if ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic4II)
    zones = [1,2,3,4];
else
    zones = [];
end

aux = app.ExtVar.ImpedanceTubeFourMic.d;
app.ExtVar.ImpedanceTubeFourMic.d = 0;
plotTubeFourMicASTM2611(app,app.ExtUI.FourMicTubeCalibrationSwappedMic4axes,{'Mic';'4'},{'';''},{'';''},{'Mic';'1'},0,0,0,zones)
app.ExtVar.ImpedanceTubeFourMic.d = aux;