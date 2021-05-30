function createLeftPanelAeroacoustics(app)

% Configure Column
column = leftGrid(app,{'1x'},{'1x'});

% Create AeroacousticsLeftPanel
app.ExtUI.AeroacousticsLeftPanel = uipanel(column);
app.ExtUI.AeroacousticsLeftPanel.BorderType = 'none';
app.ExtUI.AeroacousticsLeftPanel.TitlePosition = 'centertop';
app.ExtUI.AeroacousticsLeftPanel.Title = 'General';
app.ExtUI.AeroacousticsLeftPanel.BackgroundColor = [1 1 1];
app.ExtUI.AeroacousticsLeftPanel.Layout.Row = 1;
app.ExtUI.AeroacousticsLeftPanel.Layout.Column = 1;
app.ExtUI.AeroacousticsLeftPanel.FontWeight = 'bold';
app.ExtUI.AeroacousticsLeftPanel.FontSize = 14;

% Create GridAeroacousticsLeftPanel
app.ExtUI.GridAeroacousticsLeftPanel = uigridlayout(app.ExtUI.AeroacousticsLeftPanel);
app.ExtUI.GridAeroacousticsLeftPanel.ColumnWidth = {'1x'};
app.ExtUI.GridAeroacousticsLeftPanel.RowHeight = {'1x', 'fit', 'fit'};
app.ExtUI.GridAeroacousticsLeftPanel.BackgroundColor = [1 1 1];

% Create AeroacousticsFrequencyResponsePanelParam
app.ExtUI.AeroacousticsFrequencyResponsePanelParam = uipanel(app.ExtUI.GridAeroacousticsLeftPanel);
app.ExtUI.AeroacousticsFrequencyResponsePanelParam.ForegroundColor = [1 1 1];
app.ExtUI.AeroacousticsFrequencyResponsePanelParam.Title = 'Frequency Response ';
app.ExtUI.AeroacousticsFrequencyResponsePanelParam.BackgroundColor = [0 0 0];
app.ExtUI.AeroacousticsFrequencyResponsePanelParam.Layout.Row = 2;
app.ExtUI.AeroacousticsFrequencyResponsePanelParam.Layout.Column = 1;
app.ExtUI.AeroacousticsFrequencyResponsePanelParam.FontAngle = 'italic';
app.ExtUI.AeroacousticsFrequencyResponsePanelParam.FontWeight = 'bold';

% Create GridAeroacousticsFrequencyResponsePanelParam
app.ExtUI.GridAeroacousticsFrequencyResponsePanelParam = uigridlayout(app.ExtUI.AeroacousticsFrequencyResponsePanelParam);
app.ExtUI.GridAeroacousticsFrequencyResponsePanelParam.RowHeight = {'fit', 'fit', 'fit', 'fit'};
app.ExtUI.GridAeroacousticsFrequencyResponsePanelParam.BackgroundColor = [1 1 1];

% Create WindowDropDownLabel
app.ExtUI.WindowDropDownLabel = uilabel(app.ExtUI.GridAeroacousticsFrequencyResponsePanelParam);
app.ExtUI.WindowDropDownLabel.HorizontalAlignment = 'right';
app.ExtUI.WindowDropDownLabel.WordWrap = 'on';
app.ExtUI.WindowDropDownLabel.Layout.Row = 2;
app.ExtUI.WindowDropDownLabel.Layout.Column = 1;
app.ExtUI.WindowDropDownLabel.Text = 'Window';

% Create AeroFRWindowDropDown
app.ExtUI.AeroFRWindowDropDown = uidropdown(app.ExtUI.GridAeroacousticsFrequencyResponsePanelParam);
app.ExtUI.AeroFRWindowDropDown.Items = {'Bartlett-Hann', 'Bartlett', 'Blackman', 'Blackman-Harris', 'Bohman', 'Chebyshev', 'Flat Top', 'Gaussian', 'Hamming', 'Hann', 'Kaiser', 'Nuttall''s Blackman-Harris', 'Parzen (de la Vallée-Poussin)', 'Rectangular', 'Tapered cosine', 'Triangular'};
app.ExtUI.AeroFRWindowDropDown.ValueChangedFcn = {@AeroFRvaluechanged,app};
app.ExtUI.AeroFRWindowDropDown.Layout.Row = 2;
app.ExtUI.AeroFRWindowDropDown.Layout.Column = 2;
app.ExtUI.AeroFRWindowDropDown.Value = 'Kaiser';
if ~isempty(app.ExtVar.Aeroacoustics.FRwindow)
    app.ExtUI.AeroFRWindowDropDown.Value = app.ExtVar.Aeroacoustics.FRwindow;
else
    app.ExtVar.Aeroacoustics.FRwindow = app.ExtUI.AeroFRWindowDropDown.Value;
end

% Create NumberofDFTpointsEditFieldLabel
app.ExtUI.NumberofDFTpointsEditFieldLabel = uilabel(app.ExtUI.GridAeroacousticsFrequencyResponsePanelParam);
app.ExtUI.NumberofDFTpointsEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.NumberofDFTpointsEditFieldLabel.WordWrap = 'on';
app.ExtUI.NumberofDFTpointsEditFieldLabel.Layout.Row = 1;
app.ExtUI.NumberofDFTpointsEditFieldLabel.Layout.Column = 1;
app.ExtUI.NumberofDFTpointsEditFieldLabel.Text = 'Number of DFT points';

% Create AeroFRNumberofDFTpointsEditField
app.ExtUI.AeroFRNumberofDFTpointsEditField = uieditfield(app.ExtUI.GridAeroacousticsFrequencyResponsePanelParam, 'numeric');
app.ExtUI.AeroFRNumberofDFTpointsEditField.Limits = [256 Inf];
app.ExtUI.AeroFRNumberofDFTpointsEditField.ValueChangedFcn = {@AeroFRvaluechanged,app};
app.ExtUI.AeroFRNumberofDFTpointsEditField.RoundFractionalValues = 'on';
app.ExtUI.AeroFRNumberofDFTpointsEditField.Layout.Row = 1;
app.ExtUI.AeroFRNumberofDFTpointsEditField.Layout.Column = 2;
app.ExtUI.AeroFRNumberofDFTpointsEditField.Value = 2048;
if ~isempty(app.ExtVar.Aeroacoustics.FRnDFT)
    app.ExtUI.AeroFRNumberofDFTpointsEditField.Value = app.ExtVar.Aeroacoustics.FRnDFT;
else
    app.ExtVar.Aeroacoustics.FRnDFT = app.ExtUI.AeroFRNumberofDFTpointsEditField.Value;
end

% Create WindowsizeEditFieldLabel
app.ExtUI.WindowsizeEditFieldLabel = uilabel(app.ExtUI.GridAeroacousticsFrequencyResponsePanelParam);
app.ExtUI.WindowsizeEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.WindowsizeEditFieldLabel.WordWrap = 'on';
app.ExtUI.WindowsizeEditFieldLabel.Layout.Row = 3;
app.ExtUI.WindowsizeEditFieldLabel.Layout.Column = 1;
app.ExtUI.WindowsizeEditFieldLabel.Text = 'Window size';

% Create AeroFRWindowsizeEditField
app.ExtUI.AeroFRWindowsizeEditField = uieditfield(app.ExtUI.GridAeroacousticsFrequencyResponsePanelParam, 'numeric');
app.ExtUI.AeroFRWindowsizeEditField.Limits = [64 Inf];
app.ExtUI.AeroFRWindowsizeEditField.ValueChangedFcn = {@AeroFRvaluechanged,app};
app.ExtUI.AeroFRWindowsizeEditField.Layout.Row = 3;
app.ExtUI.AeroFRWindowsizeEditField.Layout.Column = 2;
app.ExtUI.AeroFRWindowsizeEditField.Value = 256;
if ~isempty(app.ExtVar.Aeroacoustics.FRwsize)
    app.ExtUI.AeroFRWindowsizeEditField.Value = app.ExtVar.Aeroacoustics.FRwsize;
else
    app.ExtVar.Aeroacoustics.FRwsize = app.ExtUI.AeroFRWindowsizeEditField.Value;
end

% Create WindowOverlapEditFieldLabel
app.ExtUI.WindowOverlapEditFieldLabel = uilabel(app.ExtUI.GridAeroacousticsFrequencyResponsePanelParam);
app.ExtUI.WindowOverlapEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.WindowOverlapEditFieldLabel.WordWrap = 'on';
app.ExtUI.WindowOverlapEditFieldLabel.Layout.Row = 4;
app.ExtUI.WindowOverlapEditFieldLabel.Layout.Column = 1;
app.ExtUI.WindowOverlapEditFieldLabel.Text = 'Window Overlap (%)';

% Create AeroFRWindowOverlapEditField
app.ExtUI.AeroFRWindowOverlapEditField = uieditfield(app.ExtUI.GridAeroacousticsFrequencyResponsePanelParam, 'numeric');
app.ExtUI.AeroFRWindowOverlapEditField.Limits = [0 99.9];
app.ExtUI.AeroFRWindowOverlapEditField.ValueChangedFcn = {@AeroFRvaluechanged,app};
app.ExtUI.AeroFRWindowOverlapEditField.Layout.Row = 4;
app.ExtUI.AeroFRWindowOverlapEditField.Layout.Column = 2;
app.ExtUI.AeroFRWindowOverlapEditField.Value = 50;
if ~isempty(app.ExtVar.Aeroacoustics.FRwoverlap)
    app.ExtUI.AeroFRWindowOverlapEditField.Value = app.ExtVar.Aeroacoustics.FRwoverlap;
else
    app.ExtVar.Aeroacoustics.FRwoverlap = app.ExtUI.AeroFRWindowOverlapEditField.Value;
end

% Create AeroacousticsSoundPressureLevelPanelParam
app.ExtUI.AeroacousticsSoundPressureLevelPanelParam = uipanel(app.ExtUI.GridAeroacousticsLeftPanel);
app.ExtUI.AeroacousticsSoundPressureLevelPanelParam.ForegroundColor = [1 1 1];
app.ExtUI.AeroacousticsSoundPressureLevelPanelParam.Title = 'Sound Pressure Level';
app.ExtUI.AeroacousticsSoundPressureLevelPanelParam.BackgroundColor = [0 0 0];
app.ExtUI.AeroacousticsSoundPressureLevelPanelParam.Layout.Row = 3;
app.ExtUI.AeroacousticsSoundPressureLevelPanelParam.Layout.Column = 1;
app.ExtUI.AeroacousticsSoundPressureLevelPanelParam.FontAngle = 'italic';
app.ExtUI.AeroacousticsSoundPressureLevelPanelParam.FontWeight = 'bold';

% Create GridAeroacousticsSoundPressureLevelPanelParam
app.ExtUI.GridAeroacousticsSoundPressureLevelPanelParam = uigridlayout(app.ExtUI.AeroacousticsSoundPressureLevelPanelParam);
app.ExtUI.GridAeroacousticsSoundPressureLevelPanelParam.RowHeight = {'fit', 'fit', 'fit', 'fit', 'fit', 'fit', 'fit', 'fit'};
app.ExtUI.GridAeroacousticsSoundPressureLevelPanelParam.BackgroundColor = [1 1 1];

% Create BandwidthDropDownLabel
app.ExtUI.BandwidthDropDownLabel = uilabel(app.ExtUI.GridAeroacousticsSoundPressureLevelPanelParam);
app.ExtUI.BandwidthDropDownLabel.HorizontalAlignment = 'right';
app.ExtUI.BandwidthDropDownLabel.WordWrap = 'on';
app.ExtUI.BandwidthDropDownLabel.Layout.Row = 1;
app.ExtUI.BandwidthDropDownLabel.Layout.Column = 1;
app.ExtUI.BandwidthDropDownLabel.Text = 'Bandwidth';

% Create AeroSPLBandwidthDropDown
app.ExtUI.AeroSPLBandwidthDropDown = uidropdown(app.ExtUI.GridAeroacousticsSoundPressureLevelPanelParam);
app.ExtUI.AeroSPLBandwidthDropDown.Items = {'Full band', '1 octave', '2/3 octave', '1/3 octave'};
app.ExtUI.AeroSPLBandwidthDropDown.ValueChangedFcn = {@AeroSPLvaluechanged,app};
app.ExtUI.AeroSPLBandwidthDropDown.Layout.Row = 1;
app.ExtUI.AeroSPLBandwidthDropDown.Layout.Column = 2;
app.ExtUI.AeroSPLBandwidthDropDown.Value = 'Full band';
if ~isempty(app.ExtVar.Aeroacoustics.SPLbandw)
    app.ExtUI.AeroSPLBandwidthDropDown.Value = app.ExtVar.Aeroacoustics.SPLbandw;
else
    app.ExtVar.Aeroacoustics.SPLbandw = app.ExtUI.AeroSPLBandwidthDropDown.Value;
end

% Create OctaveFilterOrderSpinnerLabel
app.ExtUI.OctaveFilterOrderSpinnerLabel = uilabel(app.ExtUI.GridAeroacousticsSoundPressureLevelPanelParam);
app.ExtUI.OctaveFilterOrderSpinnerLabel.HorizontalAlignment = 'right';
app.ExtUI.OctaveFilterOrderSpinnerLabel.WordWrap = 'on';
app.ExtUI.OctaveFilterOrderSpinnerLabel.Layout.Row = 2;
app.ExtUI.OctaveFilterOrderSpinnerLabel.Layout.Column = 1;
app.ExtUI.OctaveFilterOrderSpinnerLabel.Text = 'Octave Filter Order';

% Create AeroSPLOctaveFilterOrderSpinner
app.ExtUI.AeroSPLOctaveFilterOrderSpinner = uispinner(app.ExtUI.GridAeroacousticsSoundPressureLevelPanelParam);
app.ExtUI.AeroSPLOctaveFilterOrderSpinner.Step = 2;
app.ExtUI.AeroSPLOctaveFilterOrderSpinner.ValueChangedFcn = {@AeroSPLvaluechanged,app};
app.ExtUI.AeroSPLOctaveFilterOrderSpinner.Limits = [2 Inf];
app.ExtUI.AeroSPLOctaveFilterOrderSpinner.RoundFractionalValues = 'on';
app.ExtUI.AeroSPLOctaveFilterOrderSpinner.Tooltip = {'Order of the octave filter, specified as an even integer.'};
app.ExtUI.AeroSPLOctaveFilterOrderSpinner.Layout.Row = 2;
app.ExtUI.AeroSPLOctaveFilterOrderSpinner.Layout.Column = 2;
app.ExtUI.AeroSPLOctaveFilterOrderSpinner.Value = 2;
if ~isempty(app.ExtVar.Aeroacoustics.SPLoctOrd)
    app.ExtUI.AeroSPLOctaveFilterOrderSpinner.Value = app.ExtVar.Aeroacoustics.SPLoctOrd;
else
    app.ExtVar.Aeroacoustics.SPLoctOrd = app.ExtUI.AeroSPLOctaveFilterOrderSpinner.Value;
end

% Create FrequencyWeightingDropDownLabel
app.ExtUI.FrequencyWeightingDropDownLabel = uilabel(app.ExtUI.GridAeroacousticsSoundPressureLevelPanelParam);
app.ExtUI.FrequencyWeightingDropDownLabel.HorizontalAlignment = 'right';
app.ExtUI.FrequencyWeightingDropDownLabel.WordWrap = 'on';
app.ExtUI.FrequencyWeightingDropDownLabel.Layout.Row = 3;
app.ExtUI.FrequencyWeightingDropDownLabel.Layout.Column = 1;
app.ExtUI.FrequencyWeightingDropDownLabel.Text = 'Frequency Weighting';

% Create AeroSPLFrequencyWeightingDropDown
app.ExtUI.AeroSPLFrequencyWeightingDropDown = uidropdown(app.ExtUI.GridAeroacousticsSoundPressureLevelPanelParam);
app.ExtUI.AeroSPLFrequencyWeightingDropDown.ValueChangedFcn = {@AeroSPLvaluechanged,app};
app.ExtUI.AeroSPLFrequencyWeightingDropDown.Items = {'A-weighting', 'C-weighting', 'Z-weighting'};
app.ExtUI.AeroSPLFrequencyWeightingDropDown.Tooltip = {'Frequency weighting applied to input, specified as ''A-weighting'', ''C-weighting'', or ''Z-weighting'', where Z-weighting corresponds to no weighting.'};
app.ExtUI.AeroSPLFrequencyWeightingDropDown.Layout.Row = 3;
app.ExtUI.AeroSPLFrequencyWeightingDropDown.Layout.Column = 2;
app.ExtUI.AeroSPLFrequencyWeightingDropDown.Value = 'Z-weighting';
if ~isempty(app.ExtVar.Aeroacoustics.SPLfreqw)
    app.ExtUI.AeroSPLFrequencyWeightingDropDown.Value = app.ExtVar.Aeroacoustics.SPLfreqw;
else
    app.ExtVar.Aeroacoustics.SPLfreqw = app.ExtUI.AeroSPLFrequencyWeightingDropDown.Value;
end

% Create TimeWeightingDropDownLabel
app.ExtUI.TimeWeightingDropDownLabel = uilabel(app.ExtUI.GridAeroacousticsSoundPressureLevelPanelParam);
app.ExtUI.TimeWeightingDropDownLabel.HorizontalAlignment = 'right';
app.ExtUI.TimeWeightingDropDownLabel.WordWrap = 'on';
app.ExtUI.TimeWeightingDropDownLabel.Layout.Row = 4;
app.ExtUI.TimeWeightingDropDownLabel.Layout.Column = 1;
app.ExtUI.TimeWeightingDropDownLabel.Text = 'Time Weighting';

% Create AeroSPLTimeWeightingDropDown
app.ExtUI.AeroSPLTimeWeightingDropDown = uidropdown(app.ExtUI.GridAeroacousticsSoundPressureLevelPanelParam);
app.ExtUI.AeroSPLTimeWeightingDropDown.Items = {'Fast', 'Slow'};
app.ExtUI.AeroSPLTimeWeightingDropDown.ValueChangedFcn = {@AeroSPLvaluechanged,app};
app.ExtUI.AeroSPLTimeWeightingDropDown.Tooltip = {'Time weighting, in seconds, for calculation of time-weighted sound level and maximum time-weighted sound level, specified as ''Fast'' (0.125 s) or ''Slow'' (1 s)'};
app.ExtUI.AeroSPLTimeWeightingDropDown.Layout.Row = 4;
app.ExtUI.AeroSPLTimeWeightingDropDown.Layout.Column = 2;
app.ExtUI.AeroSPLTimeWeightingDropDown.Value = 'Fast';
if ~isempty(app.ExtVar.Aeroacoustics.SPLtw)
    app.ExtUI.AeroSPLTimeWeightingDropDown.Value = app.ExtVar.Aeroacoustics.SPLtw;
else
    app.ExtVar.Aeroacoustics.SPLtw = app.ExtUI.AeroSPLTimeWeightingDropDown.Value;
end

% Create TimeIntervalsEditFieldLabel
app.ExtUI.TimeIntervalsEditFieldLabel = uilabel(app.ExtUI.GridAeroacousticsSoundPressureLevelPanelParam);
app.ExtUI.TimeIntervalsEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.TimeIntervalsEditFieldLabel.WordWrap = 'on';
app.ExtUI.TimeIntervalsEditFieldLabel.Layout.Row = 5;
app.ExtUI.TimeIntervalsEditFieldLabel.Layout.Column = 1;
app.ExtUI.TimeIntervalsEditFieldLabel.Text = 'Time Interval (s)';

% Create AeroSPLTimeIntervalsEditField
app.ExtUI.AeroSPLTimeIntervalsEditField = uieditfield(app.ExtUI.GridAeroacousticsSoundPressureLevelPanelParam, 'numeric');
app.ExtUI.AeroSPLTimeIntervalsEditField.Limits = [0.01 Inf];
app.ExtUI.AeroSPLTimeIntervalsEditField.ValueChangedFcn = {@AeroSPLvaluechanged,app};
app.ExtUI.AeroSPLTimeIntervalsEditField.Tooltip = {'Time interval, in seconds, to report equivalent-continuous, peak, and maximum time-weighted sound levels, specified as a positive scalar integer.'};
app.ExtUI.AeroSPLTimeIntervalsEditField.Layout.Row = 5;
app.ExtUI.AeroSPLTimeIntervalsEditField.Layout.Column = 2;
app.ExtUI.AeroSPLTimeIntervalsEditField.Value = 0.5;
if ~isempty(app.ExtVar.Aeroacoustics.SPLtint)
    app.ExtUI.AeroSPLTimeIntervalsEditField.Value = app.ExtVar.Aeroacoustics.SPLtint;
else
    app.ExtVar.Aeroacoustics.SPLtint = app.ExtUI.AeroSPLTimeIntervalsEditField.Value;
end


% Create AeroSPLFrequencyRangetoevaluateLabel
app.ExtUI.AeroSPLFrequencyRangetoevaluateLabel = uilabel(app.ExtUI.GridAeroacousticsSoundPressureLevelPanelParam);
app.ExtUI.AeroSPLFrequencyRangetoevaluateLabel.HorizontalAlignment = 'center';
app.ExtUI.AeroSPLFrequencyRangetoevaluateLabel.WordWrap = 'on';
app.ExtUI.AeroSPLFrequencyRangetoevaluateLabel.FontWeight = 'bold';
app.ExtUI.AeroSPLFrequencyRangetoevaluateLabel.Layout.Row = 6;
app.ExtUI.AeroSPLFrequencyRangetoevaluateLabel.Layout.Column = [1 2];
app.ExtUI.AeroSPLFrequencyRangetoevaluateLabel.Text = 'Frequency Range to evaluate';

% Create MinfrequencyHzEditFieldLabel
app.ExtUI.MinfrequencyHzEditFieldLabel = uilabel(app.ExtUI.GridAeroacousticsSoundPressureLevelPanelParam);
app.ExtUI.MinfrequencyHzEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.MinfrequencyHzEditFieldLabel.WordWrap = 'on';
app.ExtUI.MinfrequencyHzEditFieldLabel.Layout.Row = 7;
app.ExtUI.MinfrequencyHzEditFieldLabel.Layout.Column = 1;
app.ExtUI.MinfrequencyHzEditFieldLabel.Text = 'Min frequency (Hz)';

% Create AeroSPLMinfrequencyHzEditField
app.ExtUI.AeroSPLMinfrequencyHzEditField = uieditfield(app.ExtUI.GridAeroacousticsSoundPressureLevelPanelParam, 'numeric');
app.ExtUI.AeroSPLMinfrequencyHzEditField.Limits = [0 Inf];
app.ExtUI.AeroSPLMinfrequencyHzEditField.ValueChangedFcn = {@AeroSPLvaluechanged,app};
app.ExtUI.AeroSPLMinfrequencyHzEditField.RoundFractionalValues = 'on';
app.ExtUI.AeroSPLMinfrequencyHzEditField.ValueDisplayFormat = '%.0f';
app.ExtUI.AeroSPLMinfrequencyHzEditField.Tooltip = {'Frequency range of the filter bank in Hz, specified as a two-element row vector of positive monotonically increasing values. Frequency bands centered above SampleRate/2 are excluded.'};
app.ExtUI.AeroSPLMinfrequencyHzEditField.Layout.Row = 8;
app.ExtUI.AeroSPLMinfrequencyHzEditField.Layout.Column = 1;
app.ExtUI.AeroSPLMinfrequencyHzEditField.Value = 22;
if ~isempty(app.ExtVar.Aeroacoustics.SPLminf)
    app.ExtUI.AeroSPLMinfrequencyHzEditField.Value = app.ExtVar.Aeroacoustics.SPLminf;
else
    app.ExtVar.Aeroacoustics.SPLminf = app.ExtUI.AeroSPLMinfrequencyHzEditField.Value;
end

% Create MaxfrequencyHzEditFieldLabel
app.ExtUI.MaxfrequencyHzEditFieldLabel = uilabel(app.ExtUI.GridAeroacousticsSoundPressureLevelPanelParam);
app.ExtUI.MaxfrequencyHzEditFieldLabel.HorizontalAlignment = 'right';
app.ExtUI.MaxfrequencyHzEditFieldLabel.WordWrap = 'on';
app.ExtUI.MaxfrequencyHzEditFieldLabel.Layout.Row = 7;
app.ExtUI.MaxfrequencyHzEditFieldLabel.Layout.Column = 2;
app.ExtUI.MaxfrequencyHzEditFieldLabel.Text = 'Max frequency (Hz)';

% Create AeroSPLMaxfrequencyHzEditField
app.ExtUI.AeroSPLMaxfrequencyHzEditField = uieditfield(app.ExtUI.GridAeroacousticsSoundPressureLevelPanelParam, 'numeric');
app.ExtUI.AeroSPLMaxfrequencyHzEditField.Limits = [0 Inf];
app.ExtUI.AeroSPLMaxfrequencyHzEditField.ValueChangedFcn = {@AeroSPLvaluechanged,app};
app.ExtUI.AeroSPLMaxfrequencyHzEditField.RoundFractionalValues = 'on';
app.ExtUI.AeroSPLMaxfrequencyHzEditField.ValueDisplayFormat = '%.0f';
app.ExtUI.AeroSPLMaxfrequencyHzEditField.Tooltip = {'Frequency range of the filter bank in Hz, specified as a two-element row vector of positive monotonically increasing values. Frequency bands centered above SampleRate/2 are excluded.'};
app.ExtUI.AeroSPLMaxfrequencyHzEditField.Layout.Row = 8;
app.ExtUI.AeroSPLMaxfrequencyHzEditField.Layout.Column = 2;
app.ExtUI.AeroSPLMaxfrequencyHzEditField.Value = 22050;
if ~isempty(app.ExtVar.Aeroacoustics.SPLmaxf)
    app.ExtUI.AeroSPLMaxfrequencyHzEditField.Value = app.ExtVar.Aeroacoustics.SPLmaxf;
else
    app.ExtVar.Aeroacoustics.SPLmaxf = app.ExtUI.AeroSPLMaxfrequencyHzEditField.Value;
end

% Create AeroacousticsChannelsPanel
app.ExtUI.AeroacousticsChannelsPanel = uipanel(app.ExtUI.GridAeroacousticsLeftPanel);
app.ExtUI.AeroacousticsChannelsPanel.ForegroundColor = [1 1 1];
app.ExtUI.AeroacousticsChannelsPanel.Title = 'Channels';
app.ExtUI.AeroacousticsChannelsPanel.BackgroundColor = [0 0 0];
app.ExtUI.AeroacousticsChannelsPanel.Layout.Row = 1;
app.ExtUI.AeroacousticsChannelsPanel.Layout.Column = 1;
app.ExtUI.AeroacousticsChannelsPanel.FontAngle = 'italic';
app.ExtUI.AeroacousticsChannelsPanel.FontWeight = 'bold';

% Create GridAeroacousticsChannelsPanel
app.ExtUI.GridAeroacousticsChannelsPanel = uigridlayout(app.ExtUI.AeroacousticsChannelsPanel);
app.ExtUI.GridAeroacousticsChannelsPanel.ColumnWidth = {'1x','1x','1x','1x'};
app.ExtUI.GridAeroacousticsChannelsPanel.RowHeight = {'fit', 'fit', '1x'};
app.ExtUI.GridAeroacousticsChannelsPanel.BackgroundColor = [1 1 1];

% Create OutputChannelDropDownLabel
app.ExtUI.OutputChannelDropDownLabel = uilabel(app.ExtUI.GridAeroacousticsChannelsPanel);
app.ExtUI.OutputChannelDropDownLabel.HorizontalAlignment = 'right';
app.ExtUI.OutputChannelDropDownLabel.Layout.Row = 1;
app.ExtUI.OutputChannelDropDownLabel.Layout.Column = [1,2];
app.ExtUI.OutputChannelDropDownLabel.Text = 'Output Channel';

% Get available channels
[Nin,Nout] = getAvailableChannels(app);

% Create AeroacousticsOutputChannelDropDown
app.ExtUI.AeroacousticsOutputChannelDropDown = uidropdown(app.ExtUI.GridAeroacousticsChannelsPanel);
app.ExtUI.AeroacousticsOutputChannelDropDown.Items = string(1:Nout);
app.ExtUI.AeroacousticsOutputChannelDropDown.ValueChangedFcn = {@AeroOutputChannelChange,app};
app.ExtUI.AeroacousticsOutputChannelDropDown.Layout.Row = 1;
app.ExtUI.AeroacousticsOutputChannelDropDown.Layout.Column = [3,4];
app.ExtUI.AeroacousticsOutputChannelDropDown.Value = '1';
if ~isempty(app.ExtVar.Aeroacoustics.OutputChannel)
    app.ExtUI.AeroacousticsOutputChannelDropDown.Value = string(app.ExtVar.Aeroacoustics.OutputChannel);
else
    app.ExtVar.Aeroacoustics.OutputChannel = str2double(app.ExtUI.AeroacousticsOutputChannelDropDown.Value);
end

% Create AeroacousticsInputChannelsLabel
app.ExtUI.AeroacousticsInputChannelsLabel = uilabel(app.ExtUI.GridAeroacousticsChannelsPanel);
app.ExtUI.AeroacousticsInputChannelsLabel.HorizontalAlignment = 'center';
app.ExtUI.AeroacousticsInputChannelsLabel.WordWrap = 'on';
app.ExtUI.AeroacousticsInputChannelsLabel.FontWeight = 'bold';
app.ExtUI.AeroacousticsInputChannelsLabel.Layout.Row = 2;
app.ExtUI.AeroacousticsInputChannelsLabel.Layout.Column = [1 4];
app.ExtUI.AeroacousticsInputChannelsLabel.Text = 'Input Channels';



% Create AeroacousticsInputCHtable
app.ExtUI.AeroacousticsInputCHtable = uitable(app.ExtUI.GridAeroacousticsChannelsPanel);
app.ExtUI.AeroacousticsInputCHtable.ColumnName = {'Select'; 'Channel'};
app.ExtUI.AeroacousticsInputCHtable.CellEditCallback = {@AeroacousticsInputCHtableCellEdit,app};
app.ExtUI.AeroacousticsInputCHtable.ColumnWidth = {50, 'auto'};
app.ExtUI.AeroacousticsInputCHtable.ColumnEditable = [true false];
app.ExtUI.AeroacousticsInputCHtable.RowName = {};
app.ExtUI.AeroacousticsInputCHtable.Layout.Row = 3;
app.ExtUI.AeroacousticsInputCHtable.Layout.Column = [2 3];
app.ExtUI.AeroacousticsInputCHtable.Data = table(false(Nin,1),[1:Nin]');
s = uistyle('HorizontalAlignment','left');
addStyle(app.ExtUI.AeroacousticsInputCHtable,s,'column',2);

if ~isempty(app.ExtVar.Aeroacoustics.InputChannels)
    if max(app.ExtVar.Aeroacoustics.InputChannels)<=Nin
        % Load selected channels
        app.ExtUI.AeroacousticsInputCHtable.Data{app.ExtVar.Aeroacoustics.InputChannels,1} = 1;
    end
end

function AeroacousticsInputCHtableCellEdit(~,~,app)
% Save selected input channels
app.ExtVar.Aeroacoustics.InputChannels = find(app.ExtUI.AeroacousticsInputCHtable.Data{:,1}==1);

function AeroOutputChannelChange(~,~,app)
app.ExtVar.Aeroacoustics.OutputChannel = str2double(app.ExtUI.AeroacousticsOutputChannelDropDown.Value);

function AeroFRvaluechanged(~,~,app)
app.ExtVar.Aeroacoustics.FRwoverlap = app.ExtUI.AeroFRWindowOverlapEditField.Value;
app.ExtVar.Aeroacoustics.FRwsize = app.ExtUI.AeroFRWindowsizeEditField.Value;
app.ExtVar.Aeroacoustics.FRnDFT = app.ExtUI.AeroFRNumberofDFTpointsEditField.Value;
app.ExtVar.Aeroacoustics.FRwindow = app.ExtUI.AeroFRWindowDropDown.Value;

function AeroSPLvaluechanged(~,~,app)
app.ExtVar.Aeroacoustics.SPLmaxf = app.ExtUI.AeroSPLMaxfrequencyHzEditField.Value;
app.ExtVar.Aeroacoustics.SPLminf = app.ExtUI.AeroSPLMinfrequencyHzEditField.Value;
app.ExtVar.Aeroacoustics.SPLtint = app.ExtUI.AeroSPLTimeIntervalsEditField.Value;
app.ExtVar.Aeroacoustics.SPLtw = app.ExtUI.AeroSPLTimeWeightingDropDown.Value;
app.ExtVar.Aeroacoustics.SPLfreqw = app.ExtUI.AeroSPLFrequencyWeightingDropDown.Value;
app.ExtVar.Aeroacoustics.SPLoctOrd = app.ExtUI.AeroSPLOctaveFilterOrderSpinner.Value;
app.ExtVar.Aeroacoustics.SPLbandw = app.ExtUI.AeroSPLBandwidthDropDown.Value;