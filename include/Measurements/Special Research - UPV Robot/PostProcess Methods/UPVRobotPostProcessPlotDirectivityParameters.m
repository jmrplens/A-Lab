function UPVRobotPostProcessPlotDirectivityParameters(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% ===========================================
% Loading info
d = uiprogressdlg(app.ALabUIFigure,'Title','Loading...',...
    'Indeterminate','on');

% ===========================================
% Needed data

% Horizontal
idxH = find(app.ExtVar.UPVRobotPostProcess.DirThetaCoords==90);
anglesH = app.ExtVar.UPVRobotPostProcess.DirPhiCoords(idxH);
% Sort phi
[anglesH,idx] = sort(anglesH);
idxH = idxH(idx);

% Vertical
switch app.ExtVar.UPVRobotPostProcess.DirDirection
    case 'Front/Back'
        idxV = find(app.ExtVar.UPVRobotPostProcess.DirPhiCoords==-90);
    case 'Front'
%         if strcmp(app.ExtVar.UPVRobotPostProcess.DirectivityType,'Hemisphere')
%             un = numel(unique(app.ExtVar.UPVRobotPostProcess.DirThetaCoords));
%             idxV = [1;find(app.ExtVar.UPVRobotPostProcess.DirPhiCoords==0);un];
%         else
            idxV = find(app.ExtVar.UPVRobotPostProcess.DirPhiCoords==0);
        %end
end
anglesV = app.ExtVar.UPVRobotPostProcess.DirThetaCoords(idxV);
% Sort theta
[anglesV,idx] = sort(anglesV);
idxV = idxV(idx);

% ===========================================
% Reference angle for Q, DI, Dir
switch app.ExtVar.UPVRobotPostProcess.DirDirection
    case 'Front/Back'
        angH = -90; % Front on -90 phi
        [~,idxangH] = min(abs(anglesH-angH));
        angV = 90;
        [~,idxangV] = min(abs(anglesV-angV));
    case 'Front'
        angH = 0; % Front on 0 phi
        [~,idxangH] = min(abs(anglesH-angH));
        angV = 90;
        [~,idxangV] = min(abs(anglesV-angV));
end

% ===========================================
% If Front/Back measure get index point for front and back
if strcmp(app.ExtVar.UPVRobotPostProcess.DirDirection,'Front/Back')
    % Front
    [~,Fidx] = min(abs(anglesH-(-90))); 
    % Back
    [~,Bidx] = min(abs(anglesH-(90))); 
end

% ===========================================
% Angles for plane plot
switch app.ExtVar.UPVRobotPostProcess.DirectivityType
    case 'Hor/Ver'
        incPhi = app.ExtVar.UPVRobotPostProcess.incPhi;
        incTheta = app.ExtVar.UPVRobotPostProcess.incTheta;
    case 'Hemisphere'
        incPhi = app.ExtVar.UPVRobotPostProcess.incPhiHemi;
        incTheta = app.ExtVar.UPVRobotPostProcess.incThetaHemi;
end

% To rad
anglesH = deg2rad(anglesH);
anglesV = deg2rad(anglesV);
incPhi = deg2rad(incPhi);
incTheta = deg2rad(incTheta);

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
        dataH = zeros(siz(1),numel(idxH));
        dataV = zeros(siz(1),numel(idxV));
        switch app.ExtVar.UPVRobotPostProcess.Multicore
            case 0 % Single core
                for jj = 1:numel(idxH)
                    dataH(:,jj) = mat.Data(:,idxH(jj));
                end
                dataH = dataH(idxF,:);
                for jj = 1:numel(idxV)
                    dataV(:,jj) = mat.Data(:,idxV(jj));
                end
                dataV = dataV(idxF,:);
            case 1 % Multicore
                parfor ii = 1:numel(idxH)
                    dataH(:,ii) = mat.Data(:,idxH(ii)); %#ok<PFBNS>
                end
                dataH = dataH(idxF,:);
                parfor ii = 1:numel(idxV)
                    dataV(:,ii) = mat.Data(:,idxV(ii)); %#ok<PFBNS>
                end
                dataV = dataV(idxF,:);
        end
        
    case '3rd Octave'
        % Get data
        mat = app.ExtVar.UPVRobotPostProcess.FreqResp;
        dataH = zeros(numel(freqs),numel(idxH));
        dataV = zeros(numel(freqs),numel(idxV));
        switch app.ExtVar.UPVRobotPostProcess.Multicore
            case 0 % Single core
                for ii = 1:numel(idxH)
                    datatemp = mat.Data(:,idxH(ii));
                    [dataH(:,ii),~,~,~] = FFT2octave(f,abs(datatemp),3,'',false,[],freqs);
                end
                for ii = 1:numel(idxV)
                    datatemp = mat.Data(:,idxV(ii));
                    [dataV(:,ii),~,~,~] = FFT2octave(f,abs(datatemp),3,'',false,[],freqs);
                end
            case 1 % Multicore
                parfor ii = 1:numel(idxH)
                    datatemp = mat.Data(:,idxH(ii)); %#ok<PFBNS>
                    [dataH(:,ii),~,~,~] = FFT2octave(f,abs(datatemp),3,'',false,[],freqs);
                end
                parfor ii = 1:numel(idxV)
                    datatemp = mat.Data(:,idxV(ii)); %#ok<PFBNS>
                    [dataV(:,ii),~,~,~] = FFT2octave(f,abs(datatemp),3,'',false,[],freqs);
                end
        end
end

% Max values on each freq
PmaxH = max(abs(dataH),[],2);
PmaxV = max(abs(dataV),[],2);   
        
% ===========================================
% Calc

% Directivity
DH = 20*log10(abs(dataH(:,idxangH) ./ PmaxH));
DV = 20*log10(abs(dataV(:,idxangV) ./ PmaxV));
DHS = arrayfun(@(x) num2str(round(x,2), '%.2f dB'), DH, 'UniformOutput', false);
DVS = arrayfun(@(x) num2str(round(x,2), '%.2f dB'), DV, 'UniformOutput', false);

% Directivity factor
if min(anglesH)<0 % Dont use negative angles
    sumangH = abs(min(anglesH));
else
    sumangH = 0;
end
QH = 2*abs(dataH(:,idxangH)) ./ sum(incPhi*abs(dataH).*sin(anglesH'+sumangH),2);
QV = 2*abs(dataV(:,idxangV)) ./ sum(incTheta*abs(dataV).*sin(anglesV'),2);
QHS = arrayfun(@(x) num2str(round(x,2), '%.2f'), QH, 'UniformOutput', false);
QVS = arrayfun(@(x) num2str(round(x,2), '%.2f'), QV, 'UniformOutput', false);

% Directivity index
DIH = 10*log10(QH);
DIV = 10*log10(QV);
DIHS = arrayfun(@(x) num2str(round(x,2), '%.2f dB'), DIH, 'UniformOutput', false);
DIVS = arrayfun(@(x) num2str(round(x,2), '%.2f dB'), DIV, 'UniformOutput', false);

% Front Back relation
if strcmp(app.ExtVar.UPVRobotPostProcess.DirDirection,'Front/Back')
    FB = 20*log10( abs(dataH(:,Fidx) ./ PmaxH) ./ abs(dataH(:,Bidx) ./ PmaxH) );
    FBS = arrayfun(@(x) num2str(round(x,2), '%.2f dB'), FB, 'UniformOutput', false);
end


% ===========================================
% To table
switch app.ExtVar.UPVRobotPostProcess.DirDirection
    case 'Front/Back'
        
        if incPhi > 0 && incTheta > 0 % Data in horizontal and vertical
            
            T = table(FBS,DHS,QHS,DIHS,DVS,QVS,DIVS);
            app.ExtUI.DirectivityParametersTable.Data = T;
            app.ExtUI.DirectivityParametersTable.ColumnName = ...
                ["F/B";"Dir. (Hor)";"Q (Hor)";"DI (Hor)";...
                "Dir. (Ver)";"Q (Ver)";"DI (Ver)"];
            
            % Style F/B
            s = uistyle;
            s.BackgroundColor = [1,0.9,0.9];
            s.FontWeight = 'bold';
            addStyle(app.ExtUI.DirectivityParametersTable,s,'column',1)
            s = uistyle;
            % Style Horizontal
            s.BackgroundColor = [0.9,0.9,1];
            s.FontWeight = 'bold';
            addStyle(app.ExtUI.DirectivityParametersTable,s,'column',[2,3,4])
            % Style Vertical
            s = uistyle;
            s.BackgroundColor = [0.9,1,0.9];
            s.FontWeight = 'bold';
            addStyle(app.ExtUI.DirectivityParametersTable,s,'column',[5,6,7])
            
        elseif incTheta == 0 % Only Horizontal
            
            T = table(FBS,DHS,QHS,DIHS);
            app.ExtUI.DirectivityParametersTable.Data = T;
            app.ExtUI.DirectivityParametersTable.ColumnName = ...
                ["F/B";"Dir. (Hor)";"Q (Hor)";"DI (Hor)"];
            
            % Style F/B
            s = uistyle;
            s.BackgroundColor = [1,0.9,0.9];
            s.FontWeight = 'bold';
            addStyle(app.ExtUI.DirectivityParametersTable,s,'column',1)
            s = uistyle;
            % Style Horizontal
            s.BackgroundColor = [0.9,0.9,1];
            s.FontWeight = 'bold';
            addStyle(app.ExtUI.DirectivityParametersTable,s,'column',[2,3,4])
            
        elseif incPhi == 0 % Only Vertical
            T = table(DVS,QVS,DIVS);
            app.ExtUI.DirectivityParametersTable.Data = T;
            app.ExtUI.DirectivityParametersTable.ColumnName = ...
                ["Dir. (Ver)";"Q (Ver)";"DI (Ver)"];

            % Style Vertical
            s = uistyle;
            s.BackgroundColor = [0.9,1,0.9];
            s.FontWeight = 'bold';
            addStyle(app.ExtUI.DirectivityParametersTable,s,'column',[1,2,3])
        end
        
    case 'Front'
        
        if incPhi > 0 && incTheta > 0 % Data in horizontal and vertical
            
            T = table(DHS,QHS,DIHS,DVS,QVS,DIVS);
            app.ExtUI.DirectivityParametersTable.Data = T;
            app.ExtUI.DirectivityParametersTable.ColumnName = ...
                ["Dir. (Hor)";"Q (Hor)";"DI (Hor)";...
                "Dir. (Ver)";"Q (Ver)";"DI (Ver)"];
            % Style Horizontal
            s = uistyle;
            s.BackgroundColor = [0.9,0.9,1];
            s.FontWeight = 'bold';
            addStyle(app.ExtUI.DirectivityParametersTable,s,'column',[1,2,3])
            % Style Vertical
            s = uistyle;
            s.BackgroundColor = [0.9,1,0.9];
            s.FontWeight = 'bold';
            addStyle(app.ExtUI.DirectivityParametersTable,s,'column',[4,5,6])
            
        elseif incTheta == 0 % Only Horizontal
            
            T = table(DHS,QHS,DIHS);
            app.ExtUI.DirectivityParametersTable.Data = T;
            app.ExtUI.DirectivityParametersTable.ColumnName = ...
                ["Dir. (Hor)";"Q (Hor)";"DI (Hor)"];
            % Style Horizontal
            s = uistyle;
            s.BackgroundColor = [0.9,0.9,1];
            s.FontWeight = 'bold';
            addStyle(app.ExtUI.DirectivityParametersTable,s,'column',[1,2,3])
            
        elseif incPhi == 0 % Only Vertical
            
            T = table(DVS,QVS,DIVS);
            app.ExtUI.DirectivityParametersTable.Data = T;
            app.ExtUI.DirectivityParametersTable.ColumnName = ...
                ["Dir. (Ver)";"Q (Ver)";"DI (Ver)"];
            % Style Vertical
            s = uistyle;
            s.BackgroundColor = [0.9,1,0.9];
            s.FontWeight = 'bold';
            addStyle(app.ExtUI.DirectivityParametersTable,s,'column',[1,2,3])
            
        end
end

app.ExtUI.DirectivityParametersTable.RowName = append(string(freqs),' Hz');
s = uistyle;
s.HorizontalAlignment = 'center';
addStyle(app.ExtUI.DirectivityParametersTable,s)

% ===========================================
% Close Loading info
drawnow
pause(0.5)
close(d)
