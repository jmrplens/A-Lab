function UPVRobotPostProcessFreq1DCreate(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% ===============================================
% BOTTOM GRID FOR VIEW, 1D PARAMETERS AND EXPORT PANELS

% Create GridUPVRobotPostProcessBottomCenterGridFreq1D
app.ExtUI.GridUPVRobotPostProcessBottomCenterGridFreq1D = uigridlayout(app.ExtUI.GridCenterMain);
app.ExtUI.GridUPVRobotPostProcessBottomCenterGridFreq1D.ColumnWidth = {'fit', '1x', '0.5x'};
app.ExtUI.GridUPVRobotPostProcessBottomCenterGridFreq1D.RowHeight = {'1x'};
app.ExtUI.GridUPVRobotPostProcessBottomCenterGridFreq1D.Layout.Row = 2;
app.ExtUI.GridUPVRobotPostProcessBottomCenterGridFreq1D.Layout.Column = 1;
app.ExtUI.GridUPVRobotPostProcessBottomCenterGridFreq1D.BackgroundColor = [1 1 1];

% ===============================================
% VIEW PARAMETERS
% Create UPVRobotPostProcessViewParametersPanel
app.ExtUI.UPVRobotPostProcessViewParametersPanel = uipanel(app.ExtUI.GridUPVRobotPostProcessBottomCenterGridFreq1D);
app.ExtUI.UPVRobotPostProcessViewParametersPanel.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessViewParametersPanel.TitlePosition = 'centertop';
app.ExtUI.UPVRobotPostProcessViewParametersPanel.Title = 'View parameters';
app.ExtUI.UPVRobotPostProcessViewParametersPanel.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotPostProcessViewParametersPanel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessViewParametersPanel.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessViewParametersPanel.FontWeight = 'bold';

% Create UPVRobotPostProcessViewParametersGrid
app.ExtUI.UPVRobotPostProcessViewParametersGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessViewParametersPanel);
app.ExtUI.UPVRobotPostProcessViewParametersGrid.ColumnWidth = {'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessViewParametersGrid.RowHeight = {'fit', 'fit', 'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessViewParametersGrid.BackgroundColor = [1 1 1];

% Create FrequencyHzEditFieldLabel
app.ExtUI.FrequencyHzEditFieldLabel = uilabel(app.ExtUI.UPVRobotPostProcessViewParametersGrid);
app.ExtUI.FrequencyHzEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.FrequencyHzEditFieldLabel.Layout.Row = 1;
app.ExtUI.FrequencyHzEditFieldLabel.Layout.Column = 1;
app.ExtUI.FrequencyHzEditFieldLabel.Text = 'Frequency (Hz)';

% Create UPVRobotPostProcessFrequencyHzEditField
app.ExtUI.UPVRobotPostProcessFrequencyHzEditField = uieditfield(app.ExtUI.UPVRobotPostProcessViewParametersGrid, 'numeric');
app.ExtUI.UPVRobotPostProcessFrequencyHzEditField.ValueChangedFcn = {@UPVRobotPostProcessViewParamFREQChanged,app};
app.ExtUI.UPVRobotPostProcessFrequencyHzEditField.Limits = [1 Inf];
app.ExtUI.UPVRobotPostProcessFrequencyHzEditField.ValueDisplayFormat = '%g';
app.ExtUI.UPVRobotPostProcessFrequencyHzEditField.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFrequencyHzEditField.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessFrequencyHzEditField.Value = 500;
if ~isempty(app.ExtVar.UPVRobotPostProcess.FreqView)
    app.ExtUI.UPVRobotPostProcessFrequencyHzEditField.Value = app.ExtVar.UPVRobotPostProcess.FreqView;
else
    app.ExtVar.UPVRobotPostProcess.FreqView = app.ExtUI.UPVRobotPostProcessFrequencyHzEditField.Value;
end

% Create UPVRobotPostProcessAllfrequenciesCheckBox
app.ExtUI.UPVRobotPostProcessAllfrequenciesCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessViewParametersGrid);
app.ExtUI.UPVRobotPostProcessAllfrequenciesCheckBox.ValueChangedFcn = {@UPVRobotPostProcessViewParamFREQChanged,app};
app.ExtUI.UPVRobotPostProcessAllfrequenciesCheckBox.Text = 'All frequencies';
app.ExtUI.UPVRobotPostProcessAllfrequenciesCheckBox.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessAllfrequenciesCheckBox.Layout.Column = [1 2];
app.ExtUI.UPVRobotPostProcessAllfrequenciesCheckBox.Value = 0;
if ~isempty(app.ExtVar.UPVRobotPostProcess.DistOverAll)
    app.ExtUI.UPVRobotPostProcessAllfrequenciesCheckBox.Value = app.ExtVar.UPVRobotPostProcess.DistOverAll;
else
    app.ExtVar.UPVRobotPostProcess.DistOverAll = app.ExtUI.UPVRobotPostProcessAllfrequenciesCheckBox.Value;
end

if app.ExtVar.UPVRobotPostProcess.DistOverAll
    app.ExtUI.UPVRobotPostProcessFrequencyHzEditField.Enable = 'off';
else
    app.ExtUI.UPVRobotPostProcessFrequencyHzEditField.Enable = 'on';
end

% ===============================================
% EXPORT PANEL

% Create UPVRobotPostProcessExportPanel
app.ExtUI.UPVRobotPostProcessExportPanel = uipanel(app.ExtUI.GridUPVRobotPostProcessBottomCenterGridFreq1D);
app.ExtUI.UPVRobotPostProcessExportPanel.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessExportPanel.Title = 'Export';
app.ExtUI.UPVRobotPostProcessExportPanel.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotPostProcessExportPanel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessExportPanel.Layout.Column = 3;
app.ExtUI.UPVRobotPostProcessExportPanel.FontWeight = 'bold';

% Create UPVRobotPostProcessExportGrid
app.ExtUI.UPVRobotPostProcessExportGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessExportPanel);
app.ExtUI.UPVRobotPostProcessExportGrid.ColumnWidth = {'1x'};
app.ExtUI.UPVRobotPostProcessExportGrid.RowHeight = {'fit', 'fit', 'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessExportGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessExportGraphicButton
app.ExtUI.UPVRobotPostProcessExportGraphicButton = uibutton(app.ExtUI.UPVRobotPostProcessExportGrid, 'push');
app.ExtUI.UPVRobotPostProcessExportGraphicButton.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessExportGraphicButton.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessExportGraphicButton.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessExportGraphicButton.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessExportGraphicButton.Text = 'Graphic';
app.ExtUI.UPVRobotPostProcessExportGraphicButton.ButtonPushedFcn = {@UPVRobotPostProcessFreq1DExportGraphic,app};

% Create UPVRobotPostProcessExportDataButton
app.ExtUI.UPVRobotPostProcessExportDataButton = uibutton(app.ExtUI.UPVRobotPostProcessExportGrid, 'push');
app.ExtUI.UPVRobotPostProcessExportDataButton.BackgroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessExportDataButton.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessExportDataButton.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessExportDataButton.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessExportDataButton.Text = 'Data';
app.ExtUI.UPVRobotPostProcessExportDataButton.ButtonPushedFcn = {@UPVRobotPostProcessFreq1DExportData,app};

% ===============================================
% 1D PARAMETERS

% Create UPVRobotPostProcessDParametersPanelFreq1D
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq1D = uipanel(app.ExtUI.GridUPVRobotPostProcessBottomCenterGridFreq1D);
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq1D.ForegroundColor = [1 1 1];
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq1D.Title = '1D Parameters';
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq1D.BackgroundColor = [0 0 0];
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq1D.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq1D.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq1D.FontWeight = 'bold';

% Create UPVRobotPostProcessDParametersPanelFreq1DGrid
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq1DGrid = uigridlayout(app.ExtUI.UPVRobotPostProcessDParametersPanelFreq1D);
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq1DGrid.ColumnWidth = {'1x', 'fit'};
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq1DGrid.RowHeight = {'1x', '1x', 'fit', 'fit', 'fit', 'fit'};
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq1DGrid.ColumnSpacing = 5;
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq1DGrid.RowSpacing = 5;
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq1DGrid.Padding = [5 5 5 5];
app.ExtUI.UPVRobotPostProcessDParametersPanelFreq1DGrid.BackgroundColor = [1 1 1];

% Create UPVRobotPostProcessFreq1DInformationLabel
app.ExtUI.UPVRobotPostProcessFreq1DInformationLabel = uilabel(app.ExtUI.UPVRobotPostProcessDParametersPanelFreq1DGrid);
app.ExtUI.UPVRobotPostProcessFreq1DInformationLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotPostProcessFreq1DInformationLabel.WordWrap = 'on';
app.ExtUI.UPVRobotPostProcessFreq1DInformationLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessFreq1DInformationLabel.Layout.Row = 3;
app.ExtUI.UPVRobotPostProcessFreq1DInformationLabel.Layout.Column = [1 2];
app.ExtUI.UPVRobotPostProcessFreq1DInformationLabel.Text = 'Information';

% Create UPVRobotPostProcessFreq1DFlytimeDistancefromsourceCheckBox
app.ExtUI.UPVRobotPostProcessFreq1DFlytimeDistancefromsourceCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessDParametersPanelFreq1DGrid);
app.ExtUI.UPVRobotPostProcessFreq1DFlytimeDistancefromsourceCheckBox.Text = 'Fly time / Distance from source';
app.ExtUI.UPVRobotPostProcessFreq1DFlytimeDistancefromsourceCheckBox.Layout.Row = 4;
app.ExtUI.UPVRobotPostProcessFreq1DFlytimeDistancefromsourceCheckBox.Layout.Column = [1 2];
app.ExtUI.UPVRobotPostProcessFreq1DFlytimeDistancefromsourceCheckBox.Value = 0;
app.ExtUI.UPVRobotPostProcessFreq1DFlytimeDistancefromsourceCheckBox.ValueChangedFcn = {@UPVRobotPostProcessFreq1DFlyTimeSelection,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.FlyTimeCheck)
    app.ExtUI.UPVRobotPostProcessFreq1DFlytimeDistancefromsourceCheckBox.Value = app.ExtVar.UPVRobotPostProcess.FlyTimeCheck;
else
    app.ExtVar.UPVRobotPostProcess.FlyTimeCheck = app.ExtUI.UPVRobotPostProcessFreq1DFlytimeDistancefromsourceCheckBox.Value;
end

% Create UPVRobotPostProcessFreq1DOverallSPLCheckBox
app.ExtUI.UPVRobotPostProcessFreq1DOverallSPLCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessDParametersPanelFreq1DGrid);
app.ExtUI.UPVRobotPostProcessFreq1DOverallSPLCheckBox.Text = 'Overall SPL';
app.ExtUI.UPVRobotPostProcessFreq1DOverallSPLCheckBox.Layout.Row = 5;
app.ExtUI.UPVRobotPostProcessFreq1DOverallSPLCheckBox.Layout.Column = [1 2];
app.ExtUI.UPVRobotPostProcessFreq1DOverallSPLCheckBox.Value = 0;
app.ExtUI.UPVRobotPostProcessFreq1DOverallSPLCheckBox.ValueChangedFcn = {@UPVRobotPostProcessFreq1DOverSPLSelection,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.OverallSPLCheck)
    app.ExtUI.UPVRobotPostProcessFreq1DOverallSPLCheckBox.Value = app.ExtVar.UPVRobotPostProcess.OverallSPLCheck;
else
    app.ExtVar.UPVRobotPostProcess.OverallSPLCheck = app.ExtUI.UPVRobotPostProcessFreq1DOverallSPLCheckBox.Value;
end

% Create UPVRobotPostProcessFreq1DClippingsaturatedinputsignalCheckBox
app.ExtUI.UPVRobotPostProcessFreq1DClippingsaturatedinputsignalCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessDParametersPanelFreq1DGrid);
app.ExtUI.UPVRobotPostProcessFreq1DClippingsaturatedinputsignalCheckBox.Text = 'Clipping (saturated input signal?)';
app.ExtUI.UPVRobotPostProcessFreq1DClippingsaturatedinputsignalCheckBox.Layout.Row = 6;
app.ExtUI.UPVRobotPostProcessFreq1DClippingsaturatedinputsignalCheckBox.Layout.Column = [1 2];
app.ExtUI.UPVRobotPostProcessFreq1DClippingsaturatedinputsignalCheckBox.Value = 0;
app.ExtUI.UPVRobotPostProcessFreq1DClippingsaturatedinputsignalCheckBox.ValueChangedFcn = {@UPVRobotPostProcessFreq1DClippingSelection,app};
if ~isempty(app.ExtVar.UPVRobotPostProcess.ClippingCheck)
    app.ExtUI.UPVRobotPostProcessFreq1DClippingsaturatedinputsignalCheckBox.Value = app.ExtVar.UPVRobotPostProcess.ClippingCheck;
else
    app.ExtVar.UPVRobotPostProcess.ClippingCheck = app.ExtUI.UPVRobotPostProcessFreq1DClippingsaturatedinputsignalCheckBox.Value;
end
% Create UPVRobotPostProcessFreq1DDatasourceLabel
app.ExtUI.UPVRobotPostProcessFreq1DDatasourceLabel = uilabel(app.ExtUI.UPVRobotPostProcessDParametersPanelFreq1DGrid);
app.ExtUI.UPVRobotPostProcessFreq1DDatasourceLabel.HorizontalAlignment = 'center';
app.ExtUI.UPVRobotPostProcessFreq1DDatasourceLabel.FontWeight = 'bold';
app.ExtUI.UPVRobotPostProcessFreq1DDatasourceLabel.Layout.Row = 1;
app.ExtUI.UPVRobotPostProcessFreq1DDatasourceLabel.Layout.Column = [1 2];
app.ExtUI.UPVRobotPostProcessFreq1DDatasourceLabel.Text = 'Data source';

% Create UPVRobotPostProcessFreq1DImpulseResponseCheckBox
app.ExtUI.UPVRobotPostProcessFreq1DImpulseResponseCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessDParametersPanelFreq1DGrid);
app.ExtUI.UPVRobotPostProcessFreq1DImpulseResponseCheckBox.Text = 'Impulse Response';
app.ExtUI.UPVRobotPostProcessFreq1DImpulseResponseCheckBox.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessFreq1DImpulseResponseCheckBox.Layout.Column = 1;
app.ExtUI.UPVRobotPostProcessFreq1DImpulseResponseCheckBox.Value = 1;
app.ExtUI.UPVRobotPostProcessFreq1DImpulseResponseCheckBox.ValueChangedFcn = {@UPVRobotPostProcessFreq1DImpulseSelection,app};

% Create UPVRobotPostProcessFreq1DInputsignalCheckBox
app.ExtUI.UPVRobotPostProcessFreq1DInputsignalCheckBox = uicheckbox(app.ExtUI.UPVRobotPostProcessDParametersPanelFreq1DGrid);
app.ExtUI.UPVRobotPostProcessFreq1DInputsignalCheckBox.Text = 'Input signal';
app.ExtUI.UPVRobotPostProcessFreq1DInputsignalCheckBox.Layout.Row = 2;
app.ExtUI.UPVRobotPostProcessFreq1DInputsignalCheckBox.Layout.Column = 2;
app.ExtUI.UPVRobotPostProcessFreq1DInputsignalCheckBox.Value = 0;
app.ExtUI.UPVRobotPostProcessFreq1DInputsignalCheckBox.ValueChangedFcn = {@UPVRobotPostProcessFreq1DInputSelection,app};

if ~isempty(app.ExtVar.UPVRobotPostProcess.DataSource)
    switch app.ExtVar.UPVRobotPostProcess.DataSource
        case 'IR'
            app.ExtUI.UPVRobotPostProcessFreq1DImpulseResponseCheckBox.Value = 1;
            app.ExtUI.UPVRobotPostProcessFreq1DInputsignalCheckBox.Value = 0;
        case 'Input'
            app.ExtUI.UPVRobotPostProcessFreq1DImpulseResponseCheckBox.Value = 0;
            app.ExtUI.UPVRobotPostProcessFreq1DInputsignalCheckBox.Value = 1;
    end
else
    app.ExtVar.UPVRobotPostProcess.DataSource = 'IR';
    app.ExtUI.UPVRobotPostProcessFreq1DImpulseResponseCheckBox.Value = 1;
    app.ExtUI.UPVRobotPostProcessFreq1DInputsignalCheckBox.Value = 0;
end

% ===========================================================================
function UPVRobotPostProcessViewParamFREQChanged(~,~,app)
app.ExtVar.UPVRobotPostProcess.FreqView = app.ExtUI.UPVRobotPostProcessFrequencyHzEditField.Value;
app.ExtVar.UPVRobotPostProcess.DistOverAll = app.ExtUI.UPVRobotPostProcessAllfrequenciesCheckBox.Value;
if app.ExtVar.UPVRobotPostProcess.DistOverAll
    app.ExtUI.UPVRobotPostProcessFrequencyHzEditField.Enable = 'off';
else
    app.ExtUI.UPVRobotPostProcessFrequencyHzEditField.Enable = 'on';
end
% Boolean to know if the selection is modified
app.ExtVar.UPVRobotPostProcess.SelectionChangedG = true;
UPVRobotPostProcessChangeParamPlot(app)

function UPVRobotPostProcessFreq1DImpulseSelection(~,~,app)
if app.ExtUI.UPVRobotPostProcessFreq1DImpulseResponseCheckBox.Value
    app.ExtUI.UPVRobotPostProcessFreq1DInputsignalCheckBox.Value = 0;
    app.ExtVar.UPVRobotPostProcess.DataSource = 'IR';
else
    app.ExtUI.UPVRobotPostProcessFreq1DInputsignalCheckBox.Value = 1;
    app.ExtVar.UPVRobotPostProcess.DataSource = 'Input';
end
% Boolean to know if the selection is modified
app.ExtVar.UPVRobotPostProcess.SelectionChangedG = true;
app.ExtVar.UPVRobotPostProcess.SelectionChangedT = true;
UPVRobotPostProcessChangeParamPlot(app)

function UPVRobotPostProcessFreq1DInputSelection(~,~,app)
if app.ExtUI.UPVRobotPostProcessFreq1DInputsignalCheckBox.Value
    app.ExtUI.UPVRobotPostProcessFreq1DImpulseResponseCheckBox.Value = 0;
    app.ExtVar.UPVRobotPostProcess.DataSource = 'Input';
else
    app.ExtUI.UPVRobotPostProcessFreq1DImpulseResponseCheckBox.Value = 1;
    app.ExtVar.UPVRobotPostProcess.DataSource = 'IR';
end
% Boolean to know if the selection is modified
app.ExtVar.UPVRobotPostProcess.SelectionChangedG = true;
app.ExtVar.UPVRobotPostProcess.SelectionChangedT = true;
UPVRobotPostProcessChangeParamPlot(app)


function UPVRobotPostProcessChangeParamPlot(app)
tab = app.ExtUI.UPVRobotPostProcessFreqTab1DPlots.SelectedTab.Title;

switch tab
    case 'Points'
        
    case 'Data graphics'
        % Loading info
        d = uiprogressdlg(app.ALabUIFigure,'Title','Loading',...
            'Indeterminate','on');
        % Plot
        UPVRobotPostProcessPlotFreq1DGraphics(app)
        % Close info
        close(d)
    case 'Data information'
        % Remove old data
        app.ExtVar.UPVRobotPostProcess.FlyTime = [];
        app.ExtVar.UPVRobotPostProcess.FlyDist = [];
        app.ExtVar.UPVRobotPostProcess.OverallSPL = [];
        app.ExtVar.UPVRobotPostProcess.Clipping = [];
        % Recalculate and store in table
        UPVRobotPostProcessPlotFreq1DInfoTable(app)
end

function UPVRobotPostProcessFreq1DFlyTimeSelection(~,~,app)
app.ExtVar.UPVRobotPostProcess.FlyTimeCheck = app.ExtUI.UPVRobotPostProcessFreq1DFlytimeDistancefromsourceCheckBox.Value;
% Boolean to know if the selection is modified
app.ExtVar.UPVRobotPostProcess.SelectionChangedT = true;
UPVRobotPostProcessPlotFreq1DInfoTable(app)

function UPVRobotPostProcessFreq1DOverSPLSelection(~,~,app)
app.ExtVar.UPVRobotPostProcess.OverallSPLCheck = app.ExtUI.UPVRobotPostProcessFreq1DOverallSPLCheckBox.Value;
% Boolean to know if the selection is modified
app.ExtVar.UPVRobotPostProcess.SelectionChangedT = true;
UPVRobotPostProcessPlotFreq1DInfoTable(app)

function UPVRobotPostProcessFreq1DClippingSelection(~,~,app)
app.ExtVar.UPVRobotPostProcess.ClippingCheck = app.ExtUI.UPVRobotPostProcessFreq1DClippingsaturatedinputsignalCheckBox.Value;
% Boolean to know if the selection is modified
app.ExtVar.UPVRobotPostProcess.SelectionChangedT = true;
UPVRobotPostProcessPlotFreq1DInfoTable(app)

% =============================================================================================================
% EXPORT
function UPVRobotPostProcessFreq1DExportGraphic(~,~,app)
msg = 'Select which graph you want to export.';
title = 'Export graphic';
selection = uiconfirm(app.ALabUIFigure,msg,title,...
    'Options',{'Points','Frequency Response','SPL VS Distance','Cancel'},...
    'DefaultOption',2,'CancelOption',4);
switch selection
    
    case 'Points'
        name = 'Measure Points';
        axes = app.ExtUI.UPVRobotPostProcessFreq1DPointsUIaxes;
        exportPlot(axes,name)
    case 'Frequency Response'
        name = 'Frequency Response';
        axes = app.ExtUI.UPVRobotPostProcessFreq1DSPLUIaxes;
        exportPlot(axes,name)
    case 'SPL VS Distance'
        name = 'Distance VS SPL';
        axes = app.ExtUI.UPVRobotPostProcessFreq1DDistanceUIaxes;
        exportPlot(axes,name)
end

function UPVRobotPostProcessFreq1DExportData(~,~,app)
msg = 'Select which data you want to export.';
title = 'Export data';
selection = uiconfirm(app.ALabUIFigure,msg,title,...
    'Options',{'Points','Frequency Response','SPL VS Distance','Cancel'},...
    'DefaultOption',2,'CancelOption',4);
switch selection
    
    case 'Points'
        name = 'Measure Points';
        
        % Coords
        idxP = app.ExtVar.UPVRobotPostProcess.SelectedPoints; % Points
        coords = app.ExtVar.UPVRobotPostProcess.Coords;
        points = coords(idxP,:);
        
        % Create table
        T = [table(idxP(:),'VariableNames',{'Point'}),array2table(points)];
        T.Properties.VariableNames(2:end) = ["X","Y","Z"];
        
    case 'Frequency Response'
        name = 'Frequency Response';
        axes = app.ExtUI.UPVRobotPostProcessFreq1DSPLUIaxes;
        
        % Get XData
        cellX = get(axes.Children,'XData');
        % Remove nan
        cellX(cellfun(@(x) any(isnan(x)),cellX)) = [];
        % Freq data
        Freq = cellX{1};
        % Get XData
        cellY = get(axes.Children,'YData');
        % Remove nan
        cellY(cellfun(@(x) any(isnan(x)),cellY)) = [];
        % SPL data
        SPL = cell2mat(cellY);
        
        % Create table
        idxP = app.ExtVar.UPVRobotPostProcess.SelectedPoints; % Points
        colNames = compose('Point %d',idxP); %string(idxP);
        T = [table(Freq','VariableNames',{'Frequency (Hz)'}),array2table(SPL')];
        T.Properties.VariableNames(2:end) = colNames;
        
    case 'SPL VS Distance'
        name = 'SPL VS Distance';
        % Distance
        switch app.ExtVar.UPVRobotPostProcess.OriginType
            case 'Point'
                coords = app.ExtVar.UPVRobotPostProcess.Coords;
                origin = coords(app.ExtVar.UPVRobotPostProcess.OriginPointIdx,:);
            case 'Coordinate'
                origin = app.ExtVar.UPVRobotPostProcess.OriginPointCoor;
        end
        name = [name,sprintf(' - Origin from [%.2g, %.2g, %.2g] m',origin(1),origin(2),origin(3))];
        axes = app.ExtUI.UPVRobotPostProcessFreq1DDistanceUIaxes;
        
        % Get XData
        cellX = get(axes.Children,'XData');
        % Remove nan
        cellX(cellfun(@(x) any(isnan(x)),cellX)) = [];
        % Freq data
        Dist = cellX{1};
        % Get XData
        cellY = get(axes.Children,'YData');
        % Remove nan
        cellY(cellfun(@(x) any(isnan(x)),cellY)) = [];
        % SPL data
        SPL = cellY{1};
        
        % Create table
        idxP = app.ExtVar.UPVRobotPostProcess.SelectedPoints; % Points
        T = table(idxP(:),round(Dist',4),SPL','VariableNames',{'Point','Distance from origin [m]','SPL [dB]'});
        
end

% Name and path selection
[filename, pathname] = uiputfile({'*.txt','Tabulated text file (*.txt)'},'Save data',[name,'.txt']);
if filename==0; return; end
if ~endsWith(filename,'.txt'); filename = [filename,'.txt']; end
writetable(T,[pathname,filename],'Delimiter','\t')