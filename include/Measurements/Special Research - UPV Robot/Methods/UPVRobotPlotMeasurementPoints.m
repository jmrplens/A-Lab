function UPVRobotPlotMeasurementPoints(app,ax)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% ====================================================
% Parameters

% SizeRobot
XLen = app.ExtVar.UPVRobot.XLen;
YLen = app.ExtVar.UPVRobot.YLen;
ZLen = app.ExtVar.UPVRobot.ZLen;

% Resolution
XRes = app.ExtVar.UPVRobot.XRes;
YRes = app.ExtVar.UPVRobot.YRes;
ZRes = app.ExtVar.UPVRobot.ZRes;

% Origin-End
XOri = app.ExtVar.UPVRobot.XOri;
XEnd = app.ExtVar.UPVRobot.XEnd;
YOri = app.ExtVar.UPVRobot.YOri;
YEnd = app.ExtVar.UPVRobot.YEnd;
ZOri = app.ExtVar.UPVRobot.ZOri;
ZEnd = app.ExtVar.UPVRobot.ZEnd;

% Coordinates
X = app.ExtVar.UPVRobot.MeasurePoints(:,1);
Y = app.ExtVar.UPVRobot.MeasurePoints(:,2);
Z = app.ExtVar.UPVRobot.MeasurePoints(:,3);

% Robot
app.ExtVar.UPVRobot.RobotPlot = ...
    scatter3(ax,[],[],[],20*max([XLen,YLen,ZLen]),...
    's','MarkerEdgeColor','k','MarkerFaceColor','b','MarkerFaceAlpha',0.3,'linewidth',2);
hold(ax,'on')
app.ExtVar.UPVRobot.RobotPlotGuides(1) = plot3(ax,[0,0],[0,YLen],[0,0],'b','linewidth',0.5);
app.ExtVar.UPVRobot.RobotPlotGuides(2) = plot3(ax,[0,XLen],[0,0],[0,0],'b','linewidth',0.5);
app.ExtVar.UPVRobot.RobotPlotGuides(3) = plot3(ax,[0,0],[0,0],[0,ZLen],'b','linewidth',0.5);

% Points
app.ExtVar.UPVRobot.ScatterRedPlot = ...
    scatter3(ax,X(:),Y(:),Z(:),6*max([XLen,YLen,ZLen]),'o','MarkerEdgeColor','k','MarkerFaceColor','r');
app.ExtVar.UPVRobot.ScatterGreenPlot = ...
    scatter3(ax,[],[],[],6*max([XLen,YLen,ZLen]),'o','MarkerEdgeColor','k','MarkerFaceColor','g');

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
% Surface restriction
if app.ExtVar.UPVRobot.Restricted
    % Volume restricted
    XNaNOri = app.ExtVar.UPVRobot.XNaNOri;
    XNaNEnd = app.ExtVar.UPVRobot.XNaNEnd;
    YNaNOri = app.ExtVar.UPVRobot.YNaNOri;
    YNaNEnd = app.ExtVar.UPVRobot.YNaNEnd;
    ZNaNOri = app.ExtVar.UPVRobot.ZNaNOri;
    ZNaNEnd = app.ExtVar.UPVRobot.ZNaNEnd;
    
    colorRestrict = [0.2039,0.2863,0.3686];
    alphaRestrict = 0.7;
    %if XRes==1; XNaNOri = XOri; end
    %if YRes==1; YNaNOri = YOri; end
    %if ZRes==1; ZNaNOri = ZOri; end

    % Bottom (X,Y)
    if XNaNOri~=XNaNEnd && YNaNOri~=YNaNEnd %&& YRes>1 %&& XRes>1
        patch(ax,...
            [XNaNOri;XNaNOri;XNaNEnd;XNaNEnd],...
            [YNaNOri;YNaNEnd;YNaNEnd;YNaNOri],...
            [ZNaNOri;ZNaNOri;ZNaNOri;ZNaNOri],...
            colorRestrict,'FaceAlpha',alphaRestrict);
    end
    % Front (X,Z)
    if XNaNOri~=XNaNEnd && ZNaNOri~=ZNaNEnd %&& ZRes>1  && XRes>1
        patch(ax,...
            [XNaNOri;XNaNOri;XNaNEnd;XNaNEnd],...
            [YNaNOri;YNaNOri;YNaNOri;YNaNOri],...
            [ZNaNOri;ZNaNEnd;ZNaNEnd;ZNaNOri],...
            colorRestrict,'FaceAlpha',alphaRestrict);
    end
    % Back (-X,Z)
    if XNaNOri~=XNaNEnd && ZNaNOri~=ZNaNEnd && YNaNOri~=YNaNEnd %&& ZRes>1 && YRes>1  && XRes>1
        patch(ax,...
            [XNaNOri;XNaNOri;XNaNEnd;XNaNEnd],...
            [YNaNEnd;YNaNEnd;YNaNEnd;YNaNEnd],...
            [ZNaNOri;ZNaNEnd;ZNaNEnd;ZNaNOri],...
            colorRestrict,'FaceAlpha',alphaRestrict);
    end
    % Left (Y,Z)
    if YNaNOri~=YNaNEnd && ZNaNOri~=ZNaNEnd && ZRes>1 && YRes>1
        patch(ax,...
            [XNaNOri;XNaNOri;XNaNOri;XNaNOri],...
            [YNaNOri;YNaNOri;YNaNEnd;YNaNEnd],...
            [ZNaNOri;ZNaNEnd;ZNaNEnd;ZNaNOri],...
            colorRestrict,'FaceAlpha',alphaRestrict);
    end
    % Right (Y,Z)
    if YNaNOri~=YNaNEnd && ZNaNOri~=ZNaNEnd && XNaNOri~=XNaNEnd %&& ZRes>1 && YRes>1  && XRes>1
        patch(ax,...
            [XNaNEnd;XNaNEnd;XNaNEnd;XNaNEnd],...
            [YNaNOri;YNaNOri;YNaNEnd;YNaNEnd],...
            [ZNaNOri;ZNaNEnd;ZNaNEnd;ZNaNOri],...
            colorRestrict,'FaceAlpha',alphaRestrict);
    end
    % Top (X,-Y)
    if XNaNOri~=XNaNEnd && YNaNOri~=YNaNEnd && ZNaNOri~=ZNaNEnd %&& ZRes>1 && YRes>1  && XRes>1
        patch(ax,...
            [XNaNOri;XNaNOri;XNaNEnd;XNaNEnd],...
            [YNaNOri;YNaNEnd;YNaNEnd;YNaNOri],...
            [ZNaNEnd;ZNaNEnd;ZNaNEnd;ZNaNEnd],...
            colorRestrict,'FaceAlpha',alphaRestrict);
    end
end
% To legend
h(1) = scatter3(ax,[],[],[],6*max([XLen,YLen,ZLen]),'o','MarkerEdgeColor','k','MarkerFaceColor','r','visible', 'on');
h(2) = scatter3(ax,[],[],[],6*max([XLen,YLen,ZLen]),'o','MarkerEdgeColor','k','MarkerFaceColor','g','visible', 'on');
hold(ax,'off')
box(ax,'on')
grid(ax,'on')
grid(ax,'minor')
% Details
xlabel(ax,'X axis (m)')
ylabel(ax,'Y axis (m)')
zlabel(ax,'Z axis (m)')
leg = legend(h, 'Not measured','Measured','Location','northoutside');
leg.NumColumns = 2;
axis(ax,'equal')
axis(ax,[0-0.01*XLen,XLen*1.01,0-0.01*YLen,YLen*1.01,0-0.01,ZLen*1.01])
if max(Z(:))==0
    % XY
    app.ExtVar.UPVRobot.viewPos = [0,90];
    view(ax,app.ExtVar.UPVRobot.viewPos)
    set(ax, 'Ydir', 'reverse')
elseif max(Y(:))==0
    % XZ
    app.ExtVar.UPVRobot.viewPos = [0,0];
    view(ax,app.ExtVar.UPVRobot.viewPos)
elseif max(X(:))==0
    % YZ
    app.ExtVar.UPVRobot.viewPos = [90,0];
    view(ax,app.ExtVar.UPVRobot.viewPos)
else
    % 3D
    app.ExtVar.UPVRobot.viewPos = [20,20];
    view(ax,app.ExtVar.UPVRobot.viewPos)
    set(ax, 'Ydir', 'reverse')
end


% ====================================================
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
set(leg,'fontname',font,'fontsize',fsize,'interpreter',type); % Text
set(leg,'Color',[1,1,1],'EdgeColor',[0.4 0.6 0.7],'LineWidth',1.5) % Box