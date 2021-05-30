function measureAeroacoustics(~,~,app)

% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Measuring...',...
    'Indeterminate','on');

% Refresh devices
audiodevreset;

% Generate signal
[app.ExtVar.Aeroacoustics.Output,time] = signalGenerator(app);

% Parameters
SignalOut = app.ExtVar.Aeroacoustics.Output;
OutCh = app.ExtVar.Aeroacoustics.OutputChannel;
InCh = app.ExtVar.Aeroacoustics.InputChannels;


% Measure
[Outs,Ins] = audioOutIn(app,SignalOut,OutCh,InCh,1);

close(d)

% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Processing...',...
    'Indeterminate','on');

% Store data
app.ExtVar.Aeroacoustics.TypeSignal = app.TypeSignal;
app.ExtVar.Aeroacoustics.SampleRate = app.SampleRate;
app.ExtVar.Aeroacoustics.Input = Ins;
app.ExtVar.Aeroacoustics.Output = Outs;

% Calculations
calculationsAeroacoustics(app)

% Plot parameters
plotParametersAeroacoustics(app)

close(d)