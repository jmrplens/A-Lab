function UPVRobotPostProcessOverallSPLCalc(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

if app.ExtVar.UPVRobotPostProcess.OverallSPLCheck
    
    switch app.ExtVar.UPVRobotPostProcess.DataSource
        
        case 'IR'
            % FR mat file
            mat = app.ExtVar.UPVRobotPostProcess.FreqResp;
            
            % Get SPL from selected points
            idxP = app.ExtVar.UPVRobotPostProcess.SelectedPoints;
            
            switch app.ExtVar.UPVRobotPostProcess.Multicore
                
                case 0 % Single core
                    Faux = mat.Data(:,1);
                    F = zeros(size(Faux,1),numel(idxP));
                    for i = 1:numel(idxP)
                        F(:,i) = readmat(mat,idxP(i));
                    end
                    
                    % Overall SPL
                    OverallSPL = 20*log10(abs(sum(F))/2e-5);
                    
                case 1 % multicore
                    OverallSPL = zeros(numel(idxP),1);
                    for i = 1:numel(idxP)
                        F = readmat(mat,idxP(i));
                        % Overall SPL
                        OverallSPL(i) = 20*log10(abs(sum(F))/2e-5);
                    end
            end
            app.ExtVar.UPVRobotPostProcess.OverallSPL = OverallSPL;
            
        case 'Input'
            % Signal Input
            mat = app.ExtVar.UPVRobotPostProcess.InSignal;
            
            % Get signal from selected points and calculate FR
            idxP = app.ExtVar.UPVRobotPostProcess.SelectedPoints;
            
            switch app.ExtVar.UPVRobotPostProcess.Multicore
                
                case 0 % Single core
                    S = mat.Data(:,idxP(1));
                    L = length(S);
                    F = zeros(round(L/2)+1,numel(idxP));
                    for i = 1:numel(idxP)
                        S = readmat(mat,idxP(i));
                        Faux = fft(S);
                        F(:,i) = 2*abs(Faux(1:round(L/2)+1)/L);
                    end
                    
                    % Overall SPL
                    OverallSPL = 20*log10(sum(F)/2e-5);
                    
                case 1 % multicore
                    S = mat.Data(:,idxP(1));
                    L = length(S);
                    OverallSPL = zeros(numel(idxP),1);
                    for i = 1:numel(idxP)
                        S = readmat(mat,idxP(i));
                        Faux = fft(S);
                        F = 2*abs(Faux(1:round(L/2)+1)/L);
                        OverallSPL(i) = 20*log10(sum(F)/2e-5);
                    end
                    
            end
            app.ExtVar.UPVRobotPostProcess.OverallSPL = OverallSPL;
            
    end
    
else
    app.ExtVar.UPVRobotPostProcess.OverallSPL = [];
end

function F = readmat(mat,idxP)
F = mat.Data(:,idxP);