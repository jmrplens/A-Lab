function calculationsTwoMicISO105342(~,~,app)
% This function performs the calculations indicated in the standard BS EN ISO 10534-2:2001
%
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% ===================================================================
% General parameters

% Sound speed (m/s)
c = app.c;
% Air density (kg/m3)
rho = app.rho;


% ===================================================================
% If calibrate data available
Calibrated = 0;
if app.ExtVar.ImpedanceTubeTwoMic.Calibrated && app.ExtVar.ImpedanceTubeTwoMic.NumMics==2
    msg = 'Use calibration data?';
    title = 'Calibration';
    selection = uiconfirm(app.ALabUIFigure,msg,title,...
        'Options',{'Yes, calibrate','No, without calibration'},...
        'DefaultOption',1,'CancelOption',2);
    if strcmp(selection,'Yes, calibrate')
        Calibrated = 1;
    end
end

% ===================================================================
% Signal data

% Calibration signals
if Calibrated
    fscal   = app.ExtVar.ImpedanceTubeTwoMic.Calibration.SampleRate;
    S1I = app.ExtVar.ImpedanceTubeTwoMic.Calibration.S1I; % Measurement with configuration (I)
    S2I = app.ExtVar.ImpedanceTubeTwoMic.Calibration.S2I;
    excitationI = app.ExtVar.ImpedanceTubeTwoMic.Calibration.excitationI;
    S1II = app.ExtVar.ImpedanceTubeTwoMic.Calibration.S1II; % Measurement with configuration (II)
    S2II = app.ExtVar.ImpedanceTubeTwoMic.Calibration.S2II;
    excitationII = app.ExtVar.ImpedanceTubeTwoMic.Calibration.excitationII;
end

% Measure signals (configuration (I))
fs   = app.ExtVar.ImpedanceTubeTwoMic.SampleRate;
S1   = app.ExtVar.ImpedanceTubeTwoMic.Mic1;
S2   = app.ExtVar.ImpedanceTubeTwoMic.Mic2;
excitation = app.ExtVar.ImpedanceTubeTwoMic.Output;

% ===================================================================
% Geometry parameters

d  = app.ExtVar.ImpedanceTubeTwoMic.d;
x1 = app.ExtVar.ImpedanceTubeTwoMic.x1;
s  = app.ExtVar.ImpedanceTubeTwoMic.s;

% Frequency limits
[freqMin,freqMax] = TwoMicCalculateTubeLimits(app);

% ===================================================================
% Calculate the necessary transfer functions

nfft = app.ExtVar.ImpedanceTubeTwoMic.FFTRes;

% ========================
% From calibrate data
if Calibrated
    % Impulse response
    irS1I  = impzest(excitationI,S1I);
    irS2I  = impzest(excitationI,S2I);
    irS1II = impzest(excitationII,S1II);
    irS2II = impzest(excitationII,S2II);
    % Frequency response
    H1I  = freqz(irS1I,1,nfft,fscal);
    H2I  = freqz(irS2I,1,nfft,fscal);
    H1II = freqz(irS1II,1,nfft,fscal);
    H2II = freqz(irS2II,1,nfft,fscal);
    % Transfer functions
    H12I = H1I ./ H2I;
    H12II = H1II ./ H2II;
    
    % Calibration transfer function (ISO 10534-2:2001, equation (10), page 11)
    Hc = (H12I .* H12II).^0.5;
end

% ========================
% From measure
% Impulse response
irS1  = impzest(excitation,S1);
irS2  = impzest(excitation,S2);
% Frequency response
[H1,freq]  = freqz(irS1,1,nfft,fs);
H2  = freqz(irS2,1,nfft,fs);

% Transfer function (ISO 10534-2:2001, equation (14), page 12)
H12 = H2 ./ H1;

% Transfer function corrected (ISO 10534-2:2001, equation (13), page 11)
if Calibrated
    H12 = H12 ./ Hc;
end

% Correction for tube attenuation (ISO 10534-2:2001, A.2.1.1, page 14)
if (x1-s) > 3*d
    % Attenuation constant (ISO 10534-2:2001, equation (A.18), page 17)
    switch app.ExtVar.ImpedanceTubeTwoMic.Shape
        case 'Circular'
            katen = 1.94*10^-2 * sqrt(freq) / (c*d);
        case 'Square'
            d_sq = 4*d^2;
            katen = 1.94*10^-2 * sqrt(freq) / (c*d_sq);
    end
else
    katen = 0;
end
% Complex wave number (ISO 10534-2:2001, equation (A.1), page 14)
k  = (2*pi*freq/c);
k0 = k - 1j*katen;

% Transfer function for the incident wave alone (ISO 10534-2:2001, equation (D.5), page 21)
HI = exp(-1j*k0*s);

% Transfer function for the reflected wave alone (ISO 10534-2:2001, equation (D.6), page 21)
HR = exp(1j*k0*s);

% ===================================================================
% Calculate acoustic parameters

% Reflection factor (ISO 10534-2:2001, equation (17), page 12)
r = (H12 - HI) ./ (HR - H12) .* exp(2*1j*k0*x1);
% Smoothing result
%r = smooth(freq,r);

% Sound absorption coefficient (ISO 10534-2:2001, equation (18), page 12)
alpha = 1 - abs(r).^2;

% Specific acoustic impedance (ISO 10534-2:2001, equation (19), page 12)
Z = ((1+r)./(1-r)) * rho*c;

% Store data
app.ExtVar.ImpedanceTubeTwoMic.Reflection = r;
app.ExtVar.ImpedanceTubeTwoMic.Absorption = alpha;
app.ExtVar.ImpedanceTubeTwoMic.Impedance = Z;
app.ExtVar.ImpedanceTubeTwoMic.FreqArray = freq;
app.ExtVar.ImpedanceTubeTwoMic.FreqMin = freqMin;
app.ExtVar.ImpedanceTubeTwoMic.FreqMax = freqMax;

app.ExtVar.ImpedanceTubeTwoMic.FR1 = H1;
app.ExtVar.ImpedanceTubeTwoMic.FR2 = H2;
app.ExtVar.ImpedanceTubeTwoMic.IR1 = irS1;
app.ExtVar.ImpedanceTubeTwoMic.IR2 = irS2;

% Create plots
CreateCenterPanelResultsTwoMic(app)