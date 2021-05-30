function UPVRobotPostProcessPlotFreq1DGraphics(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Axes
axFreq = app.ExtUI.UPVRobotPostProcessFreq1DSPLUIaxes;
axDist = app.ExtUI.UPVRobotPostProcessFreq1DDistanceUIaxes;

cla(axFreq,'reset')
cla(axDist,'reset')

% ===========================================
% Coords
coords = app.ExtVar.UPVRobotPostProcess.Coords;

% Selected points
idxP = app.ExtVar.UPVRobotPostProcess.SelectedPoints;


% Frequency data
switch app.ExtVar.UPVRobotPostProcess.DataSource
    
    case 'IR'
        % FR mat file
        mat = app.ExtVar.UPVRobotPostProcess.FreqResp;
        
        % Get SPL from selected points
        Faux = mat.Data(:,1);
        F = zeros(size(Faux,1),numel(idxP));
        switch app.ExtVar.UPVRobotPostProcess.Multicore
            case 0 % Single core
                for i = 1:numel(idxP)
                    F(:,i) = readmat(mat,idxP(i));
                end
                
            case 1 % multicore
                parfor i = 1:numel(idxP)
                    F(:,i) = readmat(mat,idxP(i));
                end
        end
        % Freq array
        f = app.ExtVar.UPVRobotPostProcess.FreqVec.Data;
        
    case 'Input'
        % Signal Input
        mat = app.ExtVar.UPVRobotPostProcess.InSignal;
        
        % Get signal from selected points and calculate FR
        S = mat.Data(:,idxP(1));
        L = length(S);
        Fs = app.ExtVar.UPVRobotPostProcess.SampleRate;
        nfft = Fs/2; % To get 1 Hz resolution
        F = zeros(nfft,numel(idxP));
        
        switch app.ExtVar.UPVRobotPostProcess.Multicore
            
            case 0 % Single core
                for i = 1:numel(idxP)
                    S = readmat(mat,idxP(i));
                    Faux = fft(S,2*nfft).';
                    F(:,i) = 2*abs(Faux(2:nfft+1)/L);
                end
                
            case 1 % multicore
                parfor i = 1:numel(idxP)
                    S = readmat(mat,idxP(i));
                    Faux = fft(S,2*nfft).';
                    F(:,i) = 2*abs(Faux(2:nfft+1)/L);
                end
                
        end
        % Freq array
        deltaF = Fs/2/nfft;
        f = linspace(0,Fs/2-deltaF,nfft);
        f(nfft) = Fs/2-Fs/2/nfft;
        
end

% Smooth
F = smoothdata(F,'SmoothingFactor',0.1);

% Distance
switch app.ExtVar.UPVRobotPostProcess.OriginType
    case 'Point'
        origin = coords(app.ExtVar.UPVRobotPostProcess.OriginPointIdx,:);
    case 'Coordinate'
        origin = app.ExtVar.UPVRobotPostProcess.OriginPointCoor;
end
origin = origin(:)';
dist = sqrt(sum(abs((coords(idxP,:)-origin).^2),2));
[distsort,idxD] = sort(dist); % Sort distances and get index order

% SPL at frequency selected or All frequencies
switch app.ExtVar.UPVRobotPostProcess.DistOverAll
    case 0
        FreqView = app.ExtVar.UPVRobotPostProcess.FreqView;
        idxF = find(f>=FreqView,1,'first');
        Fdist = abs(F(idxF,:));
    case 1
        switch app.ExtVar.UPVRobotPostProcess.DataSource
            
            case 'IR'
                Fdist = abs(sum(F));
            case 'Input'
                Fdist = sum(abs(F));
        end
end
SPL = 20*log10(Fdist/2e-5);
SPLsort = SPL(idxD);

% ===========================================
% Plots

% Lines color
colors = colorsfcn();

% Plot freq response
ss = semilogx(axFreq,f,20*log10(abs(F)/2e-5));
aux=0;
for i=1:numel(idxP)
    ss(i).Color = colors(i-aux,:);
    if mod(i,size(colors,1))==0
        aux = aux + size(colors,1);
    end
    
end

bands = [8,16,31.5,63,125,250,500,1000,2000,4000,8000,16000,32000];
bandsSTR = {'8','16','31.5','63','125','250','500','1k','2k','4k','8k','16k','32k'};
xticks(axFreq,bands);xticklabels(axFreq,bandsSTR)
xlim(axFreq,[6,30000])
grid(axFreq,'on')
grid(axFreq,'minor')
xlabel(axFreq,'Frequency [Hz]')
ylabel(axFreq,'SPL [dB] (ref. 20\muPa)')
title(axFreq,'Frequency Response')


% Legend
hLeg = copyobj(ss, axFreq);
set(hLeg, 'XData', NaN, 'YData', NaN, 'LineWidth', 1.5)
leg = legend(hLeg,string(idxP));
leg.ItemTokenSize = [6,5];
title(leg,'Points')
leg.Location = 'northeast';
leg.Units = 'pixels';
pos = leg.Position;
posax = axFreq.Position;
leg.Position = [posax(1)+posax(3)+1  posax(2)+posax(4)-pos(4)-3   50  pos(4)];



% Plot distance
plot(axDist,distsort,SPLsort,'k','linewidth',0.5)
hold(axDist,'on')
% Markers
colors = reshape([ss.Color],[],3);
scatter(axDist,dist,SPL,15,colors,'s','filled')
scatter(axDist,dist,SPL,100,colors,'|','linewidth',1)

grid(axDist,'on')
grid(axDist,'minor')
xlabel(axDist,'Distance [m]')

switch app.ExtVar.UPVRobotPostProcess.DistOverAll
    case 0
        ylabel(axDist,'SPL [dB] (ref. 20\muPa)')
        title(axDist,sprintf('SPL vs Distance at %.0f Hz || Origin from [%.2g, %.2g, %.2g] m',FreqView,origin(1),origin(2),origin(3)))
    case 1
        ylabel(axDist,'OASPL [dB] (ref. 20\muPa)')
        title(axDist,sprintf('SPL OverAll vs Distance || Origin from [%.2g, %.2g, %.2g] m',origin(1),origin(2),origin(3)))
end
drawnow

% Boolean to know if the selection is modified
app.ExtVar.UPVRobotPostProcess.SelectionChangedG = false;

function F = readmat(mat,idxP)
F = mat.Data(:,idxP);