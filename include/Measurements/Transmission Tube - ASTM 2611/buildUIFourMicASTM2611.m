function buildUIFourMicASTM2611(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% =======================================================
% Initialize if no exist
if ~isfield(app.ExtVar,'ImpedanceTubeFourMic')
    app.ExtVar.ImpedanceTubeFourMic = struct('TypeSignal',[],'SampleRate',[],'Symmetrical',[],...
        'Output1a',[],'Output2a',[],'Output3a',[],'Output4a',[],...
        'Mic1a',[],'Mic2a',[],'Mic3a',[],'Mic4a',[],...
        'Output1b',[],'Output2b',[],'Output3b',[],'Output4b',[],...
        'Mic1b',[],'Mic2b',[],'Mic3b',[],'Mic4b',[],...
        'OutputCh',[],'Mic1Ch',[],'Mic2Ch',[],'Mic3Ch',[],'Mic4Ch',[],...
        'Mic1I',[],'Mic2I',[],'Mic3I',[],'Mic4I',[],'OutputI',[],...
        'Mic1II2',[],'Mic1II3',[],'Mic1II4',[],'Mic2II',[],'Mic3II',[],'Mic4II',[],...
        'OutputII2',[],'OutputII3',[],'OutputII4',[],'Calibrated',false,...
        'Shape','Circular','t',0.1,'d',0.1,'l1',0.2,'l2',0.3,'s1',0.1,'s2',0.1,...
        'ReflectionRigid',[],'ReflectionAnechoic',[],'AbsorptionRigid',[],'AbsorptionAnechoic',[],'Impedance',[],'Transmission',[],'TLoss',[],'PropWave',[],...
        'IRa',[],'IRb',[],'FRa',[],'FRb',[],'FreqArray',[],'FreqMin',[],'FreqMax',[],...
        'NumMics',[],'FFTRes',[],...
        'T11',[],'T12',[],'T21',[],'T22',[]);
end

% =======================================================
% Right Column

% Delete content in right colum
delete(app.RightPanel.Children);

createRightStandardPanel(app)

% Set available signals
app.ExtUI.SignaltypeDropDown.Items = {'Sweep','MLS'};
app.ExtUI.SignaltypeDropDown.Value = 'Sweep';
switchSignal(app)

% Set 'Start measure' button callback
app.ExtUI.StartmeasureButton.ButtonPushedFcn = {@calculationsFourMicASTM2611,app};
app.ExtUI.StartmeasureButton.Text = 'Calculate results';
app.ExtUI.StartmeasureButton.Enable = 'off';

% Add tube information
createPanelRightInformationFourMic(app)

% =======================================================
% Left Column
% Delete content in left column
delete(app.LeftPanel.Children)

% Impedance Tube method
createLeftPanelFourMicASTM2611(app)

% =======================================================
% Center column
% Delete content in center column
delete(app.CenterPanel.Children)

%createFourMicASTM2611CenterPanel(app)
if ~isempty(app.ExtVar.ImpedanceTubeFourMic.ReflectionRigid)
    CreateCenterPanelResultsFourMic(app)
end
% Check
FourMicCheckForCalculate(app)

% =======================================================
% Set measure type
app.MeasureType = 'Four-microphone (ASTM 2611)';