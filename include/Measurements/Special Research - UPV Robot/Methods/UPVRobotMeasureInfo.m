function UPVRobotMeasureInfo(app,fcn)
% This function save or load the configuration in the project folder
%
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

switch lower(fcn)
    case 'save'
        % Hardware
        fid = fopen([app.ExtVar.UPVRobot.FolderPath,filesep,'Measure Information.txt'], 'wt+');
        fprintf(fid, 'Date: %s\n',datestr(now));
        fprintf(fid, '--------------------------------------------------------------------\n');
        fprintf(fid, '# HARDWARE\n');
        fprintf(fid, 'Device:\t\t\t%s\n',app.Device);
        fprintf(fid, 'Samples per frame:\t%d\n',app.SamplesPerFrame);
        fprintf(fid, 'Sample rate:\t\t%d Hz\n',app.SampleRate);
        fprintf(fid, 'Bitdepth:\t\t%s\n',app.BitDepth);
        fprintf(fid, 'Input channel:\t\t%d\n',app.ExtVar.UPVRobot.InCh);
        fprintf(fid, 'Output channel:\t\t%d\n',app.ExtVar.UPVRobot.OutCh);
        % Latency
        if ~isempty(app.Latency) && app.LatencyIsMeasured
           fprintf(fid, 'Latency (corrected on signals):\t\t%.2f ms\n',app.Latency*1e3);
        else
            fprintf(fid, 'Latency (calculated, not corrected on signals):\t%.2f ms\n',app.Latency*1e3);
        end
        
        if app.SensitivityIsMeasured(app.ExtVar.UPVRobot.InCh)
            fprintf(fid, 'Sensitivity (corrected on signals):\t\t%.5f\n',app.Sensitivity(app.ExtVar.UPVRobot.InCh)); 
        end
        
        fprintf(fid, '--------------------------------------------------------------------\n');
        
        % Signal
        fprintf(fid, '# SIGNAL\n');
        fprintf(fid, 'Signal:\t\t\t%s\n',app.TypeSignal);
        switch lower(app.TypeSignal)
            case 'mls'
                duration = app.SignalParameter.MLS.Dur;
                nseq = app.SignalParameter.MLS.nseq;
                fprintf(fid, 'Duration (seq.):\t%.2f ms\n',duration);
                fprintf(fid, 'Sequences:\t\t%d\n',nseq);
            case 'sweep'
                duration = app.SignalParameter.Sweep.swDur;
                dur_sil = app.SignalParameter.Sweep.silDur;
                fini= app.SignalParameter.Sweep.init;
                fend = app.SignalParameter.Sweep.end;
                fprintf(fid, 'Duration:\t\t%.2f s\n',duration);
                fprintf(fid, 'Silence duration:\t%.2f s\n',dur_sil);
                fprintf(fid, 'Initial frequency:\t%.2f Hz\n',fini);
                fprintf(fid, 'End frequency:\t\t%.2f Hz\n',fend);
            case 'white noise'
                duration = app.SignalParameter.WhiteNoise.Dur;
                fprintf(fid, 'Duration:\t\t%.2f s\n',duration);
            case 'pink noise'
                duration = app.SignalParameter.PinkNoise.Dur;
                fprintf(fid, 'Duration:\t\t%.2f s\n',duration);
            case 'pure tone'
                duration = app.SignalParameter.Tone.Dur;
                freq = app.SignalParameter.Tone.freq;
                fprintf(fid, 'Duration:\t\t%.2f s\n',duration);
                fprintf(fid, 'Frequency:\t\t\t%.2f Hz\n',freq);
            case 'custom signal'
                fprintf(fid, 'Path:\t\t\t%s Hz\n',app.SignalParameter.Custom.Path);
        end
        time = (length(app.ExtVar.UPVRobot.Output)+1)/app.SampleRate;
        fprintf(fid, 'Total duration:\t\t%.2f s\n',time);
        fprintf(fid, 'Averages:\t\t%d\n',app.Averages);
        
        
        fprintf(fid, '--------------------------------------------------------------------\n');
        
        % Coordinates
        fprintf(fid, '# MEASURES\n');
        num = size(app.ExtVar.UPVRobot.MeasurePoints,1);
        fprintf(fid, 'Total measures:\t\t%d\n',num);
        fprintf(fid, 'Coordinates type:\t%s\n',app.ExtVar.UPVRobot.CoordsType);
        if strcmp(app.ExtVar.UPVRobot.CoordsType,'Directivity')
            fprintf(fid, 'Directivity type:\t%s\n',app.ExtVar.UPVRobot.DirectivityType);
            fprintf(fid, 'Directivity direction:\t%s\n',app.ExtVar.UPVRobot.DirDirection);
            fprintf(fid, 'Radius:\t\t\t%.2f m\n',app.ExtVar.UPVRobot.dirR);
            fprintf(fid, 'Inc Phi:\t\t%.2f degrees\n',app.ExtVar.UPVRobot.incPhi);
            fprintf(fid, 'Inc Theta:\t\t%.2f degrees\n',app.ExtVar.UPVRobot.incTheta);
        end
        fprintf(fid, 'Measure time (each):\t~ %.1f s\n',app.ExtVar.UPVRobot.MeasureTime/num);
        fprintf(fid, 'Measure time (total):\t%s\n',['~ ',sec2str(app.ExtVar.UPVRobot.MeasureTime)]);
        
        fprintf(fid, '--------------------------------------------------------------------\n');
        
        % Measureata type
        fprintf(fid, '# MEASURE DATA\n');
        fprintf(fid, 'Source signal in ''Signal_source.txt'' file:\n');
        fprintf(fid, '\t Column 1 is time in seconds (this vector should also be used for the input signals).\n');
        fprintf(fid, '\t Column 2 is amplitude.\n');
        fprintf(fid, 'Input signals in ''N.txt'' files (where ''N'' is a index of coordinate).\n');
        fprintf(fid, 'Coordinates in ''Coordinate list.txt'' file:\n');
        fprintf(fid, '\t Column 1 is the coordinate index.\n');
        fprintf(fid, '\t Column 2, 3 and 4 are the coordinates X, Y and Z in meters.\n');
        if strcmp(app.ExtVar.UPVRobot.CoordsType,'Directivity')
            fprintf(fid, 'Angles in ''Angles list.txt'' file:\n');
            fprintf(fid, '\t Column 1 is the coordinate index.\n');
            fprintf(fid, '\t Column 2 is the elevation angle ''theta'' in degrees.\n');
            fprintf(fid, '\t Column 3 is the azimuth angle ''phi'' in degrees.\n');
        end
        
        % Other information
        fprintf(fid, '--------------------------------------------------------------------\n');
        fprintf(fid, '# OTHER INFORMATION\n');
        fprintf(fid, ['The measure.dat file contains the necessary data to carry out the\n',...
            'post-processing both within the application and externally with matlab\n']);
        % Comments
        
        % Close text file
        fclose(fid);
        
        % To mat
        Version = app.Version;
        SystemInfo = app.SystemInfo;
        UPVRobot = app.ExtVar.UPVRobot;
        MeasureType = app.MeasureType;
        Averages = app.Averages;
        Device = app.Device;
        Driver = app.Driver;
        SampleRate = app.SampleRate;
        SamplesPerFrame = app.SamplesPerFrame;
        BitDepth = app.BitDepth;
        Sensitivity = app.Sensitivity;
        SensitivityIsMeasured = app.SensitivityIsMeasured;
        Latency = app.Latency;
        LatencyIsMeasured = app.LatencyIsMeasured;
        TypeSignal = app.TypeSignal;
        OutSignal = app.OutSignal;
        InputSignal = app.InputSignal;
        SignalParameter = app.SignalParameter;
        c = app.c;
        rho = app.rho;
        
        save([app.ExtVar.UPVRobot.FolderPath,filesep,'measure.dat'],'Version','SystemInfo','UPVRobot','MeasureType','Averages','Driver','Device',...
            'SampleRate','SamplesPerFrame','BitDepth','Sensitivity','SensitivityIsMeasured','Latency','LatencyIsMeasured','TypeSignal','OutSignal',...
            'InputSignal','SignalParameter','c','rho','-mat');
        
    case 'load'
        
        % Load
        appaux = load([app.ExtVar.UPVRobot.FolderPath,filesep,'measure.dat'],'-mat');
        app.ExtVar.UPVRobot = appaux.UPVRobot;
        app.MeasureType = appaux.MeasureType;
        app.Averages = appaux.Averages;
        app.SampleRate = appaux.SampleRate;
        app.SamplesPerFrame = appaux.SamplesPerFrame;
        app.Driver = appaux.Driver;
        devices = getAvailableDevices();
        if find(appaux.Device == string(devices))
            app.Device = appaux.Device;
        else
            app.Device = devices(1);
        end
        app.BitDepth = appaux.BitDepth;
        app.Sensitivity = appaux.Sensitivity;
        app.SensitivityIsMeasured = appaux.SensitivityIsMeasured;
        app.Latency = appaux.Latency;
        app.LatencyIsMeasured = appaux.LatencyIsMeasured;
        app.TypeSignal = appaux.TypeSignal;
        app.OutSignal = appaux.OutSignal;
        app.InputSignal = appaux.InputSignal;
        app.SignalParameter = appaux.SignalParameter;
        app.c = appaux.c;
        app.rho = appaux.rho;
        refreshPanelInformation(app);
        
    case 'loadpostpro'
        
        try
            % Load
            appaux = load([app.ExtVar.UPVRobotPostProcess.FolderPath,filesep,'measure.dat'],'-mat');
            app.ExtVar.UPVRobotPostProcess.Coords = appaux.UPVRobot.MeasurePoints;
            app.ExtVar.UPVRobotPostProcess.CoordsType = appaux.UPVRobot.CoordsType;
            if isfield(appaux.UPVRobot,'DirectivityType')
                app.ExtVar.UPVRobotPostProcess.DirectivityType = appaux.UPVRobot.DirectivityType;
                app.ExtVar.UPVRobotPostProcess.incTheta = appaux.UPVRobot.incTheta;
                app.ExtVar.UPVRobotPostProcess.incPhi = appaux.UPVRobot.incPhi;
                app.ExtVar.UPVRobotPostProcess.incThetaHemi = appaux.UPVRobot.incThetaHemi;
                app.ExtVar.UPVRobotPostProcess.incPhiHemi = appaux.UPVRobot.incPhiHemi;
                app.ExtVar.UPVRobotPostProcess.dirR = appaux.UPVRobot.dirR;
                app.ExtVar.UPVRobotPostProcess.DirPosition = appaux.UPVRobot.DirPosition;
                app.ExtVar.UPVRobotPostProcess.DirDirection = appaux.UPVRobot.DirDirection;
                app.ExtVar.UPVRobotPostProcess.DirOri = appaux.UPVRobot.DirOri;
               app.ExtVar.UPVRobotPostProcess.DirPhiCoords = appaux.UPVRobot.DirPhiCoords;
               app.ExtVar.UPVRobotPostProcess.DirThetaCoords = appaux.UPVRobot.DirThetaCoords;
            end
            app.ExtVar.UPVRobotPostProcess.MeasureSingleTime = appaux.UPVRobot.MeasureSingleTime;
            app.ExtVar.UPVRobotPostProcess.MeasureTime = appaux.UPVRobot.MeasureTime;
            app.ExtVar.UPVRobotPostProcess.InCh = appaux.UPVRobot.InCh;
            app.ExtVar.UPVRobotPostProcess.OutCh = appaux.UPVRobot.OutCh;
            app.ExtVar.UPVRobotPostProcess.MeasureType = appaux.MeasureType;
            app.ExtVar.UPVRobotPostProcess.Averages = appaux.Averages;
            app.ExtVar.UPVRobotPostProcess.SampleRate = appaux.SampleRate;
            app.ExtVar.UPVRobotPostProcess.SamplesPerFrame = appaux.SamplesPerFrame;
            app.ExtVar.UPVRobotPostProcess.Device = appaux.Device;
            app.ExtVar.UPVRobotPostProcess.BitDepth = appaux.BitDepth;
            app.ExtVar.UPVRobotPostProcess.Sensitivity = appaux.Sensitivity;
            app.ExtVar.UPVRobotPostProcess.SensitivityIsMeasured = appaux.SensitivityIsMeasured;
            app.ExtVar.UPVRobotPostProcess.Latency = appaux.Latency;
            app.ExtVar.UPVRobotPostProcess.LatencyIsMeasured = appaux.LatencyIsMeasured;
            app.ExtVar.UPVRobotPostProcess.TypeSignal = appaux.TypeSignal;
            app.ExtVar.UPVRobotPostProcess.Output = appaux.UPVRobot.Output;
            app.ExtVar.UPVRobotPostProcess.SignalParameter = appaux.SignalParameter;
            app.ExtVar.UPVRobotPostProcess.c = appaux.c;
            app.ExtVar.UPVRobotPostProcess.rho = appaux.rho;
            
            app.ExtVar.UPVRobotPostProcess.XLim = [0,appaux.UPVRobot.XLen];
            app.ExtVar.UPVRobotPostProcess.YLim = [0,appaux.UPVRobot.YLen];
            app.ExtVar.UPVRobotPostProcess.ZLim = [0,appaux.UPVRobot.ZLen];
            app.ExtVar.UPVRobotPostProcess.DefaultLim = [ app.ExtVar.UPVRobotPostProcess.XLim;
                                                          app.ExtVar.UPVRobotPostProcess.YLim;
                                                          app.ExtVar.UPVRobotPostProcess.ZLim];
            
            
            % Set info
            % Hardware
            app.ExtUI.UPVRobotPostProcessMeasureDeviceInfo.Text = app.ExtVar.UPVRobotPostProcess.Device;
            app.ExtUI.UPVRobotPostProcessMeasureSampleRateInfo.Text = num2str(appaux.SampleRate,'%.0f');
            app.ExtUI.UPVRobotPostProcessMeasureSamplesPerFrameInfo.Text = num2str(appaux.SamplesPerFrame,'%.0f');
            app.ExtUI.UPVRobotPostProcessMeasureInputChInfo.Text = num2str(appaux.UPVRobot.InCh,'%.0f');
            app.ExtUI.UPVRobotPostProcessMeasureOutputChInfo.Text = num2str(appaux.UPVRobot.OutCh,'%.0f');
            app.ExtUI.UPVRobotPostProcessMeasureBitdepthInfo.Text = appaux.BitDepth;
            % Latency
            if ~isempty(appaux.Latency) && appaux.LatencyIsMeasured
                app.ExtUI.UPVRobotPostProcessMeasureLatencyInfo.Text = ['Measured: ',num2str(appaux.Latency*1000,'%.2f'),' ms'];
            else
                app.ExtUI.UPVRobotPostProcessMeasureLatencyInfo.Text = ['No (estimated: ',num2str(appaux.Latency*1000,'%.2f'),' ms)'];
            end
            
            if appaux.SensitivityIsMeasured(appaux.UPVRobot.InCh)
                app.ExtUI.UPVRobotPostProcessMeasureSensivityInfo.Text = num2str(appaux.Sensitivity(appaux.UPVRobot.InCh),'%.4f');
            else
                app.ExtUI.UPVRobotPostProcessMeasureSensivityInfo.Text  = 'Not calibrated';
            end
            % Signal
            app.ExtUI.UPVRobotPostProcessMeasureTypeSignalInfo.Text = appaux.TypeSignal;
            duration = (length(appaux.UPVRobot.Output)+1)/appaux.SampleRate;
            app.ExtUI.UPVRobotPostProcessMeasureDurationInfo.Text = sprintf('%.1f s',duration);
            app.ExtUI.UPVRobotPostProcessMeasureAveragesInfo.Text = num2str(appaux.Averages,'%d');
            % Measures
            app.ExtUI.UPVRobotPostProcessMeasureTotalInfo.Text = num2str(size(appaux.UPVRobot.MeasurePoints,1),'%d');
            app.ExtUI.UPVRobotPostProcessMeasureTypeCoordsInfo.Text = appaux.UPVRobot.CoordsType;
            app.ExtUI.UPVRobotPostProcessMeasureTimeInfo.Text = sec2str(app.ExtVar.UPVRobotPostProcess.MeasureTime);
            drawnow
            app.ExtUI.UPVRobotPostProcessMeasureinformationPanel.Visible = 'on';
            
        catch
            
            app.ExtUI.UPVRobotPostProcessRunInfo.Text = 'Measurement data contain errors.';
            app.ExtUI.UPVRobotPostProcessRunInfo.FontColor = [0.6,0,0];
            app.ExtUI.UPVRobotPostProcessProcessButton.Enable = 'off';
            
        end
        
    case 'savepostpro'
        
        % To mat
        Version = app.Version;
        SystemInfo = app.SystemInfo;
        %UPVRobotPostProcess = app.ExtVar.UPVRobotPostProcess;
        UPVRobotPostProcess.Coords = app.ExtVar.UPVRobotPostProcess.Coords;
        UPVRobotPostProcess.TimeVec = app.ExtVar.UPVRobotPostProcess.TimeVec;
        UPVRobotPostProcess.InSignal = app.ExtVar.UPVRobotPostProcess.InSignal;
        UPVRobotPostProcess.OutSignal = app.ExtVar.UPVRobotPostProcess.OutSignal;
        UPVRobotPostProcess.TimeRespType = app.ExtVar.UPVRobotPostProcess.TimeRespType;
        UPVRobotPostProcess.IRtime = app.ExtVar.UPVRobotPostProcess.IRtime;
        UPVRobotPostProcess.IRResp = app.ExtVar.UPVRobotPostProcess.IRResp;
        UPVRobotPostProcess.FreqVec = app.ExtVar.UPVRobotPostProcess.FreqVec;
        UPVRobotPostProcess.FreqResp = app.ExtVar.UPVRobotPostProcess.FreqResp;
        UPVRobotPostProcess.XLim = app.ExtVar.UPVRobotPostProcess.XLim;
        UPVRobotPostProcess.YLim = app.ExtVar.UPVRobotPostProcess.YLim;
        UPVRobotPostProcess.ZLim = app.ExtVar.UPVRobotPostProcess.ZLim;
        UPVRobotPostProcess.Mesh = app.ExtVar.UPVRobotPostProcess.Mesh;
        UPVRobotPostProcess.DefaultLim = app.ExtVar.UPVRobotPostProcess.DefaultLim;
        UPVRobotPostProcess.MeasureTime = app.ExtVar.UPVRobotPostProcess.MeasureTime;
        UPVRobotPostProcess.MeasureSingleTime = app.ExtVar.UPVRobotPostProcess.MeasureSingleTime;
        UPVRobotPostProcess.MeasureType = app.ExtVar.UPVRobotPostProcess.MeasureType;
        UPVRobotPostProcess.Averages = app.ExtVar.UPVRobotPostProcess.Averages;
        UPVRobotPostProcess.SampleRate = app.ExtVar.UPVRobotPostProcess.SampleRate;
        UPVRobotPostProcess.SamplesPerFrame = app.ExtVar.UPVRobotPostProcess.SamplesPerFrame;
        UPVRobotPostProcess.Device = app.ExtVar.UPVRobotPostProcess.Device;
        UPVRobotPostProcess.BitDepth = app.ExtVar.UPVRobotPostProcess.BitDepth;
        UPVRobotPostProcess.Sensitivity = app.ExtVar.UPVRobotPostProcess.Sensitivity;
        UPVRobotPostProcess.SensitivityIsMeasured = app.ExtVar.UPVRobotPostProcess.SensitivityIsMeasured;
        UPVRobotPostProcess.InCh = app.ExtVar.UPVRobotPostProcess.InCh;
        UPVRobotPostProcess.OutCh = app.ExtVar.UPVRobotPostProcess.OutCh;
        UPVRobotPostProcess.Latency = app.ExtVar.UPVRobotPostProcess.Latency;
        UPVRobotPostProcess.LatencyIsMeasured = app.ExtVar.UPVRobotPostProcess.LatencyIsMeasured;
        UPVRobotPostProcess.TypeSignal = app.ExtVar.UPVRobotPostProcess.TypeSignal;
        UPVRobotPostProcess.Output = app.ExtVar.UPVRobotPostProcess.Output;
        UPVRobotPostProcess.SignalParameter = app.ExtVar.UPVRobotPostProcess.SignalParameter;
        UPVRobotPostProcess.c = app.ExtVar.UPVRobotPostProcess.c;
        UPVRobotPostProcess.rho = app.ExtVar.UPVRobotPostProcess.rho;
        
        save([app.ExtVar.UPVRobotPostProcess.FolderPath,filesep,'Postprocess Data',filesep,'postprocess.dat'],'Version','SystemInfo','UPVRobotPostProcess','-mat','-v7.3','-nocompression');
end





