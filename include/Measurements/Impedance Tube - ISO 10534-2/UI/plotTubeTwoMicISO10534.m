function plotTubeTwoMicISO10534(app,ax,mic1,mic2,sample,dimensions,axisshow,zones)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

cla(ax,'reset')
% ===============================================
% Parameters
d = app.ExtVar.ImpedanceTubeTwoMic.d;
dsample = 0.03;
x1 = app.ExtVar.ImpedanceTubeTwoMic.x1;
s  = app.ExtVar.ImpedanceTubeTwoMic.s;

% ===============================================
% General size
measurezoneL = d*2;
sizeaux = 0.13*d;
sizespeaker = measurezoneL*0.1;
measurezoneR = x1+dsample;

% Colors
tubec = [0.3,0.3,0.3];
micsedge = [0,0,0]; % Microphones
micsface = [0.6,0.6,0.6];
speakerccoil = [0,0,0];
speakercmem = [0.6,0.6,0.6];
speakeredge = [0,0,0];
rigidedge = [0,0,0];
rigidface = [0,0,0];
colorOK = [0.2,0.7,0.2];

% ===============================================
% Plot

% Sample
fill(ax,[0,dsample,dsample,0,0]+x1,[0,0,d,d,0],[0.7255,0.5765,0.3529]+0.2,'EdgeColor','none')
hold(ax,'on')

% Tube
plot(ax,[-measurezoneL,measurezoneR,measurezoneR,-measurezoneL,-measurezoneL],[0,0,d,d,0],'Color',tubec,'linewidth',2)

% End tube
fill(ax,[sizespeaker,0,0,sizespeaker,sizespeaker]+measurezoneR,[0,0,d,d,0],rigidface,'EdgeColor',rigidedge,'linewidth',2)

% Speaker
fill(ax,[-sizespeaker,0,0,-sizespeaker,-sizespeaker]-measurezoneL,...
    [d*0.3,0,d,d*0.7,d*0.3],speakercmem,'EdgeColor',speakeredge,'linewidth',1)
fill(ax,[-sizespeaker*1.5,-sizespeaker,-sizespeaker,-sizespeaker*1.5,-sizespeaker*1.5]-measurezoneL,...
    [d*0.3,d*0.3,d*0.7,d*0.7,d*0.3],speakerccoil,'linewidth',1)

% Mic 1
fill(ax,[-sizeaux/2,sizeaux/2,sizeaux/2,-sizeaux/2,-sizeaux/2],[0,0,sizeaux*3,sizeaux*3,0]+d,micsface,'EdgeColor',micsedge,'linewidth',1)
text(ax,0,sizeaux*3+d,mic1,'VerticalAlignment','bottom','HorizontalAlignment','center','FontWeight','bold')
% Mic 2
fill(ax,[-sizeaux/2,sizeaux/2,sizeaux/2,-sizeaux/2,-sizeaux/2]+s,[0,0,sizeaux*3,sizeaux*3,0]+d,micsface,'EdgeColor',micsedge,'linewidth',1)
text(ax,s,sizeaux*3+d,mic2,'VerticalAlignment','bottom','HorizontalAlignment','center','FontWeight','bold')

if dimensions
    % Dimensioning
    % x1
    plot(ax,[0,x1],[d,d]*0.4,'r','linewidth',1) % Hor
    plot(ax,[0,0],[-sizeaux,sizeaux]*1.1+d*0.4,'r','linewidth',1) % Vert L
    plot(ax,[x1,x1],[-sizeaux,sizeaux]*1.1+d*0.4,'r','linewidth',1) % Vert R
    text(ax,x1/2,d*0.4,'x_1','VerticalAlignment','top','HorizontalAlignment','center','FontWeight','bold')
    % S
    plot(ax,[0,s],[d,d]*0.82,'r','linewidth',1) % Hor
    plot(ax,[0,0],[-sizeaux,sizeaux]*1.1+d*0.82,'r','linewidth',1) % Vert L
    plot(ax,[s,s],[-sizeaux,sizeaux]*1.1+d*0.82,'r','linewidth',1) % Vert R
    text(ax,s/2,d*0.82,'s','VerticalAlignment','top','HorizontalAlignment','center','FontWeight','bold')
    % d
    plot(ax,[measurezoneR,measurezoneR]+sizespeaker*1.6,[0,d],'r','linewidth',1) % Vert
    plot(ax,[-sizeaux,sizeaux]*1.1+measurezoneR+sizespeaker*1.6,[d,d],'r','linewidth',1) % Hor Up
    plot(ax,[-sizeaux,sizeaux]*1.1+measurezoneR+sizespeaker*1.6,[0,0],'r','linewidth',1) % Hor Down
    text(ax,measurezoneR+sizespeaker*1.75,d*0.5,'d','HorizontalAlignment','left','FontWeight','bold')
end

% Zones
if ~isempty(zones)
    % Upstream (Speaker to mic 1)
    if sum(zones==1)
        fill(ax,[-sizeaux/2,sizeaux/2,sizeaux/2,-sizeaux/2,-sizeaux/2],[0,0,sizeaux*3,sizeaux*3,0]+d,colorOK,'EdgeColor','none','FaceAlpha',0.5)
        text(ax,0,sizeaux*3+d,mic1,'VerticalAlignment','bottom','HorizontalAlignment','center','FontWeight','bold','Color',colorOK)
        fill(ax,[-measurezoneL,s/2,s/2,-measurezoneL,-measurezoneL],[0,0,d,d,0],colorOK,'EdgeColor','none','FaceAlpha',0.3)
    end
    % Upstream (mic 1 to sample)
    if sum(zones==2)
        fill(ax,[-sizeaux/2,sizeaux/2,sizeaux/2,-sizeaux/2,-sizeaux/2]+s,[0,0,sizeaux*3,sizeaux*3,0]+d,colorOK,'EdgeColor','none','FaceAlpha',0.5)
        text(ax,s,sizeaux*3+d,mic2,'VerticalAlignment','bottom','HorizontalAlignment','center','FontWeight','bold','Color',colorOK)
        fill(ax,[s/2,x1,x1,s/2,s/2],[0,0,d,d,0],colorOK,'EdgeColor','none','FaceAlpha',0.3)
    end
end

ht=findobj(ax,'type','text'); % Get all text
set(ht,'fontsize',13);
set(ax,'fontsize',10)

% Sample text
text(ax,x1+dsample/2,d/2,sample,...
    'VerticalAlignment','middle','HorizontalAlignment','center','FontWeight','bold',...
    'Rotation',90,'FontSize',8)

hold(ax,'off')
axis(ax,'tight')
axis(ax,'equal')
grid(ax,'on')
box(ax,'off')
ylim(ax,[-d/2,d*2])
xlim(ax,[-measurezoneL-sizespeaker*2,measurezoneR+sizespeaker*3])
ax.YAxisLocation = 'right';

% Clean negative ticks and outliers
ax.XTick = ax.XTick(ax.XTick>=0 & single(ax.XTick)<=single(x1));
ax.YTick = ax.YTick(ax.YTick>=0 & single(ax.YTick)<=single(d));

if ~axisshow
    axis(ax,'off')
end