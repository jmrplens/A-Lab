function UPVRobotOptimizeRoute(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% ====================================================
% Hide general plot
axgen = app.ExtUI.UPVRobotUIAxes;
cla(axgen,'reset')
axgen.Visible = 'off';

% ====================================================
% Reset route plot
ax = app.ExtUI.UPVRobotUIAxesRoute;
cla(ax,'reset')
ax.Visible = 'off';
drawnow

% ====================================================
% Coords XY (unique)
coords = app.ExtVar.UPVRobot.MeasurePoints;

% debug
% coords = [randi(300,80,1)/100,randi(300,80,1)/100,ones(80,1)*0.5];
%aa=load('coor.mat') ;
%coordsu = aa.coordsu;

% Get coords from 2D plane
if numel(unique(coords(:,1))) == 1 % YZ plane
    coordsu = coords(:,2:3);
elseif numel(unique(coords(:,2))) == 1 % XZ plane
    coordsu = coords(:,[1,3]);
else % XY Plane
    coordsu = coords(:,1:2);
end
% [~,idx] = unique(coords(:,1:2),'row');
% coordsu = coords(sort(idx),1:2);



% ====================================================
% Calculate actual travel distance
v = diff(coordsu);
distXY = sqrt(sum(v .^ 2,2)); % = sqrt( (x(i+1)-x(i))^2 + (y(i+1)-y(i))^2 ) ... Euclidian
travelDist = sum(distXY);

% ====================================================
% First plot

% Route
pp = plot(ax,coordsu(:,1),coordsu(:,2),'linewidth',1.5);

hold(ax,'on')

% points
scatter(ax,coordsu(:,1),coordsu(:,2),'kx','linewidth',1.5)
axis(ax,'equal')
box(ax,'on')
grid(ax,'on')
grid(ax,'minor')
hold(ax,'off')
title(ax,sprintf('Travel distance: %.2f m - Optimized distance: %.2f m',travelDist,0))
axis(ax,[0-0.01*3,3*1.01,0-0.01*3,3*1.01,0-0.01,1*1.01])
UPVRobotRouteOptimStylePlot(ax)
drawnow
% Set gradient
ax.Visible = 'on';
drawnow

% If a resumed measure, no optimize
if app.ExtVar.UPVRobot.Resumed
    title(ax,sprintf('Travel distance: %.2f m - Resumed measures cannot be optimized',travelDist))
    return;
end

% ====================================================
% Optimization
[optRoute,minDist] = optimizeRouteRobot(coordsu,travelDist,ax,pp,1);

% ====================================================
% Reorder coordinates
coords = coords(optRoute,:);

% ====================================================
% Store points
app.ExtVar.UPVRobot.MeasurePoints = coords;

% ====================================================
% Refresh time travel
[Time,TimeEach] = UPVRobotTimeTravel(app);
app.ExtUI.UPVRobotMeasureTimeEachInfo.Text = ['~ ',num2str(TimeEach,'%.1f'),' seconds'];
app.ExtUI.UPVRobotMeasureTimeTotalInfo.Text = ['~ ',sec2str(Time)];
app.ExtUI.UPVRobotStatusRemaining.Text = ['~ ',sec2str(Time)];

% Colors for gradient
colors = cool(size(coords,1));

% Route with gradient
pp = plot(ax,coords(:,1),coords(:,2),'linewidth',1.5);
cd = [uint8(colors*255) uint8(ones(size(coords,1),1))].';

hold(ax,'on')
% Start point
h(1) = scatter(ax,coords(1,1),coords(1,2),'o','MarkerEdgeColor','k','MarkerFaceColor',colors(1,:));
% End point
h(2) = scatter(ax,coords(end,1),coords(end,2),'o','MarkerEdgeColor','k','MarkerFaceColor',colors(end,:));
% Others points
scatter(ax,coords(2:end-1,1),coords(2:end-1,2),'kx','linewidth',1)

leg = legend(h, 'Start route','End route','Location','northoutside');
leg.NumColumns = 2;
view(ax,0,-90)
title(ax,sprintf('Travel distance: %.2f m - Optimized distance: %.2f m',travelDist,minDist))
drawnow
% Set gradient
set(pp.Edge, 'ColorBinding','interpolated', 'ColorData',cd)
UPVRobotRouteOptimStylePlot(ax)

% Set optimized to true
app.ExtVar.UPVRobot.RouteOptimized = 1;


function UPVRobotRouteOptimStylePlot(ax)
% Style
% Params
Black = [0 0 0];
lwidth = 0.5;
fsize = 12;
font = 'Arial';
type = 'Latex';
% Axes linewidth
set(ax,'linewidth',lwidth);
% Text properties
ht=findobj(ax,'type','text'); % Get all text
set(ht,'fontname',font,'fontsize',fsize,'color',Black,'interpreter',type);
set(ax,'fontname',font,'fontsize',fsize)
set(ax,'XMinorTick','on','YMinorTick','on','ZMinorTick','on','TickLabelInterpreter',type)
% Axis labels
set([ax.XLabel ax.YLabel ax.ZLabel],...
    'fontname',font,'fontsize',fsize,'color',Black,'interpreter',type);
% Title
set(ax.Title,'fontname',font,'fontsize',fsize,'color',Black,'interpreter',type);
% Legend General
set(ax.Legend,'fontname',font,'fontsize',fsize,'interpreter',type); % Text
set(ax.Legend,'Color',[1,1,1],'EdgeColor',[0.4 0.6 0.7],'LineWidth',1.5) % Box
