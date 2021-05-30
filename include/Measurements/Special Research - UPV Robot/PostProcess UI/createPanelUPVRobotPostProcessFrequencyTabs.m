function createPanelUPVRobotPostProcessFrequencyTabs(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Center column
centerGrid(app,{'1x'},{'1x', '0.34x'});

% Create CenterMainPanelUPVRobotPostProcess
app.ExtUI.CenterMainPanelUPVRobotPostProcess = uipanel(app.ExtUI.GridCenterMain);
app.ExtUI.CenterMainPanelUPVRobotPostProcess.TitlePosition = 'centertop';
app.ExtUI.CenterMainPanelUPVRobotPostProcess.Title = 'Frequency Domain';
app.ExtUI.CenterMainPanelUPVRobotPostProcess.BackgroundColor = [1 1 1];
app.ExtUI.CenterMainPanelUPVRobotPostProcess.Layout.Row = 1;
app.ExtUI.CenterMainPanelUPVRobotPostProcess.Layout.Column = 1;
app.ExtUI.CenterMainPanelUPVRobotPostProcess.FontWeight = 'bold';
app.ExtUI.CenterMainPanelUPVRobotPostProcess.FontSize = 14;

% Create GridCenterMainPanelUPVRobotPostProcess
app.ExtUI.CenterMainGridUPVRobotPostProcess = uigridlayout(app.ExtUI.CenterMainPanelUPVRobotPostProcess);
app.ExtUI.CenterMainGridUPVRobotPostProcess.ColumnWidth = {'1x'};
app.ExtUI.CenterMainGridUPVRobotPostProcess.RowHeight = {'1x'};
app.ExtUI.CenterMainGridUPVRobotPostProcess.BackgroundColor = [1 1 1];
app.ExtUI.CenterMainGridUPVRobotPostProcess.Padding = [0,0,0,0];

% Create UPVRobotPostProcessFreqTabGroup
app.ExtUI.UPVRobotPostProcessFreqTabGroup = uitabgroup(app.ExtUI.CenterMainGridUPVRobotPostProcess);
app.ExtUI.UPVRobotPostProcessFreqTabGroup.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFreqTabGroup.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessFreqTabGroup.SelectionChangedFcn = {@UPVRobotPostProcessFreqTabChanged,app};
app.ExtUI.UPVRobotPostProcessFreqTabGroup.Visible = 'off';

% Create UPVRobotPostProcessFreqTab1D
app.ExtUI.UPVRobotPostProcessFreqTab1D = uitab(app.ExtUI.UPVRobotPostProcessFreqTabGroup);
app.ExtUI.UPVRobotPostProcessFreqTab1D.Title = '1D';
app.ExtUI.UPVRobotPostProcessFreqTab1D.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessFreqTab2D
app.ExtUI.UPVRobotPostProcessFreqTab2D = uitab(app.ExtUI.UPVRobotPostProcessFreqTabGroup);
app.ExtUI.UPVRobotPostProcessFreqTab2D.Title = '2D';
app.ExtUI.UPVRobotPostProcessFreqTab2D.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessFreqTab3D
app.ExtUI.UPVRobotPostProcessFreqTab3D = uitab(app.ExtUI.UPVRobotPostProcessFreqTabGroup);
app.ExtUI.UPVRobotPostProcessFreqTab3D.Title = '3D';
app.ExtUI.UPVRobotPostProcessFreqTab3D.BackgroundColor = [1 1 1];

%% ===============================================
% GRID PLOT ELEMENTS FOR 1D
% Create GridCenterMainPanelUPVRobotPostProcess1D
app.ExtUI.GridCenterMainPanelUPVRobotPostProcess1D = uigridlayout(app.ExtUI.UPVRobotPostProcessFreqTab1D);
app.ExtUI.GridCenterMainPanelUPVRobotPostProcess1D.ColumnWidth = {'1x'};
app.ExtUI.GridCenterMainPanelUPVRobotPostProcess1D.RowHeight = {'1x'};
app.ExtUI.GridCenterMainPanelUPVRobotPostProcess1D.Padding = [5 5 5 5];
app.ExtUI.GridCenterMainPanelUPVRobotPostProcess1D.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessFreqTab1DPlots
app.ExtUI.UPVRobotPostProcessFreqTab1DPlots = uitabgroup(app.ExtUI.GridCenterMainPanelUPVRobotPostProcess1D);
app.ExtUI.UPVRobotPostProcessFreqTab1DPlots.TabLocation = 'bottom';
app.ExtUI.UPVRobotPostProcessFreqTab1DPlots.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFreqTab1DPlots.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessFreqTab1DPlots.SelectionChangedFcn = {@UPVRobotPostProcessFreq1DTabChanged,app};

% Create UPVRobotPostProcessFreq1DPointsTab
app.ExtUI.UPVRobotPostProcessFreq1DPointsTab = uitab(app.ExtUI.UPVRobotPostProcessFreqTab1DPlots);
app.ExtUI.UPVRobotPostProcessFreq1DPointsTab.Title = 'Points';

% Create UPVRobotPostProcessFreq1DPointsGrid
app.ExtUI.UPVRobotPostProcessFreq1DPointsGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessFreq1DPointsTab);
app.ExtUI.UPVRobotPostProcessFreq1DPointsGrid.ColumnWidth = {'fit', '0.25x'};
app.ExtUI.UPVRobotPostProcessFreq1DPointsGrid.RowHeight = {'1x', 'fit'};
app.ExtUI.UPVRobotPostProcessFreq1DPointsGrid.ColumnSpacing = 5;
app.ExtUI.UPVRobotPostProcessFreq1DPointsGrid.Padding = [5 5 5 5];
app.ExtUI.UPVRobotPostProcessFreq1DPointsGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessFreq1DPointsUIaxes
app.ExtUI.UPVRobotPostProcessFreq1DPointsUIaxes = uiaxes(app.ExtUI.UPVRobotPostProcessFreq1DPointsGrid);
app.ExtUI.UPVRobotPostProcessFreq1DPointsUIaxes.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFreq1DPointsUIaxes.Layout.Column = 1;

% Create UPVRobotPostProcessFreq1DPointsSelectionGrid
app.ExtUI.UPVRobotPostProcessFreq1DPointsSelectionGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessFreq1DPointsGrid);
app.ExtUI.UPVRobotPostProcessFreq1DPointsSelectionGrid.ColumnWidth = {'1x'};
app.ExtUI.UPVRobotPostProcessFreq1DPointsSelectionGrid.RowHeight = {'1x', 'fit'};
app.ExtUI.UPVRobotPostProcessFreq1DPointsSelectionGrid.RowSpacing = 5;
app.ExtUI.UPVRobotPostProcessFreq1DPointsSelectionGrid.Padding = [0 0 0 0];
app.ExtUI.UPVRobotPostProcessFreq1DPointsSelectionGrid.Layout.Row = [1 2];
app.ExtUI.UPVRobotPostProcessFreq1DPointsSelectionGrid.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessFreq1DPointsSelectionGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessFreq1DSelectpointsPanel
app.ExtUI.UPVRobotPostProcessFreq1DSelectpointsPanel = uipanel(app.ExtUI.UPVRobotPostProcessFreq1DPointsSelectionGrid);
app.ExtUI.UPVRobotPostProcessFreq1DSelectpointsPanel.TitlePosition = 'centertop';
app.ExtUI.UPVRobotPostProcessFreq1DSelectpointsPanel.Title = 'Select points';
app.ExtUI.UPVRobotPostProcessFreq1DSelectpointsPanel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFreq1DSelectpointsPanel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessFreq1DSelectpointsPanel.FontWeight = 'bold';

% Create UPVRobotPostProcessFreq1DSelectPointsGrid
app.ExtUI.UPVRobotPostProcessFreq1DSelectPointsGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessFreq1DSelectpointsPanel);
app.ExtUI.UPVRobotPostProcessFreq1DSelectPointsGrid.ColumnWidth = {'1x'};
app.ExtUI.UPVRobotPostProcessFreq1DSelectPointsGrid.RowHeight = {'1x'};
app.ExtUI.UPVRobotPostProcessFreq1DSelectPointsGrid.Padding = [0 0 0 0];
app.ExtUI.UPVRobotPostProcessFreq1DSelectPointsGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessFreq1DSelectPointsUITable
app.ExtUI.UPVRobotPostProcessFreq1DSelectPointsUITable = uitable(app.ExtUI.UPVRobotPostProcessFreq1DSelectPointsGrid);
app.ExtUI.UPVRobotPostProcessFreq1DSelectPointsUITable.ColumnName = {'Select';'Index point'};
app.ExtUI.UPVRobotPostProcessFreq1DSelectPointsUITable.ColumnWidth = {50, 'auto'};
app.ExtUI.UPVRobotPostProcessFreq1DSelectPointsUITable.RowName = {};
app.ExtUI.UPVRobotPostProcessFreq1DSelectPointsUITable.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFreq1DSelectPointsUITable.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessFreq1DSelectPointsUITable.ColumnEditable = [true false];
app.ExtUI.UPVRobotPostProcessFreq1DSelectPointsUITable.CellEditCallback = {@UPVRobotPostProcessFreq1DSelectPointTable,app};

% Fill table
coords = app.ExtVar.UPVRobotPostProcess.Coords;
idx = 1:size(coords,1);
selection = false(size(coords,1),1);
if ~isempty(app.ExtVar.UPVRobotPostProcess.SelectedPoints)
    selection(app.ExtVar.UPVRobotPostProcess.SelectedPoints) = true;
else
    app.ExtVar.UPVRobotPostProcess.SelectedPoints = 1;
    selection(1) = true;
end
% Table
app.ExtUI.UPVRobotPostProcessFreq1DSelectPointsUITable.Data = table(selection,idx');
% Align center
s = uistyle('HorizontalAlignment','center');
addStyle(app.ExtUI.UPVRobotPostProcessFreq1DSelectPointsUITable,s,'table','');

% Create UPVRobotPostProcessFreq1DPointsOriginGrid
app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessFreq1DPointsSelectionGrid);
app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginGrid.ColumnWidth = {'1x', '1x', '0.7x'};
app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginGrid.RowHeight = {'fit', 1, 'fit', 'fit', 'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginGrid.ColumnSpacing = 1;
app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginGrid.RowSpacing = 5;
app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginGrid.Padding = [0 0 0 0];
app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginGrid.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginGrid.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessFreq1DPointsSelectallCheckBox
app.ExtUI.UPVRobotPostProcessFreq1DPointsSelectallCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginGrid);
app.ExtUI.UPVRobotPostProcessFreq1DPointsSelectallCheckBox.Text = 'Select all';
app.ExtUI.UPVRobotPostProcessFreq1DPointsSelectallCheckBox.WordWrap = 'on';
app.ExtUI.UPVRobotPostProcessFreq1DPointsSelectallCheckBox.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessFreq1DPointsSelectallCheckBox.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFreq1DPointsSelectallCheckBox.Layout.Column = [1 3];
app.ExtUI.UPVRobotPostProcessFreq1DPointsSelectallCheckBox.ValueChangedFcn = {@UPVRobotPostProcessFreq1DSelectAllPoints,app};

if numel(find(selection==false)) > 0
    app.ExtUI.UPVRobotPostProcessFreq1DPointsSelectallCheckBox.Value = 0;
else
    app.ExtUI.UPVRobotPostProcessFreq1DPointsSelectallCheckBox.Value = 1;
end

% Create UPVRobotPostProcessFreq1DOriSeparator
app.ExtUI.UPVRobotPostProcessFreq1DOriSeparator = uigridlayout(app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginGrid);
app.ExtUI.UPVRobotPostProcessFreq1DOriSeparator.ColumnWidth = {'1x'};
app.ExtUI.UPVRobotPostProcessFreq1DOriSeparator.RowHeight = {'1x'};
app.ExtUI.UPVRobotPostProcessFreq1DOriSeparator.Padding = [0 0 0 0];
app.ExtUI.UPVRobotPostProcessFreq1DOriSeparator.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessFreq1DOriSeparator.Layout.Column = [1 3];
app.ExtUI.UPVRobotPostProcessFreq1DOriSeparator.BackgroundColor = [0 0 0];

% Create UPVRobotPostProcessFreq1DOriOriginfordistanceplotLabel
app.ExtUI.UPVRobotPostProcessFreq1DOriOriginfordistanceplotLabel = uilabel(app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginGrid);
app.ExtUI.UPVRobotPostProcessFreq1DOriOriginfordistanceplotLabel.WordWrap = 'on';
app.ExtUI.UPVRobotPostProcessFreq1DOriOriginfordistanceplotLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessFreq1DOriOriginfordistanceplotLabel.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessFreq1DOriOriginfordistanceplotLabel.Layout.Column = [1 3];
app.ExtUI.UPVRobotPostProcessFreq1DOriOriginfordistanceplotLabel.Text = 'Origin for distance plot';

% Create UPVRobotPostProcessFreq1DOriIndexpointCheckBox
app.ExtUI.UPVRobotPostProcessFreq1DOriIndexpointCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginGrid);
app.ExtUI.UPVRobotPostProcessFreq1DOriIndexpointCheckBox.Text = 'From point (index)';
app.ExtUI.UPVRobotPostProcessFreq1DOriIndexpointCheckBox.Layout.Row = 4;
app.ExtUI.UPVRobotPostProcessFreq1DOriIndexpointCheckBox.Layout.Column = [1 2];
app.ExtUI.UPVRobotPostProcessFreq1DOriIndexpointCheckBox.Value = 0;
app.ExtUI.UPVRobotPostProcessFreq1DOriIndexpointCheckBox.ValueChangedFcn = {@UPVRobotPostProcessFreq1DOriPointSelection,app};

% Create UPVRobotPostProcessFreq1DOriIndexPointEditField
app.ExtUI.UPVRobotPostProcessFreq1DOriIndexPointEditField = uieditfield(app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginGrid, 'numeric');
app.ExtUI.UPVRobotPostProcessFreq1DOriIndexPointEditField.Limits = [1 Inf];
app.ExtUI.UPVRobotPostProcessFreq1DOriIndexPointEditField.RoundFractionalValues = 'on';
app.ExtUI.UPVRobotPostProcessFreq1DOriIndexPointEditField.ValueDisplayFormat = '%.0f';
app.ExtUI.UPVRobotPostProcessFreq1DOriIndexPointEditField.FontSize = 11;
app.ExtUI.UPVRobotPostProcessFreq1DOriIndexPointEditField.Layout.Row = 4;
app.ExtUI.UPVRobotPostProcessFreq1DOriIndexPointEditField.Layout.Column = 3;
app.ExtUI.UPVRobotPostProcessFreq1DOriIndexPointEditField.Value = 1;
app.ExtUI.UPVRobotPostProcessFreq1DOriIndexPointEditField.ValueChangedFcn = {@UPVRobotPostProcessFreq1DOriChanged,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.OriginPointIdx)
    app.ExtUI.UPVRobotPostProcessFreq1DOriIndexPointEditField.Value = app.ExtVar.UPVRobotPostProcess.OriginPointIdx;
else
    app.ExtVar.UPVRobotPostProcess.OriginPointIdx = app.ExtUI.UPVRobotPostProcessFreq1DOriIndexPointEditField.Value;
end

% Create UPVRobotPostProcessFreq1DOriCoorCoordinateCheckBox
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorCoordinateCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginGrid);
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorCoordinateCheckBox.Text = 'From coordinate';
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorCoordinateCheckBox.Layout.Row = 5;
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorCoordinateCheckBox.Layout.Column = [1 2];
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorCoordinateCheckBox.Value = 0;
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorCoordinateCheckBox.ValueChangedFcn = {@UPVRobotPostProcessFreq1DOriCoorSelection,app};

% Create UPVRobotPostProcessFreq1DPointsOriginCoordsGrid
app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginCoordsGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginGrid);
app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginCoordsGrid.ColumnWidth = {'1x', '1x', '1x'};
app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginCoordsGrid.RowHeight = {'fit', '1x'};
app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginCoordsGrid.ColumnSpacing = 5;
app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginCoordsGrid.RowSpacing = 1;
app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginCoordsGrid.Padding = [5 5 5 5];
app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginCoordsGrid.Layout.Row = 6;
app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginCoordsGrid.Layout.Column = [1 3];
app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginCoordsGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessFreq1DOriCoorXEditFieldLabel
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorXEditFieldLabel = uilabel(app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginCoordsGrid);
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorXEditFieldLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorXEditFieldLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorXEditFieldLabel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorXEditFieldLabel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorXEditFieldLabel.Text = 'X';

% Create UPVRobotPostProcessFreq1DOriCoorXEditField
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorXEditField = uieditfield(app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginCoordsGrid, 'numeric');
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorXEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorXEditField.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorXEditField.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorXEditField.Value = 0;
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorXEditField.ValueChangedFcn = {@UPVRobotPostProcessFreq1DOriChanged,app};

% Create UPVRobotPostProcessFreq1DOriCoorYEditFieldLabel
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorYEditFieldLabel = uilabel(app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginCoordsGrid);
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorYEditFieldLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorYEditFieldLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorYEditFieldLabel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorYEditFieldLabel.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorYEditFieldLabel.Text = 'Y';

% Create UPVRobotPostProcessFreq1DOriCoorYEditField
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorYEditField = uieditfield(app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginCoordsGrid, 'numeric');
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorYEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorYEditField.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorYEditField.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorYEditField.Value = 0;
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorYEditField.ValueChangedFcn = {@UPVRobotPostProcessFreq1DOriChanged,app};

% Create UPVRobotPostProcessFreq1DOriCoorZEditFieldLabel
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorZEditFieldLabel = uilabel(app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginCoordsGrid);
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorZEditFieldLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorZEditFieldLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorZEditFieldLabel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorZEditFieldLabel.Layout.Column = 3;
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorZEditFieldLabel.Text = 'Z';

% Create UPVRobotPostProcessFreq1DOriCoorZEditField
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorZEditField = uieditfield(app.ExtUI.UPVRobotPostProcessFreq1DPointsOriginCoordsGrid, 'numeric');
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorZEditField.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorZEditField.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorZEditField.Layout.Column = 3;
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorZEditField.Value = 0;
app.ExtUI.UPVRobotPostProcessFreq1DOriCoorZEditField.ValueChangedFcn = {@UPVRobotPostProcessFreq1DOriChanged,app};

if ~isempty(app.ExtVar.UPVRobotPostProcess.OriginPointCoor) && numel(app.ExtVar.UPVRobotPostProcess.OriginPointCoor)==3
    app.ExtUI.UPVRobotPostProcessFreq1DOriCoorXEditField.Value = app.ExtVar.UPVRobotPostProcess.OriginPointCoor(1);
    app.ExtUI.UPVRobotPostProcessFreq1DOriCoorYEditField.Value = app.ExtVar.UPVRobotPostProcess.OriginPointCoor(2);
    app.ExtUI.UPVRobotPostProcessFreq1DOriCoorZEditField.Value = app.ExtVar.UPVRobotPostProcess.OriginPointCoor(3);
else
    app.ExtVar.UPVRobotPostProcess.OriginPointCoor = ...
        [app.ExtUI.UPVRobotPostProcessFreq1DOriCoorXEditField.Value,...
        app.ExtUI.UPVRobotPostProcessFreq1DOriCoorYEditField.Value,...
        app.ExtUI.UPVRobotPostProcessFreq1DOriCoorZEditField.Value];
end

% Logics origin
if ~isempty(app.ExtVar.UPVRobotPostProcess.OriginType)
    switch app.ExtVar.UPVRobotPostProcess.OriginType
        case 'Point'
            app.ExtUI.UPVRobotPostProcessFreq1DOriIndexpointCheckBox.Value = 1;
            app.ExtUI.UPVRobotPostProcessFreq1DOriCoorCoordinateCheckBox.Value = 0;
        case 'Coordinate'
            app.ExtUI.UPVRobotPostProcessFreq1DOriIndexpointCheckBox.Value = 0;
            app.ExtUI.UPVRobotPostProcessFreq1DOriCoorCoordinateCheckBox.Value = 1;
        otherwise
            app.ExtVar.UPVRobotPostProcess.OriginType = 'Point';
            app.ExtUI.UPVRobotPostProcessFreq1DOriIndexpointCheckBox.Value = 1;
            app.ExtUI.UPVRobotPostProcessFreq1DOriCoorCoordinateCheckBox.Value = 0;
    end
else
    app.ExtVar.UPVRobotPostProcess.OriginType = 'Point';
    app.ExtUI.UPVRobotPostProcessFreq1DOriIndexpointCheckBox.Value = 1;
    app.ExtUI.UPVRobotPostProcessFreq1DOriCoorCoordinateCheckBox.Value = 0;
end

if app.ExtUI.UPVRobotPostProcessFreq1DOriIndexpointCheckBox.Value
    app.ExtUI.UPVRobotPostProcessFreq1DOriCoorXEditField.Enable = 'off';
    app.ExtUI.UPVRobotPostProcessFreq1DOriCoorYEditField.Enable = 'off';
    app.ExtUI.UPVRobotPostProcessFreq1DOriCoorZEditField.Enable = 'off';
else
    app.ExtUI.UPVRobotPostProcessFreq1DOriIndexPointEditField.Enable = 'off';
end

% Create UPVRobotPostProcessFreq1DPointsViewGrid
app.ExtUI.UPVRobotPostProcessFreq1DPointsViewGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessFreq1DPointsGrid);
app.ExtUI.UPVRobotPostProcessFreq1DPointsViewGrid.ColumnWidth = {'1x', '1x', '1x', '1x'};
app.ExtUI.UPVRobotPostProcessFreq1DPointsViewGrid.RowHeight = {'fit'};
app.ExtUI.UPVRobotPostProcessFreq1DPointsViewGrid.ColumnSpacing = 5;
app.ExtUI.UPVRobotPostProcessFreq1DPointsViewGrid.Padding = [0 0 0 0];
app.ExtUI.UPVRobotPostProcessFreq1DPointsViewGrid.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessFreq1DPointsViewGrid.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessFreq1DPointsViewGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessButtonAxesFreq1DXY
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1DXY = uibutton(app.ExtUI.UPVRobotPostProcessFreq1DPointsViewGrid, 'push');
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1DXY.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1DXY.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1DXY.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1DXY.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1DXY.Text = 'XY';
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1DXY.ButtonPushedFcn = {@UPVRobotPostProcessFreq1DXYpushed,app};

% Create UPVRobotPostProcessButtonAxesFreq1DXZ
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1DXZ = uibutton(app.ExtUI.UPVRobotPostProcessFreq1DPointsViewGrid, 'push');
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1DXZ.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1DXZ.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1DXZ.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1DXZ.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1DXZ.Text = 'XZ';
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1DXZ.ButtonPushedFcn = {@UPVRobotPostProcessFreq1DXZpushed,app};

% Create UPVRobotPostProcessButtonAxesFreq1DYZ
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1DYZ = uibutton(app.ExtUI.UPVRobotPostProcessFreq1DPointsViewGrid, 'push');
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1DYZ.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1DYZ.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1DYZ.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1DYZ.Layout.Column = 3;
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1DYZ.Text = 'YZ';
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1DYZ.ButtonPushedFcn = {@UPVRobotPostProcessFreq1DYZpushed,app};

% Create UPVRobotPostProcessButtonAxesFreq1D3D
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1D3D = uibutton(app.ExtUI.UPVRobotPostProcessFreq1DPointsViewGrid, 'push');
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1D3D.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1D3D.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1D3D.FontColor = [0.6353 0.0784 0.1843];
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1D3D.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1D3D.Layout.Column = 4;
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1D3D.Text = '3D';
app.ExtUI.UPVRobotPostProcessButtonAxesFreq1D3D.ButtonPushedFcn = {@UPVRobotPostProcessFreq1D3Dpushed,app};

% Create UPVRobotPostProcessFreq1DDatagraphicsTab
app.ExtUI.UPVRobotPostProcessFreq1DDatagraphicsTab = uitab(app.ExtUI.UPVRobotPostProcessFreqTab1DPlots);
app.ExtUI.UPVRobotPostProcessFreq1DDatagraphicsTab.Title = 'Data graphics';
app.ExtUI.UPVRobotPostProcessFreq1DDatagraphicsTab.Scrollable = 'on';

% Create UPVRobotPostProcessFreq1DDataCenterGrid
app.ExtUI.UPVRobotPostProcessFreq1DDataCenterGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessFreq1DDatagraphicsTab);
app.ExtUI.UPVRobotPostProcessFreq1DDataCenterGrid.ColumnWidth = {'1x', 50};
app.ExtUI.UPVRobotPostProcessFreq1DDataCenterGrid.ColumnSpacing = 5;
app.ExtUI.UPVRobotPostProcessFreq1DDataCenterGrid.RowSpacing = 5;
app.ExtUI.UPVRobotPostProcessFreq1DDataCenterGrid.Scrollable = 'on';
app.ExtUI.UPVRobotPostProcessFreq1DDataCenterGrid.Padding = [5 5 5 5];
app.ExtUI.UPVRobotPostProcessFreq1DDataCenterGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessFreq1DDistanceUIaxes
app.ExtUI.UPVRobotPostProcessFreq1DDistanceUIaxes = uiaxes(app.ExtUI.UPVRobotPostProcessFreq1DDataCenterGrid);
app.ExtUI.UPVRobotPostProcessFreq1DDistanceUIaxes.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessFreq1DDistanceUIaxes.Layout.Column = 1;

% Create UPVRobotPostProcessFreq1DSPLUIaxes
app.ExtUI.UPVRobotPostProcessFreq1DSPLUIaxes = uiaxes(app.ExtUI.UPVRobotPostProcessFreq1DDataCenterGrid);
app.ExtUI.UPVRobotPostProcessFreq1DSPLUIaxes.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFreq1DSPLUIaxes.Layout.Column = 1;

% Create UPVRobotPostProcessFreq1DDatainformationTab
app.ExtUI.UPVRobotPostProcessFreq1DDatainformationTab = uitab(app.ExtUI.UPVRobotPostProcessFreqTab1DPlots);
app.ExtUI.UPVRobotPostProcessFreq1DDatainformationTab.Title = 'Data information';

% Create UPVRobotPostProcessFreq1DDatainformationGrid
app.ExtUI.UPVRobotPostProcessFreq1DDatainformationGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessFreq1DDatainformationTab);
app.ExtUI.UPVRobotPostProcessFreq1DDatainformationGrid.ColumnWidth = {'1x'};
app.ExtUI.UPVRobotPostProcessFreq1DDatainformationGrid.RowHeight = {'1x'};
app.ExtUI.UPVRobotPostProcessFreq1DDatainformationGrid.Padding = [5 5 5 5];

% Create UPVRobotPostProcessFreq1DInformationPanel
app.ExtUI.UPVRobotPostProcessFreq1DInformationPanel = uipanel(app.ExtUI.UPVRobotPostProcessFreq1DDatainformationGrid);
app.ExtUI.UPVRobotPostProcessFreq1DInformationPanel.TitlePosition = 'centertop';
app.ExtUI.UPVRobotPostProcessFreq1DInformationPanel.Title = 'Information';
app.ExtUI.UPVRobotPostProcessFreq1DInformationPanel.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessFreq1DInformationPanel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFreq1DInformationPanel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessFreq1DInformationPanel.FontWeight = 'bold';

% Create UPVRobotPostProcessFreq1DInformationGrid
app.ExtUI.UPVRobotPostProcessFreq1DInformationGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessFreq1DInformationPanel);
app.ExtUI.UPVRobotPostProcessFreq1DInformationGrid.ColumnWidth = {'1x'};
app.ExtUI.UPVRobotPostProcessFreq1DInformationGrid.RowHeight = {'1x'};
app.ExtUI.UPVRobotPostProcessFreq1DInformationGrid.Padding = [0 0 0 0];
app.ExtUI.UPVRobotPostProcessFreq1DInformationGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessFreq1DInformationTable
app.ExtUI.UPVRobotPostProcessFreq1DInformationTable = uitable(app.ExtUI.UPVRobotPostProcessFreq1DInformationGrid);
app.ExtUI.UPVRobotPostProcessFreq1DInformationTable.ColumnName = [];
app.ExtUI.UPVRobotPostProcessFreq1DInformationTable.RowName = [];
app.ExtUI.UPVRobotPostProcessFreq1DInformationTable.ColumnSortable = true;
app.ExtUI.UPVRobotPostProcessFreq1DInformationTable.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFreq1DInformationTable.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessFreq1DInformationTable.FontSize = 10;

%% ===============================================
% GRID PLOT ELEMENTS FOR 2D

% Create GridCenterMainPanelUPVRobotPostProcess
app.ExtUI.GridCenterMainPanelUPVRobotPostProcess = uigridlayout(app.ExtUI.UPVRobotPostProcessFreqTab2D);
app.ExtUI.GridCenterMainPanelUPVRobotPostProcess.ColumnWidth = {'1x', '1x', '1x', '1x'};
app.ExtUI.GridCenterMainPanelUPVRobotPostProcess.RowHeight = {'1x', 'fit'};
app.ExtUI.GridCenterMainPanelUPVRobotPostProcess.Padding = [20 10 20 10];
app.ExtUI.GridCenterMainPanelUPVRobotPostProcess.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessButtonAxesXY
app.ExtUI.UPVRobotPostProcessButtonAxesXY = uibutton(app.ExtUI.GridCenterMainPanelUPVRobotPostProcess, 'push');
app.ExtUI.UPVRobotPostProcessButtonAxesXY.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessButtonAxesXY.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessButtonAxesXY.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessButtonAxesXY.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessButtonAxesXY.Text = 'XY';
app.ExtUI.UPVRobotPostProcessButtonAxesXY.ButtonPushedFcn = {@UPVRobotPostProcessFreq2DXYpushed,app};

% Create UPVRobotPostProcessButtonAxesXZ
app.ExtUI.UPVRobotPostProcessButtonAxesXZ = uibutton(app.ExtUI.GridCenterMainPanelUPVRobotPostProcess, 'push');
app.ExtUI.UPVRobotPostProcessButtonAxesXZ.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessButtonAxesXZ.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessButtonAxesXZ.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessButtonAxesXZ.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessButtonAxesXZ.Text = 'XZ';
app.ExtUI.UPVRobotPostProcessButtonAxesXZ.ButtonPushedFcn = {@UPVRobotPostProcessFreq2DXZpushed,app};

% Create UPVRobotPostProcessButtonAxesYZ
app.ExtUI.UPVRobotPostProcessButtonAxesYZ = uibutton(app.ExtUI.GridCenterMainPanelUPVRobotPostProcess, 'push');
app.ExtUI.UPVRobotPostProcessButtonAxesYZ.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessButtonAxesYZ.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessButtonAxesYZ.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessButtonAxesYZ.Layout.Column = 3;
app.ExtUI.UPVRobotPostProcessButtonAxesYZ.Text = 'YZ';
app.ExtUI.UPVRobotPostProcessButtonAxesYZ.ButtonPushedFcn = {@UPVRobotPostProcessFreq2DYZpushed,app};

% Create UPVRobotPostProcessButtonAxes3D
app.ExtUI.UPVRobotPostProcessButtonAxes3D = uibutton(app.ExtUI.GridCenterMainPanelUPVRobotPostProcess, 'push');
app.ExtUI.UPVRobotPostProcessButtonAxes3D.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessButtonAxes3D.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessButtonAxes3D.FontColor = [0.6353 0.0784 0.1843];
app.ExtUI.UPVRobotPostProcessButtonAxes3D.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessButtonAxes3D.Layout.Column = 4;
app.ExtUI.UPVRobotPostProcessButtonAxes3D.Text = '3D';
app.ExtUI.UPVRobotPostProcessButtonAxes3D.ButtonPushedFcn = {@UPVRobotPostProcessFreq2D3Dpushed,app};

% Create UPVRobotPostProcessUIAxesFreq2D
app.ExtUI.UPVRobotPostProcessUIAxesFreq2D = uiaxes(app.ExtUI.GridCenterMainPanelUPVRobotPostProcess);
app.ExtUI.UPVRobotPostProcessUIAxesFreq2D.PlotBoxAspectRatio = [1.50712250712251 1 1];
app.ExtUI.UPVRobotPostProcessUIAxesFreq2D.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessUIAxesFreq2D.Layout.Column = [1 4];

%% ===============================================
% GRID PLOT ELEMENTS FOR 3D

% Create GridCenterMainPanelUPVRobotPostProcessFreq3D
app.ExtUI.GridCenterMainPanelUPVRobotPostProcessFreq3D = uigridlayout(app.ExtUI.UPVRobotPostProcessFreqTab3D);
app.ExtUI.GridCenterMainPanelUPVRobotPostProcessFreq3D.ColumnWidth = {'1x', '1x', '1x', '1x'};
app.ExtUI.GridCenterMainPanelUPVRobotPostProcessFreq3D.RowHeight = {'1x', 'fit'};
app.ExtUI.GridCenterMainPanelUPVRobotPostProcessFreq3D.Padding = [20 10 20 10];
app.ExtUI.GridCenterMainPanelUPVRobotPostProcessFreq3D.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessButtonAxesXYFreq3D
app.ExtUI.UPVRobotPostProcessButtonAxesXYFreq3D = uibutton(app.ExtUI.GridCenterMainPanelUPVRobotPostProcessFreq3D, 'push');
app.ExtUI.UPVRobotPostProcessButtonAxesXYFreq3D.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessButtonAxesXYFreq3D.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessButtonAxesXYFreq3D.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessButtonAxesXYFreq3D.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessButtonAxesXYFreq3D.Text = 'XY';
app.ExtUI.UPVRobotPostProcessButtonAxesXYFreq3D.ButtonPushedFcn = {@UPVRobotPostProcessFreq3DXYpushed,app};

% Create UPVRobotPostProcessButtonAxesXZFreq3D
app.ExtUI.UPVRobotPostProcessButtonAxesXZFreq3D = uibutton(app.ExtUI.GridCenterMainPanelUPVRobotPostProcessFreq3D, 'push');
app.ExtUI.UPVRobotPostProcessButtonAxesXZFreq3D.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessButtonAxesXZFreq3D.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessButtonAxesXZFreq3D.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessButtonAxesXZFreq3D.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessButtonAxesXZFreq3D.Text = 'XZ';
app.ExtUI.UPVRobotPostProcessButtonAxesXZFreq3D.ButtonPushedFcn = {@UPVRobotPostProcessFreq3DXZpushed,app};

% Create UPVRobotPostProcessButtonAxesYZFreq3D
app.ExtUI.UPVRobotPostProcessButtonAxesYZFreq3D = uibutton(app.ExtUI.GridCenterMainPanelUPVRobotPostProcessFreq3D, 'push');
app.ExtUI.UPVRobotPostProcessButtonAxesYZFreq3D.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessButtonAxesYZFreq3D.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessButtonAxesYZFreq3D.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessButtonAxesYZFreq3D.Layout.Column = 3;
app.ExtUI.UPVRobotPostProcessButtonAxesYZFreq3D.Text = 'YZ';
app.ExtUI.UPVRobotPostProcessButtonAxesYZFreq3D.ButtonPushedFcn = {@UPVRobotPostProcessFreq3DYZpushed,app};

% Create UPVRobotPostProcessButtonAxes3DFreq3D
app.ExtUI.UPVRobotPostProcessButtonAxes3DFreq3D = uibutton(app.ExtUI.GridCenterMainPanelUPVRobotPostProcessFreq3D, 'push');
app.ExtUI.UPVRobotPostProcessButtonAxes3DFreq3D.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessButtonAxes3DFreq3D.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessButtonAxes3DFreq3D.FontColor = [0.6353 0.0784 0.1843];
app.ExtUI.UPVRobotPostProcessButtonAxes3DFreq3D.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessButtonAxes3DFreq3D.Layout.Column = 4;
app.ExtUI.UPVRobotPostProcessButtonAxes3DFreq3D.Text = '3D';
app.ExtUI.UPVRobotPostProcessButtonAxes3DFreq3D.ButtonPushedFcn = {@UPVRobotPostProcessFreq3D3Dpushed,app};

% Create UPVRobotPostProcessUIAxesFreq3D
app.ExtUI.UPVRobotPostProcessUIAxesFreq3D = uiaxes(app.ExtUI.GridCenterMainPanelUPVRobotPostProcessFreq3D);
app.ExtUI.UPVRobotPostProcessUIAxesFreq3D.PlotBoxAspectRatio = [1.50712250712251 1 1];
app.ExtUI.UPVRobotPostProcessUIAxesFreq3D.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessUIAxesFreq3D.Layout.Column = [1 4];

%% ===============================================
% Logics

% Selected tab logic
if ~isempty(app.ExtVar.UPVRobotPostProcess.DimType)
    idx = find(strcmp({app.ExtUI.UPVRobotPostProcessFreqTabGroup.Children.Title},app.ExtVar.UPVRobotPostProcess.DimType), 1);
    if ~isempty(idx)
        app.ExtUI.UPVRobotPostProcessFreqTabGroup.SelectedTab = app.ExtUI.UPVRobotPostProcessFreqTabGroup.Children(idx);
    else
        app.ExtVar.UPVRobotPostProcess.DimType = app.ExtUI.UPVRobotPostProcessFreqTabGroup.SelectedTab.Title;
    end
else
    app.ExtVar.UPVRobotPostProcess.DimType = app.ExtUI.UPVRobotPostProcessFreqTabGroup.SelectedTab.Title;
end

% Create content tab
switch app.ExtVar.UPVRobotPostProcess.DimType
    case '1D'
        UPVRobotPostProcessFreq1DCreate(app)
        % Plot points
        UPVRobotPostProcessPlotFreq1DPoints(app)
    case '2D'
        UPVRobotPostProcessFreq2DCreate(app)
    case '3D'
        UPVRobotPostProcessFreq3DCreate(app)
end
% Plot data
UPVRobotPostProcessPlot(app)

% Show
drawnow
app.ExtUI.UPVRobotPostProcessFreqTabGroup.Visible = 'on';
drawnow

% Boolean to know if the selection is modified
app.ExtVar.UPVRobotPostProcess.SelectionChangedG = true;
app.ExtVar.UPVRobotPostProcess.SelectionChangedT = true;

%% ===============================================
% Main Functions
function UPVRobotPostProcessFreqTabChanged(~,~,app)

% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Loading',...
    'Indeterminate','on');

% Hide center main grids
% app.ExtUI.GridCenterMainPanelUPVRobotPostProcess1D.Visible = 'off'; % 1D
% app.ExtUI.GridCenterMainPanelUPVRobotPostProcess.Visible = 'off'; % 2D
% app.ExtUI.GridCenterMainPanelUPVRobotPostProcessFreq3D.Visible = 'off'; % 3D

% Delete actual bottom tools
if ~isempty(app.ExtVar.UPVRobotPostProcess.DimType)
    switch app.ExtVar.UPVRobotPostProcess.DimType
        case '1D'
            if isvalid(app.ExtUI.GridUPVRobotPostProcessBottomCenterGridFreq1D)
                delete(app.ExtUI.GridUPVRobotPostProcessBottomCenterGridFreq1D) % 1D
            end
        case '2D'
            if isvalid(app.ExtUI.GridUPVRobotPostProcessBottomCenterGrid)
                delete(app.ExtUI.GridUPVRobotPostProcessBottomCenterGrid) % 2D
            end
        case '3D'
            if isvalid(app.ExtUI.GridUPVRobotPostProcessBottomCenterGridFreq3D)
                delete(app.ExtUI.GridUPVRobotPostProcessBottomCenterGridFreq3D) % 3D
            end
    end
    drawnow
end

% Update DimType
app.ExtVar.UPVRobotPostProcess.DimType = app.ExtUI.UPVRobotPostProcessFreqTabGroup.SelectedTab.Title;

switch app.ExtVar.UPVRobotPostProcess.DimType
    case '1D'
        UPVRobotPostProcessFreq1DCreate(app)
        % Plot points
        UPVRobotPostProcessPlotFreq1DPoints(app)
        % Plot data
        UPVRobotPostProcessPlot(app)
        %app.ExtUI.GridCenterMainPanelUPVRobotPostProcess1D.Visible = 'on';
    case '2D'
        UPVRobotPostProcessFreq2DCreate(app)
        UPVRobotPostProcessPlot(app)
        %app.ExtUI.GridCenterMainPanelUPVRobotPostProcess.Visible = 'on';
    case '3D'
        UPVRobotPostProcessFreq3DCreate(app)
        UPVRobotPostProcessPlot(app)
        %app.ExtUI.GridCenterMainPanelUPVRobotPostProcessFreq3D.Visible = 'on';
end
% Close info
pause(0.5)
close(d)

%% =============================================================================================================
% 1D

function UPVRobotPostProcessFreq1DTabChanged(~,~,app)
tab = app.ExtUI.UPVRobotPostProcessFreqTab1DPlots.SelectedTab.Title;
switch tab
    case 'Points'
        
    case 'Data graphics'
        if app.ExtVar.UPVRobotPostProcess.SelectionChangedG
            % Loading info
            d = uiprogressdlg(app.ALabUIFigure,'Title','Loading',...
                'Indeterminate','on');
            % Plot
            UPVRobotPostProcessPlotFreq1DGraphics(app)
            % Close info
            close(d)
        end
    case 'Data information'
        if app.ExtVar.UPVRobotPostProcess.SelectionChangedT
            % Load
            UPVRobotPostProcessPlotFreq1DInfoTable(app)
        end
end

function UPVRobotPostProcessFreq1DSelectPointTable(~,~,app)
% Data
coords = app.ExtVar.UPVRobotPostProcess.Coords;
idx = 1:size(coords,1);
% Update selection
selection = logical(app.ExtUI.UPVRobotPostProcessFreq1DSelectPointsUITable.Data{:,1});
app.ExtVar.UPVRobotPostProcess.SelectedPoints = idx(selection);
% Boolean to know if the selection is modified
app.ExtVar.UPVRobotPostProcess.SelectionChangedG = true;
app.ExtVar.UPVRobotPostProcess.SelectionChangedT = true;

% Update plot
set(app.ExtVar.UPVRobotPostProcess.PlotPointsRed,'XData',coords(~selection,1),'YData',coords(~selection,2),'ZData',coords(~selection,3))
% Plot green point
set(app.ExtVar.UPVRobotPostProcess.PlotPointsGreen,'XData',coords(selection,1),'YData',coords(selection,2),'ZData',coords(selection,3))
drawnow

function UPVRobotPostProcessFreq1DSelectAllPoints(~,~,app)

if app.ExtUI.UPVRobotPostProcessFreq1DPointsSelectallCheckBox.Value
    % Data
    coords = app.ExtVar.UPVRobotPostProcess.Coords;
    idx = 1:size(coords,1);
    % Update selection
    selection = true(size(coords,1),1);
    app.ExtUI.UPVRobotPostProcessFreq1DSelectPointsUITable.Data{:,1} = selection;
    app.ExtVar.UPVRobotPostProcess.SelectedPoints = idx;
else
    % Data
    coords = app.ExtVar.UPVRobotPostProcess.Coords;
    
    % Update selection
    selection = false(size(coords,1),1);
    app.ExtUI.UPVRobotPostProcessFreq1DSelectPointsUITable.Data{:,1} = selection;
    app.ExtVar.UPVRobotPostProcess.SelectedPoints = [];
end
% Boolean to know if the selection is modified
app.ExtVar.UPVRobotPostProcess.SelectionChangedG = true;
app.ExtVar.UPVRobotPostProcess.SelectionChangedT = true;
% Update plot
set(app.ExtVar.UPVRobotPostProcess.PlotPointsRed,'XData',coords(~selection,1),'YData',coords(~selection,2),'ZData',coords(~selection,3))
% Plot green point
set(app.ExtVar.UPVRobotPostProcess.PlotPointsGreen,'XData',coords(selection,1),'YData',coords(selection,2),'ZData',coords(selection,3))

function UPVRobotPostProcessFreq1DOriCoorSelection(~,~,app)
if app.ExtUI.UPVRobotPostProcessFreq1DOriCoorCoordinateCheckBox.Value
    app.ExtUI.UPVRobotPostProcessFreq1DOriIndexpointCheckBox.Value = 0;
    app.ExtVar.UPVRobotPostProcess.OriginType = 'Coordinate';
    app.ExtUI.UPVRobotPostProcessFreq1DOriIndexPointEditField.Enable = 'off';
    app.ExtUI.UPVRobotPostProcessFreq1DOriCoorXEditField.Enable = 'on';
    app.ExtUI.UPVRobotPostProcessFreq1DOriCoorYEditField.Enable = 'on';
    app.ExtUI.UPVRobotPostProcessFreq1DOriCoorZEditField.Enable = 'on';
else
    app.ExtUI.UPVRobotPostProcessFreq1DOriIndexpointCheckBox.Value = 1;
    app.ExtVar.UPVRobotPostProcess.OriginType = 'Point';
    app.ExtUI.UPVRobotPostProcessFreq1DOriCoorXEditField.Enable = 'off';
    app.ExtUI.UPVRobotPostProcessFreq1DOriCoorYEditField.Enable = 'off';
    app.ExtUI.UPVRobotPostProcessFreq1DOriCoorZEditField.Enable = 'off';
    app.ExtUI.UPVRobotPostProcessFreq1DOriIndexPointEditField.Enable = 'on';
end
% Boolean to know if the selection is modified
app.ExtVar.UPVRobotPostProcess.SelectionChangedG = true;
app.ExtVar.UPVRobotPostProcess.SelectionChangedT = true;

function UPVRobotPostProcessFreq1DOriPointSelection(~,~,app)
if app.ExtUI.UPVRobotPostProcessFreq1DOriIndexpointCheckBox.Value
    app.ExtUI.UPVRobotPostProcessFreq1DOriCoorCoordinateCheckBox.Value = 0;
    app.ExtVar.UPVRobotPostProcess.OriginType = 'Point';
    app.ExtUI.UPVRobotPostProcessFreq1DOriCoorXEditField.Enable = 'off';
    app.ExtUI.UPVRobotPostProcessFreq1DOriCoorYEditField.Enable = 'off';
    app.ExtUI.UPVRobotPostProcessFreq1DOriCoorZEditField.Enable = 'off';
    app.ExtUI.UPVRobotPostProcessFreq1DOriIndexPointEditField.Enable = 'on';
else
    app.ExtUI.UPVRobotPostProcessFreq1DOriCoorCoordinateCheckBox.Value = 1;
    app.ExtVar.UPVRobotPostProcess.OriginType = 'Coordinate';
    app.ExtUI.UPVRobotPostProcessFreq1DOriIndexPointEditField.Enable = 'off';
    app.ExtUI.UPVRobotPostProcessFreq1DOriCoorXEditField.Enable = 'on';
    app.ExtUI.UPVRobotPostProcessFreq1DOriCoorYEditField.Enable = 'on';
    app.ExtUI.UPVRobotPostProcessFreq1DOriCoorZEditField.Enable = 'on';
end
% Boolean to know if the selection is modified
app.ExtVar.UPVRobotPostProcess.SelectionChangedG = true;
app.ExtVar.UPVRobotPostProcess.SelectionChangedT = true;

function UPVRobotPostProcessFreq1DOriChanged(~,~,app)

app.ExtVar.UPVRobotPostProcess.OriginPointCoor = ...
    [app.ExtUI.UPVRobotPostProcessFreq1DOriCoorXEditField.Value,...
    app.ExtUI.UPVRobotPostProcessFreq1DOriCoorYEditField.Value,...
    app.ExtUI.UPVRobotPostProcessFreq1DOriCoorZEditField.Value];

app.ExtVar.UPVRobotPostProcess.OriginPointIdx = app.ExtUI.UPVRobotPostProcessFreq1DOriIndexPointEditField.Value;
% Boolean to know if the selection is modified
app.ExtVar.UPVRobotPostProcess.SelectionChangedG = true;
app.ExtVar.UPVRobotPostProcess.SelectionChangedT = true;

function UPVRobotPostProcessFreq1DXYpushed(~,~,app)
view(app.ExtUI.UPVRobotPostProcessFreq1DPointsUIaxes,0,90)
set(app.ExtUI.UPVRobotPostProcessFreq1DPointsUIaxes, 'Ydir', 'reverse')

function UPVRobotPostProcessFreq1DXZpushed(~,~,app)
view(app.ExtUI.UPVRobotPostProcessFreq1DPointsUIaxes,0,0)

function UPVRobotPostProcessFreq1DYZpushed(~,~,app)
view(app.ExtUI.UPVRobotPostProcessFreq1DPointsUIaxes,90,0)

function UPVRobotPostProcessFreq1D3Dpushed(~,~,app)
view(app.ExtUI.UPVRobotPostProcessFreq1DPointsUIaxes,20,20)
set(app.ExtUI.UPVRobotPostProcessFreq1DPointsUIaxes, 'Ydir', 'reverse')


%% =============================================================================================================
% 2D
function UPVRobotPostProcessFreq2DXYpushed(~,~,app)
view(app.ExtUI.UPVRobotPostProcessUIAxesFreq2D,0,90)
set(app.ExtUI.UPVRobotPostProcessUIAxesFreq2D, 'Ydir', 'reverse')

function UPVRobotPostProcessFreq2DXZpushed(~,~,app)
view(app.ExtUI.UPVRobotPostProcessUIAxesFreq2D,0,0)

function UPVRobotPostProcessFreq2DYZpushed(~,~,app)
view(app.ExtUI.UPVRobotPostProcessUIAxesFreq2D,90,0)

function UPVRobotPostProcessFreq2D3Dpushed(~,~,app)
view(app.ExtUI.UPVRobotPostProcessUIAxesFreq2D,20,20)
set(app.ExtUI.UPVRobotPostProcessUIAxesFreq2D, 'Ydir', 'reverse')

% =============================================================================================================
% 3D
function UPVRobotPostProcessFreq3DXYpushed(~,~,app)
view(app.ExtUI.UPVRobotPostProcessUIAxesFreq3D,0,90)
set(app.ExtUI.UPVRobotPostProcessUIAxesFreq3D, 'Ydir', 'reverse')

function UPVRobotPostProcessFreq3DXZpushed(~,~,app)
view(app.ExtUI.UPVRobotPostProcessUIAxesFreq3D,0,0)

function UPVRobotPostProcessFreq3DYZpushed(~,~,app)
view(app.ExtUI.UPVRobotPostProcessUIAxesFreq3D,90,0)

function UPVRobotPostProcessFreq3D3Dpushed(~,~,app)
view(app.ExtUI.UPVRobotPostProcessUIAxesFreq3D,20,20)
set(app.ExtUI.UPVRobotPostProcessUIAxesFreq3D, 'Ydir', 'reverse')