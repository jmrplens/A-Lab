function calculationsAeroacoustics(app)

% Signals
type = app.ExtVar.Aeroacoustics.TypeSignal;
fs = app.ExtVar.Aeroacoustics.SampleRate;
Input = app.ExtVar.Aeroacoustics.Input;
Output = app.ExtVar.Aeroacoustics.Output;

%Input = [Input,Input*0.3]; % For test

% Frequency Response parameters
nfft = app.ExtVar.Aeroacoustics.FRnDFT;
winame = app.ExtVar.Aeroacoustics.FRwindow;
winsize = app.ExtVar.Aeroacoustics.FRwsize;
windo = windowGenerator(winame,winsize);
noverlapPer = app.ExtVar.Aeroacoustics.FRwoverlap;
noverlap = round(winsize*noverlapPer/100);

% Sound Pressure Level parameters
bandwidth = app.ExtVar.Aeroacoustics.SPLbandw;
octOrd = app.ExtVar.Aeroacoustics.SPLoctOrd;
freqWeight = app.ExtVar.Aeroacoustics.SPLfreqw;
timeWeight = app.ExtVar.Aeroacoustics.SPLtw;
timeInterval = app.ExtVar.Aeroacoustics.SPLtint;
minFreq = app.ExtVar.Aeroacoustics.SPLminf;
maxFreq = app.ExtVar.Aeroacoustics.SPLmaxf;


% IMPULSE RESPONSE
app.ExtVar.Aeroacoustics.IRamp = impulseResponse(type,Output,Input);
app.ExtVar.Aeroacoustics.IRt = (0:length(app.ExtVar.Aeroacoustics.IRamp)-1)'/fs;

% FREQUENCY RESPONSE
typeaux = type;
if app.ExtVar.Aeroacoustics.correlatedmeas == 0; typeaux = 'Uncorrelated'; end
[app.ExtVar.Aeroacoustics.FRh,app.ExtVar.Aeroacoustics.FRf] = ...
    frequencyResponse(Output,Input,fs,'type',typeaux,'windo',windo,'noverlap',noverlap,'nfft',nfft);

ch = app.ExtVar.Aeroacoustics.InputChannels;
for ii = 1:numel(ch) % Check each channel
    channel = ch(ii);
    if isfield(app.Sensitivity,sprintf('In%d',channel)) % Calibrated values
        %
    else % Normalized values
        H = app.ExtVar.Aeroacoustics.FRh(:,ii);
        app.ExtVar.Aeroacoustics.FRh(:,ii) = H./max(abs(H));
    end
end
app.ExtVar.Aeroacoustics.FRph = rad2deg(angle(app.ExtVar.Aeroacoustics.FRh));

% SOUND PRESSURE LEVEL
SPL = splMeter(...
    'Bandwidth',bandwidth,...
    'FrequencyRange',[minFreq,maxFreq],...
    'OctaveFilterOrder',octOrd,...
    'FrequencyWeighting',freqWeight,...
    'TimeWeighting',timeWeight,...
    'TimeInterval',timeInterval,...
    'SampleRate',fs);

[Lt,Leq,Lpeak,Lmax] = SPL(Input);

app.ExtVar.Aeroacoustics.SPLlt = reshape(max(Lt,[],1),[],size(Input,2));
app.ExtVar.Aeroacoustics.SPLleq = reshape(max(Leq,[],1),[],size(Input,2));
app.ExtVar.Aeroacoustics.SPLlpeak = reshape(max(Lpeak,[],1),[],size(Input,2));
app.ExtVar.Aeroacoustics.SPLlmax = reshape(max(Lmax,[],1),[],size(Input,2));

if strcmp(bandwidth,'Full band')
    app.ExtVar.Aeroacoustics.SPLf = [];
else
    app.ExtVar.Aeroacoustics.SPLf = getCenterFrequencies(SPL);
end

