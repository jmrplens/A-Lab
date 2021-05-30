function CreateCenterPanelResultsFourMic(app)
% Copyright (C) Jose M. Requena Plens
% joreple@upv.es - jmrplens.github.io

% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
    'Indeterminate','on');

% Configure Column
column = centerGrid(app,{'1x'},{'1x'});

% Create CenterResultsPanelFourMicTwoMic
app.ExtUI.CenterResultsPanelFourMicTwoMic = uipanel(column);
app.ExtUI.CenterResultsPanelFourMicTwoMic.Visible = 'off';
app.ExtUI.CenterResultsPanelFourMicTwoMic.TitlePosition = 'centertop';
app.ExtUI.CenterResultsPanelFourMicTwoMic.Title = 'ASTM 2611 Results';
app.ExtUI.CenterResultsPanelFourMicTwoMic.BackgroundColor = [1 1 1];
app.ExtUI.CenterResultsPanelFourMicTwoMic.Layout.Row = 1;
app.ExtUI.CenterResultsPanelFourMicTwoMic.Layout.Column = 1;
app.ExtUI.CenterResultsPanelFourMicTwoMic.FontAngle = 'italic';
app.ExtUI.CenterResultsPanelFourMicTwoMic.FontWeight = 'bold';

% Create CenterResultsGridFourMicTwoMic
app.ExtUI.CenterResultsGridFourMicTwoMic = uigridlayout(app.ExtUI.CenterResultsPanelFourMicTwoMic);
app.ExtUI.CenterResultsGridFourMicTwoMic.RowHeight = {'fit', 'fit','1x', '1x', '1x', 'fit'};
app.ExtUI.CenterResultsGridFourMicTwoMic.BackgroundColor = [1 1 1];

% Create FourMicTransmissionLossPanel
app.ExtUI.FourMicTransmissionLossPanel = uipanel(app.ExtUI.CenterResultsGridFourMicTwoMic);
app.ExtUI.FourMicTransmissionLossPanel.ForegroundColor = [1 1 1];
app.ExtUI.FourMicTransmissionLossPanel.TitlePosition = 'centertop';
app.ExtUI.FourMicTransmissionLossPanel.FontWeight = 'bold';
app.ExtUI.FourMicTransmissionLossPanel.Title = 'Transmission Loss';
app.ExtUI.FourMicTransmissionLossPanel.BackgroundColor = [0 0 0];
app.ExtUI.FourMicTransmissionLossPanel.Layout.Row = 3;
app.ExtUI.FourMicTransmissionLossPanel.Layout.Column = 1;

% Create FourMicTransmissionLossGrid
app.ExtUI.FourMicTransmissionLossGrid = uigridlayout(app.ExtUI.FourMicTransmissionLossPanel);
app.ExtUI.FourMicTransmissionLossGrid.ColumnWidth = {'1x'};
app.ExtUI.FourMicTransmissionLossGrid.RowHeight = {'1x'};
app.ExtUI.FourMicTransmissionLossGrid.Padding = [5 5 38 10];
app.ExtUI.FourMicTransmissionLossGrid.BackgroundColor = [1 1 1];

% Create FourMicTransmissionLossAxes
app.ExtUI.FourMicTransmissionLossAxes = uiaxes(app.ExtUI.FourMicTransmissionLossGrid);
app.ExtUI.FourMicTransmissionLossAxes.Layout.Row = 1;
app.ExtUI.FourMicTransmissionLossAxes.Layout.Column = 1;
app.ExtUI.FourMicTransmissionLossAxes.ButtonDownFcn = {@FourMicSingleResult,app,'transmission_loss'};

% Create FourMicImpedancePanel
app.ExtUI.FourMicImpedancePanel = uipanel(app.ExtUI.CenterResultsGridFourMicTwoMic);
app.ExtUI.FourMicImpedancePanel.ForegroundColor = [1 1 1];
app.ExtUI.FourMicImpedancePanel.TitlePosition = 'centertop';
app.ExtUI.FourMicImpedancePanel.FontWeight = 'bold';
app.ExtUI.FourMicImpedancePanel.Title = 'Impedance';
app.ExtUI.FourMicImpedancePanel.BackgroundColor = [0 0 0];
app.ExtUI.FourMicImpedancePanel.Layout.Row = 3;
app.ExtUI.FourMicImpedancePanel.Layout.Column = 2;

% Create FourMicImpedanceGrid
app.ExtUI.FourMicImpedanceGrid = uigridlayout(app.ExtUI.FourMicImpedancePanel);
app.ExtUI.FourMicImpedanceGrid.ColumnWidth = {'1x'};
app.ExtUI.FourMicImpedanceGrid.RowHeight = {'1x'};
app.ExtUI.FourMicImpedanceGrid.Padding = [5 5 5 10];
app.ExtUI.FourMicImpedanceGrid.BackgroundColor = [1 1 1];

% Create FourMicImpedanceAxes
app.ExtUI.FourMicImpedanceAxes = uiaxes(app.ExtUI.FourMicImpedanceGrid);
app.ExtUI.FourMicImpedanceAxes.Layout.Row = 1;
app.ExtUI.FourMicImpedanceAxes.Layout.Column = 1;
app.ExtUI.FourMicImpedanceAxes.ButtonDownFcn = {@FourMicSingleResult,app,'impedance'};

% Create FourMicTransmissionPanel
app.ExtUI.FourMicTransmissionPanel = uipanel(app.ExtUI.CenterResultsGridFourMicTwoMic);
app.ExtUI.FourMicTransmissionPanel.ForegroundColor = [1 1 1];
app.ExtUI.FourMicTransmissionPanel.TitlePosition = 'centertop';
app.ExtUI.FourMicTransmissionPanel.FontWeight = 'bold';
app.ExtUI.FourMicTransmissionPanel.Title = 'Transmission';
app.ExtUI.FourMicTransmissionPanel.BackgroundColor = [0 0 0];
app.ExtUI.FourMicTransmissionPanel.Layout.Row = 4;
app.ExtUI.FourMicTransmissionPanel.Layout.Column = 1;

% Create FourMicTransmissionGrid
app.ExtUI.FourMicTransmissionGrid = uigridlayout(app.ExtUI.FourMicTransmissionPanel);
app.ExtUI.FourMicTransmissionGrid.ColumnWidth = {'1x'};
app.ExtUI.FourMicTransmissionGrid.RowHeight = {'1x'};
app.ExtUI.FourMicTransmissionGrid.Padding = [5 5 5 10];
app.ExtUI.FourMicTransmissionGrid.BackgroundColor = [1 1 1];

% Create FourMicTransmissionAxes
app.ExtUI.FourMicTransmissionAxes = uiaxes(app.ExtUI.FourMicTransmissionGrid);
app.ExtUI.FourMicTransmissionAxes.Layout.Row = 1;
app.ExtUI.FourMicTransmissionAxes.Layout.Column = 1;
app.ExtUI.FourMicTransmissionAxes.ButtonDownFcn = {@FourMicSingleResult,app,'transmission'};

% Create FourMicReflectionPanel
app.ExtUI.FourMicReflectionPanel = uipanel(app.ExtUI.CenterResultsGridFourMicTwoMic);
app.ExtUI.FourMicReflectionPanel.ForegroundColor = [1 1 1];
app.ExtUI.FourMicReflectionPanel.TitlePosition = 'centertop';
app.ExtUI.FourMicReflectionPanel.FontWeight = 'bold';
app.ExtUI.FourMicReflectionPanel.Title = 'Reflection (Hard-Backed)';
app.ExtUI.FourMicReflectionPanel.BackgroundColor = [0 0 0];
app.ExtUI.FourMicReflectionPanel.Layout.Row = 4;
app.ExtUI.FourMicReflectionPanel.Layout.Column = 2;

% Create FourMicReflectionGrid
app.ExtUI.FourMicReflectionGrid = uigridlayout(app.ExtUI.FourMicReflectionPanel);
app.ExtUI.FourMicReflectionGrid.ColumnWidth = {'1x'};
app.ExtUI.FourMicReflectionGrid.RowHeight = {'1x'};
app.ExtUI.FourMicReflectionGrid.Padding = [5 5 5 10];
app.ExtUI.FourMicReflectionGrid.BackgroundColor = [1 1 1];

% Create FourMicReflectionAxes
app.ExtUI.FourMicReflectionAxes = uiaxes(app.ExtUI.FourMicReflectionGrid);
app.ExtUI.FourMicReflectionAxes.Layout.Row = 1;
app.ExtUI.FourMicReflectionAxes.Layout.Column = 1;
app.ExtUI.FourMicReflectionAxes.ButtonDownFcn = {@FourMicSingleResult,app,'reflection'};

% Create FourMicAbsorptionPanel
app.ExtUI.FourMicAbsorptionPanel = uipanel(app.ExtUI.CenterResultsGridFourMicTwoMic);
app.ExtUI.FourMicAbsorptionPanel.ForegroundColor = [1 1 1];
app.ExtUI.FourMicAbsorptionPanel.TitlePosition = 'centertop';
app.ExtUI.FourMicAbsorptionPanel.FontWeight = 'bold';
app.ExtUI.FourMicAbsorptionPanel.Title = 'Absorption (Hard-Backed)';
app.ExtUI.FourMicAbsorptionPanel.BackgroundColor = [0 0 0];
app.ExtUI.FourMicAbsorptionPanel.Layout.Row = 5;
app.ExtUI.FourMicAbsorptionPanel.Layout.Column = 2;

% Create FourMicAbsorptionGrid
app.ExtUI.FourMicAbsorptionGrid = uigridlayout(app.ExtUI.FourMicAbsorptionPanel);
app.ExtUI.FourMicAbsorptionGrid.ColumnWidth = {'1x'};
app.ExtUI.FourMicAbsorptionGrid.RowHeight = {'1x'};
app.ExtUI.FourMicAbsorptionGrid.Padding = [5 5 38 10];
app.ExtUI.FourMicAbsorptionGrid.BackgroundColor = [1 1 1];

% Create FourMicAbsorptionAxes
app.ExtUI.FourMicAbsorptionAxes = uiaxes(app.ExtUI.FourMicAbsorptionGrid);
app.ExtUI.FourMicAbsorptionAxes.Layout.Row = 1;
app.ExtUI.FourMicAbsorptionAxes.Layout.Column = 1;
app.ExtUI.FourMicAbsorptionAxes.ButtonDownFcn = {@FourMicSingleResult,app,'absorption'};

% Create FourMicPropagationWavenumberPanel
app.ExtUI.FourMicPropagationWavenumberPanel = uipanel(app.ExtUI.CenterResultsGridFourMicTwoMic);
app.ExtUI.FourMicPropagationWavenumberPanel.ForegroundColor = [1 1 1];
app.ExtUI.FourMicPropagationWavenumberPanel.TitlePosition = 'centertop';
app.ExtUI.FourMicPropagationWavenumberPanel.FontWeight = 'bold';
app.ExtUI.FourMicPropagationWavenumberPanel.Title = 'Propagation Wavenumber';
app.ExtUI.FourMicPropagationWavenumberPanel.BackgroundColor = [0 0 0];
app.ExtUI.FourMicPropagationWavenumberPanel.Layout.Row = 5;
app.ExtUI.FourMicPropagationWavenumberPanel.Layout.Column = 1;

% Create FourMicPropagationWavenumberGrid
app.ExtUI.FourMicPropagationWavenumberGrid = uigridlayout(app.ExtUI.FourMicPropagationWavenumberPanel);
app.ExtUI.FourMicPropagationWavenumberGrid.ColumnWidth = {'1x'};
app.ExtUI.FourMicPropagationWavenumberGrid.RowHeight = {'1x'};
app.ExtUI.FourMicPropagationWavenumberGrid.Padding = [5 5 5 10];
app.ExtUI.FourMicPropagationWavenumberGrid.BackgroundColor = [1 1 1];

% Create FourMicPropagationWavenumberPanelAxes
app.ExtUI.FourMicPropagationWavenumberPanelAxes = uiaxes(app.ExtUI.FourMicPropagationWavenumberGrid);
app.ExtUI.FourMicPropagationWavenumberPanelAxes.Layout.Row = 1;
app.ExtUI.FourMicPropagationWavenumberPanelAxes.Layout.Column = 1;
app.ExtUI.FourMicPropagationWavenumberPanelAxes.ButtonDownFcn = {@FourMicSingleResult,app,'wavenumber'};

% Create FourMicInformationLabel
app.ExtUI.FourMicInformationLabel = uilabel(app.ExtUI.CenterResultsGridFourMicTwoMic);
app.ExtUI.FourMicInformationLabel.HorizontalAlignment = 'center';
app.ExtUI.FourMicInformationLabel.WordWrap = 'on';
app.ExtUI.FourMicInformationLabel.FontWeight = 'bold';
app.ExtUI.FourMicInformationLabel.Layout.Row = 1;
app.ExtUI.FourMicInformationLabel.Layout.Column = [1 2];
app.ExtUI.FourMicInformationLabel.Text = 'Click on a graph to enlarge it and/or export graphic.';

% Create GridFFTSelFourMic
app.ExtUI.GridFFTSelFourMic = uigridlayout(app.ExtUI.CenterResultsGridFourMicTwoMic);
app.ExtUI.GridFFTSelFourMic.ColumnWidth = {'1x', 'fit', 'fit', '1x'};
app.ExtUI.GridFFTSelFourMic.RowHeight = {'fit'};
app.ExtUI.GridFFTSelFourMic.Padding = [0 0 0 0];
app.ExtUI.GridFFTSelFourMic.Layout.Row = 2;
app.ExtUI.GridFFTSelFourMic.Layout.Column = [1 2];
app.ExtUI.GridFFTSelFourMic.BackgroundColor = [1 1 1];

% Create ResolutionFFTDropDownLabel
app.ExtUI.ResolutionFFTDropDownLabel = uilabel(app.ExtUI.GridFFTSelFourMic);
app.ExtUI.ResolutionFFTDropDownLabel.BackgroundColor = [1 1 1];
app.ExtUI.ResolutionFFTDropDownLabel.HorizontalAlignment = 'right';
app.ExtUI.ResolutionFFTDropDownLabel.Layout.Row = 1;
app.ExtUI.ResolutionFFTDropDownLabel.Layout.Column = 2;
app.ExtUI.ResolutionFFTDropDownLabel.Text = 'Resolution (FFT)';

% Create FFTSelFourMic
app.ExtUI.FFTSelFourMic = uidropdown(app.ExtUI.GridFFTSelFourMic);
app.ExtUI.FFTSelFourMic.Items = {'1024', '2048', '4096', '8192', '16384', '32768'};
app.ExtUI.FFTSelFourMic.BackgroundColor = [1 1 1];
app.ExtUI.FFTSelFourMic.Layout.Row = 1;
app.ExtUI.FFTSelFourMic.Layout.Column = 3;
app.ExtUI.FFTSelFourMic.Value = '8192';
app.ExtUI.FFTSelFourMic.ValueChangedFcn = {@FourMicFFTChanged,app};
if isempty(app.ExtVar.ImpedanceTubeFourMic.FFTRes)
    app.ExtVar.ImpedanceTubeFourMic.FFTRes = str2double(app.ExtUI.FFTSelFourMic.Value);
else
    app.ExtUI.FFTSelFourMic.Value = num2str(app.ExtVar.ImpedanceTubeFourMic.FFTRes,'%d');
end

% Create GridResultsButtonsBottomFourMic
app.ExtUI.GridResultsButtonsBottomFourMic = uigridlayout(app.ExtUI.CenterResultsGridFourMicTwoMic);
app.ExtUI.GridResultsButtonsBottomFourMic.ColumnWidth = {'1x', '1x', '1x'};
app.ExtUI.GridResultsButtonsBottomFourMic.RowHeight = {'fit'};
app.ExtUI.GridResultsButtonsBottomFourMic.Padding = [0 0 0 0];
app.ExtUI.GridResultsButtonsBottomFourMic.Layout.Row = 6;
app.ExtUI.GridResultsButtonsBottomFourMic.Layout.Column = [1 2];
app.ExtUI.GridResultsButtonsBottomFourMic.BackgroundColor = [1 1 1];

% Create FourMicOtherresultsButton
app.ExtUI.FourMicOtherresultsButton = uibutton(app.ExtUI.GridResultsButtonsBottomFourMic, 'push');
app.ExtUI.FourMicOtherresultsButton.BackgroundColor = [1 1 1];
app.ExtUI.FourMicOtherresultsButton.Layout.Row = 1;
app.ExtUI.FourMicOtherresultsButton.Layout.Column = 3;
app.ExtUI.FourMicOtherresultsButton.Text = 'Other results';
app.ExtUI.FourMicOtherresultsButton.FontWeight = 'bold';
app.ExtUI.FourMicOtherresultsButton.ButtonPushedFcn = {@FourMicOtherResultsParameterButton,app};

% Create FourMicExportallresultstxtButton
app.ExtUI.FourMicExportallresultstxtButton = uibutton(app.ExtUI.GridResultsButtonsBottomFourMic, 'push');
app.ExtUI.FourMicExportallresultstxtButton.BackgroundColor = [1 1 1];
app.ExtUI.FourMicExportallresultstxtButton.Layout.Row = 1;
app.ExtUI.FourMicExportallresultstxtButton.Layout.Column = 1;
app.ExtUI.FourMicExportallresultstxtButton.Text = 'Export all results (.txt)';
app.ExtUI.FourMicExportallresultstxtButton.FontWeight = 'bold';
app.ExtUI.FourMicExportallresultstxtButton.ButtonPushedFcn = {@FourMicExportAllParameterButton,app};


% Create FourMicExportTransferMatrixtxtButton
app.ExtUI.FourMicExportTransferMatrixtxtButton = uibutton(app.ExtUI.GridResultsButtonsBottomFourMic, 'push');
app.ExtUI.FourMicExportTransferMatrixtxtButton.BackgroundColor = [1 1 1];
app.ExtUI.FourMicExportTransferMatrixtxtButton.Layout.Row = 1;
app.ExtUI.FourMicExportTransferMatrixtxtButton.Layout.Column = 2;
app.ExtUI.FourMicExportTransferMatrixtxtButton.Text = 'Export transfer matrix (.txt)';
app.ExtUI.FourMicExportTransferMatrixtxtButton.FontWeight = 'bold';
app.ExtUI.FourMicExportTransferMatrixtxtButton.ButtonPushedFcn = {@FourMicExportTransferMatrixButton,app};

%% Plot results

% Parameters
TL = app.ExtVar.ImpedanceTubeFourMic.TLoss;
Z = app.ExtVar.ImpedanceTubeFourMic.Impedance;
t = app.ExtVar.ImpedanceTubeFourMic.Transmission;
Rrigid = app.ExtVar.ImpedanceTubeFourMic.ReflectionRigid;
alphaRigid = app.ExtVar.ImpedanceTubeFourMic.AbsorptionRigid;
kp = app.ExtVar.ImpedanceTubeFourMic.PropWave;
freq = app.ExtVar.ImpedanceTubeFourMic.FreqArray;
freqMin = app.ExtVar.ImpedanceTubeFourMic.FreqMin;
freqMax = app.ExtVar.ImpedanceTubeFourMic.FreqMax;
xlimm = [freqMin,freqMax];
xlabell = 'Frequency [Hz]';
idx1 = find(freq>=freqMin,1,'first');
idx2 = find(freq>=freqMax,1,'first');

% Transmission loss
ax = app.ExtUI.FourMicTransmissionLossAxes;
cla(ax);
plot(ax,freq(idx1:idx2),real(TL(idx1:idx2)),'k-','linewidth',1)
xlabel(ax,xlabell)
ylabel(ax,'TL [dB]')
xlim(ax,xlimm)
up = max(real(TL(idx1:idx2)));
if ~isnan(up); ylim(ax,[0,up]); end
box(ax,'on')
plotStyle(ax)
disableDefaultInteractivity(ax)
axtoolbar(ax,'Visible','off');

% Impedance
ax = app.ExtUI.FourMicImpedanceAxes;
cla(ax);
yyaxis(ax,'left')
plot(ax,freq(idx1:idx2),abs(Z(idx1:idx2)),'k-','linewidth',1)
ylabel(ax,'$|Z|$')
up = max(abs(Z(idx1:idx2)));
if ~isnan(up); ylim(ax,[0,up]); end
yyaxis(ax,'right')
plot(ax,freq(idx1:idx2),angle(Z(idx1:idx2))/pi,'k:','linewidth',1)
ylabel(ax,'$\phi_Z/\pi$')
ylim(ax,[-1.10,1.10])
xlabel(ax,xlabell)
xlim(ax,xlimm)
leg = legend(ax,'$|Z|$','$\phi_Z/\pi$','Location','northoutside');
leg.NumColumns = 2;
box(ax,'on')
plotStyle(ax)
disableDefaultInteractivity(ax)
axtoolbar(ax,'Visible','off');

% Transmission
ax = app.ExtUI.FourMicTransmissionAxes;
cla(ax);
yyaxis(ax,'left')
plot(ax,freq(idx1:idx2),abs(t(idx1:idx2)),'k-','linewidth',1)
ylabel(ax,'$|T|$')
ylim(ax,[-0.05,1.05])
yyaxis(ax,'right')
plot(ax,freq(idx1:idx2),angle(t(idx1:idx2))/pi,'k:','linewidth',1)
ylabel(ax,'$\phi_T/\pi$')
ylim(ax,[-1.10,1.10])
xlabel(ax,xlabell)
xlim(ax,xlimm)
leg = legend(ax,'$|T|$','$\phi_T/\pi$','Location','northoutside');
leg.NumColumns = 2;
box(ax,'on')
plotStyle(ax)
disableDefaultInteractivity(ax)
axtoolbar(ax,'Visible','off');

% Reflection
ax = app.ExtUI.FourMicReflectionAxes;
cla(ax);
yyaxis(ax,'left')
plot(ax,freq(idx1:idx2),abs(Rrigid(idx1:idx2)),'k-','linewidth',1)
ylabel(ax,'$|R|$')
ylim(ax,[-0.05,1.05])
yyaxis(ax,'right')
plot(ax,freq(idx1:idx2),angle(Rrigid(idx1:idx2))/pi,'k:','linewidth',1)
ylabel(ax,'$\phi_R/\pi$')
ylim(ax,[-1.10,1.10])
xlabel(ax,xlabell)
xlim(ax,xlimm)
leg = legend(ax,'$|R|$','$\phi_R/\pi$','Location','northoutside');
leg.NumColumns = 2;
box(ax,'on')
plotStyle(ax)
disableDefaultInteractivity(ax)
axtoolbar(ax,'Visible','off');

% Absorption
ax = app.ExtUI.FourMicAbsorptionAxes;
cla(ax);
plot(ax,freq(idx1:idx2),alphaRigid(idx1:idx2),'k-','linewidth',1)
xlabel(ax,xlabell)
ylabel(ax,'$\alpha$')
xlim(ax,xlimm)
ylim(ax,[-0.05,1.05])
box(ax,'on')
plotStyle(ax)
disableDefaultInteractivity(ax)
axtoolbar(ax,'Visible','off');

% Propagation wavenumber
ax = app.ExtUI.FourMicPropagationWavenumberPanelAxes;
cla(ax);
yyaxis(ax,'left')
plot(ax,freq(idx1:idx2),abs(kp(idx1:idx2)),'k-','linewidth',1)
ylabel(ax,'$|k_p|$ [rad/m]')
up = max(abs(kp(idx1:idx2)));
if ~isnan(up); ylim(ax,[0,up]); end
yyaxis(ax,'right')
plot(ax,freq(idx1:idx2),angle(kp(idx1:idx2))/pi,'k:','linewidth',1)
ylabel(ax,'$\phi_{k_p}/\pi$')
ylim(ax,[-1.10,1.10])
xlabel(ax,xlabell)
xlim(ax,xlimm)
leg = legend(ax,'$|k_p|$','$\phi_{k_p}/\pi$','Location','northoutside');
leg.NumColumns = 2;
box(ax,'on')
plotStyle(ax)
disableDefaultInteractivity(ax)
axtoolbar(ax,'Visible','off');

%% Show
app.ExtUI.CenterResultsPanelFourMicTwoMic.Visible = 'on';

% Close progress bar
drawnow
pause(0.5)
close(d)

function FourMicExportAllParameterButton(~,~,app)
selpath = uigetdir(userpath,'Export all parameters');
if selpath ~= 0
    if strcmp(selpath(end),filesep)==0; selpath = [selpath,filesep]; end
    
    % Update userpath
    userpath(selpath);
    
    % Transmission Loss
    paramX = app.ExtVar.ImpedanceTubeFourMic.FreqArray;
    paramY = app.ExtVar.ImpedanceTubeFourMic.TLoss;
    T = table(paramX(:),paramY(:),'VariableNames',{'Frequency','TLoss'});
    % Impedance
    paramY = app.ExtVar.ImpedanceTubeFourMic.Impedance;
    T = [T,table(paramY(:),'VariableNames',{'Impedance'})];
    % Transmission
    paramY = app.ExtVar.ImpedanceTubeFourMic.Transmission;
    T = [T,table(paramY(:),'VariableNames',{'Transmission'})];
    % Reflection
    paramY = app.ExtVar.ImpedanceTubeFourMic.ReflectionRigid;
    T = [T,table(paramY(:),'VariableNames',{'Reflection_Hard-Backed'})];
    paramY = app.ExtVar.ImpedanceTubeFourMic.ReflectionAnechoic;
    T = [T,table(paramY(:),'VariableNames',{'Reflection_Anechoic-Backed'})];
    % Absorption
    paramY = app.ExtVar.ImpedanceTubeFourMic.AbsorptionRigid;
    T = [T,table(paramY(:),'VariableNames',{'Absorption_Hard-Backed'})];
    paramY = app.ExtVar.ImpedanceTubeFourMic.AbsorptionAnechoic;
    T = [T,table(paramY(:),'VariableNames',{'Absorption_Anechoic-Backed'})];
    % Propagation WaveNumber
    paramY = app.ExtVar.ImpedanceTubeFourMic.PropWave;
    T = [T,table(paramY(:),'VariableNames',{'WaveNumber'})];
    
    writetable(T,[selpath,'StandardParameters.txt'],'Delimiter','\t')
    
    % Impulse Response (Anechoic End)
    paramY = app.ExtVar.ImpedanceTubeFourMic.IRa;
    paramX = (0:length(paramY)-1)'/app.ExtVar.ImpedanceTubeFourMic.SampleRate;
    T = table(paramX,paramY(:,1),paramY(:,2),paramY(:,3),paramY(:,4),...
        'VariableNames',{'Time','IRa_Input1','IRa_Input2','IRa_Input3','IRa_Input4'});
    
    writetable(T,[selpath,'ImpulseResponses_AnechoicEnd.txt'],'Delimiter','\t')
    
    % Impulse Response (Rigid End)
    if ~app.ExtVar.ImpedanceTubeFourMic.Symmetrical
        paramY = app.ExtVar.ImpedanceTubeFourMic.IRb;
        paramX = (1:length(paramY))'/app.SampleRate;
        T = table(paramX,paramY(:,1),paramY(:,2),paramY(:,3),paramY(:,4),...
            'VariableNames',{'Time','IRb_Input1','IRb_Input2','IRb_Input3','IRb_Input4'});
        
        writetable(T,[selpath,'ImpulseResponses_RigidEnd.txt'],'Delimiter','\t')
    end
    
    % Frequency Response (Anechoic End)
    paramY = app.ExtVar.ImpedanceTubeFourMic.FRa;
    paramX = app.ExtVar.ImpedanceTubeFourMic.FreqArray;
    T = table(paramX,paramY(:,1),paramY(:,2),paramY(:,3),paramY(:,4),...
        'VariableNames',{'Frequency','FRa_Input1','FRa_Input2','FRa_Input3','FRa_Input4'});
    
    writetable(T,[selpath,'FrequencyResponses_AnechoicEnd.txt'],'Delimiter','\t')
    
    % Frequency Response (Rigid End)
    if ~app.ExtVar.ImpedanceTubeFourMic.Symmetrical
        paramY = app.ExtVar.ImpedanceTubeFourMic.FRb;
        paramX = app.ExtVar.ImpedanceTubeFourMic.FreqArray;
        T = table(paramX,paramY(:,1),paramY(:,2),paramY(:,3),paramY(:,4),...
            'VariableNames',{'Frequency','FRb_Input1','FRb_Input2','FRb_Input3','FRb_Input4'});
        
        writetable(T,[selpath,'FrequencyResponses_RigidEnd.txt'],'Delimiter','\t')
    end
end

function FourMicExportTransferMatrixButton(~,~,app)

% Select path and filename
[file, path] = uiputfile('*.txt','Export data in text file',[userpath,'Transfer Matrix.txt']);

if file ~= 0
    
    % Update userpath
    userpath(path);
    
    % Loading info
    d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
        'Indeterminate','on');
    
    % Frequency array
    paramX = app.ExtVar.ImpedanceTubeFourMic.FreqArray;
    paramY1 = app.ExtVar.ImpedanceTubeFourMic.T11;
    paramY2 = app.ExtVar.ImpedanceTubeFourMic.T12;
    paramY3 = app.ExtVar.ImpedanceTubeFourMic.T21;
    paramY4 = app.ExtVar.ImpedanceTubeFourMic.T22;
    T = table(paramX(:),paramY1(:),paramY2(:),paramY3(:),paramY4(:),...
        'VariableNames',{'Frequency','T11','T12','T21','T22'});
    
    % To file
    writetable(T,[path,file],'Delimiter','\t')
    
    % Close progress bar
    pause(0.5)
    close(d)
end

function FourMicOtherResultsParameterButton(~,~,app)
FourMicOtherResults(app);

function FourMicFFTChanged(~,~,app)
app.ExtVar.ImpedanceTubeFourMic.FFTRes = str2double(app.ExtUI.FFTSelFourMic.Value);
calculationsFourMicASTM2611([],[],app);