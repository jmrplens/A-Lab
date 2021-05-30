function UPVRobotPostProcessClippingCalc(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

if app.ExtVar.UPVRobotPostProcess.ClippingCheck
    
    
    % Signal Input
    mat = app.ExtVar.UPVRobotPostProcess.InSignal;
    
    % Get signal from selected points and calculate FR
    idxP = app.ExtVar.UPVRobotPostProcess.SelectedPoints;
    % Max available value ( 1 / sensitivity)
    if isfield(app.ExtVar.UPVRobotPostProcess.Sensitivity,sprintf('In%d',app.ExtVar.UPVRobotPostProcess.InCh))
        eval(sprintf('Val = 1 /  app.ExtVar.UPVRobotPostProcess.Sensitivity.In%d;',app.ExtVar.UPVRobotPostProcess.InCh)) % 1 / sens
    else
        Val = 1;
    end
    maxlen = app.ExtVar.UPVRobotPostProcess.SampleRate*0.05;
    Clipping = false(numel(idxP),1);
    switch app.ExtVar.UPVRobotPostProcess.Multicore
        
        case 0 % Single core
            for i = 1:numel(idxP)
                S = readmat(mat,idxP(i));
                % Index where audio clipping
                idxclip = find(round(abs(S),20)>=Val); % Find values (rounded with 20 decimals) are equal to max
                % If there are more than 5% of values equal to max, the signal has clipping
                if numel(idxclip) > maxlen
                    Clipping(i) = true;
                end
            end
            
        case 1 % multicore
            parfor i = 1:numel(idxP)
                S = readmat(mat,idxP(i));
                % Index where audio clipping
                idxclip = find(round(abs(S),20)>=Val); % Find values (rounded with 20 decimals) are equal to max
                % If there are more than 5% of values equal to max, the signal has clipping
                if numel(idxclip) > maxlen
                    Clipping(i) = true;
                end
            end
    end
    
    % Clipping
    app.ExtVar.UPVRobotPostProcess.Clipping = Clipping;
    
    
    
else
    app.ExtVar.UPVRobotPostProcess.Clipping = [];
end

function S = readmat(mat,idxP)
S = mat.Data(:,idxP);