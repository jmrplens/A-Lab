function createTabImportCoordsUPVRobot(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Create TabUPVRobotLeftPanelMeasurementPointsImport
app.ExtUI.TabUPVRobotLeftPanelMeasurementPointsImport = uitab(app.ExtUI.TabUPVRobotLeftPanelMeasurementPoints);
app.ExtUI.TabUPVRobotLeftPanelMeasurementPointsImport.Title = 'Import';
app.ExtUI.TabUPVRobotLeftPanelMeasurementPointsImport.BackgroundColor = [1 1 1];

% Create UPVRobotImportGrid
app.ExtUI.UPVRobotImportGrid = uigridlayout(app.ExtUI.TabUPVRobotLeftPanelMeasurementPointsImport);
app.ExtUI.UPVRobotImportGrid.ColumnWidth = {'1x', '0.7x', '0.7x', '1x'};
app.ExtUI.UPVRobotImportGrid.RowHeight = {'fit', 'fit', 'fit', 'fit', 'fit', 'fit', 'fit'};
app.ExtUI.UPVRobotImportGrid.RowSpacing = 5;
app.ExtUI.UPVRobotImportGrid.BackgroundColor = [1 1 1];

% Create UPVRobotImportInfo
app.ExtUI.UPVRobotImportInfo = uilabel(app.ExtUI.UPVRobotImportGrid);
app.ExtUI.UPVRobotImportInfo.WordWrap = 'on';
app.ExtUI.UPVRobotImportInfo.Layout.Row = 1;
app.ExtUI.UPVRobotImportInfo.Layout.Column = [1 4];
app.ExtUI.UPVRobotImportInfo.Text = 'The coordinates must be in a tabulated or comma separated text file, with 3 columns.';

% Create UPVRobotImportFileButton
app.ExtUI.UPVRobotImportFileButton = uibutton(app.ExtUI.UPVRobotImportGrid, 'push');
app.ExtUI.UPVRobotImportFileButton.FontWeight = 'bold';
app.ExtUI.UPVRobotImportFileButton.Layout.Row = 2;
app.ExtUI.UPVRobotImportFileButton.Layout.Column = 1;
app.ExtUI.UPVRobotImportFileButton.Text = 'File';
app.ExtUI.UPVRobotImportFileButton.ButtonPushedFcn = {@UPVRobotImportFileCoords,app};


% Create UPVRobotImportFileNameLabel
app.ExtUI.UPVRobotImportFileNameLabel = uilabel(app.ExtUI.UPVRobotImportGrid);
app.ExtUI.UPVRobotImportFileNameLabel.Layout.Row = 2;
app.ExtUI.UPVRobotImportFileNameLabel.Layout.Column = 2;
app.ExtUI.UPVRobotImportFileNameLabel.Text = '';

% Create UnitsDropDownLabel
app.ExtUI.UnitsDropDownLabel = uilabel(app.ExtUI.UPVRobotImportGrid);
app.ExtUI.UnitsDropDownLabel.HorizontalAlignment = 'right';
app.ExtUI.UnitsDropDownLabel.FontWeight = 'bold';
app.ExtUI.UnitsDropDownLabel.Layout.Row = 2;
app.ExtUI.UnitsDropDownLabel.Layout.Column = 3;
app.ExtUI.UnitsDropDownLabel.Text = 'Units';

% Create UPVRobotImportUnitsDropDown
app.ExtUI.UPVRobotImportUnitsDropDown = uidropdown(app.ExtUI.UPVRobotImportGrid);
app.ExtUI.UPVRobotImportUnitsDropDown.ValueChangedFcn = {@UPVRobotImportCoordsParameterChanged,app};
app.ExtUI.UPVRobotImportUnitsDropDown.Items = {'m', 'dm', 'cm', 'mm'};
app.ExtUI.UPVRobotImportUnitsDropDown.Layout.Row = 2;
app.ExtUI.UPVRobotImportUnitsDropDown.Layout.Column = 4;
app.ExtUI.UPVRobotImportUnitsDropDown.Value = 'm';
if ~isempty(app.ExtVar.UPVRobot.unitsCoords)
    app.ExtUI.UPVRobotImportUnitsDropDown.Value = app.ExtVar.UPVRobot.unitsCoords;
else
    app.ExtVar.UPVRobot.unitsCoords = app.ExtUI.UPVRobotImportUnitsDropDown.Value;
end

% Create UPVRobotImportXAxisLabel
app.ExtUI.UPVRobotImportXAxisLabel = uilabel(app.ExtUI.UPVRobotImportGrid);
app.ExtUI.UPVRobotImportXAxisLabel.Layout.Row = 4;
app.ExtUI.UPVRobotImportXAxisLabel.Layout.Column = 1;
app.ExtUI.UPVRobotImportXAxisLabel.Text = 'X Axis';

% Create UPVRobotImportYAxisLabel
app.ExtUI.UPVRobotImportYAxisLabel = uilabel(app.ExtUI.UPVRobotImportGrid);
app.ExtUI.UPVRobotImportYAxisLabel.Layout.Row = 5;
app.ExtUI.UPVRobotImportYAxisLabel.Layout.Column = 1;
app.ExtUI.UPVRobotImportYAxisLabel.Text = 'Y Axis';

% Create UPVRobotImportZAxisLabel
app.ExtUI.UPVRobotImportZAxisLabel = uilabel(app.ExtUI.UPVRobotImportGrid);
app.ExtUI.UPVRobotImportZAxisLabel.Layout.Row = 6;
app.ExtUI.UPVRobotImportZAxisLabel.Layout.Column = 1;
app.ExtUI.UPVRobotImportZAxisLabel.Text = 'Z Axis';

% Create UPVRobotImportCheckErrorInfo
app.ExtUI.UPVRobotImportCheckErrorInfo = uilabel(app.ExtUI.UPVRobotImportGrid);
app.ExtUI.UPVRobotImportCheckErrorInfo.WordWrap = 'on';
app.ExtUI.UPVRobotImportCheckErrorInfo.FontColor = [0.6353 0.0784 0.1843];
app.ExtUI.UPVRobotImportCheckErrorInfo.Layout.Row = 7;
app.ExtUI.UPVRobotImportCheckErrorInfo.Layout.Column = [1 4];
app.ExtUI.UPVRobotImportCheckErrorInfo.Text = '';

% Create UPVRobotImportminmLabel
app.ExtUI.UPVRobotImportminmLabel = uilabel(app.ExtUI.UPVRobotImportGrid);
app.ExtUI.UPVRobotImportminmLabel.Layout.Row = 3;
app.ExtUI.UPVRobotImportminmLabel.Layout.Column = 2;
app.ExtUI.UPVRobotImportminmLabel.Text = 'min (m)';

% Create UPVRobotImportmaxmLabel
app.ExtUI.UPVRobotImportmaxmLabel = uilabel(app.ExtUI.UPVRobotImportGrid);
app.ExtUI.UPVRobotImportmaxmLabel.Layout.Row = 3;
app.ExtUI.UPVRobotImportmaxmLabel.Layout.Column = 3;
app.ExtUI.UPVRobotImportmaxmLabel.Text = 'max (m)';

% Create UPVRobotImportOffsetmLabel
app.ExtUI.UPVRobotImportOffsetmLabel = uilabel(app.ExtUI.UPVRobotImportGrid);
app.ExtUI.UPVRobotImportOffsetmLabel.Layout.Row = 3;
app.ExtUI.UPVRobotImportOffsetmLabel.Layout.Column = 4;
app.ExtUI.UPVRobotImportOffsetmLabel.Text = 'Offset (m)';

% Create UPVRobotImportXmin
app.ExtUI.UPVRobotImportXmin = uieditfield(app.ExtUI.UPVRobotImportGrid, 'numeric');
app.ExtUI.UPVRobotImportXmin.ValueDisplayFormat = '%11.2g';
app.ExtUI.UPVRobotImportXmin.Editable = 'off';
app.ExtUI.UPVRobotImportXmin.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotImportXmin.Layout.Row = 4;
app.ExtUI.UPVRobotImportXmin.Layout.Column = 2;

% Create UPVRobotImportXmax
app.ExtUI.UPVRobotImportXmax = uieditfield(app.ExtUI.UPVRobotImportGrid, 'numeric');
app.ExtUI.UPVRobotImportXmax.ValueDisplayFormat = '%11.2g';
app.ExtUI.UPVRobotImportXmax.Editable = 'off';
app.ExtUI.UPVRobotImportXmax.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotImportXmax.Layout.Row = 4;
app.ExtUI.UPVRobotImportXmax.Layout.Column = 3;

% Create UPVRobotImportYmin
app.ExtUI.UPVRobotImportYmin = uieditfield(app.ExtUI.UPVRobotImportGrid, 'numeric');
app.ExtUI.UPVRobotImportYmin.ValueDisplayFormat = '%11.2g';
app.ExtUI.UPVRobotImportYmin.Editable = 'off';
app.ExtUI.UPVRobotImportYmin.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotImportYmin.Layout.Row = 5;
app.ExtUI.UPVRobotImportYmin.Layout.Column = 2;

% Create UPVRobotImportYmax
app.ExtUI.UPVRobotImportYmax = uieditfield(app.ExtUI.UPVRobotImportGrid, 'numeric');
app.ExtUI.UPVRobotImportYmax.ValueDisplayFormat = '%11.2g';
app.ExtUI.UPVRobotImportYmax.Editable = 'off';
app.ExtUI.UPVRobotImportYmax.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotImportYmax.Layout.Row = 5;
app.ExtUI.UPVRobotImportYmax.Layout.Column = 3;

% Create UPVRobotImportZmin
app.ExtUI.UPVRobotImportZmin = uieditfield(app.ExtUI.UPVRobotImportGrid, 'numeric');
app.ExtUI.UPVRobotImportZmin.ValueDisplayFormat = '%11.2g';
app.ExtUI.UPVRobotImportZmin.Editable = 'off';
app.ExtUI.UPVRobotImportZmin.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotImportZmin.Layout.Row = 6;
app.ExtUI.UPVRobotImportZmin.Layout.Column = 2;

% Create UPVRobotImportZmax
app.ExtUI.UPVRobotImportZmax = uieditfield(app.ExtUI.UPVRobotImportGrid, 'numeric');
app.ExtUI.UPVRobotImportZmax.ValueDisplayFormat = '%11.2g';
app.ExtUI.UPVRobotImportZmax.Editable = 'off';
app.ExtUI.UPVRobotImportZmax.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotImportZmax.Layout.Row = 6;
app.ExtUI.UPVRobotImportZmax.Layout.Column = 3;

% Create UPVRobotImportXOffset
app.ExtUI.UPVRobotImportXOffset = uieditfield(app.ExtUI.UPVRobotImportGrid, 'numeric');
app.ExtUI.UPVRobotImportXOffset.Layout.Row = 4;
app.ExtUI.UPVRobotImportXOffset.Layout.Column = 4;
app.ExtUI.UPVRobotImportXOffset.ValueChangedFcn = {@UPVRobotImportCoordsParameterChanged,app};
app.ExtUI.UPVRobotImportXOffset.Value = 0;
if ~isempty(app.ExtVar.UPVRobot.XOffset)
    app.ExtUI.UPVRobotImportXOffset.Value = app.ExtVar.UPVRobot.XOffset;
else
    app.ExtVar.UPVRobot.XOffset = app.ExtUI.UPVRobotImportXOffset.Value;
end

% Create UPVRobotImportYOffset
app.ExtUI.UPVRobotImportYOffset = uieditfield(app.ExtUI.UPVRobotImportGrid, 'numeric');
app.ExtUI.UPVRobotImportYOffset.Layout.Row = 5;
app.ExtUI.UPVRobotImportYOffset.Layout.Column = 4;
app.ExtUI.UPVRobotImportYOffset.ValueChangedFcn = {@UPVRobotImportCoordsParameterChanged,app};
app.ExtUI.UPVRobotImportYOffset.Value = 0;
if ~isempty(app.ExtVar.UPVRobot.YOffset)
    app.ExtUI.UPVRobotImportYOffset.Value = app.ExtVar.UPVRobot.YOffset;
else
    app.ExtVar.UPVRobot.YOffset = app.ExtUI.UPVRobotImportYOffset.Value;
end

% Create UPVRobotImportZOffset
app.ExtUI.UPVRobotImportZOffset = uieditfield(app.ExtUI.UPVRobotImportGrid, 'numeric');
app.ExtUI.UPVRobotImportZOffset.Layout.Row = 6;
app.ExtUI.UPVRobotImportZOffset.Layout.Column = 4;
app.ExtUI.UPVRobotImportZOffset.ValueChangedFcn = {@UPVRobotImportCoordsParameterChanged,app};
app.ExtUI.UPVRobotImportZOffset.Value = 0;
if ~isempty(app.ExtVar.UPVRobot.ZOffset)
    app.ExtUI.UPVRobotImportZOffset.Value = app.ExtVar.UPVRobot.ZOffset;
else
    app.ExtVar.UPVRobot.ZOffset = app.ExtUI.UPVRobotImportZOffset.Value;
end

function UPVRobotImportCoordsParameterChanged(~,~,app)
app.ExtVar.UPVRobot.RouteOptimized = 0;

% Process
UPVRobotProcessImportedCoords(app);
% Plot coords
UPVRobotGenerateMeasurementPoints(app)


function UPVRobotImportFileCoords(~,~,app)

% Select file
[FileName,PathName] = uigetfile({[app.RootPath,filesep,'*.txt']},'Select text file (.txt)');

if FileName ~= 0
    
    % Update userpath
    userpath(PathName);
    
    app.ExtVar.UPVRobot.RouteOptimized = 0;
    
    % File path
    app.ExtVar.UPVRobot.CustomCoordsPath = [PathName,FileName];
    
    % Print path
    app.ExtUI.UPVRobotImportFileNameLabel.Text = ['..',filesep,FileName];
    
    % Process
    UPVRobotProcessImportedCoords(app);
    
    % Plot coords
    UPVRobotGenerateMeasurementPoints(app)
    
end