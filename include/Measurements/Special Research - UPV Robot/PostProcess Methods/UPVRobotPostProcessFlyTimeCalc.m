function UPVRobotPostProcessFlyTimeCalc(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

if app.ExtVar.UPVRobotPostProcess.FlyTimeCheck
    
    switch app.ExtVar.UPVRobotPostProcess.DataSource
        
        case 'IR'
            % Signal IR mat file
            mat = app.ExtVar.UPVRobotPostProcess.IRResp;
            fs = app.ExtVar.UPVRobotPostProcess.SampleRate;
            
            % Get signal from selected points
            idxP = app.ExtVar.UPVRobotPostProcess.SelectedPoints;
            
            switch app.ExtVar.UPVRobotPostProcess.Multicore
                
                case 0 % Single core
                    Saux = mat.Data(:,1);
                    S = zeros(size(Saux,1),numel(idxP));
                    for i = 1:numel(idxP)
                        S(:,i) = readmat(mat,idxP(i));
                    end
                    % Calculate fly time
                    [~,idxPeakP]=max(S); % Find max positive in each signal
                    [~,idxPeakN]=min(S); % Find max negative in each signal
                    idxPeak = min([idxPeakP;idxPeakN]); % Lower delay
                    FlyTime = 1/fs * idxPeak; % s
                    
                case 1 % multicore
                    FlyTime = zeros(numel(idxP),1);
                    parfor i = 1:numel(idxP)
                        S = readmat(mat,idxP(i));
                        % Calculate fly time
                        [~,idxPeakP]=max(S); % Find max positive in signal
                        [~,idxPeakN]=min(S); % Find max negative in signal
                        idxPeak = min([idxPeakP;idxPeakN]); % Lower delay
                        FlyTime(i) = 1/fs * idxPeak; % s
                    end
            end
            
        case 'Input'
            % Signal Input
            mat = app.ExtVar.UPVRobotPostProcess.InSignal;
            Out = app.ExtVar.UPVRobotPostProcess.OutSignal.Data;
            fs = app.ExtVar.UPVRobotPostProcess.SampleRate;
            
            % Get signal from selected points
            idxP = app.ExtVar.UPVRobotPostProcess.SelectedPoints;
            FlyTime = zeros(numel(idxP),1);
            switch app.ExtVar.UPVRobotPostProcess.Multicore
                
                case 0 % Single core
                    for i = 1:numel(idxP)
                        S = readmat(mat,idxP(i));
                        % Calculate fly time
                        FlyTime(i) = getLatencyFromSignals(Out,S,fs); % s
                    end
                    
                case 1 % multicore
                    % Calculate fly time
                    parfor i = 1:numel(idxP)
                        S = readmat(mat,idxP(i));
                        [cross,time] = xcorr(S,Out);
                        [~,Midx]     = max(abs(cross)); % Find peak
                        FlyTime(i)   = time(Midx)/fs;   % Latency time value in seconds
                    end
            end
    end
    
    % Calculate distance
    c = app.ExtVar.UPVRobotPostProcess.c;
    FlyDist = c .* (FlyTime); % m
    
    % Store results
    app.ExtVar.UPVRobotPostProcess.FlyDist = FlyDist; % m
    app.ExtVar.UPVRobotPostProcess.FlyTime = FlyTime*1e3; % ms
    
else
    app.ExtVar.UPVRobotPostProcess.FlyTime = [];
    app.ExtVar.UPVRobotPostProcess.FlyDist = [];
end

function S = readmat(mat,idxP)
S = mat.Data(:,idxP);