function buildUIAeroacoustics(app)

% =======================================================
% Initialize if no exist
if ~isfield(app.ExtVar,'Aeroacoustics')
    app.ExtVar.Aeroacoustics = struct('TypeSignal',[],'SampleRate',[],'Output',[],'Input',[],...
        'OutputChannel',[],'InputChannels',[],...
        'FRnDFT',[],'FRwindow',[],'FRwsize',[],'FRwoverlap',[],...
        'SPLbandw',[],'SPLoctOrd',[],'SPLfreqw',[],'SPLtw',[],'SPLtint',[],'SPLminf',[],'SPLmaxf',[],...
        'IRamp',[],'IRt',[],...
        'FRh',[],'FRf',[],'FRph',[],...
        'SPLlt',[],'SPLleq',[],'SPLlpeak',[],'SPLlmax',[],'SPLf',[],...
        'correlatedmeas',[]);

end

% =======================================================
% Right Column

% Delete content in right colum
delete(app.RightPanel.Children);

createRightStandardPanel(app)

% Set available signals
app.ExtUI.SignaltypeDropDown.Items = {'Sweep','MLS','White Noise','Pink Noise','Pure tone','Custom Signal'};
app.ExtUI.SignaltypeDropDown.Value = 'White Noise';
switchSignal(app)

% Set 'Start measure' button callback
app.ExtUI.StartmeasureButton.ButtonPushedFcn = {@measureAeroacoustics,app};
app.ExtUI.StartmeasureButton.Enable = 'on';

% Add measurement type
createPanelRightMeasureType(app)

% =======================================================
% Left Column
% Delete content in left column
delete(app.LeftPanel.Children)

createLeftPanelAeroacoustics(app)

% =======================================================
% Center column
% Delete content in center column
delete(app.CenterPanel.Children)

createCenterPanelAeroacoustics(app)

% =======================================================
% Set measure type
app.MeasureType = 'Aeroacoustics';