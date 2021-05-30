function createCenterPanelAeroacoustics(app)

% Grid
column = centerGrid(app,{'1x'},{'1x', '1x', '1x', 'fit'});

% Create AeroacousticsImpulseResponsePanel
app.ExtUI.AeroacousticsImpulseResponsePanel = uipanel(column);
app.ExtUI.AeroacousticsImpulseResponsePanel.TitlePosition = 'centertop';
app.ExtUI.AeroacousticsImpulseResponsePanel.Title = 'Impulse Response';
app.ExtUI.AeroacousticsImpulseResponsePanel.BackgroundColor = [1 1 1];
app.ExtUI.AeroacousticsImpulseResponsePanel.Layout.Row = 1;
app.ExtUI.AeroacousticsImpulseResponsePanel.Layout.Column = 1;
app.ExtUI.AeroacousticsImpulseResponsePanel.FontWeight = 'bold';

% Create GridAeroacousticsImpulseResponse
app.ExtUI.GridAeroacousticsImpulseResponse = uigridlayout(app.ExtUI.AeroacousticsImpulseResponsePanel);
app.ExtUI.GridAeroacousticsImpulseResponse.ColumnWidth = {'1x'};
app.ExtUI.GridAeroacousticsImpulseResponse.RowHeight = {'1x'};
app.ExtUI.GridAeroacousticsImpulseResponse.Padding = [5 5 5 5];
app.ExtUI.GridAeroacousticsImpulseResponse.BackgroundColor = [1 1 1];

% Create AeroacousticsImpulseResponseAxes
app.ExtUI.AeroacousticsImpulseResponseAxes = uiaxes(app.ExtUI.GridAeroacousticsImpulseResponse);
xlabel(app.ExtUI.AeroacousticsImpulseResponseAxes, 'X')
ylabel(app.ExtUI.AeroacousticsImpulseResponseAxes, 'Y')
zlabel(app.ExtUI.AeroacousticsImpulseResponseAxes, 'Z')
app.ExtUI.AeroacousticsImpulseResponseAxes.Layout.Row = 1;
app.ExtUI.AeroacousticsImpulseResponseAxes.Layout.Column = 1;

% Create AeroacousticsFrequencyResponsePanel
app.ExtUI.AeroacousticsFrequencyResponsePanel = uipanel(app.ExtUI.GridCenterMain);
app.ExtUI.AeroacousticsFrequencyResponsePanel.TitlePosition = 'centertop';
app.ExtUI.AeroacousticsFrequencyResponsePanel.Title = 'Frequency Response';
app.ExtUI.AeroacousticsFrequencyResponsePanel.BackgroundColor = [1 1 1];
app.ExtUI.AeroacousticsFrequencyResponsePanel.Layout.Row = 2;
app.ExtUI.AeroacousticsFrequencyResponsePanel.Layout.Column = 1;
app.ExtUI.AeroacousticsFrequencyResponsePanel.FontWeight = 'bold';

% Create GridAeroacousticsFrequencyResponsePanel
app.ExtUI.GridAeroacousticsFrequencyResponsePanel = uigridlayout(app.ExtUI.AeroacousticsFrequencyResponsePanel);
app.ExtUI.GridAeroacousticsFrequencyResponsePanel.ColumnWidth = {'1x'};
app.ExtUI.GridAeroacousticsFrequencyResponsePanel.RowHeight = {'1x'};
app.ExtUI.GridAeroacousticsFrequencyResponsePanel.Padding = [5 5 5 5];
app.ExtUI.GridAeroacousticsFrequencyResponsePanel.BackgroundColor = [1 1 1];

% Create AeroacousticsFrequencyResponseAxes
app.ExtUI.AeroacousticsFrequencyResponseAxes = uiaxes(app.ExtUI.GridAeroacousticsFrequencyResponsePanel);
xlabel(app.ExtUI.AeroacousticsFrequencyResponseAxes, 'X')
ylabel(app.ExtUI.AeroacousticsFrequencyResponseAxes, 'Y')
zlabel(app.ExtUI.AeroacousticsFrequencyResponseAxes, 'Z')
app.ExtUI.AeroacousticsFrequencyResponseAxes.Layout.Row = 1;
app.ExtUI.AeroacousticsFrequencyResponseAxes.Layout.Column = 1;

% Create AeroacousticsSoundPressureLevelPanel
app.ExtUI.AeroacousticsSoundPressureLevelPanel = uipanel(app.ExtUI.GridCenterMain);
app.ExtUI.AeroacousticsSoundPressureLevelPanel.TitlePosition = 'centertop';
app.ExtUI.AeroacousticsSoundPressureLevelPanel.Title = 'Sound Pressure Level (first calibrate the inputs)';
app.ExtUI.AeroacousticsSoundPressureLevelPanel.BackgroundColor = [1 1 1];
app.ExtUI.AeroacousticsSoundPressureLevelPanel.Layout.Row = 3;
app.ExtUI.AeroacousticsSoundPressureLevelPanel.Layout.Column = 1;
app.ExtUI.AeroacousticsSoundPressureLevelPanel.FontWeight = 'bold';

% Create GridAeroacousticsSoundPressureLevelPanel
app.ExtUI.GridAeroacousticsSoundPressureLevelPanel = uigridlayout(app.ExtUI.AeroacousticsSoundPressureLevelPanel);
app.ExtUI.GridAeroacousticsSoundPressureLevelPanel.ColumnWidth = {'1x'};
app.ExtUI.GridAeroacousticsSoundPressureLevelPanel.RowHeight = {'1x'};
app.ExtUI.GridAeroacousticsSoundPressureLevelPanel.Padding = [5 5 5 5];
app.ExtUI.GridAeroacousticsSoundPressureLevelPanel.BackgroundColor = [1 1 1];

% Create AeroacousticsSoundPressureLevelAxes
app.ExtUI.AeroacousticsSoundPressureLevelAxes = uiaxes(app.ExtUI.GridAeroacousticsSoundPressureLevelPanel);
xlabel(app.ExtUI.AeroacousticsSoundPressureLevelAxes, 'X')
ylabel(app.ExtUI.AeroacousticsSoundPressureLevelAxes, 'Y')
zlabel(app.ExtUI.AeroacousticsSoundPressureLevelAxes, 'Z')
app.ExtUI.AeroacousticsSoundPressureLevelAxes.Layout.Row = 1;
app.ExtUI.AeroacousticsSoundPressureLevelAxes.Layout.Column = 1;

% Create GridAeroacousticsButtons
app.ExtUI.GridAeroacousticsButtons = uigridlayout(app.ExtUI.GridCenterMain);
app.ExtUI.GridAeroacousticsButtons.ColumnWidth = {'1x', 'fit', 'fit', '1x'};
app.ExtUI.GridAeroacousticsButtons.RowHeight = {'fit'};
app.ExtUI.GridAeroacousticsButtons.Padding = [0,0,0,0];
app.ExtUI.GridAeroacousticsButtons.Layout.Row = 4;
app.ExtUI.GridAeroacousticsButtons.Layout.Column = 1;
app.ExtUI.GridAeroacousticsButtons.BackgroundColor = [1 1 1];

% Create AeroacousticsExportmeasuretxtButton
app.ExtUI.AeroacousticsExportmeasuretxtButton = uibutton(app.ExtUI.GridAeroacousticsButtons, 'push');
app.ExtUI.AeroacousticsExportmeasuretxtButton.ButtonPushedFcn = {@AeroExportAllParameterButton,app};
app.ExtUI.AeroacousticsExportmeasuretxtButton.BackgroundColor = [1 1 1];
app.ExtUI.AeroacousticsExportmeasuretxtButton.Layout.Row = 1;
app.ExtUI.AeroacousticsExportmeasuretxtButton.Layout.Column = 2;
app.ExtUI.AeroacousticsExportmeasuretxtButton.Text = 'Export measures (.txt)';

% Create AeroacousticsExportgraphicsButton
app.ExtUI.AeroacousticsExportgraphicsButton = uibutton(app.ExtUI.GridAeroacousticsButtons, 'push');
app.ExtUI.AeroacousticsExportgraphicsButton.BackgroundColor = [1 1 1];
app.ExtUI.AeroacousticsExportgraphicsButton.Layout.Row = 1;
app.ExtUI.AeroacousticsExportgraphicsButton.Layout.Column = 3;
app.ExtUI.AeroacousticsExportgraphicsButton.Text = 'Export graphics';


function AeroExportAllParameterButton(~,~,app)

selpath = uigetdir([],'Export all parameters');
if selpath ~= 0
    ch = app.ExtVar.Aeroacoustics.InputChannels;
    
    % Impulse response
    paramX = app.ExtVar.Aeroacoustics.IRt;
    paramY = app.ExtVar.Aeroacoustics.IRamp;
    colname = {'Time_s'};
    T = table(paramX);
    for i = 1:numel(ch)
        colname = [colname,sprintf('IR_Input%d',ch(i))];
        newcol = table(paramY(:,i),'VariableNames', {num2str(i)});
        T = [T,newcol];
    end
    T.Properties.VariableNames = colname;
    writetable(T,[selpath,filesep,'ImpulseResponse.txt'],'Delimiter','\t')
    
    % Frequency response
    paramX = app.ExtVar.Aeroacoustics.FRf;
    paramY = app.ExtVar.Aeroacoustics.FRh;
    colname = {'Frequency_Hz'};
    T = table(paramX);
    for i = 1:numel(ch)
        colname = [colname,sprintf('FR_Input%d',ch(i))];
        newcol = table(paramY(:,i),'VariableNames', {num2str(i)});
        T = [T,newcol];
    end
    T.Properties.VariableNames = colname;
    writetable(T,[selpath,filesep,'FrequencyResponse.txt'],'Delimiter','\t')
    
    % Sound pressure level
    paramX = app.ExtVar.Aeroacoustics.SPLf;
    if isempty(paramX)
        fmin = app.ExtVar.Aeroacoustics.SPLminf;
        fmax = app.ExtVar.Aeroacoustics.SPLmaxf;
        paramX = string(sprintf('Full band [%.1f,%.1f] Hz',fmin,fmax));
    end
    for i = 1:numel(ch)
        paramY1 = app.ExtVar.Aeroacoustics.SPLlt;
        paramY2 = app.ExtVar.Aeroacoustics.SPLleq;
        paramY3 = app.ExtVar.Aeroacoustics.SPLlpeak;
        paramY4 = app.ExtVar.Aeroacoustics.SPLlmax;
        T = table(paramX(:),paramY1(:,i),paramY2(:,i),paramY3(:,i),paramY4(:,i),'VariableNames',{'Frequency_Hz','L_t','L_eq','L_peak','L_max'});
        writetable(T,[selpath,filesep,sprintf('SoundPressureLevel_Input%d.txt',ch(i))],'Delimiter','\t')
    end
end