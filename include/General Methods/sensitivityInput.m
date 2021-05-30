function K = sensitivityInput(app,channel,Lcal)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Calibration input duration
dur = 3; % seconds
mutesignal = zeros(dur*app.SampleRate,1);

% Record
[~,In] = audioOutIn(app,mutesignal,1,channel,0);

% Calculate
Pcal = 10^(Lcal/20) * 2e-5; 

% Trim the signal at the beginning and end to avoid unwanted noise.
cut = 0.10; % 10% trim
n = length(In);
cutn = floor(n*cut);
inis = cutn; ends = n - cutn;
lencut = ends - inis + 1;
signalcut = In(inis:ends); % Trimed signal

% Signal RMS
Xrms = sqrt(sum(signalcut.^2)/lencut); % = rms(signalcut)

% Calibration factor (V/Pa)
K = Xrms / Pcal;