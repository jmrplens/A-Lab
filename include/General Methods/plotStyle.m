function plotStyle(ax)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Params
Black = [0 0 0];
lwidth = 0.5;
fsize = 11;
font = 'Arial';
type = 'Latex';
% Axes linewidth
set(ax,'linewidth',lwidth);
% Y Axes color
set(ax,'YColor',Black)
% Text properties
ht=findobj(ax,'type','text'); % Get all text
set(ht,'fontname',font,'fontsize',fsize,'color',Black,'interpreter',type);
set(ax,'fontname',font,'fontsize',fsize)
set(ax,'XMinorTick','on','YMinorTick','on','ZMinorTick','on','TickLabelInterpreter',type)
% Axis labels
set([ax.XLabel ax.YLabel ax.ZLabel],...
    'fontname',font,'fontsize',fsize+1,'color',Black,'interpreter',type);
if strcmp(ax.YAxisLocation,'right')
    yyaxis(ax, 'left')
    set(ax.YLabel,...
    'fontname',font,'fontsize',fsize+1,'color',Black,'interpreter',type);
    set(ax,'YColor',Black)
end
% Title
set(ax.Title,'fontname',font,'fontsize',fsize+3,'color',Black,'interpreter','tex');
% Legend General
set(ax.Legend,'fontname',font,'fontsize',fsize+1,'interpreter',type); % Text
set(ax.Legend,'Color',[1,1,1],'EdgeColor',Black,'LineWidth',lwidth) % Box