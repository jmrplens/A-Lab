function TwoMicOtherResults(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
    'Indeterminate','on');

% Grid
column = centerGrid(app,{'1x'},{'1x'});

% Create TwoMicOtherResultPanel
app.ExtUI.TwoMicOtherResultPanel = uipanel(column);
app.ExtUI.TwoMicOtherResultPanel.TitlePosition = 'centertop';
app.ExtUI.TwoMicOtherResultPanel.Title = 'Impulse and Frequency Response';
app.ExtUI.TwoMicOtherResultPanel.BackgroundColor = [1 1 1];
app.ExtUI.TwoMicOtherResultPanel.Layout.Row = 1;
app.ExtUI.TwoMicOtherResultPanel.Layout.Column = 1;
app.ExtUI.TwoMicOtherResultPanel.FontAngle = 'italic';
app.ExtUI.TwoMicOtherResultPanel.FontWeight = 'bold';

% Create TwoMicOtherResultGrid
app.ExtUI.TwoMicOtherResultGrid = uigridlayout(app.ExtUI.TwoMicOtherResultPanel);
app.ExtUI.TwoMicOtherResultGrid.RowHeight = {'1x', '1x', 'fit'};
app.ExtUI.TwoMicOtherResultGrid.BackgroundColor = [1 1 1];

% Create TwoMicOtherResultFRAxes
app.ExtUI.TwoMicOtherResultFRAxes = uiaxes(app.ExtUI.TwoMicOtherResultGrid);
app.ExtUI.TwoMicOtherResultFRAxes.Layout.Row = 2;
app.ExtUI.TwoMicOtherResultFRAxes.Layout.Column = [1 2];

% Create TwoMicOtherResultIRAxes
app.ExtUI.TwoMicOtherResultIRAxes = uiaxes(app.ExtUI.TwoMicOtherResultGrid);
app.ExtUI.TwoMicOtherResultIRAxes.Layout.Row = 1;
app.ExtUI.TwoMicOtherResultIRAxes.Layout.Column = [1 2];

% Create TwoMicOtherResultReturnGrid
app.ExtUI.TwoMicOtherResultReturnGrid = uigridlayout(app.ExtUI.TwoMicOtherResultGrid);
app.ExtUI.TwoMicOtherResultReturnGrid.ColumnWidth = {'1x', '0.8x', '0.9x', '0.8x', '1x'};
app.ExtUI.TwoMicOtherResultReturnGrid.RowHeight = {'1x'};
app.ExtUI.TwoMicOtherResultReturnGrid.Padding = [0 0 0 0];
app.ExtUI.TwoMicOtherResultReturnGrid.Layout.Row = 3;
app.ExtUI.TwoMicOtherResultReturnGrid.Layout.Column = [1 2];
app.ExtUI.TwoMicOtherResultReturnGrid.BackgroundColor = [1 1 1];

% Create TwoMicOtherResultReturnButton
app.ExtUI.TwoMicOtherResultReturnButton = uibutton(app.ExtUI.TwoMicOtherResultReturnGrid, 'push');
app.ExtUI.TwoMicOtherResultReturnButton.BackgroundColor = [1 1 1];
app.ExtUI.TwoMicOtherResultReturnButton.FontWeight = 'bold';
app.ExtUI.TwoMicOtherResultReturnButton.Layout.Row = 1;
app.ExtUI.TwoMicOtherResultReturnButton.Layout.Column = 4;
app.ExtUI.TwoMicOtherResultReturnButton.Text = 'Return';
app.ExtUI.TwoMicOtherResultReturnButton.ButtonPushedFcn = {@TwoMicOtherReturnButton,app};

% Create TwoMicOtherResultExportDataButton
app.ExtUI.TwoMicOtherResultExportDataButton = uibutton(app.ExtUI.TwoMicOtherResultReturnGrid, 'push');
app.ExtUI.TwoMicOtherResultExportDataButton.BackgroundColor = [1 1 1];
app.ExtUI.TwoMicOtherResultExportDataButton.FontWeight = 'bold';
app.ExtUI.TwoMicOtherResultExportDataButton.Layout.Row = 1;
app.ExtUI.TwoMicOtherResultExportDataButton.Layout.Column = 2;
app.ExtUI.TwoMicOtherResultExportDataButton.Text = 'Export data';
app.ExtUI.TwoMicOtherResultExportDataButton.ButtonPushedFcn = {@TwoMicOtherExportButton,app};

% Create TwoMicOtherResultExportGraphicButton
app.ExtUI.TwoMicOtherResultExportGraphicButton = uibutton(app.ExtUI.TwoMicOtherResultReturnGrid, 'push');
app.ExtUI.TwoMicOtherResultExportGraphicButton.BackgroundColor = [1 1 1];
app.ExtUI.TwoMicOtherResultExportGraphicButton.FontWeight = 'bold';
app.ExtUI.TwoMicOtherResultExportGraphicButton.Layout.Row = 1;
app.ExtUI.TwoMicOtherResultExportGraphicButton.Layout.Column = 3;
app.ExtUI.TwoMicOtherResultExportGraphicButton.Text = 'Export graphic';
app.ExtUI.TwoMicOtherResultExportGraphicButton.ButtonPushedFcn = {@TwoMicOtherExportGraphicButton,app};


% Plot data
freq = app.ExtVar.ImpedanceTubeTwoMic.FreqArray;
bands = [10,20,31.5,63,125,250,500,1000,2000,4000,8000,16000];
bandstr = {'10','20','31.5','63','125','250','500','1k','2k','4k','8k','16k'};

% Impulse Responses
ax = app.ExtUI.TwoMicOtherResultIRAxes;
cla(ax);
IR = [app.ExtVar.ImpedanceTubeTwoMic.IR1,app.ExtVar.ImpedanceTubeTwoMic.IR2];
t = (0:length(IR)-1)'/app.ExtVar.ImpedanceTubeTwoMic.SampleRate;
plot(ax,t,IR./max(IR),'linewidth',1)
xlabel(ax,'Time [s]')
ylabel(ax,'Amplitude (norm)')
xlim(ax,[0,max(t)])
ylim(ax,[-1.1,1.1])
leg = legend(ax,'Input 1','Input 2','Location','eastoutside');
leg.NumColumns = 1;
box(ax,'on')
grid(ax,'on')
title(ax,'Impulse response')
plotStyle(ax)

% Frequency Responses
ax = app.ExtUI.TwoMicOtherResultFRAxes;
cla(ax);
FR = [app.ExtVar.ImpedanceTubeTwoMic.FR1,app.ExtVar.ImpedanceTubeTwoMic.FR2];
semilogx(ax,freq,20*log10(abs(FR)/2e-5),'linewidth',1)
xlabel(ax,'Frequency [Hz]')
ylabel(ax,'SPL [dB]')
xticks(ax,bands);xticklabels(ax,bandstr)
xlim(ax,[max([min(freq(:)),10]),max(freq(:))])
ylim(ax,[0,inf])
leg = legend(ax,'Input 1','Input 2','Location','eastoutside');
leg.NumColumns = 1;
box(ax,'on')
grid(ax,'on')
title(ax,'Frequency response')
plotStyle(ax)

% Close progress bar
drawnow
pause(0.5)
close(d)

function TwoMicOtherExportButton(~,~,app)

msg = 'What parameter do you want to export?';
title = 'Export data';
selection = uiconfirm(app.ALabUIFigure,msg,title,...
    'Options',{'Impulse Response','Frequency Response','Cancel'},...
    'DefaultOption',3,'CancelOption',3);

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
    
    switch selection
        case 'Impulse Response'
            IR1 = app.ExtVar.ImpedanceTubeTwoMic.IR1;
            IR2 = app.ExtVar.ImpedanceTubeTwoMic.IR2;
            t = (0:length(IR1)-1)'/app.ExtVar.ImpedanceTubeTwoMic.SampleRate;
            T = table(t(:),IR1(:),IR2(:),'VariableNames',{'Time','IR1','IR2'});
        case 'Frequency Response'
            FR1 = app.ExtVar.ImpedanceTubeTwoMic.FR1;
            FR2 = app.ExtVar.ImpedanceTubeTwoMic.FR2;
            freq = app.ExtVar.ImpedanceTubeTwoMic.FreqArray;
            T = table(freq(:),FR1(:),FR2(:),'VariableNames',{'Frequency','FR1','FR2'});
    end
    
    % To file
    writetable(T,[path,file],'Delimiter','\t')
    
    % Close progress bar
    pause(0.5)
    close(d)
end

function TwoMicOtherExportGraphicButton(~,~,app)

msg = 'What parameter do you want to export?';
title = 'Export graphic';
selection = uiconfirm(app.ALabUIFigure,msg,title,...
    'Options',{'Impulse Response','Frequency Response','Cancel'},...
    'DefaultOption',3,'CancelOption',3);

% If cancel, return
if strcmp(selection,'Cancel'); return; end

% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
    'Indeterminate','on');

switch selection
    case 'Impulse Response'
        axes = app.ExtUI.TwoMicOtherResultIRAxes;
    case 'Frequency Response'
        axes = app.ExtUI.TwoMicOtherResultFRAxes;
end

exportPlot(axes,selection)

% Close progress bar
pause(0.5)
close(d)

function TwoMicOtherReturnButton(~,~,app)
CreateCenterPanelResultsTwoMic(app)