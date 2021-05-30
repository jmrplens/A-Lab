function createCenterPanelInformationFourMic(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

column = centerGrid(app,{'1x'},{'1x'});

% Create FourMicASTM2611InfoPanel
app.ExtUI.FourMicASTM2611InfoPanel = uipanel(column);
app.ExtUI.FourMicASTM2611InfoPanel.TitlePosition = 'centertop';
app.ExtUI.FourMicASTM2611InfoPanel.Title = 'Information: Impedance / Transmission Tube';
app.ExtUI.FourMicASTM2611InfoPanel.BackgroundColor = [1 1 1];
app.ExtUI.FourMicASTM2611InfoPanel.Layout.Row = 1;
app.ExtUI.FourMicASTM2611InfoPanel.Layout.Column = 1;
app.ExtUI.FourMicASTM2611InfoPanel.FontWeight = 'bold';
app.ExtUI.FourMicASTM2611InfoPanel.FontSize = 14;

% Create FourMicASTM2611InfoGrid
app.ExtUI.FourMicASTM2611InfoGrid = uigridlayout(app.ExtUI.FourMicASTM2611InfoPanel);
app.ExtUI.FourMicASTM2611InfoGrid.RowHeight = {'fit', '1x', 'fit', 'fit'};
app.ExtUI.FourMicASTM2611InfoGrid.BackgroundColor = [1 1 1];

% Create FourMicASTM2611InfoAxes
app.ExtUI.FourMicASTM2611InfoAxes = uiaxes(app.ExtUI.FourMicASTM2611InfoGrid);
app.ExtUI.FourMicASTM2611InfoAxes.Layout.Row = 2;
app.ExtUI.FourMicASTM2611InfoAxes.Layout.Column = [1 2];

% Create FourMicASTM2611InfoMainLabel
app.ExtUI.FourMicASTM2611InfoMainLabel = uilabel(app.ExtUI.FourMicASTM2611InfoGrid);
app.ExtUI.FourMicASTM2611InfoMainLabel.HorizontalAlignment = 'center';
app.ExtUI.FourMicASTM2611InfoMainLabel.Layout.Row = 1;
app.ExtUI.FourMicASTM2611InfoMainLabel.Layout.Column = [1 2];
app.ExtUI.FourMicASTM2611InfoMainLabel.Text = 'According to ASTM 2611:';

% Create FourMicASTM2611InfoParametersPanel
app.ExtUI.FourMicASTM2611InfoParametersPanel = uipanel(app.ExtUI.FourMicASTM2611InfoGrid);
app.ExtUI.FourMicASTM2611InfoParametersPanel.Title = 'Parameters';
app.ExtUI.FourMicASTM2611InfoParametersPanel.BackgroundColor = [0.9412 0.9412 0.9412];
app.ExtUI.FourMicASTM2611InfoParametersPanel.Layout.Row = 3;
app.ExtUI.FourMicASTM2611InfoParametersPanel.Layout.Column = 1;
app.ExtUI.FourMicASTM2611InfoParametersPanel.FontWeight = 'bold';
app.ExtUI.FourMicASTM2611InfoParametersPanel.Scrollable = 'on';

% Create FourMicASTM2611InfoParametersGrid
app.ExtUI.FourMicASTM2611InfoParametersGrid = uigridlayout(app.ExtUI.FourMicASTM2611InfoParametersPanel);
app.ExtUI.FourMicASTM2611InfoParametersGrid.ColumnWidth = {'fit', '1x'};
app.ExtUI.FourMicASTM2611InfoParametersGrid.RowHeight = {'fit', 'fit', 'fit', 'fit', 'fit', 'fit'};
app.ExtUI.FourMicASTM2611InfoParametersGrid.ColumnSpacing = 5;
app.ExtUI.FourMicASTM2611InfoParametersGrid.RowSpacing = 5;
app.ExtUI.FourMicASTM2611InfoParametersGrid.Scrollable = 'on';
app.ExtUI.FourMicASTM2611InfoParametersGrid.BackgroundColor = [1 1 1];

% Create FourMicASTM2611InfoParamL2info
app.ExtUI.FourMicASTM2611InfoParamL2info = uilabel(app.ExtUI.FourMicASTM2611InfoParametersGrid);
app.ExtUI.FourMicASTM2611InfoParamL2info.WordWrap = 'on';
app.ExtUI.FourMicASTM2611InfoParamL2info.Layout.Row = 6;
app.ExtUI.FourMicASTM2611InfoParamL2info.Layout.Column = 2;
app.ExtUI.FourMicASTM2611InfoParamL2info.Text = 'Distance between incident face of the sample and Mic 3.';

% Create FourMicASTM2611InfoParamL2label
app.ExtUI.FourMicASTM2611InfoParamL2label = uilabel(app.ExtUI.FourMicASTM2611InfoParametersGrid);
app.ExtUI.FourMicASTM2611InfoParamL2label.Interpreter = 'latex';
app.ExtUI.FourMicASTM2611InfoParamL2label.HorizontalAlignment = 'right';
app.ExtUI.FourMicASTM2611InfoParamL2label.Layout.Row = 6;
app.ExtUI.FourMicASTM2611InfoParamL2label.Layout.Column = 1;
app.ExtUI.FourMicASTM2611InfoParamL2label.Text = '$\mathbf{l_2}$';

% Create FourMicASTM2611InfoParamL1label
app.ExtUI.FourMicASTM2611InfoParamL1label = uilabel(app.ExtUI.FourMicASTM2611InfoParametersGrid);
app.ExtUI.FourMicASTM2611InfoParamL1label.Interpreter = 'latex';
app.ExtUI.FourMicASTM2611InfoParamL1label.HorizontalAlignment = 'right';
app.ExtUI.FourMicASTM2611InfoParamL1label.Layout.Row = 5;
app.ExtUI.FourMicASTM2611InfoParamL1label.Layout.Column = 1;
app.ExtUI.FourMicASTM2611InfoParamL1label.Text = '$\mathbf{l_1}$';

% Create FourMicASTM2611InfoParamL1info
app.ExtUI.FourMicASTM2611InfoParamL1info = uilabel(app.ExtUI.FourMicASTM2611InfoParametersGrid);
app.ExtUI.FourMicASTM2611InfoParamL1info.WordWrap = 'on';
app.ExtUI.FourMicASTM2611InfoParamL1info.Layout.Row = 5;
app.ExtUI.FourMicASTM2611InfoParamL1info.Layout.Column = 2;
app.ExtUI.FourMicASTM2611InfoParamL1info.Text = 'Distance between incident face of the sample and Mic 2.';

% Create FourMicASTM2611InfoParamSinfo
app.ExtUI.FourMicASTM2611InfoParamSinfo = uilabel(app.ExtUI.FourMicASTM2611InfoParametersGrid);
app.ExtUI.FourMicASTM2611InfoParamSinfo.WordWrap = 'on';
app.ExtUI.FourMicASTM2611InfoParamSinfo.Layout.Row = 4;
app.ExtUI.FourMicASTM2611InfoParamSinfo.Layout.Column = 2;
app.ExtUI.FourMicASTM2611InfoParamSinfo.Text = 'Distance between each pairs of microphones.';

% Create FourMicASTM2611InfoParamSlabel
app.ExtUI.FourMicASTM2611InfoParamSlabel = uilabel(app.ExtUI.FourMicASTM2611InfoParametersGrid);
app.ExtUI.FourMicASTM2611InfoParamSlabel.Interpreter = 'latex';
app.ExtUI.FourMicASTM2611InfoParamSlabel.HorizontalAlignment = 'right';
app.ExtUI.FourMicASTM2611InfoParamSlabel.Layout.Row = 4;
app.ExtUI.FourMicASTM2611InfoParamSlabel.Layout.Column = 1;
app.ExtUI.FourMicASTM2611InfoParamSlabel.Text = '$\mathbf{s_1}$ , $\mathbf{s_2}$';

% Create FourMicASTM2611InfoParamDinfo
app.ExtUI.FourMicASTM2611InfoParamDinfo = uilabel(app.ExtUI.FourMicASTM2611InfoParametersGrid);
app.ExtUI.FourMicASTM2611InfoParamDinfo.WordWrap = 'on';
app.ExtUI.FourMicASTM2611InfoParamDinfo.Layout.Row = 3;
app.ExtUI.FourMicASTM2611InfoParamDinfo.Layout.Column = 2;
app.ExtUI.FourMicASTM2611InfoParamDinfo.Text = 'Sample thickness.';

% Create FourMicASTM2611InfoParamDlabel
app.ExtUI.FourMicASTM2611InfoParamDlabel = uilabel(app.ExtUI.FourMicASTM2611InfoParametersGrid);
app.ExtUI.FourMicASTM2611InfoParamDlabel.Interpreter = 'latex';
app.ExtUI.FourMicASTM2611InfoParamDlabel.HorizontalAlignment = 'right';
app.ExtUI.FourMicASTM2611InfoParamDlabel.FontWeight = 'bold';
app.ExtUI.FourMicASTM2611InfoParamDlabel.Layout.Row = 3;
app.ExtUI.FourMicASTM2611InfoParamDlabel.Layout.Column = 1;
app.ExtUI.FourMicASTM2611InfoParamDlabel.Text = '$\mathbf{d}$';

% Create FourMicASTM2611InfoParamTinfo
app.ExtUI.FourMicASTM2611InfoParamTinfo = uilabel(app.ExtUI.FourMicASTM2611InfoParametersGrid);
app.ExtUI.FourMicASTM2611InfoParamTinfo.WordWrap = 'on';
app.ExtUI.FourMicASTM2611InfoParamTinfo.Layout.Row = 2;
app.ExtUI.FourMicASTM2611InfoParamTinfo.Layout.Column = 2;
app.ExtUI.FourMicASTM2611InfoParamTinfo.Text = 'The inside diameter (circular) or inside side length (square).';

% Create FourMicASTM2611InfoParamTlabel
app.ExtUI.FourMicASTM2611InfoParamTlabel = uilabel(app.ExtUI.FourMicASTM2611InfoParametersGrid);
app.ExtUI.FourMicASTM2611InfoParamTlabel.Interpreter = 'latex';
app.ExtUI.FourMicASTM2611InfoParamTlabel.HorizontalAlignment = 'right';
app.ExtUI.FourMicASTM2611InfoParamTlabel.FontWeight = 'bold';
app.ExtUI.FourMicASTM2611InfoParamTlabel.Layout.Row = 2;
app.ExtUI.FourMicASTM2611InfoParamTlabel.Layout.Column = 1;
app.ExtUI.FourMicASTM2611InfoParamTlabel.Text = '$\mathbf{t}$';

% Create FourMicASTM2611InfoParamShapeInfo
app.ExtUI.FourMicASTM2611InfoParamShapeInfo = uilabel(app.ExtUI.FourMicASTM2611InfoParametersGrid);
app.ExtUI.FourMicASTM2611InfoParamShapeInfo.WordWrap = 'on';
app.ExtUI.FourMicASTM2611InfoParamShapeInfo.Layout.Row = 1;
app.ExtUI.FourMicASTM2611InfoParamShapeInfo.Layout.Column = 2;
app.ExtUI.FourMicASTM2611InfoParamShapeInfo.Text = 'The shape of the tube section, circular and square ara available.';

% Create FourMicASTM2611InfoParamShapeLabel
app.ExtUI.FourMicASTM2611InfoParamShapeLabel = uilabel(app.ExtUI.FourMicASTM2611InfoParametersGrid);
app.ExtUI.FourMicASTM2611InfoParamShapeLabel.HorizontalAlignment = 'right';
app.ExtUI.FourMicASTM2611InfoParamShapeLabel.FontWeight = 'bold';
app.ExtUI.FourMicASTM2611InfoParamShapeLabel.Layout.Row = 1;
app.ExtUI.FourMicASTM2611InfoParamShapeLabel.Layout.Column = 1;
app.ExtUI.FourMicASTM2611InfoParamShapeLabel.Text = 'Shape';

% Create FourMicASTM2611InfoLimitsPanel
app.ExtUI.FourMicASTM2611InfoLimitsPanel = uipanel(app.ExtUI.FourMicASTM2611InfoGrid);
app.ExtUI.FourMicASTM2611InfoLimitsPanel.Title = 'Limits';
app.ExtUI.FourMicASTM2611InfoLimitsPanel.BackgroundColor = [0.9412 0.9412 0.9412];
app.ExtUI.FourMicASTM2611InfoLimitsPanel.Layout.Row = 3;
app.ExtUI.FourMicASTM2611InfoLimitsPanel.Layout.Column = 2;
app.ExtUI.FourMicASTM2611InfoLimitsPanel.FontWeight = 'bold';

% Create FourMicASTM2611InfoLimitsGrid
app.ExtUI.FourMicASTM2611InfoLimitsGrid = uigridlayout(app.ExtUI.FourMicASTM2611InfoLimitsPanel);
app.ExtUI.FourMicASTM2611InfoLimitsGrid.ColumnWidth = {15, 'fit', 'fit', '1x'};
app.ExtUI.FourMicASTM2611InfoLimitsGrid.RowHeight = {'fit', 'fit', 'fit', 'fit', 'fit', 'fit', 'fit'};
app.ExtUI.FourMicASTM2611InfoLimitsGrid.ColumnSpacing = 5;
app.ExtUI.FourMicASTM2611InfoLimitsGrid.RowSpacing = 5;
app.ExtUI.FourMicASTM2611InfoLimitsGrid.BackgroundColor = [1 1 1];

% Create FourMicASTM2611InfoLimitsMainLabel
app.ExtUI.FourMicASTM2611InfoLimitsMainLabel = uilabel(app.ExtUI.FourMicASTM2611InfoLimitsGrid);
app.ExtUI.FourMicASTM2611InfoLimitsMainLabel.VerticalAlignment = 'top';
app.ExtUI.FourMicASTM2611InfoLimitsMainLabel.WordWrap = 'on';
app.ExtUI.FourMicASTM2611InfoLimitsMainLabel.Layout.Row = 1;
app.ExtUI.FourMicASTM2611InfoLimitsMainLabel.Layout.Column = [1 4];
app.ExtUI.FourMicASTM2611InfoLimitsMainLabel.Text = 'The working frequency range (upper and lower) is calculated with the expressions below and is automatically applied in the parameter plots to show only the correct data.';

% Create FourMicASTM2611InfoLimitsFmin1_3
app.ExtUI.FourMicASTM2611InfoLimitsFmin1_3 = uilabel(app.ExtUI.FourMicASTM2611InfoLimitsGrid);
app.ExtUI.FourMicASTM2611InfoLimitsFmin1_3.Interpreter = 'latex';
app.ExtUI.FourMicASTM2611InfoLimitsFmin1_3.HorizontalAlignment = 'center';
app.ExtUI.FourMicASTM2611InfoLimitsFmin1_3.Layout.Row = 2;
app.ExtUI.FourMicASTM2611InfoLimitsFmin1_3.Layout.Column = 2;
app.ExtUI.FourMicASTM2611InfoLimitsFmin1_3.Text = '$\mathbf{f_{\text{min}}}$';

% Create FourMicASTM2611InfoLimitsFmin2_3
app.ExtUI.FourMicASTM2611InfoLimitsFmin2_3 = uilabel(app.ExtUI.FourMicASTM2611InfoLimitsGrid);
app.ExtUI.FourMicASTM2611InfoLimitsFmin2_3.Interpreter = 'latex';
app.ExtUI.FourMicASTM2611InfoLimitsFmin2_3.HorizontalAlignment = 'center';
app.ExtUI.FourMicASTM2611InfoLimitsFmin2_3.Layout.Row = 2;
app.ExtUI.FourMicASTM2611InfoLimitsFmin2_3.Layout.Column = 3;
app.ExtUI.FourMicASTM2611InfoLimitsFmin2_3.Text = '$=$';

% Create FourMicASTM2611InfoLimitsFmin3_3
app.ExtUI.FourMicASTM2611InfoLimitsFmin3_3 = uilabel(app.ExtUI.FourMicASTM2611InfoLimitsGrid);
app.ExtUI.FourMicASTM2611InfoLimitsFmin3_3.Interpreter = 'latex';
app.ExtUI.FourMicASTM2611InfoLimitsFmin3_3.Layout.Row = 2;
app.ExtUI.FourMicASTM2611InfoLimitsFmin3_3.Layout.Column = 4;
app.ExtUI.FourMicASTM2611InfoLimitsFmin3_3.Text = '$0.01 \frac{c}{\text{min}(s_1,s_2)}$';

% Create FourMicASTM2611InfoLimitsFmax1_3
app.ExtUI.FourMicASTM2611InfoLimitsFmax1_3 = uilabel(app.ExtUI.FourMicASTM2611InfoLimitsGrid);
app.ExtUI.FourMicASTM2611InfoLimitsFmax1_3.Interpreter = 'latex';
app.ExtUI.FourMicASTM2611InfoLimitsFmax1_3.HorizontalAlignment = 'center';
app.ExtUI.FourMicASTM2611InfoLimitsFmax1_3.Layout.Row = 3;
app.ExtUI.FourMicASTM2611InfoLimitsFmax1_3.Layout.Column = 2;
app.ExtUI.FourMicASTM2611InfoLimitsFmax1_3.Text = '$\mathbf{f_{\text{max}}}$';

% Create FourMicASTM2611InfoLimitsFmax2_3
app.ExtUI.FourMicASTM2611InfoLimitsFmax2_3 = uilabel(app.ExtUI.FourMicASTM2611InfoLimitsGrid);
app.ExtUI.FourMicASTM2611InfoLimitsFmax2_3.Interpreter = 'latex';
app.ExtUI.FourMicASTM2611InfoLimitsFmax2_3.HorizontalAlignment = 'center';
app.ExtUI.FourMicASTM2611InfoLimitsFmax2_3.Layout.Row = 3;
app.ExtUI.FourMicASTM2611InfoLimitsFmax2_3.Layout.Column = 3;
app.ExtUI.FourMicASTM2611InfoLimitsFmax2_3.Text = '$=$';

% Create FourMicASTM2611InfoLimitsFmax3_3
app.ExtUI.FourMicASTM2611InfoLimitsFmax3_3 = uilabel(app.ExtUI.FourMicASTM2611InfoLimitsGrid);
app.ExtUI.FourMicASTM2611InfoLimitsFmax3_3.Interpreter = 'latex';
app.ExtUI.FourMicASTM2611InfoLimitsFmax3_3.Layout.Row = 3;
app.ExtUI.FourMicASTM2611InfoLimitsFmax3_3.Layout.Column = 4;
app.ExtUI.FourMicASTM2611InfoLimitsFmax3_3.Text = '$K \frac{c}{t}$';

% Create FourMicASTM2611InfoLimitsWhere1_5
app.ExtUI.FourMicASTM2611InfoLimitsWhere1_5 = uilabel(app.ExtUI.FourMicASTM2611InfoLimitsGrid);
app.ExtUI.FourMicASTM2611InfoLimitsWhere1_5.Layout.Row = 4;
app.ExtUI.FourMicASTM2611InfoLimitsWhere1_5.Layout.Column = 2;
app.ExtUI.FourMicASTM2611InfoLimitsWhere1_5.Text = 'Where:';

% Create FourMicASTM2611InfoLimitsWhere2_5
app.ExtUI.FourMicASTM2611InfoLimitsWhere2_5 = uilabel(app.ExtUI.FourMicASTM2611InfoLimitsGrid);
app.ExtUI.FourMicASTM2611InfoLimitsWhere2_5.Interpreter = 'latex';
app.ExtUI.FourMicASTM2611InfoLimitsWhere2_5.Layout.Row = 4;
app.ExtUI.FourMicASTM2611InfoLimitsWhere2_5.Layout.Column = 3;
app.ExtUI.FourMicASTM2611InfoLimitsWhere2_5.Text = '$K$';

% Create FourMicASTM2611InfoLimitsWhere3_5
app.ExtUI.FourMicASTM2611InfoLimitsWhere3_5 = uilabel(app.ExtUI.FourMicASTM2611InfoLimitsGrid);
app.ExtUI.FourMicASTM2611InfoLimitsWhere3_5.WordWrap = 'on';
app.ExtUI.FourMicASTM2611InfoLimitsWhere3_5.Layout.Row = 4;
app.ExtUI.FourMicASTM2611InfoLimitsWhere3_5.Layout.Column = 4;
app.ExtUI.FourMicASTM2611InfoLimitsWhere3_5.Text = 'is 0.586 for circular shape and 0.500 for square shape.';

% Create FourMicASTM2611InfoLimitsWhere4_5
app.ExtUI.FourMicASTM2611InfoLimitsWhere4_5 = uilabel(app.ExtUI.FourMicASTM2611InfoLimitsGrid);
app.ExtUI.FourMicASTM2611InfoLimitsWhere4_5.Interpreter = 'latex';
app.ExtUI.FourMicASTM2611InfoLimitsWhere4_5.Layout.Row = 5;
app.ExtUI.FourMicASTM2611InfoLimitsWhere4_5.Layout.Column = 3;
app.ExtUI.FourMicASTM2611InfoLimitsWhere4_5.Text = '$c$';

% Create FourMicASTM2611InfoLimitsWhere5_5
app.ExtUI.FourMicASTM2611InfoLimitsWhere5_5 = uilabel(app.ExtUI.FourMicASTM2611InfoLimitsGrid);
app.ExtUI.FourMicASTM2611InfoLimitsWhere5_5.Layout.Row = 5;
app.ExtUI.FourMicASTM2611InfoLimitsWhere5_5.Layout.Column = 4;
app.ExtUI.FourMicASTM2611InfoLimitsWhere5_5.Text = 'is speed of sound in m/s.';

% Create FourMicASTM2611InfoLimitsSmax1_4
app.ExtUI.FourMicASTM2611InfoLimitsSmax1_4 = uilabel(app.ExtUI.FourMicASTM2611InfoLimitsGrid);
app.ExtUI.FourMicASTM2611InfoLimitsSmax1_4.VerticalAlignment = 'top';
app.ExtUI.FourMicASTM2611InfoLimitsSmax1_4.WordWrap = 'on';
app.ExtUI.FourMicASTM2611InfoLimitsSmax1_4.Layout.Row = 6;
app.ExtUI.FourMicASTM2611InfoLimitsSmax1_4.Layout.Column = [1 4];
app.ExtUI.FourMicASTM2611InfoLimitsSmax1_4.Text = 'The maximum microphone spacing';

% Create FourMicASTM2611InfoLimitsSmax2_4
app.ExtUI.FourMicASTM2611InfoLimitsSmax2_4 = uilabel(app.ExtUI.FourMicASTM2611InfoLimitsGrid);
app.ExtUI.FourMicASTM2611InfoLimitsSmax2_4.Interpreter = 'latex';
app.ExtUI.FourMicASTM2611InfoLimitsSmax2_4.Layout.Row = 7;
app.ExtUI.FourMicASTM2611InfoLimitsSmax2_4.Layout.Column = 2;
app.ExtUI.FourMicASTM2611InfoLimitsSmax2_4.Text = '$\mathbf{s_\text{max}}$';

% Create FourMicASTM2611InfoLimitsSmax3_4
app.ExtUI.FourMicASTM2611InfoLimitsSmax3_4 = uilabel(app.ExtUI.FourMicASTM2611InfoLimitsGrid);
app.ExtUI.FourMicASTM2611InfoLimitsSmax3_4.Interpreter = 'latex';
app.ExtUI.FourMicASTM2611InfoLimitsSmax3_4.HorizontalAlignment = 'center';
app.ExtUI.FourMicASTM2611InfoLimitsSmax3_4.Layout.Row = 7;
app.ExtUI.FourMicASTM2611InfoLimitsSmax3_4.Layout.Column = 3;
app.ExtUI.FourMicASTM2611InfoLimitsSmax3_4.Text = '$=$';

% Create FourMicASTM2611InfoLimitsSmax4_4
app.ExtUI.FourMicASTM2611InfoLimitsSmax4_4 = uilabel(app.ExtUI.FourMicASTM2611InfoLimitsGrid);
app.ExtUI.FourMicASTM2611InfoLimitsSmax4_4.Interpreter = 'latex';
app.ExtUI.FourMicASTM2611InfoLimitsSmax4_4.Layout.Row = 7;
app.ExtUI.FourMicASTM2611InfoLimitsSmax4_4.Layout.Column = 4;
app.ExtUI.FourMicASTM2611InfoLimitsSmax4_4.Text = '$0.80 \frac{c}{2f_\text{max}}$';

% Create FourMicASTM2611InfoMeasurementPanel
app.ExtUI.FourMicASTM2611InfoMeasurementPanel = uipanel(app.ExtUI.FourMicASTM2611InfoGrid);
app.ExtUI.FourMicASTM2611InfoMeasurementPanel.Title = 'Measurement';
app.ExtUI.FourMicASTM2611InfoMeasurementPanel.Layout.Row = 4;
app.ExtUI.FourMicASTM2611InfoMeasurementPanel.Layout.Column = [1 2];
app.ExtUI.FourMicASTM2611InfoMeasurementPanel.FontWeight = 'bold';

% Create FourMicASTM2611InfoMeasurementGrid
app.ExtUI.FourMicASTM2611InfoMeasurementGrid = uigridlayout(app.ExtUI.FourMicASTM2611InfoMeasurementPanel);
app.ExtUI.FourMicASTM2611InfoMeasurementGrid.ColumnWidth = {'fit', '1x'};
app.ExtUI.FourMicASTM2611InfoMeasurementGrid.RowHeight = {'fit', '1x'};
app.ExtUI.FourMicASTM2611InfoMeasurementGrid.ColumnSpacing = 5;
app.ExtUI.FourMicASTM2611InfoMeasurementGrid.RowSpacing = 5;
app.ExtUI.FourMicASTM2611InfoMeasurementGrid.BackgroundColor = [1 1 1];

% Create FourMicASTM2611InfoMeasurementLabel1
app.ExtUI.FourMicASTM2611InfoMeasurementLabel1 = uilabel(app.ExtUI.FourMicASTM2611InfoMeasurementGrid);
app.ExtUI.FourMicASTM2611InfoMeasurementLabel1.WordWrap = 'on';
app.ExtUI.FourMicASTM2611InfoMeasurementLabel1.Layout.Row = 1;
app.ExtUI.FourMicASTM2611InfoMeasurementLabel1.Layout.Column = 2;
app.ExtUI.FourMicASTM2611InfoMeasurementLabel1.Text = 'You have three options to carry out the measurement: Use one microphone, use two microphones or use 4 microphones, all the options are available in the panel on the left.';

% Create FourMicASTM2611InfoMeasurementLabel2
app.ExtUI.FourMicASTM2611InfoMeasurementLabel2 = uilabel(app.ExtUI.FourMicASTM2611InfoMeasurementGrid);
app.ExtUI.FourMicASTM2611InfoMeasurementLabel2.WordWrap = 'on';
app.ExtUI.FourMicASTM2611InfoMeasurementLabel2.Layout.Row = 2;
app.ExtUI.FourMicASTM2611InfoMeasurementLabel2.Layout.Column = 2;
app.ExtUI.FourMicASTM2611InfoMeasurementLabel2.Text = {'If the sample is the same on both sides, it is a symmetrical material, so only the measurement with anechoic termination is necessary.'; 'On the other hand, if the sample is not symmetrical, it is necessary to perform a measurement with an anechoic end and another with a rigid end.'};

% Create FourMicASTM2611InfoMeasurementLabel1bar
app.ExtUI.FourMicASTM2611InfoMeasurementLabel1bar = uilabel(app.ExtUI.FourMicASTM2611InfoMeasurementGrid);
app.ExtUI.FourMicASTM2611InfoMeasurementLabel1bar.VerticalAlignment = 'top';
app.ExtUI.FourMicASTM2611InfoMeasurementLabel1bar.Layout.Row = 1;
app.ExtUI.FourMicASTM2611InfoMeasurementLabel1bar.Layout.Column = 1;
app.ExtUI.FourMicASTM2611InfoMeasurementLabel1bar.Text = '-';

% Create FourMicASTM2611InfoMeasurementLabel2bar
app.ExtUI.FourMicASTM2611InfoMeasurementLabel2bar = uilabel(app.ExtUI.FourMicASTM2611InfoMeasurementGrid);
app.ExtUI.FourMicASTM2611InfoMeasurementLabel2bar.VerticalAlignment = 'top';
app.ExtUI.FourMicASTM2611InfoMeasurementLabel2bar.Layout.Row = 2;
app.ExtUI.FourMicASTM2611InfoMeasurementLabel2bar.Layout.Column = 1;
app.ExtUI.FourMicASTM2611InfoMeasurementLabel2bar.Text = '-';

plotTubeFourMicASTM2611(app,app.ExtUI.FourMicASTM2611InfoAxes,{'Mic';'1'},{'Mic';'2'},{'Mic';'3'},{'Mic';'4'},1,0,0,[])