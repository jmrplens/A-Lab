function UPVRobotPostProcessPlotDirectivityPolar(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% ===========================================
% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
    'Indeterminate','on');

% ===========================================
% Angles for plane plot
switch app.ExtVar.UPVRobotPostProcess.DirPolarPlane
    case 'Horizontal'
        idxP = find(app.ExtVar.UPVRobotPostProcess.DirThetaCoords==90);
        angleplot = app.ExtVar.UPVRobotPostProcess.DirPhiCoords(idxP);
    case 'Vertical'
        switch app.ExtVar.UPVRobotPostProcess.DirDirection
            case 'Front/Back'
                idxP = find(app.ExtVar.UPVRobotPostProcess.DirPhiCoords==-90);
            case 'Front'
%                 if strcmp(app.ExtVar.UPVRobotPostProcess.DirectivityType,'Hemisphere')
%                     un = numel(unique(app.ExtVar.UPVRobotPostProcess.DirThetaCoords));
%                     idxP = [1;find(app.ExtVar.UPVRobotPostProcess.DirPhiCoords==0);un];
%                 else
                    idxP = find(app.ExtVar.UPVRobotPostProcess.DirPhiCoords==0);
                %end
        end
        angleplot = app.ExtVar.UPVRobotPostProcess.DirThetaCoords(idxP);
        % If a measure FrontBack, in Hemisphere and Vertical plane, get data
        % from back and dont mirror
        if strcmp(app.ExtVar.UPVRobotPostProcess.DirectivityType,'Hemisphere') ...
                && strcmp(app.ExtVar.UPVRobotPostProcess.DirDirection,'Front/Back')...
                && app.ExtVar.UPVRobotPostProcess.Dir360
            idxP2 = find(app.ExtVar.UPVRobotPostProcess.DirPhiCoords==90);
            angle2 = app.ExtVar.UPVRobotPostProcess.DirThetaCoords(idxP2);
            if angle2(1)<angle2(end)
                idxP2 = flipud(idxP2);
            end
            angleplot = [angleplot;angle2+180;angleplot(1)+360];
            idxP = [idxP;idxP2;idxP(1)];
            vert360 = true; %#ok<NASGU>
        end
end
angleplot = angleplot(:);
% Sort angles
[angleplot,idx] = sort(angleplot);
idxP = idxP(idx);

% Radius (if needed?)
%radius = app.ExtVar.UPVRobotPostProcess.dirR;

% ===========================================
% Frequencies selected
freqs = app.ExtVar.UPVRobotPostProcess.DirFreqPolar;
% Locate selected frequency
f = app.ExtVar.UPVRobotPostProcess.FreqVec.Data;

% ===========================================
% Frequency response (FFT or 3rd octave
switch app.ExtVar.UPVRobotPostProcess.DirDataType
    
    case 'FFT'
        % Locate frequencies
        idxF = zeros(numel(freqs),1);
        for ii = 1:numel(freqs)
            idxF(ii) = find(f>=freqs(ii),1,'first');
        end
        % Get data
        mat = app.ExtVar.UPVRobotPostProcess.FreqResp;
        siz = size(mat.Data(:,1));
        data = zeros(siz(1),numel(idxP));
        switch app.ExtVar.UPVRobotPostProcess.Multicore
            case 0 % Single core
                for jj = 1:numel(idxP)
                    data(:,jj) = mat.Data(:,idxP(jj));
                end
                data = data(idxF,:);
            case 1 % Multicore
                parfor ii = 1:numel(idxP)
                    data(:,ii) = mat.Data(:,idxP(ii)); %#ok<PFBNS>
                end
                data = data(idxF,:);
        end
        
    case '3rd Octave'
        % Get data
        mat = app.ExtVar.UPVRobotPostProcess.FreqResp;
        data = zeros(numel(freqs),numel(idxP));
        switch app.ExtVar.UPVRobotPostProcess.Multicore
            case 0 % Single core
                for ii = 1:numel(idxP)
                    datatemp = mat.Data(:,idxP(ii));
                    [data(:,ii),~,~,~] = FFT2octave(f,abs(datatemp),3,'',false,[],freqs);
                end
            case 1 % Multicore
                parfor ii = 1:numel(idxP)
                    datatemp = mat.Data(:,idxP(ii)); %#ok<PFBNS>
                    [data(:,ii),~,~,~] = FFT2octave(f,abs(datatemp),3,'',false,[],freqs);
                end
        end
end

% ===========================================
% Rotate angles
switch app.ExtVar.UPVRobotPostProcess.DirPolarPlane
    case 'Horizontal'
        angleplot = angleplot + app.ExtVar.UPVRobotPostProcess.DirRotateHor;
    case 'Vertical'
        angleplot = angleplot + app.ExtVar.UPVRobotPostProcess.DirRotateVer;
end

% ===========================================
% Reference
switch app.ExtVar.UPVRobotPostProcess.DirReference
    case '20µPa'
        Pmax = 2e-5;
    case 'Relative'
        % Relative reference
        switch app.ExtVar.UPVRobotPostProcess.DirRefType
            case 'Angle'
                ang = app.ExtVar.UPVRobotPostProcess.DirRefAngle;
                [~,idxang] = min(abs(angleplot-ang));
                Pmax = max(abs(data(:,idxang)),[],2);
            case 'Max'
                Pmax = max(abs(data),[],2);
        end
end

% Calculous
switch app.ExtVar.UPVRobotPostProcess.DirUnits
    case 'dB'
        data = 20*log10(abs(data ./ Pmax));
    case 'Pa'
        data = abs(data);
end

% ===========================================
% Plot polar
% If Force 360, angle max = 360
if app.ExtVar.UPVRobotPostProcess.Dir360 && ~exist('vert360','var')
    data = [data(:,1:end-1),fliplr(data)];
    dif = max(angleplot)-min(angleplot);
    angleplot = [angleplot(1:end-1);angleplot+dif];
end


% ===========================================
% Smooth
if app.ExtVar.UPVRobotPostProcess.DirSmooth
    % Oversampling
    anglesmooth = linspace(min(angleplot),max(angleplot),numel(angleplot)*6);
    data = interp1(angleplot,data',anglesmooth,'pchip')';
    angleplot = anglesmooth(:);
    % Level
    lev = app.ExtVar.UPVRobotPostProcess.DirSmoothLev;
    % Smoothing
    switch app.ExtVar.UPVRobotPostProcess.Multicore
        case 0 % Single core
            for i=1:size(data,1)
                data(i,:) = smooth(angleplot,data(i,:),lev/100);
            end
        case 1 % multicore
            parfor i=1:size(data,1)
                data(i,:) = smooth(angleplot,data(i,:),lev/100);    
            end
    end
end

% ===========================================
% Axes
ax = app.ExtUI.DirectivityPolarAxes;
try
    warning off
    cla(ax,'reset')
    warning on
catch
end

% Plot
hold(ax,'on')
pp1 = polarplot(ax,deg2rad(angleplot),data,'linewidth',1.5);

hold(ax,'off')
% Setting
switch app.ExtVar.UPVRobotPostProcess.DirUnits
    case 'dB'
        switch app.ExtVar.UPVRobotPostProcess.DirReference
            case '20µPa'
                rlim(ax,[floor((min(data(:)))*0.85/10)*10 ceil((max(data(:))+1)/10)*10])
                ax.RAxis.Label.String = 'SPL [dB] (ref. 20\muPa)';
            case 'Relative'
                rlim(ax,[floor((min(data(:))-1)/10)*10 max(data(:))+1])
                ax.RAxis.Label.String = 'SPL [dB] (dBFS)';
        end
    case 'Pa'
        ax.RAxis.Label.String = 'Pressure [Pa]';
        rlim(ax,[min([min(data(:)),0])-0.05,max([max(data(:)),1])*1.03])
end
% If 360 degrees, remove R label
if app.ExtVar.UPVRobotPostProcess.Dir360 || exist('vert360','var')
    ax.RAxis.Label.String = [];
    switch app.ExtVar.UPVRobotPostProcess.DirUnits
        case 'dB'
            rtickformat(ax,'%g dB')
        case 'Pa'
            rtickformat(ax,'%g Pa')
    end
    
end

switch app.ExtVar.UPVRobotPostProcess.DirDataType
    case 'FFT'
        title(ax,'From linear FFT')
    case '3rd Octave'
        title(ax,'From third-band octave')
end
hold(ax,'off')
leg = legend(ax,append(string(freqs),' Hz'));
leg.FontSize = 11;

% Axes settings
switch app.ExtVar.UPVRobotPostProcess.DirUnits
    case 'dB'
        if mod(ax.RTick(end)-ax.RTick(1),20) == 0 && ax.RTick(end)-ax.RTick(1) > 50
            ax.RTick = ax.RTick(1):20:ax.RTick(end)+20;
        elseif mod(ax.RTick(end)-ax.RTick(1),10) == 0 && ax.RTick(end)-ax.RTick(1) > 35
            ax.RTick = ax.RTick(1):10:ax.RTick(end)+10;
            if strcmp(app.ExtVar.UPVRobotPostProcess.DirPolarPlane,'Horizontal') && numel(ax.RTick) > 6
                siz = [10,15,20,25,30,40];
                aux = 1;
                while numel(ax.RTick) > 6
                    ax.RTick = ax.RTick(1):siz(aux):ax.RTick(end)+siz(aux);
                    aux = aux+1;
                    if aux > 6; break; end
                end
            end
        elseif mod(ax.RTick(end)-ax.RTick(1),6) == 0
            ax.RTick = ax.RTick(1):6:ax.RTick(end)+6;
        elseif mod(ax.RTick(end)-ax.RTick(1),5) == 0
            ax.RTick = ax.RTick(1):5:ax.RTick(end)+5;
        elseif mod(ax.RTick(end)-ax.RTick(1),3) == 0
            ax.RTick = ax.RTick(1):3:ax.RTick(end)+3;
        end
    case 'Pa'
        if ax.RTick(end) == 1 && ax.RTick(1) == 0
            ax.RTick = ax.RTick(1):0.2:ax.RTick(end)+0.2;
        end
end

if app.ExtVar.UPVRobotPostProcess.Dir360 || exist('vert360','var')
    ax.ThetaTick = 0:15:360;
    ax.ThetaTickLabel = {'0º','15º','30º','45º','60º','75º','90º','105º','120º','135º','150º','165º','180º',...
        '-165º','-150º','-135º','-120º','-105º','-90º','-75º','-60º','-45º','-30º','-15º'};
    ax.ThetaAxis.MinorTickValues = 0:5:360;
else
    ax.ThetaLim = [min(angleplot),max(angleplot)];
    switch app.ExtVar.UPVRobotPostProcess.DirPolarPlane
        case 'Horizontal'
            ax.ThetaTick = -90:15:90;
            ax.ThetaTickLabel = {'-90º','-75º','-60º','-45º','-30º','-15º','0º','15º','30º','45º','60º','75º','90º'};
            ax.ThetaAxis.MinorTickValues = -90:5:90;
            ax.RAxisLocation = 0;
            ax.RTickLabelRotation = 0;
            ax.ThetaAxis.TickLabelRotation = 0;
        case 'Vertical'
            ax.ThetaTick = 0:15:180;
            ax.ThetaTickLabel = {'0º','15º','30º','45º','60º','75º','90º','105º','120º','135º','150º','165º','180º'};
            ax.ThetaAxis.MinorTickValues = 0:5:180;
            ax.RAxisLocation = 90;
            ax.RTickLabelRotation = 0;
            ax.ThetaAxis.TickLabelRotation = 0;
    end
end
ax.RAxis.FontSize = 10;
ax.RAxis.Label.FontSize = 11;
ax.RAxis.LineWidth = 1;
ax.ThetaZeroLocation = 'top';
ax.ThetaDir = 'clockwise';
ax.ThetaMinorGrid = 'on';
ax.ThetaAxis.FontSize = 11;
ax.ThetaAxis.LineWidth = 1;
ax.GridColor = ones(1,3)*0.15;
ax.GridAlpha = 0.5;
ax.RMinorGrid = 'off';
ax.MinorGridColor = ones(1,3)*0.15;
ax.MinorGridAlpha = 0.5;
ax.MinorGridLineStyle = ':';
ax.TickDir = 'out';
ax.TickLength = [0.01 0];
box(ax,'on')
ax.ThetaAxis.Color= [0,0,0];
ax.RAxis.Color= [0,0,0];


colors = (colorsfcn());
aux = 0;
for i = 1:numel(freqs)
    pp1(i).Color = colors(i-aux,:);
    if mod(i,size(colors,1))==0
        aux = aux + size(colors,1);
    end
end

% ===========================================
% Close Loading info
drawnow
pause(0.5)
close(d)
