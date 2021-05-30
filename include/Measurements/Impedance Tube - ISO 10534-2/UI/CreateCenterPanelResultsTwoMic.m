function CreateCenterPanelResultsTwoMic(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
    'Indeterminate','on');

% Configure Column
column = centerGrid(app,{'1x'},{'1x'});

% Create CenterResultsPanelTwoMic
app.ExtUI.CenterResultsPanelTwoMic = uipanel(column);
app.ExtUI.CenterResultsPanelTwoMic.TitlePosition = 'centertop';
app.ExtUI.CenterResultsPanelTwoMic.Title = 'ISO 10534-2 Results';
app.ExtUI.CenterResultsPanelTwoMic.BackgroundColor = [1 1 1];
app.ExtUI.CenterResultsPanelTwoMic.Layout.Row = 1;
app.ExtUI.CenterResultsPanelTwoMic.Layout.Column = 1;
app.ExtUI.CenterResultsPanelTwoMic.FontAngle = 'italic';
app.ExtUI.CenterResultsPanelTwoMic.FontWeight = 'bold';

% Create CenterResultsGridTwoMic
app.ExtUI.CenterResultsGridTwoMic = uigridlayout(app.ExtUI.CenterResultsPanelTwoMic);
app.ExtUI.CenterResultsGridTwoMic.ColumnWidth = {'1x', '1x', '1x'};
app.ExtUI.CenterResultsGridTwoMic.RowHeight = {'fit','1x', '1x', '1x', 'fit'};
app.ExtUI.CenterResultsGridTwoMic.BackgroundColor = [1 1 1];

% Create GridFFTSelTwoMic
app.ExtUI.GridFFTSelTwoMic = uigridlayout(app.ExtUI.CenterResultsGridTwoMic);
app.ExtUI.GridFFTSelTwoMic.ColumnWidth = {'1x', 'fit', 'fit', '1x'};
app.ExtUI.GridFFTSelTwoMic.RowHeight = {'fit'};
app.ExtUI.GridFFTSelTwoMic.Padding = [0 0 0 0];
app.ExtUI.GridFFTSelTwoMic.Layout.Row = 1;
app.ExtUI.GridFFTSelTwoMic.Layout.Column = [1 3];
app.ExtUI.GridFFTSelTwoMic.BackgroundColor = [1 1 1];

% Create ResolutionFFTDropDownLabel
app.ExtUI.ResolutionFFTDropDownLabel = uilabel(app.ExtUI.GridFFTSelTwoMic);
app.ExtUI.ResolutionFFTDropDownLabel.BackgroundColor = [1 1 1];
app.ExtUI.ResolutionFFTDropDownLabel.HorizontalAlignment = 'right';
app.ExtUI.ResolutionFFTDropDownLabel.Layout.Row = 1;
app.ExtUI.ResolutionFFTDropDownLabel.Layout.Column = 2;
app.ExtUI.ResolutionFFTDropDownLabel.Text = 'Resolution (FFT)';

% Create ResolutionFFTDropDown
app.ExtUI.ResolutionFFTDropDown = uidropdown(app.ExtUI.GridFFTSelTwoMic);
app.ExtUI.ResolutionFFTDropDown.Items = {'1024', '2048', '4096', '8192', '16384', '32768'};
app.ExtUI.ResolutionFFTDropDown.BackgroundColor = [1 1 1];
app.ExtUI.ResolutionFFTDropDown.Layout.Row = 1;
app.ExtUI.ResolutionFFTDropDown.Layout.Column = 3;
app.ExtUI.ResolutionFFTDropDown.Value = '8192';
app.ExtUI.ResolutionFFTDropDown.ValueChangedFcn = {@TwoMicFFTChanged,app};
if isempty(app.ExtVar.ImpedanceTubeTwoMic.FFTRes)
    app.ExtVar.ImpedanceTubeTwoMic.FFTRes = str2double(app.ExtUI.ResolutionFFTDropDown.Value);
else
    app.ExtUI.ResolutionFFTDropDown.Value = num2str(app.ExtVar.ImpedanceTubeTwoMic.FFTRes,'%d');
end

% Create TwoMicImpedancePanel
app.ExtUI.TwoMicImpedancePanel = uipanel(app.ExtUI.CenterResultsGridTwoMic);
app.ExtUI.TwoMicImpedancePanel.ForegroundColor = [1 1 1];
app.ExtUI.TwoMicImpedancePanel.TitlePosition = 'centertop';
app.ExtUI.TwoMicImpedancePanel.Title = 'Specific acoustic impedance';
app.ExtUI.TwoMicImpedancePanel.BackgroundColor = [0 0 0];
app.ExtUI.TwoMicImpedancePanel.Layout.Row = 2;
app.ExtUI.TwoMicImpedancePanel.Layout.Column = [1 3];
app.ExtUI.TwoMicImpedancePanel.FontWeight = 'bold';

% Create TwoMicImpedanceGrid
app.ExtUI.TwoMicImpedanceGrid = uigridlayout(app.ExtUI.TwoMicImpedancePanel);
app.ExtUI.TwoMicImpedanceGrid.ColumnWidth = {'1x'};
app.ExtUI.TwoMicImpedanceGrid.RowHeight = {'1x'};
app.ExtUI.TwoMicImpedanceGrid.Padding = [5 5 5 5];
app.ExtUI.TwoMicImpedanceGrid.BackgroundColor = [1 1 1];

% Create TwoMicImpedanceAxes
app.ExtUI.TwoMicImpedanceAxes = uiaxes(app.ExtUI.TwoMicImpedanceGrid);
app.ExtUI.TwoMicImpedanceAxes.Layout.Row = 1;
app.ExtUI.TwoMicImpedanceAxes.Layout.Column = 1;
app.ExtUI.TwoMicImpedanceAxes.PositionConstraint = 'innerposition';

% Create TwoMicReflectionPanel
app.ExtUI.TwoMicReflectionPanel = uipanel(app.ExtUI.CenterResultsGridTwoMic);
app.ExtUI.TwoMicReflectionPanel.ForegroundColor = [1 1 1];
app.ExtUI.TwoMicReflectionPanel.TitlePosition = 'centertop';
app.ExtUI.TwoMicReflectionPanel.Title = 'Reflection factor';
app.ExtUI.TwoMicReflectionPanel.BackgroundColor = [0 0 0];
app.ExtUI.TwoMicReflectionPanel.Layout.Row = 3;
app.ExtUI.TwoMicReflectionPanel.Layout.Column = [1 3];
app.ExtUI.TwoMicReflectionPanel.FontWeight = 'bold';

% Create TwoMicReflectionGrid
app.ExtUI.TwoMicReflectionGrid = uigridlayout(app.ExtUI.TwoMicReflectionPanel);
app.ExtUI.TwoMicReflectionGrid.ColumnWidth = {'1x'};
app.ExtUI.TwoMicReflectionGrid.RowHeight = {'1x'};
app.ExtUI.TwoMicReflectionGrid.Padding = [5 5 5 5];
app.ExtUI.TwoMicReflectionGrid.BackgroundColor = [1 1 1];

% Create TwoMicReflectionAxes
app.ExtUI.TwoMicReflectionAxes = uiaxes(app.ExtUI.TwoMicReflectionGrid);
app.ExtUI.TwoMicReflectionAxes.Layout.Row = 1;
app.ExtUI.TwoMicReflectionAxes.Layout.Column = 1;
app.ExtUI.TwoMicReflectionAxes.PositionConstraint = 'innerposition';

% Create TwoMicAbsorptionPanel
app.ExtUI.TwoMicAbsorptionPanel = uipanel(app.ExtUI.CenterResultsGridTwoMic);
app.ExtUI.TwoMicAbsorptionPanel.ForegroundColor = [1 1 1];
app.ExtUI.TwoMicAbsorptionPanel.TitlePosition = 'centertop';
app.ExtUI.TwoMicAbsorptionPanel.Title = 'Absorption factor';
app.ExtUI.TwoMicAbsorptionPanel.BackgroundColor = [0 0 0];
app.ExtUI.TwoMicAbsorptionPanel.Layout.Row = 4;
app.ExtUI.TwoMicAbsorptionPanel.Layout.Column = [1 3];
app.ExtUI.TwoMicAbsorptionPanel.FontWeight = 'bold';

% Create TwoMicAbsorptionGrid
app.ExtUI.TwoMicAbsorptionGrid = uigridlayout(app.ExtUI.TwoMicAbsorptionPanel);
app.ExtUI.TwoMicAbsorptionGrid.ColumnWidth = {'1x'};
app.ExtUI.TwoMicAbsorptionGrid.RowHeight = {'1x'};
app.ExtUI.TwoMicAbsorptionGrid.Padding = [5 5 45 31];
app.ExtUI.TwoMicAbsorptionGrid.BackgroundColor = [1 1 1];

% Create TwoMicAbsorptionAxes
app.ExtUI.TwoMicAbsorptionAxes = uiaxes(app.ExtUI.TwoMicAbsorptionGrid);
app.ExtUI.TwoMicAbsorptionAxes.Layout.Row = 1;
app.ExtUI.TwoMicAbsorptionAxes.Layout.Column = 1;
app.ExtUI.TwoMicAbsorptionAxes.PositionConstraint = 'innerposition';

% Create TwoMicOtherresultsButton
app.ExtUI.TwoMicOtherresultsButton = uibutton(app.ExtUI.CenterResultsGridTwoMic, 'push');
app.ExtUI.TwoMicOtherresultsButton.BackgroundColor = [1 1 1];
app.ExtUI.TwoMicOtherresultsButton.Layout.Row = 5;
app.ExtUI.TwoMicOtherresultsButton.Layout.Column = 3;
app.ExtUI.TwoMicOtherresultsButton.Text = 'Other results';
app.ExtUI.TwoMicOtherresultsButton.FontWeight = 'bold';
app.ExtUI.TwoMicOtherresultsButton.ButtonPushedFcn = {@TwoMicOtherResultButton,app};

% Create TwoMicExportResultButton
app.ExtUI.TwoMicExportResultButton = uibutton(app.ExtUI.CenterResultsGridTwoMic, 'push');
app.ExtUI.TwoMicExportResultButton.BackgroundColor = [1 1 1];
app.ExtUI.TwoMicExportResultButton.Layout.Row = 5;
app.ExtUI.TwoMicExportResultButton.Layout.Column = 1;
app.ExtUI.TwoMicExportResultButton.Text = 'Export result (.txt)';
app.ExtUI.TwoMicExportResultButton.FontWeight = 'bold';
app.ExtUI.TwoMicExportResultButton.ButtonPushedFcn = {@TwoMicExportButton,app};

% Create TwoMicExportGraphicButton
app.ExtUI.TwoMicExportGraphicButton = uibutton(app.ExtUI.CenterResultsGridTwoMic, 'push');
app.ExtUI.TwoMicExportGraphicButton.BackgroundColor = [1 1 1];
app.ExtUI.TwoMicExportGraphicButton.Layout.Row = 5;
app.ExtUI.TwoMicExportGraphicButton.Layout.Column = 2;
app.ExtUI.TwoMicExportGraphicButton.Text = 'Export graphic';
app.ExtUI.TwoMicExportGraphicButton.FontWeight = 'bold';
app.ExtUI.TwoMicExportGraphicButton.ButtonPushedFcn = {@TwoMicExportGraphicButton,app};

% Parameters
Z = app.ExtVar.ImpedanceTubeTwoMic.Impedance;
R = app.ExtVar.ImpedanceTubeTwoMic.Reflection;
alpha = app.ExtVar.ImpedanceTubeTwoMic.Absorption;
freq = app.ExtVar.ImpedanceTubeTwoMic.FreqArray;
freqMin = app.ExtVar.ImpedanceTubeTwoMic.FreqMin;
freqMax = app.ExtVar.ImpedanceTubeTwoMic.FreqMax;
xlimm = [freqMin,freqMax];
xlabell = 'Frequency [Hz]';
idx1 = find(freq>=freqMin,1,'first');
idx2 = find(freq>=freqMax,1,'first');

% Impedance
ax = app.ExtUI.TwoMicImpedanceAxes;
cla(ax);
yyaxis(ax,'left')
plot(ax,freq,abs(Z),'k-','linewidth',1)
ylabel(ax,'$|Z|$')
up = max(abs(Z(idx1:idx2)));
if ~isnan(up); ylim(ax,[0,up]); end
yyaxis(ax,'right')
plot(ax,freq,angle(Z)/pi,'k:','linewidth',1)
ylabel(ax,'$\phi_Z/\pi$')
ylim(ax,[-1.10,1.10])
xlabel(ax,xlabell)
xlim(ax,xlimm)
leg = legend(ax,'$|Z|$','$\phi_Z/\pi$','Location','northoutside');
leg.NumColumns = 2;
box(ax,'on')
plotStyle(ax)

% Reflection
ax = app.ExtUI.TwoMicReflectionAxes;
cla(ax);
yyaxis(ax,'left')
plot(ax,freq,abs(R),'k-','linewidth',1)
ylabel(ax,'$|R|$')
ylim(ax,[-0.05,1.05])
yyaxis(ax,'right')
plot(ax,freq,angle(R)/pi,'k:','linewidth',1)
ylabel(ax,'$\phi_R/\pi$')
ylim(ax,[-1.10,1.10])
xlabel(ax,xlabell)
xlim(ax,xlimm)
leg = legend(ax,'$|R|$','$\phi_R/\pi$','Location','northoutside');
leg.NumColumns = 2;
box(ax,'on')
plotStyle(ax)

% Absorption
ax = app.ExtUI.TwoMicAbsorptionAxes;
cla(ax);
plot(ax,freq,alpha,'k-','linewidth',1)
xlabel(ax,xlabell)
ylabel(ax,'$\alpha$')
xlim(ax,xlimm)
ylim(ax,[-0.05,1.05])
box(ax,'on')
plotStyle(ax)

% Close progress bar
drawnow
pause(0.5)
close(d)

function TwoMicExportButton(~,~,app)

msg = 'What parameter do you want to export?';
title = 'Export data';
selection = uiconfirm(app.ALabUIFigure,msg,title,...
    'Options',{'Impedance','Reflection','Absorption','Cancel'},...
    'DefaultOption',4,'CancelOption',4);

% If cancel, return
if strcmp(selection,'Cancel'); return; end

% Select path and filename
[file, path] = uiputfile('*.txt','Export data in text file',[userpath,selection,'.txt']);

if file ~= 0
    % Update userpath
    userpath(path);
    
    % Loading info
    d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
        'Indeterminate','on');
    
    % Frequency array
    paramX = app.ExtVar.ImpedanceTubeTwoMic.FreqArray;
    
    switch selection
        case 'Impedance'
            paramY = app.ExtVar.ImpedanceTubeTwoMic.Impedance;
            T = table(paramX(:),paramY(:),'VariableNames',{'Frequency','Impedance'});
        case 'Reflection'
            paramY = app.ExtVar.ImpedanceTubeTwoMic.Reflection;
            T = table(paramX(:),paramY(:),'VariableNames',{'Frequency','Reflection'});
        case 'Absorption'
            paramY = app.ExtVar.ImpedanceTubeTwoMic.Absorption;
            T = table(paramX(:),paramY(:),'VariableNames',{'Frequency','Absorption'});
    end
    
    % To file
    writetable(T,[path,file],'Delimiter','\t')
    
    % Close progress bar
    pause(0.5)
    close(d)
end

function TwoMicExportGraphicButton(~,~,app)

msg = 'What parameter do you want to export?';
title = 'Export graphic';
selection = uiconfirm(app.ALabUIFigure,msg,title,...
    'Options',{'Impedance','Reflection','Absorption','Cancel'},...
    'DefaultOption',4,'CancelOption',4);

% If cancel, return
if strcmp(selection,'Cancel'); return; end

% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
    'Indeterminate','on');

switch selection
    case 'Impedance'
        axes = app.ExtUI.TwoMicImpedanceAxes;
    case 'Reflection'
        axes = app.ExtUI.TwoMicReflectionAxes;
    case 'Absorption'
        axes = app.ExtUI.TwoMicAbsorptionAxes;
end

exportPlot(axes,selection)

% Close progress bar
pause(0.5)
close(d)

function TwoMicOtherResultButton(~,~,app)
TwoMicOtherResults(app)

function TwoMicFFTChanged(~,~,app)
app.ExtVar.ImpedanceTubeTwoMic.FFTRes = str2double(app.ExtUI.ResolutionFFTDropDown.Value);
calculationsTwoMicISO105342([],[],app);