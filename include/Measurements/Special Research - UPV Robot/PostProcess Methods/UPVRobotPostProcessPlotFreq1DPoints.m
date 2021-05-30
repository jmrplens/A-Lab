function UPVRobotPostProcessPlotFreq1DPoints(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Axes
ax = app.ExtUI.UPVRobotPostProcessFreq1DPointsUIaxes;
% ===========================================
% Size axis
XLen = app.ExtVar.UPVRobotPostProcess.DefaultLim(1,2);
YLen = app.ExtVar.UPVRobotPostProcess.DefaultLim(2,2);
ZLen = app.ExtVar.UPVRobotPostProcess.DefaultLim(3,2);

% ===========================================
% Coords
coords = app.ExtVar.UPVRobotPostProcess.Coords;
x = coords(:,1);
y = coords(:,2);
z = coords(:,3);

X = app.ExtVar.UPVRobotPostProcess.Mesh.Xmatrix;
Y = app.ExtVar.UPVRobotPostProcess.Mesh.Ymatrix;
Z = app.ExtVar.UPVRobotPostProcess.Mesh.Zmatrix;

% Selected points
selection = false(size(coords,1),1);
selection(app.ExtVar.UPVRobotPostProcess.SelectedPoints) = true;

% Points
app.ExtVar.UPVRobotPostProcess.PlotPointsRed = ...
    scatter3(ax,x(~selection),y(~selection),z(~selection),5*max([XLen,YLen,ZLen]),'o','MarkerEdgeColor','k','MarkerFaceColor','r');
hold(ax,'on')
app.ExtVar.UPVRobotPostProcess.PlotPointsGreen = ...
    scatter3(ax,x(selection),y(selection),z(selection),5*max([XLen,YLen,ZLen]),'o','MarkerEdgeColor','k','MarkerFaceColor','g');

% Box
Xb = [0;XLen;XLen;0;0];
Yb = [0;0;YLen;YLen;0];
Zb = [0;0;0;0;0];
plot3(ax,Xb,Yb,Zb,'Color',[0.4 0.6 0.7]);   % draw a square in the xy plane with z = 0
plot3(ax,Xb,Yb,Zb+ZLen,'Color',[0.4 0.6 0.7]); % draw a square in the xy plane with z = 1
for k=1:length(Xb)-1
    plot3(ax,[Xb(k);Xb(k)],[Yb(k);Yb(k)],[0;ZLen],'Color',[0.4 0.6 0.7]);
end
% Surface
a = patch(ax,[0;XLen;XLen;0],[0;0;YLen;YLen],[-0.01;-0.01;-0.01;-0.01],[0.4 0.6 0.7]);
a.FaceAlpha = 0.2;

% To legend
h(1) = scatter3(ax,[],[],[],5*max([XLen,YLen,ZLen]),'o','MarkerEdgeColor','k','MarkerFaceColor','r','visible', 'on');
h(2) = scatter3(ax,[],[],[],5*max([XLen,YLen,ZLen]),'o','MarkerEdgeColor','k','MarkerFaceColor','g','visible', 'on');
hold(ax,'off')
box(ax,'on')
grid(ax,'on')
grid(ax,'minor')
% Details
xlabel(ax,'X (m)')
ylabel(ax,'Y (m)')
zlabel(ax,'Z (m)')
leg = legend(h, {'No selected','Selected'},'Location','northoutside');
leg.NumColumns = 2;
set(leg,'Color',[1,1,1],'EdgeColor',[0.4 0.6 0.7],'LineWidth',1.5) % Box
axis(ax,'equal')
axis(ax,[0-0.01*XLen,XLen*1.01,0-0.01*YLen,YLen*1.01,0-0.01,ZLen*1.01])
if max(Z(:))==0
    % XY
    view(ax,0,90)
    set(ax, 'Ydir', 'reverse')
elseif max(Y(:))==0
    % XZ
    view(ax,0,0)
elseif max(X(:))==0
    % YZ
    view(ax,90,0)
else
    % 3D
    view(ax,20,20)
    set(ax, 'Ydir', 'reverse')
end


% % ====================================================
% % Style
% % Params
% Black = [0 0 0];
% lwidth = 0.5;
% fsize = 12;
% font = 'Arial';
% type = 'Latex';
% % Axes linewidth
% set(ax,'linewidth',lwidth);
% % Text properties
% ht=findobj(ax,'type','text'); % Get all text
% set(ht,'fontname',font,'fontsize',fsize,'color',Black,'interpreter',type);
% set(ax,'fontname',font,'fontsize',fsize)
% set(ax,'XMinorTick','on','YMinorTick','on','ZMinorTick','on','TickLabelInterpreter',type)
% % Axis labels
% set([ax.XLabel ax.YLabel ax.ZLabel],...
%     'fontname',font,'fontsize',fsize,'color',Black,'interpreter',type);
% % Title
% set(ax.Title,'fontname',font,'fontsize',fsize,'color',Black,'interpreter',type);
% % Legend General
% set(leg,'fontname',font,'fontsize',fsize,'interpreter',type); % Text
% set(leg,'Color',[1,1,1],'EdgeColor',[0.4 0.6 0.7],'LineWidth',1.5) % Box