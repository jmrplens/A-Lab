function loadProject(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Select file
[FileName,PathName] = uigetfile({[userpath,filesep,'*.alab']},'Select .alab file');

if FileName ~= 0
    % Update userpath
    userpath(PathName);
    
    % Load
    appaux = load([PathName,FileName],'-mat');
    
    %app.ExtUI = appaux.ExtUI;
    app.ExtVar = appaux.ExtVar;
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
    
    % After load, load the latest measure type
    switch app.MeasureType
        case 'Two-microphone (ISO 10534-2)'
            buildUITwoMicISO105342(app);
        case 'Aeroacoustics'
            buildUIAeroacoustics(app);
        case 'UPV Robot'
            buildUPVRobot(app);
        case 'Anechoic chamber (ISO 10534-2 modified)'
            buildUIAnechoicISO105342(app);
        case 'Four-microphone (ASTM 2611)'
            buildUIFourMicASTM2611(app);
    end
    
end