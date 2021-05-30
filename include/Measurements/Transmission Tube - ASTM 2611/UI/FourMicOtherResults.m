function FourMicOtherResults(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
    'Indeterminate','on');


% Grid
column = centerGrid(app,{'1x'},{'1x'});

% Create FourMicOtherResultPanel
app.ExtUI.FourMicOtherResultPanel = uipanel(column);
app.ExtUI.FourMicOtherResultPanel.TitlePosition = 'centertop';
app.ExtUI.FourMicOtherResultPanel.Title = 'Other results';
app.ExtUI.FourMicOtherResultPanel.BackgroundColor = [1 1 1];
app.ExtUI.FourMicOtherResultPanel.Layout.Row = 1;
app.ExtUI.FourMicOtherResultPanel.Layout.Column = 1;
app.ExtUI.FourMicOtherResultPanel.FontAngle = 'italic';
app.ExtUI.FourMicOtherResultPanel.FontWeight = 'bold';

% Create FourMicOtherResultGrid
app.ExtUI.FourMicOtherResultGrid = uigridlayout(app.ExtUI.FourMicOtherResultPanel);
if app.ExtVar.ImpedanceTubeFourMic.Symmetrical
    app.ExtUI.FourMicOtherResultGrid.RowHeight = {'1x', '1x', 'fit'};
else
    app.ExtUI.FourMicOtherResultGrid.RowHeight = {'1x','1x','1x', '1x', 'fit'};
end
app.ExtUI.FourMicOtherResultGrid.BackgroundColor = [1 1 1];

% Create FourMicOtherResultReturnGrid
app.ExtUI.FourMicOtherResultReturnGrid = uigridlayout(app.ExtUI.FourMicOtherResultGrid);
app.ExtUI.FourMicOtherResultReturnGrid.ColumnWidth = {'1x', '0.5x', '1x'};
app.ExtUI.FourMicOtherResultReturnGrid.RowHeight = {'1x'};
app.ExtUI.FourMicOtherResultReturnGrid.Padding = [10,10,10,10];
if app.ExtVar.ImpedanceTubeFourMic.Symmetrical
    app.ExtUI.FourMicOtherResultReturnGrid.Layout.Row = 3;
else
    app.ExtUI.FourMicOtherResultReturnGrid.Layout.Row = 5;
end
app.ExtUI.FourMicOtherResultReturnGrid.Layout.Column = [1 2];
app.ExtUI.FourMicOtherResultReturnGrid.BackgroundColor = [1 1 1];

% Create FourMicOtherResultReturnButton
app.ExtUI.FourMicOtherResultReturnButton = uibutton(app.ExtUI.FourMicOtherResultReturnGrid, 'push');
app.ExtUI.FourMicOtherResultReturnButton.BackgroundColor = [1 1 1];
app.ExtUI.FourMicOtherResultReturnButton.Layout.Row = 1;
app.ExtUI.FourMicOtherResultReturnButton.Layout.Column = 2;
app.ExtUI.FourMicOtherResultReturnButton.Text = 'Return';
app.ExtUI.FourMicOtherResultReturnButton.FontWeight = 'bold';
app.ExtUI.FourMicOtherResultReturnButton.ButtonPushedFcn = {@FourMicOtherResultReturnFCN,app};

% Create FourMicOtherResultIRAxes
app.ExtUI.FourMicOtherResultIRAxes = uiaxes(app.ExtUI.FourMicOtherResultGrid);
app.ExtUI.FourMicOtherResultIRAxes.Layout.Row = 1;
app.ExtUI.FourMicOtherResultIRAxes.Layout.Column = [1 2];

if ~app.ExtVar.ImpedanceTubeFourMic.Symmetrical
    % Create FourMicOtherResultIRAxes RigidEnd
    app.ExtUI.FourMicOtherResultIRbAxes = uiaxes(app.ExtUI.FourMicOtherResultGrid);
    app.ExtUI.FourMicOtherResultIRbAxes.Layout.Row = 2;
    app.ExtUI.FourMicOtherResultIRbAxes.Layout.Column = [1 2];
end

% Create FourMicOtherResultFRAxes
app.ExtUI.FourMicOtherResultFRAxes = uiaxes(app.ExtUI.FourMicOtherResultGrid);
if app.ExtVar.ImpedanceTubeFourMic.Symmetrical
    app.ExtUI.FourMicOtherResultFRAxes.Layout.Row = 2;
else
    app.ExtUI.FourMicOtherResultFRAxes.Layout.Row = 3;
end
app.ExtUI.FourMicOtherResultFRAxes.Layout.Column = [1 2];

if ~app.ExtVar.ImpedanceTubeFourMic.Symmetrical
    % Create FourMicOtherResultFRAxes RigidEnd
    app.ExtUI.FourMicOtherResultFRbAxes = uiaxes(app.ExtUI.FourMicOtherResultGrid);
    app.ExtUI.FourMicOtherResultFRbAxes.Layout.Row = 4;
    app.ExtUI.FourMicOtherResultFRbAxes.Layout.Column = [1 2];
end

% Plot data
freq = app.ExtVar.ImpedanceTubeFourMic.FreqArray;
bands = [10,20,31.5,63,125,250,500,1000,2000,4000,8000,16000,32000];
bandstr = {'10','20','31.5','63','125','250','500','1k','2k','4k','8k','16k','32k'};

% Impulse Responses
ax = app.ExtUI.FourMicOtherResultIRAxes;
cla(ax);
IR = app.ExtVar.ImpedanceTubeFourMic.IRa;
t = (0:length(IR)-1)'/app.ExtVar.ImpedanceTubeFourMic.SampleRate;
plot(ax,t,IR./max(IR),'linewidth',1)
xlabel(ax,'Time [s]')
ylabel(ax,'Amplitude (norm)')
xlim(ax,[0,max(t)])
ylim(ax,[-1.1,1.1])
leg = legend(ax,'Input 1','Input 2','Input 3','Input 4','Location','eastoutside');
leg.NumColumns = 1;
box(ax,'on')
grid(ax,'on')
plotStyle(ax)
if app.ExtVar.ImpedanceTubeFourMic.Symmetrical
    title(ax,'Impulse response','interpreter','tex')
else
    title(ax,'Impulse response (Anechoic End)','interpreter','tex')
end

if ~app.ExtVar.ImpedanceTubeFourMic.Symmetrical
    % Impulse Responses Rigid end
    ax = app.ExtUI.FourMicOtherResultIRbAxes;
    cla(ax);
    IR = app.ExtVar.ImpedanceTubeFourMic.IRb;
    t = (0:length(IR)-1)'/app.ExtVar.ImpedanceTubeFourMic.SampleRate;
    plot(ax,t,IR./max(IR),'linewidth',1)
    xlabel(ax,'Time [s]')
    ylabel(ax,'Amplitude (norm)')
    xlim(ax,[0,max(t)])
    ylim(ax,[-1.1,1.1])
    leg = legend(ax,'Input 1','Input 2','Input 3','Input 4','Location','eastoutside');
    leg.NumColumns = 1;
    box(ax,'on')
    grid(ax,'on')
    plotStyle(ax)
    title(ax,'Impulse response (Rigid End)','interpreter','tex')
end

% Frequency Responses
ax = app.ExtUI.FourMicOtherResultFRAxes;
cla(ax);
FR = app.ExtVar.ImpedanceTubeFourMic.FRa;
semilogx(ax,freq,20*log10(abs(FR)/2e-5),'linewidth',1)
xlabel(ax,'Frequency [Hz]')
ylabel(ax,'SPL [dB] (ref. 20$\mu$Pa)')
xticks(ax,bands);xticklabels(ax,bandstr)
xlim(ax,[max([min(freq(:)),10]),30e3])
ylim(ax,[0,inf])
leg = legend(ax,'Input 1','Input 2','Input 3','Input 4','Location','eastoutside');
leg.NumColumns = 1;
box(ax,'on')
grid(ax,'on')
plotStyle(ax)
if app.ExtVar.ImpedanceTubeFourMic.Symmetrical
    title(ax,'Frequency response','interpreter','tex')
else
    title(ax,'Frequency response (Anechoic End)','interpreter','tex')
end

if ~app.ExtVar.ImpedanceTubeFourMic.Symmetrical
    % Frequency Responses (rigid end)
    ax = app.ExtUI.FourMicOtherResultFRbAxes;
    cla(ax);
    FR = app.ExtVar.ImpedanceTubeFourMic.FRb;
    semilogx(ax,freq,20*log10(abs(FR)/2e-5),'linewidth',1)
    xlabel(ax,'Frequency [Hz]')
    ylabel(ax,'SPL [dB] (ref. 20$\mu$Pa)')
    xticks(ax,bands);xticklabels(ax,bandstr)
    xlim(ax,[max([min(freq(:)),10]),30e3])
    ylim(ax,[0,inf])
    leg = legend(ax,'Input 1','Input 2','Input 3','Input 4','Location','eastoutside');
    leg.NumColumns = 1;
    box(ax,'on')
    grid(ax,'on')
    plotStyle(ax)
    title(ax,'Frequency response (Rigid End)','interpreter','tex')
end

% Close progress bar
drawnow
pause(0.5)
close(d)

function FourMicOtherResultReturnFCN(~,~,app)
CreateCenterPanelResultsFourMic(app)