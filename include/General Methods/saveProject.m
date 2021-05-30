function saveProject(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Select folder
[FileName,PathName] = uiputfile([userpath,filesep,'Project.alab'],'Select the folder to save the data');

if FileName ~= 0
    % Update userpath
    userpath(PathName);
    
    % Store
    Version = app.Version;
    SystemInfo = app.SystemInfo;
    %ExtUI = app.ExtUI;
    ExtVar = app.ExtVar;
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
    
    save([PathName,FileName],'Version','SystemInfo','ExtVar','MeasureType','Averages','Driver','Device',...
        'SampleRate','SamplesPerFrame','BitDepth','Sensitivity','SensitivityIsMeasured',...
        'Latency','LatencyIsMeasured','TypeSignal','OutSignal',...
        'InputSignal','SignalParameter','c','rho','-mat');
end