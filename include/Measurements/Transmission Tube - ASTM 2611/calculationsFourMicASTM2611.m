function calculationsFourMicASTM2611(~,~,app)
% This function performs the calculations indicated in the standard ASTM 2611-19
%
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% ===================================================================
% General parameters

% Sound speed (m/s) (ASTM 2611-19, equation (4))
c = app.c;
% Air density (kg/m3) (ASTM 2611-19, equation (5))
rho = app.rho;

% ===================================================================
% Material type
isSymmetrical = app.ExtVar.ImpedanceTubeFourMic.Symmetrical;

% ===================================================================
% If calibrate data available
Calibrated = 0;
if app.ExtVar.ImpedanceTubeFourMic.Calibrated
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

% Measure signals
fs   = app.ExtVar.ImpedanceTubeFourMic.SampleRate;
S1a   = app.ExtVar.ImpedanceTubeFourMic.Mic1a;
S2a   = app.ExtVar.ImpedanceTubeFourMic.Mic2a;
S3a   = app.ExtVar.ImpedanceTubeFourMic.Mic3a;
S4a   = app.ExtVar.ImpedanceTubeFourMic.Mic4a;
excitation1a = app.ExtVar.ImpedanceTubeFourMic.Output1a;
excitation2a = app.ExtVar.ImpedanceTubeFourMic.Output2a;
excitation3a = app.ExtVar.ImpedanceTubeFourMic.Output3a;
excitation4a = app.ExtVar.ImpedanceTubeFourMic.Output4a;
if ~isSymmetrical
    S1b   = app.ExtVar.ImpedanceTubeFourMic.Mic1b;
    S2b   = app.ExtVar.ImpedanceTubeFourMic.Mic2b;
    S3b   = app.ExtVar.ImpedanceTubeFourMic.Mic3b;
    S4b   = app.ExtVar.ImpedanceTubeFourMic.Mic4b;
    excitation1b = app.ExtVar.ImpedanceTubeFourMic.Output1b;
    excitation2b = app.ExtVar.ImpedanceTubeFourMic.Output2b;
    excitation3b = app.ExtVar.ImpedanceTubeFourMic.Output3b;
    excitation4b = app.ExtVar.ImpedanceTubeFourMic.Output4b;
end

% Calibration Signals
if Calibrated
    excitationI = app.ExtVar.ImpedanceTubeFourMic.OutputI;      % Out signal in direct position
    excitationII2 = app.ExtVar.ImpedanceTubeFourMic.OutputII2;  % Out signal in 21 position
    excitationII3 = app.ExtVar.ImpedanceTubeFourMic.OutputII3;  % Out signal in 31 position
    excitationII4 =  app.ExtVar.ImpedanceTubeFourMic.OutputII4; % Out signal in 41 position
    S1I = app.ExtVar.ImpedanceTubeFourMic.Mic1I;                % Input signal 1 in direct position
    S2I = app.ExtVar.ImpedanceTubeFourMic.Mic2I;                % Input signal 2 in direct position
    S3I = app.ExtVar.ImpedanceTubeFourMic.Mic3I;                % Input signal 3 in direct position
    S4I = app.ExtVar.ImpedanceTubeFourMic.Mic4I;                % Input signal 4 in direct position
    S1II2 = app.ExtVar.ImpedanceTubeFourMic.Mic1II2;            % Input signal 1 in 21 position
    S1II3 = app.ExtVar.ImpedanceTubeFourMic.Mic1II3;            % Input signal 1 in 31 position
    S1II4 = app.ExtVar.ImpedanceTubeFourMic.Mic1II4;            % Input signal 1 in 41 position
    S2II = app.ExtVar.ImpedanceTubeFourMic.Mic2II;              % Input signal 2 in 21 position
    S3II = app.ExtVar.ImpedanceTubeFourMic.Mic3II;              % Input signal 3 in 31 position
    S4II = app.ExtVar.ImpedanceTubeFourMic.Mic4II;              % Input signal 4 in 41 position
end

% ===================================================================
% Geometry parameters
d  = app.ExtVar.ImpedanceTubeFourMic.d;
t  = app.ExtVar.ImpedanceTubeFourMic.t;
l1 = app.ExtVar.ImpedanceTubeFourMic.l1;
l2 = app.ExtVar.ImpedanceTubeFourMic.l2;
s1  = app.ExtVar.ImpedanceTubeFourMic.s1;
s2  = app.ExtVar.ImpedanceTubeFourMic.s2;

% Frequency limits (ASTM 2611-19, equation (1,2))
freqMin =  0.01 * c/min(s1,s2);
switch app.ExtVar.ImpedanceTubeFourMic.Shape
    case 'Circular'
        freqMax = 0.586 * c / t;
    case 'Square'
        freqMax = 0.50 * c / t;
end

% ===================================================================
% Calculate the necessary transfer functions

nfft = app.ExtVar.ImpedanceTubeFourMic.FFTRes;

% ========================
% From calibration
if Calibrated
    % Direct position
    irS1I  = impzest(excitationI,S1I);
    irS2I  = impzest(excitationI,S2I);
    irS3I  = impzest(excitationI,S3I);
    irS4I  = impzest(excitationI,S4I);
    % Swapped position
    irS1II2 = impzest(excitationII2,S1II2);
    irS1II3 = impzest(excitationII3,S1II3);
    irS1II4 = impzest(excitationII4,S1II4);
    irS2II = impzest(excitationII2,S2II);
    irS3II = impzest(excitationII3,S3II);
    irS4II = impzest(excitationII4,S4II);
    
    % Frequency response
    [H1I,freqc]  = freqz(irS1I,1,nfft,fs); %#ok<ASGLU>
    H2I  = freqz(irS2I,1,nfft,fs);
    H3I  = freqz(irS3I,1,nfft,fs);
    H4I  = freqz(irS4I,1,nfft,fs);
    
    H1II2  = freqz(irS1II2,1,nfft,fs);
    H1II3  = freqz(irS1II3,1,nfft,fs);
    H1II4  = freqz(irS1II4,1,nfft,fs);
    H2II  = freqz(irS2II,1,nfft,fs);
    H3II  = freqz(irS3II,1,nfft,fs);
    H4II  = freqz(irS4II,1,nfft,fs);
    
    % Correction transfer function
    H12I = H1I ./ H2I;
    H12II = H1II2 ./ H2II;
    Hc2 = (H12I .* H12II).^0.5;
    
    H13I = H1I ./ H3I;
    H13II = H1II3 ./ H3II;
    Hc3 = (H13I .* H13II).^0.5;
    
    H14I = H1I ./ H4I;
    H14II = H1II4 ./ H4II;
    Hc4 = (H14I .* H14II).^0.5;
    
end

% ========================
% From measure
% Impulse response
irS1a  = impzest(excitation1a,S1a);
irS2a  = impzest(excitation2a,S2a);
irS3a  = impzest(excitation3a,S3a);
irS4a  = impzest(excitation4a,S4a);
if ~isSymmetrical
    irS1b  = impzest(excitation1b,S1b);
    irS2b  = impzest(excitation2b,S2b);
    irS3b  = impzest(excitation3b,S3b);
    irS4b  = impzest(excitation4b,S4b);
end
% Frequency response
[H1au,freq]  = freqz(irS1a,1,nfft,fs);
H2au  = freqz(irS2a,1,nfft,fs);
H3au  = freqz(irS3a,1,nfft,fs);
H4au  = freqz(irS4a,1,nfft,fs);
% 
% Calibrate
if Calibrated
    H2au = H2au./Hc2;
    H3au = H3au./Hc3;
    H4au = H4au./Hc4;
end

% Correct transfer functions
H1a = H1au./H1au; % = 1
H2a = H2au./H1au;
H3a = H3au./H1au;
H4a = H4au./H1au;
if ~isSymmetrical
    H1bu  = freqz(irS1b,1,nfft,fs);
    H2bu  = freqz(irS2b,1,nfft,fs);
    H3bu  = freqz(irS3b,1,nfft,fs);
    H4bu  = freqz(irS4b,1,nfft,fs);
    
    % Calibrate
    if Calibrated
        H2bu = H2bu./Hc2;
        H3bu = H3bu./Hc3;
        H4bu = H4bu./Hc4;
    end
    
    H1b = H1bu./H1bu;
    H2b = H2bu./H1bu;
    H3b = H3bu./H1bu;
    H4b = H4bu./H1bu;
    
end
% Wave number
k  = (2*pi*freq/c);

% Wave fields and Transfer Matrix (ASTM 2611-19, equation (17,18,19,20,21,22))
ls1 = l1+s1;
ls2 = l2+s2;

Aa = 1j * (H1a.*exp(-1j*k*l1) - H2a.*exp(-1j*k*ls1)) ./ (2*sin(k*s1));
Ba = 1j * (H2a.*exp(1j*k*ls1) - H1a.*exp(1j*k*l1))   ./ (2*sin(k*s1));
Ca = 1j * (H3a.*exp(1j*k*ls2) - H4a.*exp(1j*k*l2))   ./ (2*sin(k*s2));
Da = 1j * (H4a.*exp(-1j*k*l2) - H3a.*exp(-1j*k*ls2)) ./ (2*sin(k*s2));

p0a = Aa+Ba;
u0a = (Aa-Ba) / (rho*c);
pda = Ca .* exp(-1j*k*d)+Da.*exp(1j*k*d);
uda = (Ca .* exp(-1j*k*d) - Da .* exp(1j*k*d)) / (rho*c);

if isSymmetrical
    T11 = (pda.*uda + p0a.*u0a) ./ (p0a.*uda + pda.*u0a);
    T12 = (p0a.^2 - pda.^2) ./ (p0a.*uda + pda.*u0a);
    T21 = (u0a.^2 - uda.^2) ./ (p0a.*uda + pda.*u0a);
    T22 = T11;
else
    Ab = 1j * (H1b.*exp(-1j*k*l1) - H2b.*exp(-1j*k*ls1)) ./ (2*sin(k*s1));
    Bb = 1j * (H2b.*exp(1j*k*ls1) - H1b.*exp(1j*k*l1))   ./ (2*sin(k*s1));
    Cb = 1j * (H3b.*exp(1j*k*ls2) - H4b.*exp(1j*k*l2))   ./ (2*sin(k*s2));
    Db = 1j * (H4b.*exp(-1j*k*l2) - H3b.*exp(-1j*k*ls2)) ./ (2*sin(k*s2));
    
    p0b = Ab+Bb;
    u0b = (Ab-Bb)/(rho*c);
    pdb = Cb.*exp(-1j*k*d) + Db.*exp(1j*k*d);
    udb = (Cb.*exp(-1j*k*d) - Db.*exp(1j*k*d))/(rho*c);
    
    T11 = (p0a.*udb - p0b.*uda) ./ (pda.*udb - pdb.*uda);
    T12 = (p0b.*pda - p0a.*pdb) ./ (pda.*udb - pdb.*uda);
    T21 = (u0a.*udb - u0b.*uda) ./ (pda.*udb - pdb.*uda);
    T22 = (pda.*u0b - pdb.*u0a) ./ (pda.*udb - pdb.*uda);
end

% ===================================================================
% Calculate acoustic parameters

% Transmission Coefficient (ASTM 2611-19, equation (25)) (anechoic-backed)
t = 2*exp(1j*k*d) ./ (T11+(T12/(rho*c)) + (rho*c)*T21 + T22);

% Normal Incidence Transmission Loss (ASTM 2611-19, equation (26)) (anechoic-backed)
TL = -20*log10(abs(t));

% Reflection coefficient (ASTM 2611-19, equation (27)) (hard-backed)
Rrigid = (T11-(rho*c)*T21) ./ (T11+(rho*c)*T21);

% Reflection coefficient (anechoic-backed)
Ranechoic = (T11+T12/(rho*c)-rho*c*T21-T22)./(T11+T12/(rho*c)+rho*c*T21+T22);

% Absorption coefficient (ASTM 2611-19, equation (28)) (hard-backed)
alphaRigid = 1 - abs(Rrigid).^2;% - abs(t).^2;

% Absorption coefficient (anechoic-backed)
alphaAnechoic = 1 - abs(Ranechoic).^2;

% Propagation wavenumber in material (ASTM 2611-19, equation (29))
kp = 1/d * acos(T11);

% Characteristic Impedance in material (ASTM 2611-19, equation (30))
z = sqrt(T12./T21);

% ===================================================================
% Store Results
app.ExtVar.ImpedanceTubeFourMic.Transmission = t;
app.ExtVar.ImpedanceTubeFourMic.TLoss = TL;
app.ExtVar.ImpedanceTubeFourMic.ReflectionRigid = Rrigid;
app.ExtVar.ImpedanceTubeFourMic.AbsorptionRigid = alphaRigid;
app.ExtVar.ImpedanceTubeFourMic.ReflectionAnechoic = Ranechoic;
app.ExtVar.ImpedanceTubeFourMic.AbsorptionAnechoic = alphaAnechoic;
app.ExtVar.ImpedanceTubeFourMic.PropWave = kp;
app.ExtVar.ImpedanceTubeFourMic.Impedance = z;
app.ExtVar.ImpedanceTubeFourMic.IRa = [irS1a,irS2a,irS3a,irS4a];
if ~isSymmetrical
    app.ExtVar.ImpedanceTubeFourMic.IRb = [irS1b,irS2b,irS3b,irS4b];
end
app.ExtVar.ImpedanceTubeFourMic.FRa = [H1au,H2au,H3au,H4au];
if ~isSymmetrical
    app.ExtVar.ImpedanceTubeFourMic.FRb = [H1bu,H2bu,H3bu,H4bu];
end
app.ExtVar.ImpedanceTubeFourMic.FreqArray = freq;
app.ExtVar.ImpedanceTubeFourMic.FreqMin = freqMin;
app.ExtVar.ImpedanceTubeFourMic.FreqMax = freqMax;
app.ExtVar.ImpedanceTubeFourMic.T11 = T11;
app.ExtVar.ImpedanceTubeFourMic.T12 = T12;
app.ExtVar.ImpedanceTubeFourMic.T21 = T21;
app.ExtVar.ImpedanceTubeFourMic.T22 = T22;

% Create plots
CreateCenterPanelResultsFourMic(app)