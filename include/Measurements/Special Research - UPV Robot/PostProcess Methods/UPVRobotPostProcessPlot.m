function UPVRobotPostProcessPlot(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

switch lower(app.ExtVar.UPVRobotPostProcess.ResultType)
    case 'frequency'
        switch app.ExtVar.UPVRobotPostProcess.DimType
            case '1D'
                
            case '2D'
                UPVRobotPostProcessPlotFreq2D(app);
            case '3D'
                UPVRobotPostProcessPlotFreq3D(app)
        end
    case 'time'
        switch app.ExtVar.UPVRobotPostProcess.DimType
            case '1D'
                
            case '2D'
               UPVRobotPostProcessPlotTime2D(app)
            case '3D'   
                
        end
    case 'directivity'
        switch app.ExtVar.UPVRobotPostProcess.DirType
            case 'Polar'
                UPVRobotPostProcessPlotDirectivityPolar(app)
            case '2D'
                UPVRobotPostProcessPlotDirectivity2D(app)
            case '3D'
                UPVRobotPostProcessPlotDirectivity3D(app)
            case 'Parameters'
                UPVRobotPostProcessPlotDirectivityParameters(app)
        end
end
