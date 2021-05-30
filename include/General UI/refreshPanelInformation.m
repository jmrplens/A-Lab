function refreshPanelInformation(app)
% Copyright (C) Jose M. Requena Plens
% joreple@upv.es - jmrplens.github.io

% Refresh data info
if isfield(app.ExtUI,'InfoDevice')
    % Device
    if ~isempty(app.Device)
        app.ExtUI.InfoDevice.Text = app.Device;
    else
        app.ExtUI.InfoDevice.Text = 'Undefined';
    end
    
    % Sample Rate
    if ~isempty(app.SampleRate)
        app.ExtUI.InfoSampleRate.Text = [num2str(app.SampleRate,'%d'),' Hz'];
    else
        app.ExtUI.InfoSampleRate.Text = 'Undefined';
    end
    
    % Samples per frame
    if ~isempty(app.SamplesPerFrame)
        app.ExtUI.InfoSamplesPerFrame.Text = num2str(app.SamplesPerFrame,'%d');
    else
        app.ExtUI.InfoSamplesPerFrame.Text = 'Undefined';
    end
    
    % BitDepth
    if ~isempty(app.BitDepth)
        app.ExtUI.InfoBitDepth.Text = num2str(app.BitDepth,'%d');
    else
        app.ExtUI.InfoBitDepth.Text = 'Undefined';
    end
    
    % Inputs calibrated
    if sum(app.SensitivityIsMeasured)>0
        ch = find(app.SensitivityIsMeasured==1);
        str = strjoin(string(ch),',');
        app.ExtUI.InfoInputsCalibrated.Text = sprintf('Yes. Channels: [%s]',str);
    else
        app.ExtUI.InfoInputsCalibrated.Text = 'No';
    end
    
    % Latency
    if app.LatencyIsMeasured
        app.ExtUI.InfoLatency.Text = ['Measured: ',num2str(app.Latency*1000,'%.2f'),' ms'];
    else
        app.ExtUI.InfoLatency.Text = ['No (estimated: ',num2str(app.Latency*1000,'%.2f'),' ms)'];
    end
end