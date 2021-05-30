function plotTubeFourMicASTM2611(app,ax,mic1,mic2,mic3,mic4,dimensions,rigid,axisshow,zones)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

cla(ax)
% ===============================================
% Parameters
t = app.ExtVar.ImpedanceTubeFourMic.t;
d = app.ExtVar.ImpedanceTubeFourMic.d;
l1 = app.ExtVar.ImpedanceTubeFourMic.l1;
l2 = app.ExtVar.ImpedanceTubeFourMic.l2;
s1  = app.ExtVar.ImpedanceTubeFourMic.s1;
s2  = app.ExtVar.ImpedanceTubeFourMic.s2;

% ===============================================
% General size
measurezoneR = (l2+s2+min(s1,s2)*0.5);
measurezoneL = (l1+s1+min(s1,s2)*0.5);
sizeaux = 0.15*t;
sizespeaker = measurezoneL*0.1;

% Colors
tubec = [0.3,0.3,0.3];
micsedge = [0,0,0]; % Microphones
micsface = [0.6,0.6,0.6];
speakerccoil = [0,0,0];
speakercmem = [0.6,0.6,0.6];
speakeredge = [0,0,0];
rigidedge = [0,0,0];
rigidface = [0,0,0];
anechface = [0.5,0.5,0.7];
colorOK = [0.2,0.7,0.2];

% ===============================================
% Plot

% Sample
if d>0
    fill(ax,[0,d,d,0,0],[0,0,t,t,0],[0.7255,0.5765,0.3529]+0.2,'EdgeColor','none')
end
hold(ax,'on')

% Tube
if rigid
    plot(ax,[-measurezoneL,measurezoneR,measurezoneR,-measurezoneL,-measurezoneL],[0,0,t,t,0],'Color',tubec,'linewidth',2)
else
    plot(ax,[-measurezoneL,measurezoneR+sizespeaker,measurezoneR+sizespeaker,-measurezoneL,-measurezoneL],[0,0,t,t,0],'Color',tubec,'linewidth',2)
end

% Speaker
fill(ax,[-sizespeaker,0,0,-sizespeaker,-sizespeaker]-measurezoneL,...
    [t*0.3,0,t,t*0.7,t*0.3],speakercmem,'EdgeColor',speakeredge,'linewidth',1)
fill(ax,[-sizespeaker*1.5,-sizespeaker,-sizespeaker,-sizespeaker*1.5,-sizespeaker*1.5]-measurezoneL,...
    [t*0.3,t*0.3,t*0.7,t*0.7,t*0.3],speakerccoil,'linewidth',1)

% End tube
if rigid
    % Rigid end
    fill(ax,[sizespeaker,0,0,sizespeaker,sizespeaker]+measurezoneR,[0,0,t,t,0],rigidface,'EdgeColor',rigidedge,'linewidth',2)
else
    % Anechoic end
    fill(ax,[sizespeaker,-min(s1,s2)*0.2,sizespeaker,sizespeaker]+measurezoneR,[0,t/2,t,0],anechface,'EdgeColor',rigidedge,'linewidth',1)
end

% Mics upstream
% Mic 1
fill(ax,-[l1-sizeaux/2,l1+sizeaux/2,l1+sizeaux/2,l1-sizeaux/2,l1-sizeaux/2]-s1,[0,0,sizeaux*3,sizeaux*3,0]+t,micsface,'EdgeColor',micsedge,'linewidth',1)
text(ax,-(l1+s1),sizeaux*3+t,mic1,'VerticalAlignment','bottom','HorizontalAlignment','center','FontWeight','bold')
% Mic 2
fill(ax,-[l1-sizeaux/2,l1+sizeaux/2,l1+sizeaux/2,l1-sizeaux/2,l1-sizeaux/2],[0,0,sizeaux*3,sizeaux*3,0]+t,micsface,'EdgeColor',micsedge,'linewidth',1)
text(ax,-l1,sizeaux*3+t,mic2,'VerticalAlignment','bottom','HorizontalAlignment','center','FontWeight','bold')

% Mics upstream
% Mic 3
fill(ax,[l2-sizeaux/2,l2+sizeaux/2,l2+sizeaux/2,l2-sizeaux/2,l2-sizeaux/2],[0,0,sizeaux*3,sizeaux*3,0]+t,micsface,'EdgeColor',micsedge,'linewidth',1)
text(ax,l2,sizeaux*3+t,mic3,'VerticalAlignment','bottom','HorizontalAlignment','center','FontWeight','bold')
% Mic 4
fill(ax,[l2-sizeaux/2,l2+sizeaux/2,l2+sizeaux/2,l2-sizeaux/2,l2-sizeaux/2]+s2,[0,0,sizeaux*3,sizeaux*3,0]+t,micsface,'EdgeColor',micsedge,'linewidth',1)
text(ax,l2+s2,sizeaux*3+t,mic4,'VerticalAlignment','bottom','HorizontalAlignment','center','FontWeight','bold')

if dimensions
    % Dimensioning
    % L1
    plot(ax,[-l1,0],[t,t]*0.7,'r','linewidth',1) % Hor
    plot(ax,[-l1,-l1],[-sizeaux,sizeaux]*1.1+t*0.7,'r','linewidth',1) % Vert L
    plot(ax,[0,0],[-sizeaux,sizeaux]*1.1+t*0.7,'r','linewidth',2) % Vert R
    text(ax,-l1/2,t*0.7,'l_1','VerticalAlignment','top','HorizontalAlignment','center','FontWeight','bold')
    % S1
    plot(ax,[-l1-s1,-l1],[t,t]*0.7,'r','linewidth',1) % Hor
    plot(ax,[-l1-s1,-l1-s1],[-sizeaux,sizeaux]*1.1+t*0.7,'r','linewidth',1) % Vert L
    text(ax,-l1-s1/2,t*0.7,'s_1','VerticalAlignment','top','HorizontalAlignment','center','FontWeight','bold')
    % L2
    plot(ax,[l2,0],[t,t]*0.7,'r','linewidth',1) % Hor
    plot(ax,[l2,l2],[-sizeaux,sizeaux]*1.1+t*0.7,'r','linewidth',1) % Vert R
    plot(ax,[0,0],[-sizeaux,sizeaux]*1.1+t*0.7,'r','linewidth',1) % Vert L
    text(ax,(l2)/2,t*0.7,'l_2','VerticalAlignment','top','HorizontalAlignment','center','FontWeight','bold')
    % S2
    plot(ax,[l2+s2,l2],[t,t]*0.7,'r','linewidth',1) % Hor
    plot(ax,[l2+s2,l2+s2],[-sizeaux,sizeaux]*1.1+t*0.7,'r','linewidth',1) % Vert R
    text(ax,l2+s2/2,t*0.7,'s_2','VerticalAlignment','top','HorizontalAlignment','center','FontWeight','bold')
    % d
    plot(ax,[0,d],[-sizeaux,-sizeaux]*1.5,'r','linewidth',1) % Hor
    plot(ax,[0,0],[-sizeaux,sizeaux]*1.1 -sizeaux*1.5,'r','linewidth',1) % Vert L
    plot(ax,[d,d],[-sizeaux,sizeaux]*1.1 -sizeaux*1.5,'r','linewidth',1) % Vert R
    text(ax,d/2,-sizeaux*1.5,'d','VerticalAlignment','top','HorizontalAlignment','center','FontWeight','bold')
    % d_t
    plot(ax,[measurezoneR,measurezoneR]+sizespeaker*1.6,[0,t],'r','linewidth',1) % Vert
    plot(ax,[-sizeaux,sizeaux]*1.1+measurezoneR+sizespeaker*1.6,[t,t],'r','linewidth',1) % Hor Up
    plot(ax,[-sizeaux,sizeaux]*1.1+measurezoneR+sizespeaker*1.6,[0,0],'r','linewidth',1) % Hor Down
    text(ax,measurezoneR+sizespeaker*1.75,t*0.5,'t','HorizontalAlignment','left','FontWeight','bold')
end

% Zones
if ~isempty(zones)
    % Upstream (Speaker to mic 2)
    if sum(zones==1)
        fill(ax,-[l1-sizeaux/2,l1+sizeaux/2,l1+sizeaux/2,l1-sizeaux/2,l1-sizeaux/2]-s1,[0,0,sizeaux*3,sizeaux*3,0]+t,colorOK,'EdgeColor','none','FaceAlpha',0.5)
        text(ax,-(l1+s1),sizeaux*3+t,mic1,'VerticalAlignment','bottom','HorizontalAlignment','center','FontWeight','bold','Color',colorOK)
        fill(ax,[-measurezoneL,-l1,-l1,-measurezoneL,-measurezoneL],[0,0,t,t,0],colorOK,'EdgeColor','none','FaceAlpha',0.3)
    end
    % Upstream (mic 2 to sample)
    if sum(zones==2)
        fill(ax,-[l1-sizeaux/2,l1+sizeaux/2,l1+sizeaux/2,l1-sizeaux/2,l1-sizeaux/2],[0,0,sizeaux*3,sizeaux*3,0]+t,colorOK,'EdgeColor','none','FaceAlpha',0.5)
        text(ax,-l1,sizeaux*3+t,mic2,'VerticalAlignment','bottom','HorizontalAlignment','center','FontWeight','bold','Color',colorOK)
        fill(ax,[-l1,0,0,-l1,-l1],[0,0,t,t,0],colorOK,'EdgeColor','none','FaceAlpha',0.3)
    end
    % Downstream (sample to mic 3)
    if sum(zones==3)
        fill(ax,[l2-sizeaux/2,l2+sizeaux/2,l2+sizeaux/2,l2-sizeaux/2,l2-sizeaux/2],[0,0,sizeaux*3,sizeaux*3,0]+t,colorOK,'EdgeColor','none','FaceAlpha',0.5)
        text(ax,l2,sizeaux*3+t,mic3,'VerticalAlignment','bottom','HorizontalAlignment','center','FontWeight','bold','Color',colorOK)
        fill(ax,[d,l2,l2,d,d],[0,0,t,t,0],colorOK,'EdgeColor','none','FaceAlpha',0.3)
    end
    if sum(zones==4)
        fill(ax,[l2-sizeaux/2,l2+sizeaux/2,l2+sizeaux/2,l2-sizeaux/2,l2-sizeaux/2]+s2,[0,0,sizeaux*3,sizeaux*3,0]+t,colorOK,'EdgeColor','none','FaceAlpha',0.5)
        text(ax,l2+s2,sizeaux*3+t,mic4,'VerticalAlignment','bottom','HorizontalAlignment','center','FontWeight','bold','Color',colorOK)
        if rigid
            fill(ax,[measurezoneR,l2,l2,measurezoneR,measurezoneR],[0,0,t,t,0],colorOK,'EdgeColor','none','FaceAlpha',0.3)
        else
            fill(ax,[measurezoneR+sizespeaker,l2,l2,measurezoneR+sizespeaker,measurezoneR+sizespeaker],[0,0,t,t,0],colorOK,'EdgeColor','none','FaceAlpha',0.3)
        end
    end
end

hold(ax,'on')
axis(ax,'equal')
axis(ax,'tight')
grid(ax,'on')
%box(ax,'on')

ht=findobj(ax,'type','text'); % Get all text
set(ht,'fontsize',13);
set(ax,'fontsize',9)
ylim(ax,[-sizeaux*7,sizeaux*15+t])
xlim(ax,[-measurezoneL-sizespeaker*2,measurezoneR+sizespeaker*3])

if ~axisshow
    axis(ax,'off')
end