function createCenterPanelInformationTwoMic(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

column = centerGrid(app,{'1x'},{'1x'});

% Create TwoMicISO10534InfoPanel
app.ExtUI.TwoMicISO10534InfoPanel = uipanel(column);
app.ExtUI.TwoMicISO10534InfoPanel.TitlePosition = 'centertop';
app.ExtUI.TwoMicISO10534InfoPanel.Title = 'Information: Impedance Tube';
app.ExtUI.TwoMicISO10534InfoPanel.BackgroundColor = [1 1 1];
app.ExtUI.TwoMicISO10534InfoPanel.Layout.Row = 1;
app.ExtUI.TwoMicISO10534InfoPanel.Layout.Column = 1;
app.ExtUI.TwoMicISO10534InfoPanel.FontWeight = 'bold';
app.ExtUI.TwoMicISO10534InfoPanel.FontSize = 14;

% Create TwoMicISO10534InfoGrid
app.ExtUI.TwoMicISO10534InfoGrid = uigridlayout(app.ExtUI.TwoMicISO10534InfoPanel);
app.ExtUI.TwoMicISO10534InfoGrid.RowHeight = {'fit', '1x', 'fit', 'fit'};
app.ExtUI.TwoMicISO10534InfoGrid.BackgroundColor = [1 1 1];

% Create TwoMicISO10534InfoAxes
app.ExtUI.TwoMicISO10534InfoAxes = uiaxes(app.ExtUI.TwoMicISO10534InfoGrid);
app.ExtUI.TwoMicISO10534InfoAxes.Layout.Row = 2;
app.ExtUI.TwoMicISO10534InfoAxes.Layout.Column = [1 2];

% Create TwoMicISO10534InfoMainLabel
app.ExtUI.TwoMicISO10534InfoMainLabel = uilabel(app.ExtUI.TwoMicISO10534InfoGrid);
app.ExtUI.TwoMicISO10534InfoMainLabel.HorizontalAlignment = 'center';
app.ExtUI.TwoMicISO10534InfoMainLabel.Layout.Row = 1;
app.ExtUI.TwoMicISO10534InfoMainLabel.Layout.Column = [1 2];
app.ExtUI.TwoMicISO10534InfoMainLabel.Text = 'According to ISO 10534-2:';

% Create TwoMicISO10534InfoParametersPanel
app.ExtUI.TwoMicISO10534InfoParametersPanel = uipanel(app.ExtUI.TwoMicISO10534InfoGrid);
app.ExtUI.TwoMicISO10534InfoParametersPanel.Title = 'Parameters';
app.ExtUI.TwoMicISO10534InfoParametersPanel.BackgroundColor = [0.9412 0.9412 0.9412];
app.ExtUI.TwoMicISO10534InfoParametersPanel.Layout.Row = 3;
app.ExtUI.TwoMicISO10534InfoParametersPanel.Layout.Column = 1;
app.ExtUI.TwoMicISO10534InfoParametersPanel.FontWeight = 'bold';
app.ExtUI.TwoMicISO10534InfoParametersPanel.Scrollable = 'on';

% Create TwoMicISO10534InfoParametersGrid
app.ExtUI.TwoMicISO10534InfoParametersGrid = uigridlayout(app.ExtUI.TwoMicISO10534InfoParametersPanel);
app.ExtUI.TwoMicISO10534InfoParametersGrid.ColumnWidth = {'0.2x', '1x'};
app.ExtUI.TwoMicISO10534InfoParametersGrid.RowHeight = {'fit', 'fit', 'fit', 'fit'};
app.ExtUI.TwoMicISO10534InfoParametersGrid.ColumnSpacing = 5;
app.ExtUI.TwoMicISO10534InfoParametersGrid.RowSpacing = 5;
app.ExtUI.TwoMicISO10534InfoParametersGrid.Scrollable = 'on';
app.ExtUI.TwoMicISO10534InfoParametersGrid.BackgroundColor = [1 1 1];

% Create TwoMicISO10534InfoParamL2info
app.ExtUI.TwoMicISO10534InfoParamL2info = uilabel(app.ExtUI.TwoMicISO10534InfoParametersGrid);
app.ExtUI.TwoMicISO10534InfoParamL2info.WordWrap = 'on';
app.ExtUI.TwoMicISO10534InfoParamL2info.Layout.Row = 4;
app.ExtUI.TwoMicISO10534InfoParamL2info.Layout.Column = 2;
app.ExtUI.TwoMicISO10534InfoParamL2info.Text = 'Distance between microphone 1 and 2.';

% Create TwoMicISO10534InfoParamL2label
app.ExtUI.TwoMicISO10534InfoParamL2label = uilabel(app.ExtUI.TwoMicISO10534InfoParametersGrid);
app.ExtUI.TwoMicISO10534InfoParamL2label.Interpreter = 'latex';
app.ExtUI.TwoMicISO10534InfoParamL2label.HorizontalAlignment = 'right';
app.ExtUI.TwoMicISO10534InfoParamL2label.Layout.Row = 4;
app.ExtUI.TwoMicISO10534InfoParamL2label.Layout.Column = 1;
app.ExtUI.TwoMicISO10534InfoParamL2label.Text = '$\mathbf{s}$';

% Create TwoMicISO10534InfoParamL1label
app.ExtUI.TwoMicISO10534InfoParamL1label = uilabel(app.ExtUI.TwoMicISO10534InfoParametersGrid);
app.ExtUI.TwoMicISO10534InfoParamL1label.Interpreter = 'latex';
app.ExtUI.TwoMicISO10534InfoParamL1label.HorizontalAlignment = 'right';
app.ExtUI.TwoMicISO10534InfoParamL1label.Layout.Row = 3;
app.ExtUI.TwoMicISO10534InfoParamL1label.Layout.Column = 1;
app.ExtUI.TwoMicISO10534InfoParamL1label.Text = '$\mathbf{x_1}$';

% Create TwoMicISO10534InfoParamL1info
app.ExtUI.TwoMicISO10534InfoParamL1info = uilabel(app.ExtUI.TwoMicISO10534InfoParametersGrid);
app.ExtUI.TwoMicISO10534InfoParamL1info.WordWrap = 'on';
app.ExtUI.TwoMicISO10534InfoParamL1info.Layout.Row = 3;
app.ExtUI.TwoMicISO10534InfoParamL1info.Layout.Column = 2;
app.ExtUI.TwoMicISO10534InfoParamL1info.Text = 'Distance between incident face of the sample and microphone 1.';

% Create TwoMicISO10534InfoParamTinfo
app.ExtUI.TwoMicISO10534InfoParamTinfo = uilabel(app.ExtUI.TwoMicISO10534InfoParametersGrid);
app.ExtUI.TwoMicISO10534InfoParamTinfo.WordWrap = 'on';
app.ExtUI.TwoMicISO10534InfoParamTinfo.Layout.Row = 2;
app.ExtUI.TwoMicISO10534InfoParamTinfo.Layout.Column = 2;
app.ExtUI.TwoMicISO10534InfoParamTinfo.Text = 'The inside diameter (circular) or inside side length (square).';

% Create TwoMicISO10534InfoParamTlabel
app.ExtUI.TwoMicISO10534InfoParamTlabel = uilabel(app.ExtUI.TwoMicISO10534InfoParametersGrid);
app.ExtUI.TwoMicISO10534InfoParamTlabel.Interpreter = 'latex';
app.ExtUI.TwoMicISO10534InfoParamTlabel.HorizontalAlignment = 'right';
app.ExtUI.TwoMicISO10534InfoParamTlabel.FontWeight = 'bold';
app.ExtUI.TwoMicISO10534InfoParamTlabel.Layout.Row = 2;
app.ExtUI.TwoMicISO10534InfoParamTlabel.Layout.Column = 1;
app.ExtUI.TwoMicISO10534InfoParamTlabel.Text = '$\mathbf{d}$';

% Create TwoMicISO10534InfoParamShapeInfo
app.ExtUI.TwoMicISO10534InfoParamShapeInfo = uilabel(app.ExtUI.TwoMicISO10534InfoParametersGrid);
app.ExtUI.TwoMicISO10534InfoParamShapeInfo.WordWrap = 'on';
app.ExtUI.TwoMicISO10534InfoParamShapeInfo.Layout.Row = 1;
app.ExtUI.TwoMicISO10534InfoParamShapeInfo.Layout.Column = 2;
app.ExtUI.TwoMicISO10534InfoParamShapeInfo.Text = 'The shape of the tube section, circular and square are available.';

% Create TwoMicISO10534InfoParamShapeLabel
app.ExtUI.TwoMicISO10534InfoParamShapeLabel = uilabel(app.ExtUI.TwoMicISO10534InfoParametersGrid);
app.ExtUI.TwoMicISO10534InfoParamShapeLabel.HorizontalAlignment = 'right';
app.ExtUI.TwoMicISO10534InfoParamShapeLabel.FontWeight = 'bold';
app.ExtUI.TwoMicISO10534InfoParamShapeLabel.Layout.Row = 1;
app.ExtUI.TwoMicISO10534InfoParamShapeLabel.Layout.Column = 1;
app.ExtUI.TwoMicISO10534InfoParamShapeLabel.Text = 'Shape';

% Create TwoMicISO10534InfoLimitsPanel
app.ExtUI.TwoMicISO10534InfoLimitsPanel = uipanel(app.ExtUI.TwoMicISO10534InfoGrid);
app.ExtUI.TwoMicISO10534InfoLimitsPanel.Title = 'Limits';
app.ExtUI.TwoMicISO10534InfoLimitsPanel.BackgroundColor = [0.9412 0.9412 0.9412];
app.ExtUI.TwoMicISO10534InfoLimitsPanel.Layout.Row = 3;
app.ExtUI.TwoMicISO10534InfoLimitsPanel.Layout.Column = 2;
app.ExtUI.TwoMicISO10534InfoLimitsPanel.FontWeight = 'bold';

% Create TwoMicISO10534InfoLimitsGrid
app.ExtUI.TwoMicISO10534InfoLimitsGrid = uigridlayout(app.ExtUI.TwoMicISO10534InfoLimitsPanel);
app.ExtUI.TwoMicISO10534InfoLimitsGrid.ColumnWidth = {15, 'fit', 'fit', '1x'};
app.ExtUI.TwoMicISO10534InfoLimitsGrid.RowHeight = {'fit', 'fit', 'fit', 'fit', 'fit', 'fit', 'fit'};
app.ExtUI.TwoMicISO10534InfoLimitsGrid.ColumnSpacing = 5;
app.ExtUI.TwoMicISO10534InfoLimitsGrid.RowSpacing = 5;
app.ExtUI.TwoMicISO10534InfoLimitsGrid.BackgroundColor = [1 1 1];

% Create TwoMicISO10534InfoLimitsMainLabel
app.ExtUI.TwoMicISO10534InfoLimitsMainLabel = uilabel(app.ExtUI.TwoMicISO10534InfoLimitsGrid);
app.ExtUI.TwoMicISO10534InfoLimitsMainLabel.VerticalAlignment = 'top';
app.ExtUI.TwoMicISO10534InfoLimitsMainLabel.WordWrap = 'on';
app.ExtUI.TwoMicISO10534InfoLimitsMainLabel.Layout.Row = 1;
app.ExtUI.TwoMicISO10534InfoLimitsMainLabel.Layout.Column = [1 4];
app.ExtUI.TwoMicISO10534InfoLimitsMainLabel.Text = 'The working frequency range (upper and lower) is calculated with the expressions below and is automatically applied in the parameter plots to show only the correct data.';

% Create TwoMicISO10534InfoLimitsFmin1_3
app.ExtUI.TwoMicISO10534InfoLimitsFmin1_3 = uilabel(app.ExtUI.TwoMicISO10534InfoLimitsGrid);
app.ExtUI.TwoMicISO10534InfoLimitsFmin1_3.Interpreter = 'latex';
app.ExtUI.TwoMicISO10534InfoLimitsFmin1_3.HorizontalAlignment = 'center';
app.ExtUI.TwoMicISO10534InfoLimitsFmin1_3.Layout.Row = 2;
app.ExtUI.TwoMicISO10534InfoLimitsFmin1_3.Layout.Column = 2;
app.ExtUI.TwoMicISO10534InfoLimitsFmin1_3.Text = '$\mathbf{f_{\text{min}}}$';

% Create TwoMicISO10534InfoLimitsFmin2_3
app.ExtUI.TwoMicISO10534InfoLimitsFmin2_3 = uilabel(app.ExtUI.TwoMicISO10534InfoLimitsGrid);
app.ExtUI.TwoMicISO10534InfoLimitsFmin2_3.Interpreter = 'latex';
app.ExtUI.TwoMicISO10534InfoLimitsFmin2_3.HorizontalAlignment = 'center';
app.ExtUI.TwoMicISO10534InfoLimitsFmin2_3.Layout.Row = 2;
app.ExtUI.TwoMicISO10534InfoLimitsFmin2_3.Layout.Column = 3;
app.ExtUI.TwoMicISO10534InfoLimitsFmin2_3.Text = '$=$';

% Create TwoMicISO10534InfoLimitsFmin3_3
app.ExtUI.TwoMicISO10534InfoLimitsFmin3_3 = uilabel(app.ExtUI.TwoMicISO10534InfoLimitsGrid);
app.ExtUI.TwoMicISO10534InfoLimitsFmin3_3.Interpreter = 'latex';
app.ExtUI.TwoMicISO10534InfoLimitsFmin3_3.Layout.Row = 2;
app.ExtUI.TwoMicISO10534InfoLimitsFmin3_3.Layout.Column = 4;
app.ExtUI.TwoMicISO10534InfoLimitsFmin3_3.Text = '$0.05 \frac{c}{s}$';

% Create TwoMicISO10534InfoLimitsFmax1_3
app.ExtUI.TwoMicISO10534InfoLimitsFmax1_3 = uilabel(app.ExtUI.TwoMicISO10534InfoLimitsGrid);
app.ExtUI.TwoMicISO10534InfoLimitsFmax1_3.Interpreter = 'latex';
app.ExtUI.TwoMicISO10534InfoLimitsFmax1_3.HorizontalAlignment = 'center';
app.ExtUI.TwoMicISO10534InfoLimitsFmax1_3.Layout.Row = 3;
app.ExtUI.TwoMicISO10534InfoLimitsFmax1_3.Layout.Column = 2;
app.ExtUI.TwoMicISO10534InfoLimitsFmax1_3.Text = '$\mathbf{f_{\text{max}}}$';

% Create TwoMicISO10534InfoLimitsFmax2_3
app.ExtUI.TwoMicISO10534InfoLimitsFmax2_3 = uilabel(app.ExtUI.TwoMicISO10534InfoLimitsGrid);
app.ExtUI.TwoMicISO10534InfoLimitsFmax2_3.Interpreter = 'latex';
app.ExtUI.TwoMicISO10534InfoLimitsFmax2_3.HorizontalAlignment = 'center';
app.ExtUI.TwoMicISO10534InfoLimitsFmax2_3.Layout.Row = 3;
app.ExtUI.TwoMicISO10534InfoLimitsFmax2_3.Layout.Column = 3;
app.ExtUI.TwoMicISO10534InfoLimitsFmax2_3.Text = '$=$';

% Create TwoMicISO10534InfoLimitsFmax3_3
app.ExtUI.TwoMicISO10534InfoLimitsFmax3_3 = uilabel(app.ExtUI.TwoMicISO10534InfoLimitsGrid);
app.ExtUI.TwoMicISO10534InfoLimitsFmax3_3.Interpreter = 'latex';
app.ExtUI.TwoMicISO10534InfoLimitsFmax3_3.Layout.Row = 3;
app.ExtUI.TwoMicISO10534InfoLimitsFmax3_3.Layout.Column = 4;
app.ExtUI.TwoMicISO10534InfoLimitsFmax3_3.Text = '$K \frac{c}{d}$';

% Create TwoMicISO10534InfoLimitsWhere1_5
app.ExtUI.TwoMicISO10534InfoLimitsWhere1_5 = uilabel(app.ExtUI.TwoMicISO10534InfoLimitsGrid);
app.ExtUI.TwoMicISO10534InfoLimitsWhere1_5.Layout.Row = 4;
app.ExtUI.TwoMicISO10534InfoLimitsWhere1_5.Layout.Column = 2;
app.ExtUI.TwoMicISO10534InfoLimitsWhere1_5.Text = 'Where:';

% Create TwoMicISO10534InfoLimitsWhere2_5
app.ExtUI.TwoMicISO10534InfoLimitsWhere2_5 = uilabel(app.ExtUI.TwoMicISO10534InfoLimitsGrid);
app.ExtUI.TwoMicISO10534InfoLimitsWhere2_5.Interpreter = 'latex';
app.ExtUI.TwoMicISO10534InfoLimitsWhere2_5.Layout.Row = 4;
app.ExtUI.TwoMicISO10534InfoLimitsWhere2_5.Layout.Column = 3;
app.ExtUI.TwoMicISO10534InfoLimitsWhere2_5.Text = '$K$';

% Create TwoMicISO10534InfoLimitsWhere3_5
app.ExtUI.TwoMicISO10534InfoLimitsWhere3_5 = uilabel(app.ExtUI.TwoMicISO10534InfoLimitsGrid);
app.ExtUI.TwoMicISO10534InfoLimitsWhere3_5.WordWrap = 'on';
app.ExtUI.TwoMicISO10534InfoLimitsWhere3_5.Layout.Row = 4;
app.ExtUI.TwoMicISO10534InfoLimitsWhere3_5.Layout.Column = 4;
app.ExtUI.TwoMicISO10534InfoLimitsWhere3_5.Text = 'is 0.58 for circular shape and 0.50 for square shape.';

% Create TwoMicISO10534InfoLimitsWhere4_5
app.ExtUI.TwoMicISO10534InfoLimitsWhere4_5 = uilabel(app.ExtUI.TwoMicISO10534InfoLimitsGrid);
app.ExtUI.TwoMicISO10534InfoLimitsWhere4_5.Interpreter = 'latex';
app.ExtUI.TwoMicISO10534InfoLimitsWhere4_5.Layout.Row = 5;
app.ExtUI.TwoMicISO10534InfoLimitsWhere4_5.Layout.Column = 3;
app.ExtUI.TwoMicISO10534InfoLimitsWhere4_5.Text = '$c$';

% Create TwoMicISO10534InfoLimitsWhere5_5
app.ExtUI.TwoMicISO10534InfoLimitsWhere5_5 = uilabel(app.ExtUI.TwoMicISO10534InfoLimitsGrid);
app.ExtUI.TwoMicISO10534InfoLimitsWhere5_5.Layout.Row = 5;
app.ExtUI.TwoMicISO10534InfoLimitsWhere5_5.Layout.Column = 4;
app.ExtUI.TwoMicISO10534InfoLimitsWhere5_5.Text = 'is speed of sound in m/s.';

% Create TwoMicISO10534InfoLimitsSmax1_4
app.ExtUI.TwoMicISO10534InfoLimitsSmax1_4 = uilabel(app.ExtUI.TwoMicISO10534InfoLimitsGrid);
app.ExtUI.TwoMicISO10534InfoLimitsSmax1_4.VerticalAlignment = 'top';
app.ExtUI.TwoMicISO10534InfoLimitsSmax1_4.WordWrap = 'on';
app.ExtUI.TwoMicISO10534InfoLimitsSmax1_4.Layout.Row = 6;
app.ExtUI.TwoMicISO10534InfoLimitsSmax1_4.Layout.Column = [1 4];
app.ExtUI.TwoMicISO10534InfoLimitsSmax1_4.Text = 'The maximum microphone spacing';

% Create TwoMicISO10534InfoLimitsSmax2_4
app.ExtUI.TwoMicISO10534InfoLimitsSmax2_4 = uilabel(app.ExtUI.TwoMicISO10534InfoLimitsGrid);
app.ExtUI.TwoMicISO10534InfoLimitsSmax2_4.Interpreter = 'latex';
app.ExtUI.TwoMicISO10534InfoLimitsSmax2_4.Layout.Row = 7;
app.ExtUI.TwoMicISO10534InfoLimitsSmax2_4.Layout.Column = 2;
app.ExtUI.TwoMicISO10534InfoLimitsSmax2_4.Text = '$\mathbf{s_\text{max}}$';

% Create TwoMicISO10534InfoLimitsSmax3_4
app.ExtUI.TwoMicISO10534InfoLimitsSmax3_4 = uilabel(app.ExtUI.TwoMicISO10534InfoLimitsGrid);
app.ExtUI.TwoMicISO10534InfoLimitsSmax3_4.Interpreter = 'latex';
app.ExtUI.TwoMicISO10534InfoLimitsSmax3_4.HorizontalAlignment = 'center';
app.ExtUI.TwoMicISO10534InfoLimitsSmax3_4.Layout.Row = 7;
app.ExtUI.TwoMicISO10534InfoLimitsSmax3_4.Layout.Column = 3;
app.ExtUI.TwoMicISO10534InfoLimitsSmax3_4.Text = '$=$';

% Create TwoMicISO10534InfoLimitsSmax4_4
app.ExtUI.TwoMicISO10534InfoLimitsSmax4_4 = uilabel(app.ExtUI.TwoMicISO10534InfoLimitsGrid);
app.ExtUI.TwoMicISO10534InfoLimitsSmax4_4.Interpreter = 'latex';
app.ExtUI.TwoMicISO10534InfoLimitsSmax4_4.Layout.Row = 7;
app.ExtUI.TwoMicISO10534InfoLimitsSmax4_4.Layout.Column = 4;
app.ExtUI.TwoMicISO10534InfoLimitsSmax4_4.Text = '$0.45 \frac{c}{f_\text{max}}$';

% Create TwoMicISO10534InfoMeasurementPanel
app.ExtUI.TwoMicISO10534InfoMeasurementPanel = uipanel(app.ExtUI.TwoMicISO10534InfoGrid);
app.ExtUI.TwoMicISO10534InfoMeasurementPanel.Title = 'Measurement';
app.ExtUI.TwoMicISO10534InfoMeasurementPanel.Layout.Row = 4;
app.ExtUI.TwoMicISO10534InfoMeasurementPanel.Layout.Column = [1 2];
app.ExtUI.TwoMicISO10534InfoMeasurementPanel.FontWeight = 'bold';


% Create TwoMicISO10534InfoMeasurementGrid
app.ExtUI.TwoMicISO10534InfoMeasurementGrid = uigridlayout(app.ExtUI.TwoMicISO10534InfoMeasurementPanel);
app.ExtUI.TwoMicISO10534InfoMeasurementGrid.ColumnWidth = {'fit', '1x'};
app.ExtUI.TwoMicISO10534InfoMeasurementGrid.RowHeight = {'fit', '1x'};
app.ExtUI.TwoMicISO10534InfoMeasurementGrid.ColumnSpacing = 5;
app.ExtUI.TwoMicISO10534InfoMeasurementGrid.RowSpacing = 5;
app.ExtUI.TwoMicISO10534InfoMeasurementGrid.BackgroundColor = [1 1 1];

% Create TwoMicISO10534InfoMeasurementLabel1
app.ExtUI.TwoMicISO10534InfoMeasurementLabel1 = uilabel(app.ExtUI.TwoMicISO10534InfoMeasurementGrid);
app.ExtUI.TwoMicISO10534InfoMeasurementLabel1.WordWrap = 'on';
app.ExtUI.TwoMicISO10534InfoMeasurementLabel1.Layout.Row = 1;
app.ExtUI.TwoMicISO10534InfoMeasurementLabel1.Layout.Column = 2;
app.ExtUI.TwoMicISO10534InfoMeasurementLabel1.Text = 'You have two options to carry out the measurement: Use one microphone or use two microphones, all the options are available in the panel on the left.';

% Create TwoMicISO10534InfoMeasurementLabel1bar
app.ExtUI.TwoMicISO10534InfoMeasurementLabel1bar = uilabel(app.ExtUI.TwoMicISO10534InfoMeasurementGrid);
app.ExtUI.TwoMicISO10534InfoMeasurementLabel1bar.VerticalAlignment = 'top';
app.ExtUI.TwoMicISO10534InfoMeasurementLabel1bar.Layout.Row = 1;
app.ExtUI.TwoMicISO10534InfoMeasurementLabel1bar.Layout.Column = 1;
app.ExtUI.TwoMicISO10534InfoMeasurementLabel1bar.Text = '-';

% Create TwoMicISO10534InfoMeasurementLabel1_2
app.ExtUI.TwoMicISO10534InfoMeasurementLabel1_2 = uilabel(app.ExtUI.TwoMicISO10534InfoMeasurementGrid);
app.ExtUI.TwoMicISO10534InfoMeasurementLabel1_2.WordWrap = 'on';
app.ExtUI.TwoMicISO10534InfoMeasurementLabel1_2.Layout.Row = 2;
app.ExtUI.TwoMicISO10534InfoMeasurementLabel1_2.Layout.Column = 2;
app.ExtUI.TwoMicISO10534InfoMeasurementLabel1_2.Text = 'If you wish, you can calibrate the tube system to increase the quality of the results. At the top of the measurement there is a calibration button, there are the steps to perform it.';

% Create TwoMicISO10534InfoMeasurementLabel1bar_2
app.ExtUI.TwoMicISO10534InfoMeasurementLabel1bar_2 = uilabel(app.ExtUI.TwoMicISO10534InfoMeasurementGrid);
app.ExtUI.TwoMicISO10534InfoMeasurementLabel1bar_2.VerticalAlignment = 'top';
app.ExtUI.TwoMicISO10534InfoMeasurementLabel1bar_2.Layout.Row = 2;
app.ExtUI.TwoMicISO10534InfoMeasurementLabel1bar_2.Layout.Column = 1;
app.ExtUI.TwoMicISO10534InfoMeasurementLabel1bar_2.Text = '-';

plotTubeTwoMicISO10534(app,app.ExtUI.TwoMicISO10534InfoAxes,{'Mic';'1'},{'Mic';'2'},'Sample',1,0,[])