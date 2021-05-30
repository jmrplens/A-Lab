function buildUPVRobotPostProcess(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Initialize if no exist
if ~isfield(app.ExtVar,'UPVRobotPostProcess')
    app.ExtVar.UPVRobotPostProcess = struct('FolderPath',[],...
        'ResultType',[],'DimType',[],'Multicore',[],...
        'FreqView',[],'FreqMinRange',[],'FreqMaxRange',[],'FreqColorAuto',[],'PointsSPL_SingleFreq',[],'Single_FreqIndex',[],... % Freq view params
        'PlotPointsRed',[],'PlotPointsGreen',[],'SelectionChangedT',[],'SelectionChangedG',[],'SelectedPoints',[],'OriginType',[],'OriginPointIdx',[],'OriginPointCoor',[],... % View 1D params
        'DistOverAll',[],'DataSource',[],'FlyTimeCheck',[],'OverallSPLCheck',[],'ClippingCheck',[],'FlyTime',[],'FlyDist',[],... 
        'OverallSPL',[],'Clipping',[],...
        'Slice2DType',[],'SliceXY_Zvalue',[],'SliceXZ_Yvalue',[],'SliceYZ_Xvalue',[],'ViewPoints',[],'ViewBoundary',[],'SurfacePlot',[],... % View 2D params
        'ViewType3D',[],'XYsliderValue',[],'XZsliderValue',[],'YZsliderValue',[],'ViewLight',[],... % View 3D params
        'SlicesPlot',[],'SlicesBoundary',[],'XYslicesValues',[],'XZslicesValues',[],'YZslicesValues',[],'ISOsurf',[],...
        'FISOvalue',[],'FISOLower',[],'FISOUpper',[],'FISOSmooth',[],... % View 3D freq params
        'DirType',[],'DirReference',[],'DirRefType',[],'DirRefAngle',[],'DirDataType',[],'DirFreqPolar',[],'DirFreq3D',[],'DirFrontBack',[],'Dir3DAxisArrows',[],'Dir3DAxisCart',[],'Dir3DAxisPolar',[],'DirUnits',[],...% Directivity
        'DirPolarPlane',[],'Dir360',[],'DirRotateHor',[],'DirRotateVer',[],'DirPlotType2D',[],'DirRangeAuto',[],'DirMinRange',[],'DirMaxRange',[],'DirSmooth',[],'DirSmoothLev',[],...
        'Coords',[],'TimeVec',[],'InSignal',[],'OutSignal',[],'TimeRespType',[],'IRtime',[],'IRResp',[],'FreqVec',[],'FreqResp',[],... % Processed data
        'XLim',[],'YLim',[],'ZLim',[],'DefaultLim',[],'Mesh',[],... % General visualization
        'MeasureTime',[],'MeasureSingleTime',[],'MeasureType',[],... % Measure information
        'Averages',[],'SampleRate',[],'SamplesPerFrame',[],'Device',[],'BitDepth',[],...
        'Sensitivity',[],'InCh',[],'OutCh',[],'Latency',[],'LatencyIsMeasured',[],'TypeSignal',[],'Output',[],...
        'SignalParameter',[],'c',[],'rho',[]...
        ); 
end

% ====================================================
% Right
% Delete content in right colum
delete(app.RightPanel.Children);
% Set column
rightGrid(app,{'1x'},{'fit', 'fit', '1x', 'fit'});

% Measure information panel
createPanelUPVRobotPostProcessRight(app);

% ====================================================
% Left
% Delete content in left colum
delete(app.LeftPanel.Children);
createPanelUPVRobotPostProcessLeft(app)

% ====================================================
% Center
% Delete content in center colum
delete(app.CenterPanel.Children);
% Load after process data and clic over option
