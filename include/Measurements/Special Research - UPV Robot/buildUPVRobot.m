function buildUPVRobot(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Initialize if no exist
if ~isfield(app.ExtVar,'UPVRobot')
    app.ExtVar.UPVRobot = struct('XLen',[],'YLen',[],'ZLen',[],'XYSpeed',[],'MaxXYSpeed',[],'ZSpeed',[],...
        'MaxZSpeed',[],'XYAcel',[],'ZAcel',[],'MaxXYAcel',[],'MaxZAcel',[],...
        'RobotURLmove',[],'RobotURLpos',[],'RobotURLstatus',[],...
        'InCh',[],'OutCh',[],'Output',[],'TypeSignal',[],'FolderPath',[],...
        'XRes',[],'YRes',[],'ZRes',[],'XOri',[],'YOri',[],'ZOri',[],'XEnd',[],'YEnd',[],'ZEnd',[],...
        'Restricted',[],'XNaNOri',[],'YNaNOri',[],'ZNaNOri',[],'XNaNEnd',[],'YNaNEnd',[],'ZNaNEnd',[],...
        'MeasurePoints',[],'CoordsType',[],'CustomCoordsPath',[],'ManualCoords',[],'GeometricCoords',[],'DirectivityCoords',[],...
        'XOffset',[],'YOffset',[],'ZOffset',[],'unitsCoords',[],... % For import coords
        'DirectivityType',[],'incTheta',[],'incPhi',[],'incThetaHemi',[],'incPhiHemi',[],'dirR',[],...% For directivity coords
        'DirPosition',[],'DirDirection',[],'DirOri',[],'DirThetaCoords',[],'DirPhiCoords',[],... 
        'Resumed',0,'MeasureTime',[],'MeasureSingleTime',[],'RouteOptimized',[],... % Others
        'ScatterRedPlot',[],'ScatterGreenPlot',[],'RobotPlot',[],'RobotPlotGuidesX',[],'viewPos',[]);
end

% =======================================================
% UPV Anehoic chamber robot details

% URL to connect with robot
app.ExtVar.UPVRobot.RobotURLmove = 'http://192.168.4.1/movexyz';
app.ExtVar.UPVRobot.RobotURLpos = 'http://192.168.4.1/position';
app.ExtVar.UPVRobot.RobotURLstatus = 'http://192.168.4.1/status';

 % Size - each axis (m)
    app.ExtVar.UPVRobot.XLen = 3;
    app.ExtVar.UPVRobot.YLen = 3;
    app.ExtVar.UPVRobot.ZLen = 1;
    
    % Speed - each axis (mm/s)
    app.ExtVar.UPVRobot.XYSpeed = 100;
    app.ExtVar.UPVRobot.ZSpeed = 100;
    app.ExtVar.UPVRobot.MaxXYSpeed = 100;
    app.ExtVar.UPVRobot.MaxZSpeed = 100;
    
    % Aceleration - each axis (mm/s^2)
    app.ExtVar.UPVRobot.XYAcel = 50;
    app.ExtVar.UPVRobot.ZAcel = 50;
    app.ExtVar.UPVRobot.MaxXYAcel = 500;
    app.ExtVar.UPVRobot.MaxZAcel = 500;

% ====================================================
% Left
% Delete content in left colum
delete(app.LeftPanel.Children);
createPanelUPVRobotLeft(app)

% ====================================================
% Center
% Delete content in center colum
delete(app.CenterPanel.Children);
createPanelUPVRobotCenter(app)

% ====================================================
% Right
% Delete content in right colum
delete(app.RightPanel.Children);

createRightStandardPanel(app)

% Set available signals
app.ExtUI.SignaltypeDropDown.Items = {'Sweep','MLS','White Noise','Pink Noise','Pure tone','Custom Signal'};
app.ExtUI.SignaltypeDropDown.Value = 'Sweep';
switchSignal(app)

% Add Robot info panel
createPanelInfoUPVRobot(app)

% ====================================================
% Set 'Start measure' button callback
app.ExtUI.StartmeasureButton.ButtonPushedFcn = {@measureUPVRobotcallback,app};
app.ExtUI.StartmeasureButton.Enable = 'off';
app.ExtUI.StartmeasureButton.Text = 'Start measure';

% ====================================================
% Check for resume
if ~isempty(app.ExtVar.UPVRobot.FolderPath) % If path
    if exist(app.ExtVar.UPVRobot.FolderPath,'dir')
        UPVRobotResumeMeasure(app);
    end
end

% ====================================================
% Plot coordinates if exist
if ~isempty(app.ExtVar.UPVRobot.MeasurePoints)
    app.ExtUI.UPVRobotGeneratemeasurementpointsButton.Enable = 'on';
    UPVRobotGenerateMeasurementPoints(app)
end

% =======================================================
% Check connection with robot
done = UPVRobotCheckConnection(app);
% Get data from robot
if done
    status = UPVRobotGetStatus(app);
    
    % Size - each axis (m)
    app.ExtVar.UPVRobot.XLen = status.X.MAX_POS*1e-3;
    app.ExtVar.UPVRobot.YLen = status.Y.MAX_POS*1e-3;
    app.ExtVar.UPVRobot.ZLen = status.Z.MAX_POS*1e-3;
    
    % Speed - each axis (mm/s)
    app.ExtVar.UPVRobot.XYSpeed = status.X.DEFAULT_SPEED;
    app.ExtVar.UPVRobot.ZSpeed = status.Z.DEFAULT_SPEED;
    app.ExtVar.UPVRobot.MaxXYSpeed = status.X.MAX_SPEED;
    app.ExtVar.UPVRobot.MaxZSpeed = status.Z.MAX_SPEED;
    
    % Aceleration - each axis (mm/s^2)
    app.ExtVar.UPVRobot.XYAcel = status.X.DEFAULT_ACCEL;
    app.ExtVar.UPVRobot.ZAcel = status.Z.DEFAULT_ACCEL;
    app.ExtVar.UPVRobot.MaxXYAcel = status.X.MAX_ACCEL;
    app.ExtVar.UPVRobot.MaxZAcel = status.Z.MAX_ACCEL;
    
end

% =======================================================
% Set measure type
app.MeasureType = 'UPV Robot';

function measureUPVRobotcallback(~,~,app)
app.ExtUI.StartmeasureButton.Enable = 'off';
drawnow
measureUPVRobot(app)
app.ExtUI.StartmeasureButton.Enable = 'on';
drawnow