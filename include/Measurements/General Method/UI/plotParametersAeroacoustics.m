function plotParametersAeroacoustics(app)

% AXES
IRax = app.ExtUI.AeroacousticsImpulseResponseAxes;
FRax = app.ExtUI.AeroacousticsFrequencyResponseAxes;
SPLax = app.ExtUI.AeroacousticsSoundPressureLevelAxes;
cla(IRax,'reset')
cla(FRax,'reset')
cla(SPLax,'reset')

% Channels
ch = app.ExtVar.Aeroacoustics.InputChannels;
%ch = [1,5];
nch = numel(ch);

% Impulse response
t = app.ExtVar.Aeroacoustics.IRt;
ir = app.ExtVar.Aeroacoustics.IRamp./max(abs(app.ExtVar.Aeroacoustics.IRamp));
plot(IRax,t,ir)
xline(IRax,0,'k','linewidth',1)
grid(IRax,'on')
ylim(IRax,[-1.1,1.1])
xlim(IRax,[-0.01,max(t(:))])
xlabel(IRax,'Time [s]');ylabel(IRax,'Amplitude [normalized]')
title(IRax,[])
box(IRax,'on')
strleg = strings(nch,1);
for i=1:nch 
    strleg(i) = sprintf('Input %d',ch(i));
end
leg = legend(IRax,strleg,'Location','northoutside');
leg.NumColumns = 6;
plotStyle(IRax)

% Frequency response
H = app.ExtVar.Aeroacoustics.FRh;
F = app.ExtVar.Aeroacoustics.FRf;
P = app.ExtVar.Aeroacoustics.FRph;
colors = lines(nch);
yyaxis(FRax,'left'); set(FRax,'YColor','k');
hold(FRax,'on')
for i=1:nch
plot(FRax,F,20*log10(abs(H(:,i))),'-','Color',colors(i,:),'Linewidth',1);
end
ylabel(FRax,'PSD [dB/Hz]')

yyaxis(FRax,'right'); set(FRax,'YColor','k');
for i=1:nch
plot(FRax,F, P(:,i),':','Color',[colors(i,:),0.5],'Linewidth',1);
end
ylim(FRax,[-180,180])
yticks(FRax,[-180,-90,0,90,180]);xticklabels(FRax,num2cell([-180,-90,0,90,180]))
ylabel(FRax,'Phase [deg]')
bands =[16,31.5,63,125,250,500,1000,2000,4000,8000,16000,32000];
xticks(FRax,bands);xticklabels(FRax,num2cell(bands))
xlabel(FRax,'Frequency [Hz]')
title(FRax,[])
box(FRax,'on'); grid(FRax,'on')
xlim(FRax,[min(F(2:end)),max(F(:))])
set(FRax,'XScale','log')
leg = legend(FRax,strleg,'Location','northoutside');
leg.NumColumns = 6;

plotStyle(FRax)

% Sound pressure level
Lt = app.ExtVar.Aeroacoustics.SPLlt;
Leq = app.ExtVar.Aeroacoustics.SPLleq;
Lpeak = app.ExtVar.Aeroacoustics.SPLlpeak;
Lmax = app.ExtVar.Aeroacoustics.SPLlmax;
F2 = app.ExtVar.Aeroacoustics.SPLf;
if ~isempty(app.ExtVar.Aeroacoustics.SPLf)
    % If the duration of the signal is less than the integration time interval, only L_t is displayed
    if app.ExtVar.Aeroacoustics.SPLtint > length(app.ExtVar.Aeroacoustics.Output)/app.ExtVar.Aeroacoustics.SampleRate
        semilogx(SPLax,F2,Lt,'Linewidth',1);
        leg = legend(SPLax,'$L_\mathrm{t}$');
    else
        semilogx(SPLax,F2,Lt,'Linewidth',1);
        hold(SPLax,'on')
        semilogx(SPLax,F2,Leq,'Linewidth',1);
        semilogx(SPLax,F2,Lpeak,'Linewidth',1);
        semilogx(SPLax,F2,Lmax,'Linewidth',1);
        hold(SPLax,'off')
        leg = legend(SPLax,'$L_\mathrm{t}$','$L_\mathrm{eq}$','$L_\mathrm{peak}$','$L_\mathrm{max}$');
        leg.NumColumns = 4;
    end
    bands =[16,31.5,63,125,250,500,1000,2000,4000,8000,16000,32000];
    xticks(SPLax,bands);xticklabels(SPLax,num2cell(bands))
    xlabel(SPLax,'Frequency [Hz]')
    leg.Location = 'northoutside';
    xlim(SPLax,[min(F(2:end)),max(F(:))])
    
else
    % If the duration of the signal is less than the integration time interval, only L_t is displayed
    if app.ExtVar.Aeroacoustics.SPLtint > length(app.ExtVar.Aeroacoustics.Output)/app.ExtVar.Aeroacoustics.SampleRate
        X = categorical({'$L_\mathrm{t}$'});
        b = bar(SPLax,X, Lt);
    else
        X = categorical({'$L_\mathrm{t}$','$L_\mathrm{eq}$','$L_\mathrm{peak}$','$L_\mathrm{max}$'});
        X = reordercats(X,{'$L_\mathrm{t}$','$L_\mathrm{eq}$','$L_\mathrm{peak}$','$L_\mathrm{max}$'});
        b = bar(SPLax,X, [Lt',Leq',Lpeak',Lmax']);
    end
    
    strleg = strings(nch,1);
    for i=1:nch
        xtips1 = b(i).XEndPoints;
        ytips1 = b(i).YEndPoints;
        labels1 = string(round(b(i).YData,1));
        text(SPLax,xtips1,ytips1,labels1,'HorizontalAlignment','center',...
            'VerticalAlignment','bottom')
        strleg(i) = sprintf('Input %d',ch(i));
    end
    legend(SPLax,strleg,'Location','northeastoutside')
end
ylabel(SPLax,'Sound Pressure Level [dB]')
title(SPLax,[])
grid(SPLax,'on')
box(SPLax,'on')
plotStyle(SPLax)
