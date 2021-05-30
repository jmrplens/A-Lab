function createCenterPanelMeasureFourMicASTM2611(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Grid
existpanel = 1;
if isfield(app.ExtUI,'CenterMainPanelFourMicTube')
    if  ~isvalid(app.ExtUI.CenterMainPanelFourMicTube)
        existpanel = 0;
    end
else
    existpanel = 0;
end

if existpanel == 0
    column = centerGrid(app,{'1x'},{'1x'});
    
    % Create CenterMainPanelFourMicTwoMic
    app.ExtUI.CenterMainPanelFourMicTube = uipanel(column);
    app.ExtUI.CenterMainPanelFourMicTube.TitlePosition = 'centertop';
    app.ExtUI.CenterMainPanelFourMicTube.Title = 'Measurement';
    app.ExtUI.CenterMainPanelFourMicTube.FontWeight = 'bold';
    app.ExtUI.CenterMainPanelFourMicTube.BackgroundColor = [1 1 1];
    app.ExtUI.CenterMainPanelFourMicTube.Layout.Row = 1;
    app.ExtUI.CenterMainPanelFourMicTube.Layout.Column = 1;
    app.ExtUI.CenterMainPanelFourMicTube.FontAngle = 'italic';
    
    % Create GridCenterPanelFourMicTube
    app.ExtUI.GridCenterPanelFourMicTube = uigridlayout(app.ExtUI.CenterMainPanelFourMicTube);
    app.ExtUI.GridCenterPanelFourMicTube.ColumnWidth = {'1x'};
    app.ExtUI.GridCenterPanelFourMicTube.RowHeight = {'fit', '1x', '1x'};
    app.ExtUI.GridCenterPanelFourMicTube.BackgroundColor = [1 1 1];
    
end

% Clean
delete(app.ExtUI.GridCenterPanelFourMicTube.Children)

% Select measure type
switch  app.ExtVar.ImpedanceTubeFourMic.NumMics
    case 1
        % Create FourMicTwoMicSymmetricGrid
        app.ExtUI.FourMicOneMicSymmetricGrid = uigridlayout(app.ExtUI.GridCenterPanelFourMicTube);
        app.ExtUI.FourMicOneMicSymmetricGrid.ColumnWidth = {'1x', 'fit', 'fit', '1x', 'fit', 'fit', '1x', 'fit', 'fit', '1x'};
        app.ExtUI.FourMicOneMicSymmetricGrid.RowHeight = {'fit', 'fit'};
        app.ExtUI.FourMicOneMicSymmetricGrid.Layout.Row = 1;
        app.ExtUI.FourMicOneMicSymmetricGrid.Layout.Column = 1;
        app.ExtUI.FourMicOneMicSymmetricGrid.BackgroundColor = [1 1 1];
        
        % Create FourMicTwoMicSymmetricLabel
        app.ExtUI.FourMicTwoMicSymmetricLabel = uilabel(app.ExtUI.FourMicOneMicSymmetricGrid);
        app.ExtUI.FourMicTwoMicSymmetricLabel.WordWrap = 'on';
        app.ExtUI.FourMicTwoMicSymmetricLabel.FontWeight = 'bold';
        app.ExtUI.FourMicTwoMicSymmetricLabel.Layout.Row = 2;
        app.ExtUI.FourMicTwoMicSymmetricLabel.Layout.Column = 2;
        app.ExtUI.FourMicTwoMicSymmetricLabel.Text = 'Is the sample symmetric?';
        
        % Create FourMicTwoMicSymmetricCheck
        app.ExtUI.FourMicTubeSymmetricCheck = uicheckbox(app.ExtUI.FourMicOneMicSymmetricGrid);
        app.ExtUI.FourMicTubeSymmetricCheck.ValueChangedFcn = {@FourMicTubeSymmetricChanged,app};
        app.ExtUI.FourMicTubeSymmetricCheck.Text = '';
        app.ExtUI.FourMicTubeSymmetricCheck.Layout.Row = 2;
        app.ExtUI.FourMicTubeSymmetricCheck.Layout.Column = 3;
        
        % Create OutputChannelDropDownLabel
        app.ExtUI.OutputChannelDropDownLabel = uilabel(app.ExtUI.FourMicOneMicSymmetricGrid);
        app.ExtUI.OutputChannelDropDownLabel.HorizontalAlignment = 'right';
        app.ExtUI.OutputChannelDropDownLabel.WordWrap = 'on';
        app.ExtUI.OutputChannelDropDownLabel.FontWeight = 'bold';
        app.ExtUI.OutputChannelDropDownLabel.Layout.Row = 2;
        app.ExtUI.OutputChannelDropDownLabel.Layout.Column = 5;
        app.ExtUI.OutputChannelDropDownLabel.Text = 'Output Channel';
        
        [Nin,Nout] = getAvailableChannels(app);
        
        % Create FourMicTubeMeasureOutputChannelDropDown
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDown = uidropdown(app.ExtUI.FourMicOneMicSymmetricGrid);
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDown.Items = string(1:Nout);
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDown.ValueChangedFcn = {@FourMicTubeOutputChanged,app};
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDown.BackgroundColor = [1 1 1];
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDown.Layout.Row = 2;
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDown.Layout.Column = 6;
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDown.Value = '1';
        if isempty(app.ExtVar.ImpedanceTubeFourMic.OutputCh) || app.ExtVar.ImpedanceTubeFourMic.OutputCh > Nout
            app.ExtVar.ImpedanceTubeFourMic.OutputCh = str2double(app.ExtUI.FourMicTubeMeasureOutputChannelDropDown.Value);
        else
            app.ExtUI.FourMicTubeMeasureOutputChannelDropDown.Value = num2str(app.ExtVar.ImpedanceTubeFourMic.OutputCh,'%d');
        end
        
        % Create FourMicTwoMicMeasureInfo
        app.ExtUI.FourMicTubeMeasureInfo = uilabel(app.ExtUI.FourMicOneMicSymmetricGrid);
        app.ExtUI.FourMicTubeMeasureInfo.WordWrap = 'on';
        app.ExtUI.FourMicTubeMeasureInfo.Layout.Row = 1;
        app.ExtUI.FourMicTubeMeasureInfo.Layout.Column = [1 10];
        app.ExtUI.FourMicTubeMeasureInfo.Text = 'When you finish the measurements, click on the <Calculate results> (red button in the right column) to get the results.';
        
        
        % Create FourMicOneMicMic1DropDown
        app.ExtUI.FourMicOneMicMic1DropDown = uidropdown(app.ExtUI.FourMicOneMicSymmetricGrid);
        app.ExtUI.FourMicOneMicMic1DropDown.ValueChangedFcn = {@FourMicOneMicChangedChannel,app};
        app.ExtUI.FourMicOneMicMic1DropDown.Items = string(1:Nin);
        app.ExtUI.FourMicOneMicMic1DropDown.FontWeight = 'bold';
        app.ExtUI.FourMicOneMicMic1DropDown.BackgroundColor = [1 1 1];
        app.ExtUI.FourMicOneMicMic1DropDown.Layout.Row = 2;
        app.ExtUI.FourMicOneMicMic1DropDown.Layout.Column = 9;
        app.ExtUI.FourMicOneMicMic1DropDown.Value = '1';
        if isempty(app.ExtVar.ImpedanceTubeFourMic.Mic1Ch) || app.ExtVar.ImpedanceTubeFourMic.Mic1Ch > Nin
            app.ExtVar.ImpedanceTubeFourMic.Mic1Ch = str2double(app.ExtUI.FourMicOneMicMic1DropDown.Value);
            app.ExtVar.ImpedanceTubeFourMic.Mic2Ch = [];
            app.ExtVar.ImpedanceTubeFourMic.Mic3Ch = [];
            app.ExtVar.ImpedanceTubeFourMic.Mic4Ch = [];
        else
            app.ExtUI.FourMicOneMicMic1DropDown.Value = num2str(app.ExtVar.ImpedanceTubeFourMic.Mic1Ch,'%d');
            app.ExtVar.ImpedanceTubeFourMic.Mic2Ch = [];
            app.ExtVar.ImpedanceTubeFourMic.Mic3Ch = [];
            app.ExtVar.ImpedanceTubeFourMic.Mic4Ch = [];
        end
        
        % Create InputChannelLabel
        app.ExtUI.InputChannelLabel = uilabel(app.ExtUI.FourMicOneMicSymmetricGrid);
        app.ExtUI.InputChannelLabel.BackgroundColor = [1 1 1];
        app.ExtUI.InputChannelLabel.HorizontalAlignment = 'right';
        app.ExtUI.InputChannelLabel.WordWrap = 'on';
        app.ExtUI.InputChannelLabel.FontWeight = 'bold';
        app.ExtUI.InputChannelLabel.Layout.Row = 2;
        app.ExtUI.InputChannelLabel.Layout.Column = 8;
        app.ExtUI.InputChannelLabel.Text = 'Input Channel';
        
        % Check symmetric and output channel
        if isempty(app.ExtVar.ImpedanceTubeFourMic.Symmetrical)
            app.ExtVar.ImpedanceTubeFourMic.Symmetrical = app.ExtUI.FourMicTubeSymmetricCheck.Value;
        else
            app.ExtUI.FourMicTubeSymmetricCheck.Value = app.ExtVar.ImpedanceTubeFourMic.Symmetrical;
        end
        
        % Load
        app.ExtUI.CenterMainPanelFourMicTube.Title = '1-Mic measurement';
        createMeasureFourMicOneMicOptions(app)
        
    case 2
        
        % Create FourMicTubeSymmetricGrid
        app.ExtUI.FourMicTubeSymmetricGrid = uigridlayout(app.ExtUI.GridCenterPanelFourMicTube);
        app.ExtUI.FourMicTubeSymmetricGrid.ColumnWidth = {'1x', 'fit', 'fit', '1x', 'fit', 'fit', '1x'};
        app.ExtUI.FourMicTubeSymmetricGrid.RowHeight = {'fit','fit'};
        app.ExtUI.FourMicTubeSymmetricGrid.Layout.Row = 1;
        app.ExtUI.FourMicTubeSymmetricGrid.Layout.Column = 1;
        app.ExtUI.FourMicTubeSymmetricGrid.BackgroundColor = [1 1 1];
        
        % Create FourMicTubeMeasureInfo
        app.ExtUI.FourMicTubeMeasureInfo = uilabel(app.ExtUI.FourMicTubeSymmetricGrid);
        app.ExtUI.FourMicTubeMeasureInfo.WordWrap = 'on';
        app.ExtUI.FourMicTubeMeasureInfo.Layout.Row = 1;
        app.ExtUI.FourMicTubeMeasureInfo.Layout.Column = [1 7];
        app.ExtUI.FourMicTubeMeasureInfo.Text = 'When you finish the measurements, click on the <Calculate results> (red button in the right column) to get the results.';
        
        % Create FourMicTubeSymmetricLabel
        app.ExtUI.FourMicTubeSymmetricLabel = uilabel(app.ExtUI.FourMicTubeSymmetricGrid);
        app.ExtUI.FourMicTubeSymmetricLabel.Layout.Row = 2;
        app.ExtUI.FourMicTubeSymmetricLabel.Layout.Column = 2;
        app.ExtUI.FourMicTubeSymmetricLabel.Text = 'Is the sample symmetric?';
        app.ExtUI.FourMicTubeSymmetricLabel.FontWeight = 'bold';
        
        % Create FourMicTubeSymmetricCheck
        app.ExtUI.FourMicTubeSymmetricCheck = uicheckbox(app.ExtUI.FourMicTubeSymmetricGrid);
        app.ExtUI.FourMicTubeSymmetricCheck.Text = '';
        app.ExtUI.FourMicTubeSymmetricCheck.ValueChangedFcn = {@FourMicTubeSymmetricChanged,app};
        app.ExtUI.FourMicTubeSymmetricCheck.Layout.Row = 2;
        app.ExtUI.FourMicTubeSymmetricCheck.Layout.Column = 3;
        app.ExtUI.FourMicTubeSymmetricCheck.Value = true;
        
        % Create FourMicTubeMeasureOutputChannelDropDownLabel
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDownLabel = uilabel(app.ExtUI.FourMicTubeSymmetricGrid);
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDownLabel.HorizontalAlignment = 'right';
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDownLabel.FontWeight = 'bold';
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDownLabel.Layout.Row = 2;
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDownLabel.Layout.Column = 5;
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDownLabel.Text = 'Output Channel';
        
        [~,Nout] = getAvailableChannels(app);
        
        % Create FourMicTubeMeasureOutputChannelDropDown
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDown = uidropdown(app.ExtUI.FourMicTubeSymmetricGrid);
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDown.Items = string(1:Nout);
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDown.ValueChangedFcn = {@FourMicTubeOutputChanged,app};
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDown.BackgroundColor = [1 1 1];
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDown.Layout.Row = 2;
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDown.Layout.Column = 6;
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDown.Value = '1';
        if isempty(app.ExtVar.ImpedanceTubeFourMic.OutputCh) || app.ExtVar.ImpedanceTubeFourMic.OutputCh > Nout
            app.ExtVar.ImpedanceTubeFourMic.OutputCh = str2double(app.ExtUI.FourMicTubeMeasureOutputChannelDropDown.Value);
        else
            app.ExtUI.FourMicTubeMeasureOutputChannelDropDown.Value = num2str(app.ExtVar.ImpedanceTubeFourMic.OutputCh,'%d');
        end
        
        % Check symmetric
        if isempty(app.ExtVar.ImpedanceTubeFourMic.Symmetrical)
            app.ExtVar.ImpedanceTubeFourMic.Symmetrical = app.ExtUI.FourMicTubeSymmetricCheck.Value;
        else
            app.ExtUI.FourMicTubeSymmetricCheck.Value = app.ExtVar.ImpedanceTubeFourMic.Symmetrical;
        end
        
        app.ExtUI.CenterMainPanelFourMicTube.Title = '2-Mic measurement';
        createMeasureFourMicTwoMicOptions(app);
        
    case 4
        
        % Create FourMicSymmetricGrid
        app.ExtUI.FourMicSymmetricGrid = uigridlayout(app.ExtUI.GridCenterPanelFourMicTube);
        app.ExtUI.FourMicSymmetricGrid.ColumnWidth = {'1x', 'fit', 'fit', '1x', 'fit', 'fit', '1x', 'fit'};
        app.ExtUI.FourMicSymmetricGrid.RowHeight = {'fit', 'fit'};
        app.ExtUI.FourMicSymmetricGrid.Layout.Row = 1;
        app.ExtUI.FourMicSymmetricGrid.Layout.Column = 1;
        app.ExtUI.FourMicSymmetricGrid.BackgroundColor = [1 1 1];
        
        % Create FourMicTwoMicSymmetricLabel
        app.ExtUI.FourMicTubeMeasureInfo = uilabel(app.ExtUI.FourMicSymmetricGrid);
        app.ExtUI.FourMicTubeMeasureInfo.FontWeight = 'bold';
        app.ExtUI.FourMicTubeMeasureInfo.Layout.Row = 2;
        app.ExtUI.FourMicTubeMeasureInfo.Layout.Column = 2;
        app.ExtUI.FourMicTubeMeasureInfo.Text = 'Is the sample symmetric?';
        
        % Create FourMicTwoMicSymmetricCheck
        app.ExtUI.FourMicTubeSymmetricCheck = uicheckbox(app.ExtUI.FourMicSymmetricGrid);
        app.ExtUI.FourMicTubeSymmetricCheck.ValueChangedFcn = {@FourMicTubeSymmetricChanged,app};
        app.ExtUI.FourMicTubeSymmetricCheck.Text = '';
        app.ExtUI.FourMicTubeSymmetricCheck.Layout.Row = 2;
        app.ExtUI.FourMicTubeSymmetricCheck.Layout.Column = 3;
        
        % Create OutputChannelDropDownLabel
        app.ExtUI.OutputChannelDropDownLabel = uilabel(app.ExtUI.FourMicSymmetricGrid);
        app.ExtUI.OutputChannelDropDownLabel.HorizontalAlignment = 'right';
        app.ExtUI.OutputChannelDropDownLabel.FontWeight = 'bold';
        app.ExtUI.OutputChannelDropDownLabel.Layout.Row = 2;
        app.ExtUI.OutputChannelDropDownLabel.Layout.Column = 5;
        app.ExtUI.OutputChannelDropDownLabel.Text = 'Output Channel';
        
        [~,Nout] = getAvailableChannels(app);
        
        % Create FourMicTubeMeasureOutputChannelDropDown
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDown = uidropdown(app.ExtUI.FourMicSymmetricGrid);
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDown.ValueChangedFcn = {@FourMicTubeOutputChanged,app};
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDown.Items = string(1:Nout);
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDown.FontWeight = 'bold';
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDown.BackgroundColor = [1 1 1];
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDown.Layout.Row = 2;
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDown.Layout.Column = 6;
        app.ExtUI.FourMicTubeMeasureOutputChannelDropDown.Value = '1';
        
        if isempty(app.ExtVar.ImpedanceTubeFourMic.OutputCh) || app.ExtVar.ImpedanceTubeFourMic.OutputCh > Nout
            app.ExtVar.ImpedanceTubeFourMic.OutputCh = str2double(app.ExtUI.FourMicTubeMeasureOutputChannelDropDown.Value);
        else
            app.ExtUI.FourMicTubeMeasureOutputChannelDropDown.Value = num2str(app.ExtVar.ImpedanceTubeFourMic.OutputCh,'%d');
        end
        
        % Create FourMicTwoMicMeasureInfo
        app.ExtUI.FourMicTwoMicMeasureInfo = uilabel(app.ExtUI.FourMicSymmetricGrid);
        app.ExtUI.FourMicTwoMicMeasureInfo.WordWrap = 'on';
        app.ExtUI.FourMicTwoMicMeasureInfo.Layout.Row = 1;
        app.ExtUI.FourMicTwoMicMeasureInfo.Layout.Column = [1 8];
        app.ExtUI.FourMicTwoMicMeasureInfo.Text = 'When you finish the measurements, click on the <Calculate results> (red button in the right column) to get the results.';
        
        % Create CalibratetubeButton
        app.ExtUI.CalibratetubeButton = uibutton(app.ExtUI.FourMicSymmetricGrid, 'push');
        app.ExtUI.CalibratetubeButton.BackgroundColor = [1 1 1];
        app.ExtUI.CalibratetubeButton.FontWeight = 'bold';
        app.ExtUI.CalibratetubeButton.Layout.Row = 2;
        app.ExtUI.CalibratetubeButton.Layout.Column = 8;
        app.ExtUI.CalibratetubeButton.Text = 'Calibrate tube';
        app.ExtUI.CalibratetubeButton.ButtonPushedFcn = {@createCenterPanelFourMicCalibration,app};
        
        
        
        % Check symmetric
        if isempty(app.ExtVar.ImpedanceTubeFourMic.Symmetrical)
            app.ExtVar.ImpedanceTubeFourMic.Symmetrical = app.ExtUI.FourMicTubeSymmetricCheck.Value;
        else
            app.ExtUI.FourMicTubeSymmetricCheck.Value = app.ExtVar.ImpedanceTubeFourMic.Symmetrical;
        end
        
        app.ExtUI.CenterMainPanelFourMicTube.Title = '4-Mic measurement';
        createMeasureFourMicFourMicOptions(app)
        
end
drawnow

function FourMicTubeSymmetricChanged(~,~,app)
app.ExtVar.ImpedanceTubeFourMic.Symmetrical = app.ExtUI.FourMicTubeSymmetricCheck.Value;
% Check
FourMicCheckForCalculate(app)

switch  app.ExtVar.ImpedanceTubeFourMic.NumMics
    case 1
        if app.ExtVar.ImpedanceTubeFourMic.Symmetrical
            app.ExtUI.FourMicOneMicRigidendPanel.Visible = 'off';
        else
            app.ExtUI.FourMicOneMicRigidendPanel.Visible = 'on';
        end
    case 2
        if app.ExtVar.ImpedanceTubeFourMic.Symmetrical
            app.ExtUI.FourMicTwoMicRigidendPanel.Visible = 'off';
        else
            app.ExtUI.FourMicTwoMicRigidendPanel.Visible = 'on';
        end
    case 4
        if app.ExtVar.ImpedanceTubeFourMic.Symmetrical
            app.ExtUI.FourMicFourMicRigidendPanel.Visible = 'off';
        else
            app.ExtUI.FourMicFourMicRigidendPanel.Visible = 'on';
        end
        
end

function FourMicTubeOutputChanged(~,~,app)
app.ExtVar.ImpedanceTubeFourMic.OutputCh = str2double(app.ExtUI.FourMicTubeMeasureOutputChannelDropDown.Value);

function FourMicOneMicChangedChannel(~,~,app)
app.ExtVar.ImpedanceTubeFourMic.Mic1Ch = str2double(app.ExtUI.FourMicOneMicMic1DropDown.Value);