function UPVRobotPostProcessPlotDirectivity2D(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% ===========================================
% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
    'Indeterminate','on');

% ===========================================
% Points and angles for rectangular plot or frequency response plot
switch app.ExtVar.UPVRobotPostProcess.DirPlotType2D
    case 'Rectangular' % Hor and Ver
        phi = app.ExtVar.UPVRobotPostProcess.DirPhiCoords;
        theta = app.ExtVar.UPVRobotPostProcess.DirThetaCoords;
        phi = phi(:);
        theta = theta(:);
        idxP = 1:numel(phi);
    case 'Frequency' % Hor or Ver
        switch app.ExtVar.UPVRobotPostProcess.DirPolarPlane
            case 'Horizontal'
                idxP = find(app.ExtVar.UPVRobotPostProcess.DirThetaCoords==90);
                angleplot = app.ExtVar.UPVRobotPostProcess.DirPhiCoords(idxP);
            case 'Vertical'
                switch app.ExtVar.UPVRobotPostProcess.DirDirection
                    case 'Front/Back'
                        idxP = find(app.ExtVar.UPVRobotPostProcess.DirPhiCoords==-90);
                    case 'Front'
%                         if strcmp(app.ExtVar.UPVRobotPostProcess.DirectivityType,'Hemisphere')
%                             un = numel(unique(app.ExtVar.UPVRobotPostProcess.DirThetaCoords));
%                             idxP = [1;find(app.ExtVar.UPVRobotPostProcess.DirPhiCoords==0);un];
%                         else
                            idxP = find(app.ExtVar.UPVRobotPostProcess.DirPhiCoords==0);
                        %end
                end
                angleplot = app.ExtVar.UPVRobotPostProcess.DirThetaCoords(idxP);
        end
        angleplot = angleplot(:);
end

% Radius (if needed?)
%radius = app.ExtVar.UPVRobotPostProcess.dirR;

% ===========================================
% Get data
f = app.ExtVar.UPVRobotPostProcess.FreqVec.Data;
switch app.ExtVar.UPVRobotPostProcess.DirDataType
    
    case 'FFT'
        % Limit data
        switch app.ExtVar.UPVRobotPostProcess.DirPlotType2D
            case 'Rectangular' % Hor and Ver
                % Frequencies selected
                freq = app.ExtVar.UPVRobotPostProcess.DirFreq3D;
                idx = find(f>=freq,1,'first');
                fc = f(idx);
                arr = idx;
                siz = 1;
            case 'Frequency' % Hor or Ver
                idx = find(f>=24000,1,'first');
                fc = f(1:idx);
                arr = 1:idx;
                siz = numel(arr);
        end
        % Get data
        mat = app.ExtVar.UPVRobotPostProcess.FreqResp;
        % siz = size(mat.Data(:,1));
        data = zeros(siz,numel(idxP));
        switch app.ExtVar.UPVRobotPostProcess.Multicore
            case 0 % Single core
                for jj = 1:numel(idxP)
                    data(:,jj) = mat.Data(arr,idxP(jj));
                end
            case 1 % Multicore
                parfor ii = 1:numel(idxP)
                    data(:,ii) = mat.Data(arr,idxP(ii)); %#ok<PFBNS>
                end
        end
        
    case '3rd Octave'
        % Limit data
        switch app.ExtVar.UPVRobotPostProcess.DirPlotType2D
            case 'Rectangular' % Hor and Ver
                % Frequencies selected
                freq = app.ExtVar.UPVRobotPostProcess.DirFreq3D;
                fc = freq;
                mat = app.ExtVar.UPVRobotPostProcess.FreqResp;
                data = zeros(1,numel(idxP));
            case 'Frequency' % Hor or Ver
                % Get data
                mat = app.ExtVar.UPVRobotPostProcess.FreqResp;
                fc = getANSIfrequencies(3,[10,28000],false);
                data = zeros(numel(fc),numel(idxP));
                freq = [];
        end
        switch app.ExtVar.UPVRobotPostProcess.Multicore
            case 0 % Single core
                for ii = 1:numel(idxP)
                    datatemp = mat.Data(:,idxP(ii));
                    [data(:,ii),~,~,~] = FFT2octave(f,abs(datatemp),3,'',false,[10,28000],freq);
                end
            case 1 % Multicore
                parfor ii = 1:numel(idxP)
                    datatemp = mat.Data(:,idxP(ii)); %#ok<PFBNS>
                    [data(:,ii),~,~,~] = FFT2octave(f,abs(datatemp),3,'',false,[10,28000],freq);
                end
        end
end

% ===========================================
% Reference
switch app.ExtVar.UPVRobotPostProcess.DirReference
    case '20µPa'
        Pmax = 2e-5;
    case 'Relative'
        % Relative reference
        Pmax = max(abs(data),[],2);
end

% ===========================================
% Calc
switch app.ExtVar.UPVRobotPostProcess.DirUnits
    case 'dB'
        data = 20*log10(abs(data ./ Pmax));
    case 'Pa'
        data = abs(data);
end

% ===========================================
% Axes
ax = app.ExtUI.Directivity2DAxes;
try
    warning off
    cla(ax,'reset')
    warning on
catch
end

% ===========================================
% Data and plot selected type
switch app.ExtVar.UPVRobotPostProcess.DirPlotType2D
    % ======================================================================================
    case 'Rectangular' % Hor and Ver
        
        switch app.ExtVar.UPVRobotPostProcess.DirectivityType
            case 'Hor/Ver'
                
                % ===========================================
                % Find point for horizontal plane and vertical plane
                idxH = find(app.ExtVar.UPVRobotPostProcess.DirThetaCoords==90);
                switch app.ExtVar.UPVRobotPostProcess.DirDirection
                    case 'Front/Back'
                        idxV = find(app.ExtVar.UPVRobotPostProcess.DirPhiCoords==-90);
                    case 'Front'
                        idxV = find(app.ExtVar.UPVRobotPostProcess.DirPhiCoords==0);
                end
                
                % ===========================================
                % Angles
                thetau = unique(app.ExtVar.UPVRobotPostProcess.DirThetaCoords);
                phiu   = unique(app.ExtVar.UPVRobotPostProcess.DirPhiCoords);
                
                % ===========================================
                % If only Horizontal or only vertical, repeat data with 21 points
                % resolution
                if numel(idxV) == 1 % Horizontal
                    idxV = repmat(idxV,21,1);
                    thetau = linspace(0,180,21);
                end
                if numel(idxH) == 1 % Vertical
                    idxH = repmat(idxH,21,1);
                    phiu = linspace(-90,90,21);
                end
                
                % ===========================================
                % Data
                vertSlice  = data(idxV);
                horizSlice = data(idxH);
                % Sort data
                [thetau,idx] = sort(thetau);
                vertSlice = vertSlice(idx);
                [phiu,idx] = sort(phiu);
                horizSlice = horizSlice(idx);
                
                % ===========================================
                % Format data
                
                switch app.ExtVar.UPVRobotPostProcess.DirUnits
                    case 'dB'
                        % Normalize before sum
                        maxDirectivity = max(max(vertSlice),max(horizSlice));
                        vertSliceNorm  = vertSlice - maxDirectivity;
                        horizSliceNorm = horizSlice - maxDirectivity;
                        % Mesh data
                        [vertMeshLog,horizMeshLog] = meshgrid(vertSliceNorm,horizSliceNorm);
                        % Combine Vertical and Horizontal data
                        data = vertMeshLog + horizMeshLog;
                        % Rescale magnitude
                        Mag  = data + maxDirectivity;
                    case 'Pa'
                        % Normalize before sum
                        maxDirectivity = max(max(vertSlice),max(horizSlice));
                        vertSliceNorm  = vertSlice / maxDirectivity;
                        horizSliceNorm = horizSlice / maxDirectivity;
                        % Mesh data
                        [vertMeshLog,horizMeshLog] = meshgrid(vertSliceNorm,horizSliceNorm);
                        % Combine Vertical and Horizontal data
                        data = vertMeshLog + horizMeshLog;
                        % Rescale magnitude
                        Mag  = data * maxDirectivity;
                end
                
                
                
                % Mesh angles
                [theta,phi] = meshgrid(thetau, phiu);
                
                % Reshape data
                Mag = reshape(Mag,length(phiu),length(thetau));
                
            case 'Hemisphere'
                % Search and copy data (single points on top and bottom) for decompose polar to cartesian
                tn = numel(unique(theta))-1;
                pn = numel(unique(phi))-1;
                
                % Top point
                idx1 = find(phi==-90 & theta==0);
                % Bottom point
                idx2 = find(phi==-90 & theta==180);
                % Copy data
                theta = [theta;ones(tn,1)*theta(idx1);ones(pn,1)*theta(idx2)];
                phi = [phi;ones(tn,1)*phi(idx1);ones(pn,1)*phi(idx2)];
                data = [data,ones(1,tn)*data(idx1),ones(1,pn)*data(idx2)];
                
                % Unique values for theta and phi and length
                thetaplot = unique(theta,'sorted');
                phiplot = unique(phi,'sorted');
                Ltheta = length(thetaplot);
                Lphi = length(phiplot);
                
                % Sort data
                phithetacomb = [phi, theta];
                [~,idx] = sortrows(phithetacomb,2);
                Magtmp  = data(idx);
                Mag = reshape(Magtmp,[Lphi, Ltheta]);
                % Mesh angles for surf plot
                [theta,phi] = meshgrid(thetaplot, phiplot);
        end
        
         % If Force 360, Theta angle max = 360, Phi max = 180
        if app.ExtVar.UPVRobotPostProcess.Dir360
                phi = [flipud(-phi(2:end,:)+min(phi));(phi-min(phi))];
                theta = [flipud(theta(2:end,:));(theta)];
                Mag = [flipud(Mag(2:end,:));Mag];
        end
        
        % ===========================================
        % Smooth
        if app.ExtVar.UPVRobotPostProcess.DirSmooth
            % Level
            lev = app.ExtVar.UPVRobotPostProcess.DirSmoothLev;
            % Size
            ny = min(size(theta));
            nx = min(size(phi));
            n = min([nx,ny]);
            sz = round(lev/100 * n);
            % Filter
            Mag = conv2(Mag, ones(sz)/(sz^2), 'same');
        end
        
        % ===========================================
        % Plot
        hold(ax,'on');
            pcolor(ax,phi,theta,Mag)
        
        % Settings
        colormap(ax,jet(256));
        ylabel(ax,'Theta (degree)');
        xlabel(ax,'Phi (degree)');
        ytickformat(ax,'degrees')
        xtickformat(ax,'degrees')
        c = colorbar(ax);
        if app.ExtVar.UPVRobotPostProcess.Dir360
            xticks(ax,-180:30:180);
            xlim(ax,[-180,180])
        else
            xticks(ax,-90:30:90);
            xlim(ax,[-90,90])
        end
        ylim(ax,[0,180])
        yticks(ax,0:30:180);
        
        switch app.ExtVar.UPVRobotPostProcess.DirUnits
            case 'dB'
                switch app.ExtVar.UPVRobotPostProcess.DirReference
                    case '20µPa'
                        ylabel(c, 'SPL [dB] (ref. 20\muPa)');
                    case 'Relative'
                        ylabel(c, 'SPL [dB] (dBFS)');
                end
            case 'Pa'
                ylabel(c, 'Pressure [Pa]');
        end
        
        if app.ExtVar.UPVRobotPostProcess.DirRangeAuto
            app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMinField.Value = round(c.Limits(1),1);
            app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMaxField.Value = round(c.Limits(2),1);
        else
            Min = app.ExtVar.UPVRobotPostProcess.DirMinRange;
            Max = app.ExtVar.UPVRobotPostProcess.DirMaxRange;
            caxis(ax,[Min,Max])
        end
        switch app.ExtVar.UPVRobotPostProcess.DirDataType
            case 'FFT'
                title(ax,['From linear FFT - ',num2str(freq,'%.0f'),' Hz'])
            case '3rd Octave'
                title(ax,['From third-band octave - ',num2str(freq,'%.0f'),' Hz'])
        end
        % Other Settings
        shading(ax,'interp')
        set(ax, 'Ydir', 'reverse')
        grid(ax,'off');
        hold(ax,'off');
        axis(ax,'tight')
        axis(ax,'equal')
        box(ax,'on')
        set(ax,'layer','top')
        set(ax,'LineWidth',0.7)
        
        % ======================================================================================
    case 'Frequency'
        
        % ===========================================
         % Mesh X,Y data
        [F,THE] = meshgrid(fc,angleplot);
        
        % ===========================================
         % If Force 360, Theta angle max = 360, Phi max = 180
        if app.ExtVar.UPVRobotPostProcess.Dir360
            switch app.ExtVar.UPVRobotPostProcess.DirPolarPlane
                case 'Horizontal'
                    F = [flipud(F(2:end,:));(F)];
                    THE =  [flipud(-THE(2:end,:)+min(THE));(THE-min(THE))];
                    data =  [fliplr(data(:,2:end)),data];
                case 'Vertical'
                    F = [flipud(F(2:end,:));(F)];
                    THE = [THE;(THE(2:end,:)+max(THE))];
                    data = [data,fliplr(data(:,2:end))];
            end
        end
        
        % ===========================================
        % Smooth
        if app.ExtVar.UPVRobotPostProcess.DirSmooth 
            % Level
            lev = app.ExtVar.UPVRobotPostProcess.DirSmoothLev;
            % Size
            ny = min(size(F));
            nx = min(size(THE));
            n = min([nx,ny]);
            sz = round(lev/100 * n);
            % Filter
            data = conv2(data, ones(sz)/(sz^2), 'same');
        end
        
        
        % ===========================================
        % Plot
        hold(ax,'on')
        pcolor(ax,F,THE,data')
        
        % Settings
        xlabel(ax,'Frequency [Hz]')
        shading(ax,'interp')
        ax.XScale = 'log';
        xticks(ax,[50,100,200,500,1000,2000,5000,10000,20000]);
        xticklabels(ax,{'50','100','200','500','1k','2k','5k','10k','20k'})
        xlim(ax,[40,24000])
        % Plane
        switch app.ExtVar.UPVRobotPostProcess.DirPolarPlane
            case 'Horizontal'
                if app.ExtVar.UPVRobotPostProcess.Dir360
                    ylim(ax,[-180,180])
                    yticks(ax,-180:60:180);
                else
                    ylim(ax,[-90,90])
                    yticks(ax,-90:30:90);
                end
                ylabel(ax,'Phi [deg] (Horizontal)')
            case 'Vertical'
                if app.ExtVar.UPVRobotPostProcess.Dir360
                    ylim(ax,[0,360])
                    yticks(ax,0:60:360);
                else
                    ylim(ax,[0,180])
                    yticks(ax,0:30:180);
                end
                ylabel(ax,'Theta [deg] (Vertical)')
                set(ax, 'Ydir', 'reverse')
        end
        ytickformat(ax,'degrees')
        colormap(ax,jet(500))
        c = colorbar(ax);
        switch app.ExtVar.UPVRobotPostProcess.DirUnits
            
            case 'dB'
                switch app.ExtVar.UPVRobotPostProcess.DirReference
                    case '20µPa'
                        ylabel(c, 'SPL [dB] (ref. 20\muPa)');
                        if app.ExtVar.UPVRobotPostProcess.DirRangeAuto
                            app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMinField.Value = round(min(data(:)),1);
                            app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMaxField.Value = round(max(data(:)),1);
                        else
                            Min = app.ExtVar.UPVRobotPostProcess.DirMinRange;
                            Max = app.ExtVar.UPVRobotPostProcess.DirMaxRange;
                            caxis(ax,[Min,Max])
                        end
                    case 'Relative'
                        ylabel(c, 'SPL [dB] (dBFS)');
                        if app.ExtVar.UPVRobotPostProcess.DirRangeAuto
                            caxis(ax,[-40,0]);
                            app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMinField.Value = -40;
                            app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMaxField.Value = 0;
                        else
                            Min = app.ExtVar.UPVRobotPostProcess.DirMinRange;
                            Max = app.ExtVar.UPVRobotPostProcess.DirMaxRange;
                            caxis(ax,[Min,Max])
                        end
                        
                end
            case 'Pa'
                ylabel(c, 'Pressure [Pa]');
                if app.ExtVar.UPVRobotPostProcess.DirRangeAuto
                    app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMinField.Value = round(c.Limits(1),1);
                    app.ExtUI.UPVRobotPostProcessDirectivityColorRangeMaxField.Value = round(c.Limits(2),1);
                else
                    Min = app.ExtVar.UPVRobotPostProcess.DirMinRange;
                    Max = app.ExtVar.UPVRobotPostProcess.DirMaxRange;
                    caxis(ax,[Min,Max])
                end
        end
        
        switch app.ExtVar.UPVRobotPostProcess.DirDataType
            case 'FFT'
                title(ax,'From linear FFT')
            case '3rd Octave'
                title(ax,'From third-band octave')
        end
        % Other settings
        ax.PlotBoxAspectRatio = [1,0.4,1];
        box(ax,'on')
        hold(ax,'off')
        grid(ax,'off')
        set(ax,'layer','top')
        set(ax,'LineWidth',0.7)
end

% ===========================================
% % Close Loading info
drawnow
pause(0.5)
close(d)
