function buildUITwoMicISO105342(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% =======================================================
% Initialize if no exist
if ~isfield(app.ExtVar,'ImpedanceTubeTwoMic')
    app.ExtVar.ImpedanceTubeTwoMic = struct('TypeSignal',[],'SampleRate',[],'Output',[],'Mic1',[],'Mic2',[],'NumMics',[],...
        'OutputCh',[],'Mic1Ch',[],'Mic2Ch',[],'Calibrated',[],...
        'Shape','Circular','d',0.1,'x1',0.2,'s',0.1,...
        'Reflection',[],'Absorption',[],'Impedance',[],'FreqArray',[],'FreqMin',[],'FreqMax',[],'FR1',[],'FR2',[],'IR1',[],'IR2',[],...
        'FFTRes',[]);
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
app.ExtUI.StartmeasureButton.ButtonPushedFcn = {@calculationsTwoMicISO105342,app};
app.ExtUI.StartmeasureButton.Text = 'Calculate results';
app.ExtUI.StartmeasureButton.Enable = 'off';

% Add tube information
createPanelRightInformationTwoMic(app)

% =======================================================
% Left Column
% Delete content in left column
delete(app.LeftPanel.Children)

% Impedance Tube method
createLeftPanelTwoMicISO10534(app)

% =======================================================
% Center column
% Delete content in center column
delete(app.CenterPanel.Children)

if ~isempty(app.ExtVar.ImpedanceTubeTwoMic.Reflection)
    CreateCenterPanelResultsTwoMic(app)
end
% Check
    TwoMicCheckForCalculate(app)
    
% =======================================================
% Set measure type
app.MeasureType = 'Two-microphone (ISO 10534-2)';