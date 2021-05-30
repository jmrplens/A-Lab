function UPVRobotPostProcessPlotFreq1DInfoTable(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Execute only when Data information Tab is selected
if ~strcmp(app.ExtUI.UPVRobotPostProcessFreqTab1DPlots.SelectedTab.Title,'Data information')
    return;
end

% Initialize table
T = table();
Rows = app.ExtVar.UPVRobotPostProcess.SelectedPoints';
colNames = [];

if numel(Rows) > 0
    
    % Progress
    strmain = sprintf('Processing results for %d points... Please Wait.',numel(Rows));
    d = uiprogressdlg(app.ALabUIFigure,'Title','Processing',...
        'Message',strmain,...
        'Indeterminate','on');
    
    
    % Fly / Dist
    if app.ExtVar.UPVRobotPostProcess.FlyTimeCheck
        
        d.Message = {strmain;...
                ' ';...
                'Processing fly time and distance'};
            
        if isempty(app.ExtVar.UPVRobotPostProcess.FlyDist) ...
                || isempty(app.ExtVar.UPVRobotPostProcess.FlyTime) ...
                || app.ExtVar.UPVRobotPostProcess.SelectionChangedT ...
                || numel(app.ExtVar.UPVRobotPostProcess.FlyDist)~=numel(Rows)
            UPVRobotPostProcessFlyTimeCalc(app);
            
        end
        FlyDist = app.ExtVar.UPVRobotPostProcess.FlyDist;
        FlyTime = app.ExtVar.UPVRobotPostProcess.FlyTime;
        if numel(FlyDist)==numel(Rows) && numel(FlyTime)==numel(Rows)
            T = [T,table(FlyTime(:),FlyDist(:))];
            colNames = [colNames,"Time of flight (ms)","Distance of flight (m)"];
            T.Properties.VariableNames = colNames;
        end
    end
    
    % Overall SPL
    if app.ExtVar.UPVRobotPostProcess.OverallSPLCheck
        
        d.Message = {strmain;...
                ' ';...
                'Processing Overall SPL'};
            
        if isempty(app.ExtVar.UPVRobotPostProcess.OverallSPL) ...
                || app.ExtVar.UPVRobotPostProcess.SelectionChangedT ...
                || numel(app.ExtVar.UPVRobotPostProcess.OverallSPL)~=numel(Rows)
            UPVRobotPostProcessOverallSPLCalc(app);
        end
        
        OverallSPL = app.ExtVar.UPVRobotPostProcess.OverallSPL;
        if numel(OverallSPL)==numel(Rows)
            T = [T,table(OverallSPL(:))];
            colNames = [colNames,"Overall SPL (dB)"];
            T.Properties.VariableNames = colNames;
            
        end
    end
    
    % Cliping
    if app.ExtVar.UPVRobotPostProcess.ClippingCheck
        
        d.Message = {strmain;...
                ' ';...
                'Processing Clipping'};
            
        if isempty(app.ExtVar.UPVRobotPostProcess.Clipping) ...
                || app.ExtVar.UPVRobotPostProcess.SelectionChangedT ...
                || numel(app.ExtVar.UPVRobotPostProcess.Clipping)~=numel(Rows)
            UPVRobotPostProcessClippingCalc(app);
        end
        
        Clipping = app.ExtVar.UPVRobotPostProcess.Clipping;
        if numel(Clipping)==numel(Rows)
            Value = strings(numel(Clipping),1);
            for ii = 1:numel(Clipping)
                if Clipping(ii)
                    Value(ii) = "Yes";
                else
                    Value(ii) = "No";
                end
            end
            
            T = [T,table(Value)];
            colNames = [colNames,"Clipping"];
            T.Properties.VariableNames = colNames;
            
        end
        
    end
    
    % Close alert
    pause(0.5)
    
    close(d)
    
end

% To UI table
app.ExtUI.UPVRobotPostProcessFreq1DInformationTable.Data = [];
app.ExtUI.UPVRobotPostProcessFreq1DInformationTable.Data = T;
app.ExtUI.UPVRobotPostProcessFreq1DInformationTable.ColumnName = colNames;
app.ExtUI.UPVRobotPostProcessFreq1DInformationTable.RowName = Rows;
removeStyle(app.ExtUI.UPVRobotPostProcessFreq1DInformationTable)
% Main style
s = uistyle;
s.HorizontalAlignment = 'center';
addStyle(app.ExtUI.UPVRobotPostProcessFreq1DInformationTable,s)

% Style for clipping column
if app.ExtVar.UPVRobotPostProcess.ClippingCheck
    % is Clipping
    idxC = find(app.ExtVar.UPVRobotPostProcess.Clipping == 1);
    s = uistyle;
    s.BackgroundColor = [0.6350 0.0780 0.1840];
    s.FontColor = [0,0,0];
    s.FontWeight = 'bold';
    col = find(strcmp(app.ExtUI.UPVRobotPostProcessFreq1DInformationTable.ColumnName,'Clipping'));
    if ~isempty(idxC)
        addStyle(app.ExtUI.UPVRobotPostProcessFreq1DInformationTable,s,'cell',[idxC,ones(size(idxC))*col])
    end
    % no Clipping
    idxC = find(app.ExtVar.UPVRobotPostProcess.Clipping == 0);
    s.BackgroundColor = [0.4660 0.6740 0.1880];
    if ~isempty(idxC)
        addStyle(app.ExtUI.UPVRobotPostProcessFreq1DInformationTable,s,'cell',[idxC,ones(size(idxC))*col])
    end
end

% Boolean to know if the selection is modified
app.ExtVar.UPVRobotPostProcess.SelectionChangedT = false;