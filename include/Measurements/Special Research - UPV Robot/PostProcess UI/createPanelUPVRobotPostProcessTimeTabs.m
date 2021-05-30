function createPanelUPVRobotPostProcessTimeTabs(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Center column
centerGrid(app,{'1x'},{'1x', '0.34x'});

% Create CenterMainPanelUPVRobotPostProcessTime
app.ExtUI.CenterMainPanelUPVRobotPostProcessTime = uipanel(app.ExtUI.GridCenterMain);
app.ExtUI.CenterMainPanelUPVRobotPostProcessTime.TitlePosition = 'centertop';
app.ExtUI.CenterMainPanelUPVRobotPostProcessTime.Title = 'Time Domain';
app.ExtUI.CenterMainPanelUPVRobotPostProcessTime.BackgroundColor = [1 1 1];
app.ExtUI.CenterMainPanelUPVRobotPostProcessTime.Layout.Row = 1;
app.ExtUI.CenterMainPanelUPVRobotPostProcessTime.Layout.Column = 1;
app.ExtUI.CenterMainPanelUPVRobotPostProcessTime.FontWeight = 'bold';
app.ExtUI.CenterMainPanelUPVRobotPostProcessTime.FontSize = 14;

% Create CenterMainGridUPVRobotPostProcessTime
app.ExtUI.CenterMainGridUPVRobotPostProcessTime = uigridlayout(app.ExtUI.CenterMainPanelUPVRobotPostProcessTime);
app.ExtUI.CenterMainGridUPVRobotPostProcessTime.ColumnWidth = {'1x'};
app.ExtUI.CenterMainGridUPVRobotPostProcessTime.RowHeight = {'1x'};
app.ExtUI.CenterMainGridUPVRobotPostProcessTime.Padding = [0 0 0 0];

% Create UPVRobotPostProcessTimeTabGroup
app.ExtUI.UPVRobotPostProcessTimeTabGroup = uitabgroup(app.ExtUI.CenterMainGridUPVRobotPostProcessTime);
app.ExtUI.UPVRobotPostProcessTimeTabGroup.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessTimeTabGroup.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessTimeTabGroup.Visible = 'off';
app.ExtUI.UPVRobotPostProcessTimeTabGroup.SelectionChangedFcn = {@UPVRobotPostProcessTimeTabChanged,app};

% Create UPVRobotPostProcessTimeTab1D
app.ExtUI.UPVRobotPostProcessTimeTab1D = uitab(app.ExtUI.UPVRobotPostProcessTimeTabGroup);
app.ExtUI.UPVRobotPostProcessTimeTab1D.Title = '1D';
app.ExtUI.UPVRobotPostProcessTimeTab1D.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessTimeTab2D
app.ExtUI.UPVRobotPostProcessTimeTab2D = uitab(app.ExtUI.UPVRobotPostProcessTimeTabGroup);
app.ExtUI.UPVRobotPostProcessTimeTab2D.Title = '2D';
app.ExtUI.UPVRobotPostProcessTimeTab2D.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessTimeTab3D
app.ExtUI.UPVRobotPostProcessTimeTab3D = uitab(app.ExtUI.UPVRobotPostProcessTimeTabGroup);
app.ExtUI.UPVRobotPostProcessTimeTab3D.Title = '3D';
app.ExtUI.UPVRobotPostProcessTimeTab3D.BackgroundColor = [1 1 1];

%% ===============================================
% GRID PLOT ELEMENTS FOR 2D
% Create GridCenterMainPanelUPVRobotPostProcessTime
app.ExtUI.GridCenterMainPanelUPVRobotPostProcessTime = uigridlayout(app.ExtUI.UPVRobotPostProcessTimeTab2D);
app.ExtUI.GridCenterMainPanelUPVRobotPostProcessTime.ColumnWidth = {'1x', '1x', '1x', '1x'};
app.ExtUI.GridCenterMainPanelUPVRobotPostProcessTime.RowHeight = {'1x', 'fit','fit'};
app.ExtUI.GridCenterMainPanelUPVRobotPostProcessTime.Padding = [20 10 20 10];
app.ExtUI.GridCenterMainPanelUPVRobotPostProcessTime.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessUIAxesTime2D
app.ExtUI.UPVRobotPostProcessUIAxesTime2D = uiaxes(app.ExtUI.GridCenterMainPanelUPVRobotPostProcessTime);
app.ExtUI.UPVRobotPostProcessUIAxesTime2D.PlotBoxAspectRatio = [1.50712250712251 1 1];
app.ExtUI.UPVRobotPostProcessUIAxesTime2D.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessUIAxesTime2D.Layout.Column = [1 4];

% Create GridUPVRobotPostProcessTimeControl2D
app.ExtUI.GridUPVRobotPostProcessTimeControl2D = uigridlayout(app.ExtUI.GridCenterMainPanelUPVRobotPostProcessTime);
app.ExtUI.GridUPVRobotPostProcessTimeControl2D.ColumnWidth = {'0.5x', 'fit', 'fit'};
app.ExtUI.GridUPVRobotPostProcessTimeControl2D.RowHeight = {'1x'};
app.ExtUI.GridUPVRobotPostProcessTimeControl2D.Padding = [5 5 5 5];
app.ExtUI.GridUPVRobotPostProcessTimeControl2D.Layout.Row = 2;
app.ExtUI.GridUPVRobotPostProcessTimeControl2D.Layout.Column = [1 4];
app.ExtUI.GridUPVRobotPostProcessTimeControl2D.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessTimeSlider2D
app.ExtUI.UPVRobotPostProcessTimeSlider2D = uislider(app.ExtUI.GridUPVRobotPostProcessTimeControl2D);
app.ExtUI.UPVRobotPostProcessTimeSlider2D.MajorTicks = [];
app.ExtUI.UPVRobotPostProcessTimeSlider2D.MajorTickLabels = {''};
app.ExtUI.UPVRobotPostProcessTimeSlider2D.MinorTicks = [];
app.ExtUI.UPVRobotPostProcessTimeSlider2D.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessTimeSlider2D.Layout.Column = 1;

% Create UPVRobotPostProcessTimeInfo2D
app.ExtUI.UPVRobotPostProcessTimeInfo2D = uilabel(app.ExtUI.GridUPVRobotPostProcessTimeControl2D);
app.ExtUI.UPVRobotPostProcessTimeInfo2D.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessTimeInfo2D.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessTimeInfo2D.Text = 'X ms';

% Create UPVRobotPostProcessTimePlayButton2D
app.ExtUI.UPVRobotPostProcessTimePlayButton2D = uibutton(app.ExtUI.GridUPVRobotPostProcessTimeControl2D, 'push');
app.ExtUI.UPVRobotPostProcessTimePlayButton2D.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessTimePlayButton2D.Layout.Column = 3;
app.ExtUI.UPVRobotPostProcessTimePlayButton2D.Text = 'Play';

% Create UPVRobotPostProcessButtonAxes2DXYTime
app.ExtUI.UPVRobotPostProcessButtonAxes2DXYTime = uibutton(app.ExtUI.GridCenterMainPanelUPVRobotPostProcessTime, 'push');
app.ExtUI.UPVRobotPostProcessButtonAxes2DXYTime.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessButtonAxes2DXYTime.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessButtonAxes2DXYTime.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessButtonAxes2DXYTime.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessButtonAxes2DXYTime.Text = 'XY';

% Create UPVRobotPostProcessButtonAxes2DXZTime
app.ExtUI.UPVRobotPostProcessButtonAxes2DXZTime = uibutton(app.ExtUI.GridCenterMainPanelUPVRobotPostProcessTime, 'push');
app.ExtUI.UPVRobotPostProcessButtonAxes2DXZTime.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessButtonAxes2DXZTime.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessButtonAxes2DXZTime.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessButtonAxes2DXZTime.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessButtonAxes2DXZTime.Text = 'XZ';

% Create UPVRobotPostProcessButtonAxes2DYZTime
app.ExtUI.UPVRobotPostProcessButtonAxes2DYZTime = uibutton(app.ExtUI.GridCenterMainPanelUPVRobotPostProcessTime, 'push');
app.ExtUI.UPVRobotPostProcessButtonAxes2DYZTime.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessButtonAxes2DYZTime.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessButtonAxes2DYZTime.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessButtonAxes2DYZTime.Layout.Column = 3;
app.ExtUI.UPVRobotPostProcessButtonAxes2DYZTime.Text = 'YZ';

% Create UPVRobotPostProcessButtonAxes2D3DTime
app.ExtUI.UPVRobotPostProcessButtonAxes2D3DTime = uibutton(app.ExtUI.GridCenterMainPanelUPVRobotPostProcessTime, 'push');
app.ExtUI.UPVRobotPostProcessButtonAxes2D3DTime.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessButtonAxes2D3DTime.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessButtonAxes2D3DTime.FontColor = [0.6353 0.0784 0.1843];
app.ExtUI.UPVRobotPostProcessButtonAxes2D3DTime.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessButtonAxes2D3DTime.Layout.Column = 4;
app.ExtUI.UPVRobotPostProcessButtonAxes2D3DTime.Text = '3D';

%% ===============================================
% Logics

% Selected tab logic
if ~isempty(app.ExtVar.UPVRobotPostProcess.DimType)
    idx = find(strcmp({app.ExtUI.UPVRobotPostProcessTimeTabGroup.Children.Title},app.ExtVar.UPVRobotPostProcess.DimType), 1);
    if ~isempty(idx)
        app.ExtUI.UPVRobotPostProcessTimeTabGroup.SelectedTab = app.ExtUI.UPVRobotPostProcessTimeTabGroup.Children(idx);
    else
        app.ExtVar.UPVRobotPostProcess.DimType = app.ExtUI.UPVRobotPostProcessTimeTabGroup.SelectedTab.Title;
    end
else
    app.ExtVar.UPVRobotPostProcess.DimType = app.ExtUI.UPVRobotPostProcessTimeTabGroup.SelectedTab.Title;
end

% Create content tab
switch app.ExtVar.UPVRobotPostProcess.DimType
    case '1D'
        %         UPVRobotPostProcessFreq1DCreate(app)
        %         % Plot points
        %         UPVRobotPostProcessPlotFreq1DPoints(app)
    case '2D'
        UPVRobotPostProcessTime2DCreate(app)
    case '3D'
        %UPVRobotPostProcessFreq3DCreate(app)
end
% Plot data
UPVRobotPostProcessPlot(app)

% Show
drawnow
app.ExtUI.UPVRobotPostProcessTimeTabGroup.Visible = 'on';
drawnow

% Boolean to know if the selection is modified
app.ExtVar.UPVRobotPostProcess.SelectionChangedG = true;
app.ExtVar.UPVRobotPostProcess.SelectionChangedT = true;

%% ===============================================
% Main Functions
function UPVRobotPostProcessTimeTabChanged(~,~,app)

% % Loading info
% d = uiprogressdlg(app.ALabUIFigure,'Title','Loading',...
%     'Indeterminate','on');

% Hide center main grids
% app.ExtUI.GridCenterMainPanelUPVRobotPostProcess1D.Visible = 'off'; % 1D
% app.ExtUI.GridCenterMainPanelUPVRobotPostProcess.Visible = 'off'; % 2D
% app.ExtUI.GridCenterMainPanelUPVRobotPostProcessFreq3D.Visible = 'off'; % 3D

% Delete actual bottom tools
if ~isempty(app.ExtVar.UPVRobotPostProcess.DimType)
    switch app.ExtVar.UPVRobotPostProcess.DimType
        case '1D'
            %             if isvalid(app.ExtUI.GridUPVRobotPostProcessBottomCenterGridFreq1D)
            %                 delete(app.ExtUI.GridUPVRobotPostProcessBottomCenterGridFreq1D) % 1D
            %             end
        case '2D'
            if isvalid(app.ExtUI.GridUPVRobotPostProcessBottomCenterGrid2DTime)
                delete(app.ExtUI.GridUPVRobotPostProcessBottomCenterGrid2DTime) % 2D
            end
        case '3D'
            %             if isvalid(app.ExtUI.GridUPVRobotPostProcessBottomCenterGridFreq3D)
            %                 delete(app.ExtUI.GridUPVRobotPostProcessBottomCenterGridFreq3D) % 3D
            %             end
    end
    drawnow
end

% Update DimType
app.ExtVar.UPVRobotPostProcess.DimType = app.ExtUI.UPVRobotPostProcessTimeTabGroup.SelectedTab.Title;

switch app.ExtVar.UPVRobotPostProcess.DimType
    case '1D'
        %         UPVRobotPostProcessFreq1DCreate(app)
        %         % Plot points
        %         UPVRobotPostProcessPlotFreq1DPoints(app)
        %         % Plot data
        %         UPVRobotPostProcessPlot(app)
        %         %app.ExtUI.GridCenterMainPanelUPVRobotPostProcess1D.Visible = 'on';
    case '2D'
        UPVRobotPostProcessTime2DCreate(app)
        UPVRobotPostProcessPlot(app)
        %app.ExtUI.GridCenterMainPanelUPVRobotPostProcess.Visible = 'on';
    case '3D'
        %         UPVRobotPostProcessFreq3DCreate(app)
        %         UPVRobotPostProcessPlot(app)
        %app.ExtUI.GridCenterMainPanelUPVRobotPostProcessFreq3D.Visible = 'on';
end
% Close info
pause(0.5)
%close(d)