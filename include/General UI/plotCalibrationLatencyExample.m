function plotCalibrationLatencyExample(ax)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Box
plot(ax,[0,0,1,1,0],[0,0.75,0.75,0,0],'k','linewidth',2)
hold(ax,'on')
text(ax,0.5,0.65,'Sound card','HorizontalAlignment','center','FontSize',20,'FontWeight','bold')

% Connectors
r1 = 0.03;
r2 = 0.05;
r3 = 0.06;
angles = linspace(0,2*pi,100);

% Out
cOut = [0.25,0.35];
x = cOut(1) + [r1;r2;r3] .* sin(angles);
y = cOut(2) + [r1;r2;r3] .* cos(angles);
plot(ax,x(1,:),y(1,:),'k','linewidth',2)
plot(ax,x(2,:),y(2,:),'b','linewidth',6)
plot(ax,x(3,:),y(3,:),'k','linewidth',2)
text(ax,0.25,0.45,'Audio Output','HorizontalAlignment','center','FontSize',13)

% In
cIn = [0.75,0.35];
x = cIn(1) + [r1;r2;r3] .* sin(angles);
y = cIn(2) + [r1;r2;r3] .* cos(angles);
plot(ax,x(1,:),y(1,:),'k','linewidth',2)
plot(ax,x(2,:),y(2,:),'r','linewidth',6)
plot(ax,x(3,:),y(3,:),'k','linewidth',2)
text(ax,0.75,0.45,'Audio Input','HorizontalAlignment','center','FontSize',13)

% Wire
a = 0.25; b = 0.3;
x = -a:0.001:a;
y = sqrt(b^2 - b^2*(x.^2/a^2));
plot(ax,x+0.5,-y+0.35,'k','linewidth',3)
text(ax,0.5,0.15,'Direct link','HorizontalAlignment','center','FontSize',12)
% 
% % Arrow 1
% annotation(app.ALabUIFigure,'arrow',[0.31,0.34],[0.52,0.35])
% % Arrow 2
% annotation(ax,'arrow',[0.31,0.34]+0.385,[0.35,0.52])

axis(ax,'off')
axis(ax,'equal')