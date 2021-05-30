function createTabManualCoordsUPVRobot(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Create TabUPVRobotLeftPanelMeasurementPoinManual
app.ExtUI.TabUPVRobotLeftPanelMeasurementPoinManual = uitab(app.ExtUI.TabUPVRobotLeftPanelMeasurementPoints);
app.ExtUI.TabUPVRobotLeftPanelMeasurementPoinManual.Title = 'Manual';
app.ExtUI.TabUPVRobotLeftPanelMeasurementPoinManual.BackgroundColor = [1 1 1];

% Create UPVRobotLeftPanelMeasurementPoinManualGrid
app.ExtUI.UPVRobotLeftPanelMeasurementPoinManualGrid = uigridlayout(app.ExtUI.TabUPVRobotLeftPanelMeasurementPoinManual);
app.ExtUI.UPVRobotLeftPanelMeasurementPoinManualGrid.ColumnWidth = {'1x', '1x', '1x'};
app.ExtUI.UPVRobotLeftPanelMeasurementPoinManualGrid.RowHeight = {'fit', 150, 'fit'};
app.ExtUI.UPVRobotLeftPanelMeasurementPoinManualGrid.BackgroundColor = [1 1 1];

% Create NumberofpointsEditFieldLabel
app.ExtUI.NumberofpointsEditFieldLabel = uilabel(app.ExtUI.UPVRobotLeftPanelMeasurementPoinManualGrid);
app.ExtUI.NumberofpointsEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.NumberofpointsEditFieldLabel.FontWeight = 'bold';
app.ExtUI.NumberofpointsEditFieldLabel.Layout.Row = 1;
app.ExtUI.NumberofpointsEditFieldLabel.Layout.Column = [1 2];
app.ExtUI.NumberofpointsEditFieldLabel.Text = 'Number of points';


% Create UPVRobotPointManualNumberofpointsEditField
app.ExtUI.UPVRobotPointManualNumberofpointsEditField = uieditfield(app.ExtUI.UPVRobotLeftPanelMeasurementPoinManualGrid, 'numeric');
app.ExtUI.UPVRobotPointManualNumberofpointsEditField.Limits = [0 Inf];
app.ExtUI.UPVRobotPointManualNumberofpointsEditField.RoundFractionalValues = 'on';
app.ExtUI.UPVRobotPointManualNumberofpointsEditField.ValueDisplayFormat = '%.0f';
app.ExtUI.UPVRobotPointManualNumberofpointsEditField.Layout.Row = 1;
app.ExtUI.UPVRobotPointManualNumberofpointsEditField.Layout.Column = 3;
app.ExtUI.UPVRobotPointManualNumberofpointsEditField.Value = 1;
app.ExtUI.UPVRobotPointManualNumberofpointsEditField.ValueChangedFcn = {@UPVRobotManualNumPoinsEdited,app};

% Create UPVRobotPointManualExporttotextButton
app.ExtUI.UPVRobotPointManualExporttotextButton = uibutton(app.ExtUI.UPVRobotLeftPanelMeasurementPoinManualGrid, 'push');
app.ExtUI.UPVRobotPointManualExporttotextButton.ButtonPushedFcn = {@UPVRobotManualTableExport,app};
app.ExtUI.UPVRobotPointManualExporttotextButton.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPointManualExporttotextButton.Layout.Row = 3;
app.ExtUI.UPVRobotPointManualExporttotextButton.Layout.Column = 2;
app.ExtUI.UPVRobotPointManualExporttotextButton.Text = 'Export to text';

% Create UPVRobotPointManualTable
app.ExtUI.UPVRobotPointManualTable = uitable(app.ExtUI.UPVRobotLeftPanelMeasurementPoinManualGrid);
app.ExtUI.UPVRobotPointManualTable.ColumnName = {'X (m)'; 'Y (m)'; 'Z (m)'};
app.ExtUI.UPVRobotPointManualTable.CellEditCallback = {@UPVRobotManualTableEdited,app};
app.ExtUI.UPVRobotPointManualTable.RowName = {};
app.ExtUI.UPVRobotPointManualTable.ColumnEditable = true;
app.ExtUI.UPVRobotPointManualTable.Layout.Row = 2;
app.ExtUI.UPVRobotPointManualTable.Layout.Column = [1 3];
numpoint = app.ExtUI.UPVRobotPointManualNumberofpointsEditField.Value;
if ~isempty(app.ExtVar.UPVRobot.ManualCoords)
    coords = app.ExtVar.UPVRobot.ManualCoords;
    app.ExtUI.UPVRobotPointManualNumberofpointsEditField.Value = size(coords,1);
    app.ExtUI.UPVRobotPointManualTable.Data = table(coords(:,1),coords(:,2),coords(:,3));
    app.ExtUI.UPVRobotPointManualTable.RowName = string(1:size(coords,1));
else
    T = table(zeros(numpoint,1),zeros(numpoint,1),zeros(numpoint,1));
    app.ExtUI.UPVRobotPointManualTable.Data = T;
    app.ExtVar.UPVRobot.ManualCoords = table2array(T);
    app.ExtUI.UPVRobotPointManualTable.RowName = repmat({'1'},numpoint,1);
end


function UPVRobotManualTableEdited(~,~,app)
app.ExtVar.UPVRobot.RouteOptimized = 0;

T = app.ExtUI.UPVRobotPointManualTable.Data;
% Clip values
maxX = app.ExtVar.UPVRobot.XLen;
maxY = app.ExtVar.UPVRobot.YLen;
maxZ = app.ExtVar.UPVRobot.ZLen;

% NaN to zero
[row,col] = find(isnan(T{:,:}));
T{row,col} = 0;

% X
[row,col] = find(T{:,1}>maxX);
T{row,col} = maxX;
if ~isempty(row) || ~isempty(col)
    app.ExtUI.UPVRobotPointManualTable.Data = T;
end
% Y
[row,col] = find(T{:,2}>maxY);
T{row,col+1} = maxY;
if ~isempty(row) || ~isempty(col)
    app.ExtUI.UPVRobotPointManualTable.Data = T;
end
% Z
[row,col] = find(T{:,3}>maxZ);
T{row,col+2} = maxZ;
if ~isempty(row) || ~isempty(col)
    app.ExtUI.UPVRobotPointManualTable.Data = T;
end

% Store
app.ExtVar.UPVRobot.ManualCoords = table2array(T);


function UPVRobotManualNumPoinsEdited(~,~,app)

num = app.ExtUI.UPVRobotPointManualNumberofpointsEditField.Value;

% Size table
T = app.ExtUI.UPVRobotPointManualTable.Data;
H = height(T);

if H < num
    T = [T;table(zeros(num-H,1),zeros(num-H,1),zeros(num-H,1))];
elseif H > num
    T = T(1:num,:);
end

% Set new size
app.ExtUI.UPVRobotPointManualTable.Data = T;
% Set row names
app.ExtUI.UPVRobotPointManualTable.RowName = string(1:height(T));

% Store
app.ExtVar.UPVRobot.ManualCoords = table2array(T);

function UPVRobotManualTableExport(~,~,app)

[filename, pathname, ~] = uiputfile( ...
    {'*.txt', 'Tabulated data (.txt)'},...
    'Export parameter','Manual coordinates');
if filename ~= 0
    T = app.ExtUI.UPVRobotPointManualTable.Data;
    T.Properties.VariableNames = [{'X'},{'Y'},{'Z'}];
    writetable(T,[pathname,filename],'Delimiter','\t')
end