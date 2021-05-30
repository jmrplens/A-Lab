function FourMicSingleResult(~,~,app,type)
% Copyright (C) Jose M. Requena Plens
% joreple@upv.es - jmrplens.github.io

% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
    'Indeterminate','on');

% Grid
column = centerGrid(app,{'1x'},{'1x'});

% Create FourMicSingleResultPanel
app.ExtUI.FourMicSingleResultPanel = uipanel(column);
app.ExtUI.FourMicSingleResultPanel.TitlePosition = 'centertop';
app.ExtUI.FourMicSingleResultPanel.Title = 'Panel';
app.ExtUI.FourMicSingleResultPanel.BackgroundColor = [1 1 1];
app.ExtUI.FourMicSingleResultPanel.Layout.Row = 1;
app.ExtUI.FourMicSingleResultPanel.Layout.Column = 1;
app.ExtUI.FourMicSingleResultPanel.FontAngle = 'italic';
app.ExtUI.FourMicSingleResultPanel.FontWeight = 'bold';

% Create FourMicSingleResultGrid
switch lower(type)
    case {'reflection','absorption'}
        app.ExtUI.FourMicSingleResultGrid = uigridlayout(app.ExtUI.FourMicSingleResultPanel);
        app.ExtUI.FourMicSingleResultGrid.RowHeight = {'1x', '1x', 'fit', '0.1x'};
        app.ExtUI.FourMicSingleResultGrid.BackgroundColor = [1 1 1];
        app.ExtUI.FourMicSingleResultAxes2 = uiaxes(app.ExtUI.FourMicSingleResultGrid);
        app.ExtUI.FourMicSingleResultAxes2.Layout.Row = 2;
        app.ExtUI.FourMicSingleResultAxes2.Layout.Column = [1 2];
        Pos = 2;
    otherwise
        app.ExtUI.FourMicSingleResultGrid = uigridlayout(app.ExtUI.FourMicSingleResultPanel);
        app.ExtUI.FourMicSingleResultGrid.RowHeight = {'1x', 'fit', 'fit','1x'};
        app.ExtUI.FourMicSingleResultGrid.BackgroundColor = [1 1 1];
        Pos = 1;
end

% Create FourMicSingleResultExportresulttxtButton
app.ExtUI.FourMicSingleResultExportresulttxtButton = uibutton(app.ExtUI.FourMicSingleResultGrid, 'push');
app.ExtUI.FourMicSingleResultExportresulttxtButton.WordWrap = 'on';
app.ExtUI.FourMicSingleResultExportresulttxtButton.BackgroundColor = [1 1 1];
app.ExtUI.FourMicSingleResultExportresulttxtButton.Layout.Row = Pos+1;
app.ExtUI.FourMicSingleResultExportresulttxtButton.Layout.Column = 1;
app.ExtUI.FourMicSingleResultExportresulttxtButton.FontWeight = 'bold';
app.ExtUI.FourMicSingleResultExportresulttxtButton.Text = 'Export result (.txt)';
app.ExtUI.FourMicSingleResultExportresulttxtButton.ButtonPushedFcn = {@FourMicSingleExportResult,app};

% Create FourMicSingleResultExportgraphicButton
app.ExtUI.FourMicSingleResultExportgraphicButton = uibutton(app.ExtUI.FourMicSingleResultGrid, 'push');
app.ExtUI.FourMicSingleResultExportgraphicButton.WordWrap = 'on';
app.ExtUI.FourMicSingleResultExportgraphicButton.BackgroundColor = [1 1 1];
app.ExtUI.FourMicSingleResultExportgraphicButton.Layout.Row = Pos+1;
app.ExtUI.FourMicSingleResultExportgraphicButton.Layout.Column = 2;
app.ExtUI.FourMicSingleResultExportgraphicButton.FontWeight = 'bold';
app.ExtUI.FourMicSingleResultExportgraphicButton.Text = 'Export graphic';

app.ExtUI.FourMicSingleResultExportgraphicButton.ButtonPushedFcn = {@FourMicSingleExportGraphic,app};

% Create ReturnButtonGrid
app.ExtUI.FourMicSingleResultReturnButtonGrid = uigridlayout(app.ExtUI.FourMicSingleResultGrid);
app.ExtUI.FourMicSingleResultReturnButtonGrid.ColumnWidth = {'1x', '0.5x', '1x'};
app.ExtUI.FourMicSingleResultReturnButtonGrid.RowHeight = {'1x'};
app.ExtUI.FourMicSingleResultReturnButtonGrid.Padding = [0 0 0 0];
app.ExtUI.FourMicSingleResultReturnButtonGrid.Layout.Row = Pos+2;
app.ExtUI.FourMicSingleResultReturnButtonGrid.Layout.Column = [1 2];
app.ExtUI.FourMicSingleResultReturnButtonGrid.BackgroundColor = [1 1 1];

% Create ReturnButton
app.ExtUI.FourMicSingleResultReturnButton = uibutton(app.ExtUI.FourMicSingleResultReturnButtonGrid, 'push');
app.ExtUI.FourMicSingleResultReturnButton.BackgroundColor = [1 1 1];
app.ExtUI.FourMicSingleResultReturnButton.Layout.Row = 1;
app.ExtUI.FourMicSingleResultReturnButton.Layout.Column = 2;
app.ExtUI.FourMicSingleResultReturnButton.Text = 'Return';
app.ExtUI.FourMicSingleResultReturnButton.FontWeight = 'bold';
app.ExtUI.FourMicSingleResultReturnButton.ButtonPushedFcn = {@FourMicSingleReturnFCN,app};

% Create FourMicSingleResultAxes
app.ExtUI.FourMicSingleResultAxes = uiaxes(app.ExtUI.FourMicSingleResultGrid);
app.ExtUI.FourMicSingleResultAxes.Layout.Row = 1;
app.ExtUI.FourMicSingleResultAxes.Layout.Column = [1 2];

% Plot selected result
ax = app.ExtUI.FourMicSingleResultAxes;
cla(ax);
freq = app.ExtVar.ImpedanceTubeFourMic.FreqArray;
freqMin = app.ExtVar.ImpedanceTubeFourMic.FreqMin;
freqMax = app.ExtVar.ImpedanceTubeFourMic.FreqMax;
idx1 = find(freq>=freqMin,1,'first');
idx2 = find(freq>=freqMax,1,'first');

switch lower(type)
    case 'transmission_loss'
        app.ExtUI.FourMicSingleResultPanel.Title = 'Transmission Loss';
        TL = app.ExtVar.ImpedanceTubeFourMic.TLoss;
        plot(ax,freq,real(TL),'k-','linewidth',1)
        ylabel(ax,'TL [dB]')
        up = max(real(TL(idx1:idx2)));
        ylim(ax,[0,up])
    case 'impedance'
        app.ExtUI.FourMicSingleResultPanel.Title = 'Characteristic Impedance';
        Z = app.ExtVar.ImpedanceTubeFourMic.Impedance;
        yyaxis(ax,'left')
        plot(ax,freq,abs(Z),'k-','linewidth',1)
        ylabel(ax,'$|Z|$')
        up = max(abs(Z(idx1:idx2)));
        ylim(ax,[0,up])
        yyaxis(ax,'right')
        plot(ax,freq,angle(Z)/pi,'k:','linewidth',1)
        ylabel(ax,'$\phi_Z/\pi$')
        ylim(ax,[-1.10,1.10])
        leg = legend(ax,'$|Z|$','$\phi_Z/\pi$','Location','northoutside');
        leg.NumColumns = 2;
    case 'transmission'
        app.ExtUI.FourMicSingleResultPanel.Title = 'Transmission';
        t = app.ExtVar.ImpedanceTubeFourMic.Transmission;
        yyaxis(ax,'left')
        plot(ax,freq,abs(t),'k-','linewidth',1)
        ylabel(ax,'$|T|$')
        ylim(ax,[-0.05,1.05])
        yyaxis(ax,'right')
        plot(ax,freq,angle(t)/pi,'k:','linewidth',1)
        ylabel(ax,'$\phi_T/\pi$')
        ylim(ax,[-1.10,1.10])
        leg = legend(ax,'$|T|$','$\phi_T/\pi$','Location','northoutside');
        leg.NumColumns = 2;
    case 'reflection'
        app.ExtUI.FourMicSingleResultPanel.Title = 'Reflection';
        Rrigid = app.ExtVar.ImpedanceTubeFourMic.ReflectionRigid;
        Ranechoic = app.ExtVar.ImpedanceTubeFourMic.ReflectionAnechoic;
        % Hard backed
        yyaxis(ax,'left')
        plot(ax,freq,abs(Rrigid),'k-','linewidth',1)
        ylabel(ax,'$|R|$')
        ylim(ax,[-0.05,1.05])
        yyaxis(ax,'right')
        plot(ax,freq,angle(Rrigid)/pi,'k:','linewidth',1)
        ylabel(ax,'$\phi_R/\pi$')
        ylim(ax,[-1.10,1.10])
        leg = legend(ax,'$|R|$','$\phi_R/\pi$','Location','northoutside');
        leg.NumColumns = 2;
        title(ax,'Reflection - Hard-Backed (ASTM 2611)')
        % Anechoic backed
        ax2 = app.ExtUI.FourMicSingleResultAxes2;
        cla(ax2);
        yyaxis(ax2,'left')
        plot(ax2,freq,abs(Ranechoic),'k-','linewidth',1)
        ylabel(ax2,'$|R|$')
        ylim(ax2,[-0.05,1.05])
        yyaxis(ax2,'right')
        plot(ax2,freq,angle(Ranechoic)/pi,'k:','linewidth',1)
        ylabel(ax2,'$\phi_R/\pi$')
        ylim(ax2,[-1.10,1.10])
        leg = legend(ax2,'$|R|$','$\phi_R/\pi$','Location','northoutside');
        leg.NumColumns = 2;
        title(ax2,'Reflection - Anechoic-Backed')
    case 'absorption'
        app.ExtUI.FourMicSingleResultPanel.Title = 'Absorption';
        alphaRigid = app.ExtVar.ImpedanceTubeFourMic.AbsorptionRigid;
        alphaAnechoic = app.ExtVar.ImpedanceTubeFourMic.AbsorptionAnechoic;
        plot(ax,freq,alphaRigid,'k-','linewidth',1)
        ylabel(ax,'$\alpha$')
        ylim(ax,[-0.05,1.05])
        title(ax,'Absorption - Hard-Backed (ASTM 2611)')
        ax2 = app.ExtUI.FourMicSingleResultAxes2;
        cla(ax2);
        plot(ax2,freq,alphaAnechoic,'k-','linewidth',1)
        ylabel(ax2,'$\alpha$')
        ylim(ax2,[-0.05,1.05])
        title(ax2,'Absorption - Anechoic-Backed')
    case 'wavenumber'
        app.ExtUI.FourMicSingleResultPanel.Title = 'Propagation Wavenumber';
        kp = app.ExtVar.ImpedanceTubeFourMic.PropWave;
        yyaxis(ax,'left')
        plot(ax,freq,abs(kp),'k-','linewidth',1)
        ylabel(ax,'$|k_p|$ [rad/m]')
        up = max(abs(kp(idx1:idx2)));
        ylim(ax,[0,up])
        yyaxis(ax,'right')
        plot(ax,freq,angle(kp)/pi,'k:','linewidth',1)
        ylabel(ax,'$\phi_{k_p}/\pi$')
        ylim(ax,[-1.10,1.10])
        leg = legend(ax,'$|k_p|$','$\phi_{k_p}/\pi$','Location','northoutside');
        leg.NumColumns = 2;
end
xlim(ax,[freqMin,freqMax])
xlabel(ax,'Frequency [Hz]')
box(ax,'on')
grid(ax,'on')
plotStyle(ax)

switch lower(type)
    case {'reflection','absorption'}
        xlim(ax2,[freqMin,freqMax])
        xlabel(ax2,'Frequency [Hz]')
        box(ax2,'on')
        grid(ax2,'on')
        plotStyle(ax2)
end

% Close progress bar

pause(0.5)
close(d)


function FourMicSingleReturnFCN(~,~,app)
CreateCenterPanelResultsFourMic(app)

function FourMicSingleExportGraphic(~,~,app)

if isfield(app.ExtUI,'FourMicSingleResultAxes2')
    if isvalid(app.ExtUI.FourMicSingleResultAxes2)
        
        msg = 'What parameter do you want to export?';
        title = 'Export graphic';
        selection = uiconfirm(app.ALabUIFigure,msg,title,...
            'Options',{'Hard-Backed','Anechoic-Backed','Cancel'},...
            'DefaultOption',3,'CancelOption',3);
        
        % If cancel, return
        if strcmp(selection,'Cancel'); return; end
        
        % Loading info
        d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
            'Indeterminate','on');
        
        name = app.ExtUI.FourMicSingleResultPanel.Title;
        switch selection
            case 'Hard-Backed'
                axes = app.ExtUI.FourMicSingleResultAxes;
                exportPlot(axes,[name,' - Hard-Backed'])
            case 'Anechoic-Backed'
                axes2 = app.ExtUI.FourMicSingleResultAxes2;
                exportPlot(axes2,[name,' - Anechoic-Backed'])
        end
        close(d)
    end
else
    % Loading info
    d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
        'Indeterminate','on');
    
    name = app.ExtUI.FourMicSingleResultPanel.Title;
    axes = app.ExtUI.FourMicSingleResultAxes;
    exportPlot(axes,name)
    
    close(d)
end


function FourMicSingleExportResult(~,~,app)
paramX = app.ExtVar.ImpedanceTubeFourMic.FreqArray;

switch app.ExtUI.FourMicSingleResultPanel.Title
    case 'Transmission Loss'
        % Transmission Loss
        paramY = app.ExtVar.ImpedanceTubeFourMic.TLoss;
        T = table(paramX(:),paramY(:),'VariableNames',{'Frequency','TLoss'});
        
    case 'Characteristic Impedance'
        % Impedance
        paramY = app.ExtVar.ImpedanceTubeFourMic.Impedance;
        T = table(paramX(:),paramY(:),'VariableNames',{'Frequency','Impedance'});
        
    case 'Transmission'
        % Transmission
        paramY = app.ExtVar.ImpedanceTubeFourMic.Transmission;
        T = table(paramX(:),paramY(:),'VariableNames',{'Frequency','Transmission'});
        
    case 'Reflection'
        % Reflection
        paramYRigid = app.ExtVar.ImpedanceTubeFourMic.ReflectionRigid;
        paramYAnechoic = app.ExtVar.ImpedanceTubeFourMic.ReflectionAnechoic;
        T = table(paramX(:),paramYRigid(:),paramYAnechoic(:),'VariableNames',{'Frequency','Reflection Hard-Backed','Reflection Anechoic-Backed'});
        
    case 'Absorption'
        % Absorption
        paramYRigid = app.ExtVar.ImpedanceTubeFourMic.AbsorptionRigid;
        paramYAnechoic = app.ExtVar.ImpedanceTubeFourMic.AbsorptionAnechoic;
        T = table(paramX(:),paramYRigid(:),paramYAnechoic(:),'VariableNames',{'Frequency','Absorption Hard-Backed','Absorption Anechoic-Backed'});
        
    case 'Propagation Wavenumber'
        % Propagation WaveNumber
        paramY = app.ExtVar.ImpedanceTubeFourMic.PropWave;
        T = table(paramX(:),paramY(:),'VariableNames',{'Frequency','WaveNumber'});
        
end

[filename, pathname, ~] = uiputfile( ...
    {'*.txt', 'Tabulated data (.txt)'},...
    'Export parameter',[userpath,app.ExtUI.FourMicSingleResultPanel.Title]);
if filename ~= 0
    
    % Update userpath
    userpath(pathname);
    
    writetable(T,[pathname,filename],'Delimiter','\t')
end