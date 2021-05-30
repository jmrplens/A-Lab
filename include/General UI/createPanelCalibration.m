function createPanelCalibration(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Delete content in Right column
delete(app.RightPanel.Children)

% Right column
column = rightGrid(app,{'1x'},{'fit','fit','1x','fit'});

% Create RightMainPanelCalibration
app.ExtUI.RightMainPanelCalibration = uipanel(column);
app.ExtUI.RightMainPanelCalibration.TitlePosition = 'Centertop';
app.ExtUI.RightMainPanelCalibration.Title = ['Calibrate inputs for ',app.Device];
app.ExtUI.RightMainPanelCalibration.BackgroundColor = [1 1 1];
app.ExtUI.RightMainPanelCalibration.Layout.Row = 1;
app.ExtUI.RightMainPanelCalibration.Layout.Column = 1;
app.ExtUI.RightMainPanelCalibration.FontWeight = 'bold';
app.ExtUI.RightMainPanelCalibration.FontSize = 14;
app.ExtUI.RightMainPanelCalibration.BorderType = 'none';

% Create GridRightPanelCalibration
app.ExtUI.GridRightPanelCalibration = uigridlayout(app.ExtUI.RightMainPanelCalibration);
app.ExtUI.GridRightPanelCalibration.ColumnWidth = {'fit', '1x'};
app.ExtUI.GridRightPanelCalibration.RowHeight = {'fit', 'fit', 'fit','fit'};
app.ExtUI.GridRightPanelCalibration.BackgroundColor = [1 1 1];

% Create CalibratorsignalleveldBEditFieldLabel
app.ExtUI.CalibratorsignalleveldBEditFieldLabel = uilabel(app.ExtUI.GridRightPanelCalibration);
app.ExtUI.CalibratorsignalleveldBEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.CalibratorsignalleveldBEditFieldLabel.Layout.Row = 1;
app.ExtUI.CalibratorsignalleveldBEditFieldLabel.Layout.Column = 1;
app.ExtUI.CalibratorsignalleveldBEditFieldLabel.Text = 'Calibrator signal level (dB)';
app.ExtUI.CalibratorsignalleveldBEditFieldLabel.WordWrap = 'on';

% Create CalibratorsignalleveldBEditField
app.ExtUI.CalibratorsignalleveldBEditField = uieditfield(app.ExtUI.GridRightPanelCalibration, 'numeric');
app.ExtUI.CalibratorsignalleveldBEditField.Limits = [1 Inf];
app.ExtUI.CalibratorsignalleveldBEditField.Layout.Row = 1;
app.ExtUI.CalibratorsignalleveldBEditField.Layout.Column = 2;
app.ExtUI.CalibratorsignalleveldBEditField.Value = 94;

% Create SelectchanneltocalibrateDropDownLabel
app.ExtUI.SelectchanneltocalibrateDropDownLabel = uilabel(app.ExtUI.GridRightPanelCalibration);
app.ExtUI.SelectchanneltocalibrateDropDownLabel.BackgroundColor = [1 1 1];
app.ExtUI.SelectchanneltocalibrateDropDownLabel.HorizontalAlignment = 'right';
app.ExtUI.SelectchanneltocalibrateDropDownLabel.Layout.Row = 2;
app.ExtUI.SelectchanneltocalibrateDropDownLabel.Layout.Column = 1;
app.ExtUI.SelectchanneltocalibrateDropDownLabel.Text = 'Select channel to calibrate';
app.ExtUI.SelectchanneltocalibrateDropDownLabel.WordWrap = 'on';

% Create SelectchanneltocalibrateDropDown
app.ExtUI.SelectchanneltocalibrateDropDown = uidropdown(app.ExtUI.GridRightPanelCalibration);
app.ExtUI.SelectchanneltocalibrateDropDown.ValueChangedFcn = {@selectedchannelcalibration,app};
app.ExtUI.SelectchanneltocalibrateDropDown.Items = {'1'};
app.ExtUI.SelectchanneltocalibrateDropDown.BackgroundColor = [1 1 1];
app.ExtUI.SelectchanneltocalibrateDropDown.Layout.Row = 2;
app.ExtUI.SelectchanneltocalibrateDropDown.Layout.Column = 2;
app.ExtUI.SelectchanneltocalibrateDropDown.Value = '1';

% Create CalibratechannelXButton
app.ExtUI.CalibratechannelXButton = uibutton(app.ExtUI.GridRightPanelCalibration, 'push');
app.ExtUI.CalibratechannelXButton.ButtonPushedFcn = {@CalibratechannelXButton,app};
app.ExtUI.CalibratechannelXButton.WordWrap = 'on';
app.ExtUI.CalibratechannelXButton.BackgroundColor = [1 1 1];
app.ExtUI.CalibratechannelXButton.Layout.Row = 3;
app.ExtUI.CalibratechannelXButton.Layout.Column = [1 2];
app.ExtUI.CalibratechannelXButton.Text = 'Calibrate channel 1';
app.ExtUI.SelectchanneltocalibrateDropDownLabel.WordWrap = 'on';

% Create TableCalibration
app.ExtUI.TableCalibration = uitable(app.ExtUI.GridRightPanelCalibration);
app.ExtUI.TableCalibration.ColumnName = {'Channel'; 'Calibrated'; 'Sensitivity (system)'};
app.ExtUI.TableCalibration.RowName = {};
app.ExtUI.TableCalibration.ColumnWidth = {70, 81, 135};
app.ExtUI.TableCalibration.Layout.Row = 4;
app.ExtUI.TableCalibration.Layout.Column = [1 2];

% Get available channels
[Nin,~] = getAvailableChannels(app);
app.ExtUI.SelectchanneltocalibrateDropDown.Items = string(1:Nin);

if size(app.Sensitivity,1)~=Nin
    app.Sensitivity = zeros(Nin,1);
    app.SensitivityIsMeasured = false(Nin,1);
end
    
printTableCalibrationSens(app)

end


function printTableCalibrationSens(app)
[Nin,~] = getAvailableChannels(app);
if size(app.Sensitivity,1)~=Nin
    app.Sensitivity = zeros(Nin,1);
    app.SensitivityIsMeasured = false(Nin,1);
end
% Get calibrated channels if exist
calibrated = strings(Nin,1);
value = cell(Nin,1);

for ii = 1:Nin
    if app.SensitivityIsMeasured(ii)
        calibrated(ii) = "Yes";
        value{ii} = app.Sensitivity(ii);
    else
        calibrated(ii) = "No";
        value{ii} = "[]";
    end
end
% Table
app.ExtUI.TableCalibration.Data = table([1:Nin]',calibrated,value);
% Yes format
idx = find(calibrated=="Yes");
for ii = 1:length(idx)
    s = uistyle('FontWeight','bold','FontAngle','normal','FontColor',[0,0.75,0]);
    addStyle(app.ExtUI.TableCalibration,s,'cell',[idx(ii),2])
end
% No format
idx = find(calibrated~="Yes");
for ii = 1:length(idx)
    s = uistyle('FontWeight','bold','FontAngle','italic','FontColor','r');
    addStyle(app.ExtUI.TableCalibration,s,'cell',[idx(ii),2])
end
end

function selectedchannelcalibration(~,~,app)

channel = app.ExtUI.SelectchanneltocalibrateDropDown.Value;
% Update button text
app.ExtUI.CalibratechannelXButton.Text = ['Calibrate channel ',channel];
end

function CalibratechannelXButton(~,~,app)

channel = str2double(app.ExtUI.SelectchanneltocalibrateDropDown.Value);
Lcal = app.ExtUI.CalibratorsignalleveldBEditField.Value;

% If already measured, confirm recalibration
if app.SensitivityIsMeasured(channel)
    msg = sprintf('Repeat calibration in channel %s, are you sure?',channel);
    title = 'Repeat calibration';
    selection = uiconfirm(app.ALabUIFigure,msg,title,...
        'Options',{'Yes','Cancel'},...
        'DefaultOption',2,'CancelOption',2);
    if strcmp(selection,'Cancel'); return; end
end

app.ExtUI.CalibratechannelXButton.Text = 'Calibrating, wait';
app.ExtUI.CalibratechannelXButton.Enable = 'off';
drawnow
% Calibration
K = sensitivityInput(app,channel,Lcal);

% Store data
app.Sensitivity(channel)= K;
app.SensitivityIsMeasured(channel) = true;

% Update
printTableCalibrationSens(app)

% Update button text
app.ExtUI.CalibratechannelXButton.Text = ['Calibrate channel ',num2str(channel)];
app.ExtUI.CalibratechannelXButton.Enable = 'on';

refreshPanelInformation(app)
end