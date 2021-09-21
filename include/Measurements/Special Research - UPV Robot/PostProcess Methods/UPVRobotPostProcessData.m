function UPVRobotPostProcessData(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Get folder path
folder = [app.ExtVar.UPVRobotPostProcess.FolderPath,filesep];

% Create data folder
datafolder = 'Postprocess Data';
if ~exist([folder,datafolder], 'dir')
    mkdir([folder,datafolder])
end
folderDataPath = [folder,datafolder,filesep];


% Check exist data
if ~exist([folder,'measure.dat'],'file')
    return;
end

% Check if postprocess data exist, return if true
if exist([folderDataPath,'postprocess.dat'],'file')
    % Load
    app.ExtUI.UPVRobotPostProcessRunInfo.Text = '''postprocess.dat'' file is loading.';
    drawnow
    aux = load([folderDataPath,'postprocess.dat'],'-mat');
    % Remove old fields
    try aux = rmfield(aux.UPVRobotPostProcess,'FolderPath'); catch; end
    try aux = rmfield(aux,'ResultType'); catch; end
    try aux = rmfield(aux,'DimType'); catch; end
    try aux = rmfield(aux,'SelectedPoints'); catch; end
    try aux = rmfield(aux,'DataSource'); catch; end
    try aux = rmfield(aux,'FlyTime'); catch; end
    try aux = rmfield(aux,'FlyDist'); catch; end
    try aux = rmfield(aux,'Multicore'); catch; end
    % Copy all fields
    names = fieldnames(aux.UPVRobotPostProcess);
    for ii = 1:length(names)
        if isfield(app.ExtVar.UPVRobotPostProcess,names{ii})
            app.ExtVar.UPVRobotPostProcess.(names{ii}) = aux.UPVRobotPostProcess.(names{ii});
        end
    end
    % Refresh .mat path
    app.ExtVar.UPVRobotPostProcess.TimeVec = matfile([folderDataPath,'Time_Array.mat']);
    app.ExtVar.UPVRobotPostProcess.InSignal = matfile([folderDataPath,'Input_Signals.mat']);
    app.ExtVar.UPVRobotPostProcess.OutSignal = matfile([folderDataPath,'Out_Signal.mat']);
    app.ExtVar.UPVRobotPostProcess.FreqVec = matfile([folderDataPath,'Frequency_Array.mat']);
    app.ExtVar.UPVRobotPostProcess.FreqResp = matfile([folderDataPath,'Frequency_Responses.mat']);
    app.ExtVar.UPVRobotPostProcess.IRResp = matfile([folderDataPath,'Impulse_Responses.mat']);
    app.ExtVar.UPVRobotPostProcess.IRtime = matfile([folderDataPath,'Time_Array_forImpulse.mat']);
    app.ExtVar.UPVRobotPostProcess.Mesh = matfile([folderDataPath,'Mesh.mat']);
    % UI
    app.ExtUI.UPVRobotPostProcessRunInfo.Text = '''postprocess.dat'' file is loaded.';
    drawnow
    % Make UI
    % Center UI
    delete(app.CenterPanel.Children);
    % Right UI
    delete(app.RightPanel.Children);
    rightGrid(app,{'1x'},{'fit', 'fit', '1x', 'fit'});
    createPanelUPVRobotPostProcessRight(app);
    UPVRobotMeasureInfo(app,'loadpostpro');
    app.ExtUI.UPVRobotPostProcessMeasureinformationPanel.Visible = 'on';
    app.ExtUI.UPVRobotPostProcessFrequencydomainButton.Enable = 'on';
    app.ExtUI.UPVRobotPostProcessTimedomainButton.Enable = 'on';
    if strcmp(app.ExtVar.UPVRobotPostProcess.CoordsType,'Directivity')
        app.ExtUI.UPVRobotPostProcessDirectivityButton.Enable = 'on';
    else
        app.ExtUI.UPVRobotPostProcessDirectivityButton.Enable = 'off';
    end
    return;
end

% Create progress bar
d = uiprogressdlg(app.ALabUIFigure,'Title','Please Wait',...
    'Message','Initializing...');

% Load data
UPVRobotMeasureInfo(app,'loadpostpro');

% Get other data
coords = app.ExtVar.UPVRobotPostProcess.Coords;
type = lower(app.ExtVar.UPVRobotPostProcess.TypeSignal);
Fs = app.ExtVar.UPVRobotPostProcess.SampleRate;
nfft = Fs/2; % To get 1 Hz resolution

% Load signal source
fid = fopen([folder,'Signal_source.txt']);
aux = cell2mat(textscan(fid, '%f %f'));
fclose(fid);
t = aux(:,1);
Outs = aux(:,2);

% Process first measure and get data for initialize variables
% Load measure 'n'
fid = fopen(sprintf('%s%d.txt',folder,1));
Ins = cell2mat(textscan(fid, '%f'));
fclose(fid);

switch type
    case {'mls','sweep'}
        % Impulse Response
        IR = impzest(Outs,Ins);
        [H,f] = freqz(IR,1,nfft,Fs);
        H(1) = [];
        f(1) = [];
        tIR = (1:length(IR))'/Fs;
    otherwise
        Haux = fft(Ins,2.*nfft).';
        H = 2*Haux(2:nfft);
        deltaF = Fs/2/nfft;
        faux = linspace(0,Fs/2-deltaF,nfft);
        faux(nfft) = Fs/2-Fs/2/nfft;
        f = faux(2:end);
        IR = real(ifft(fft(Ins) ./ fft(Outs)));
        tIR = (1:length(IR))'/Fs;
end
H = H(:); % To column

% Get idx for 30Khz (max frequency stored) - idx=nfft-1 to store all data
idxF = find(f>=30e3,1,'first');
if isempty(idxF) % From fs lower than 60kHz, get nfft length
    idxF = nfft-1;
end

% Store/Initialize results variables/mats
app.ExtUI.UPVRobotPostProcessRunInfo.Text = 'Making needed data files. Please, wait...';
drawnow
N = length(coords);
%H = [H,zeros(size(H,1),N-1)];
%Ins = [Ins,zeros(size(Ins,1),N-1)];
%IR = [IR,zeros(size(IR,1),N-1)];
n_completed = 1;

app.ExtVar.UPVRobotPostProcess.TimeVec = ...
    matfile([folderDataPath,'Time_Array.mat'],'Writable',true);
app.ExtVar.UPVRobotPostProcess.TimeVec.Data = t;

app.ExtVar.UPVRobotPostProcess.InSignal = ...
    matfile([folderDataPath,'Input_Signals.mat'],'Writable',true);
app.ExtVar.UPVRobotPostProcess.InSignal.Data = Ins;

app.ExtVar.UPVRobotPostProcess.OutSignal = ...
    matfile([folderDataPath,'Out_Signal.mat'],'Writable',true);
app.ExtVar.UPVRobotPostProcess.OutSignal.Data = Outs;

switch type
    case {'mls','sweep'}
        app.ExtVar.UPVRobotPostProcess.TimeRespType = 'Correlated';
    otherwise
        app.ExtVar.UPVRobotPostProcess.TimeRespType = 'Uncorrelated';
end

app.ExtVar.UPVRobotPostProcess.FreqVec = ...
    matfile([folderDataPath,'Frequency_Array.mat'],'Writable',true);
app.ExtVar.UPVRobotPostProcess.FreqVec.Data = f(1:idxF);

app.ExtVar.UPVRobotPostProcess.FreqResp = matfile([folderDataPath,'Frequency_Responses.mat'],'Writable',true);
app.ExtVar.UPVRobotPostProcess.FreqResp.Data(1:idxF,1) = H(1:idxF);

app.ExtVar.UPVRobotPostProcess.IRResp = matfile([folderDataPath,'Impulse_Responses.mat'],'Writable',true);
app.ExtVar.UPVRobotPostProcess.IRResp.Data = IR;

app.ExtVar.UPVRobotPostProcess.IRtime = matfile([folderDataPath,'Time_Array_forImpulse.mat'],'Writable',true);
app.ExtVar.UPVRobotPostProcess.IRtime.Data = tIR;

switch app.ExtVar.UPVRobotPostProcess.Multicore
    
    case 1 % Multicore
        % Steps:
        %   1. Create parallel pool with all workers (N)
        %   2. Create 'N' temp files to IR, H and Ins, for each worker
        %   3. Calculate and store results in temp files
        %   5. Delete actual pool and make new with 3 workers, one for each .mat file (Ins, H, IR)
        %   6. Move/concatenate results in main .mat files
        %   7. Delete pool.
        %   8. Remove temp files.
        
        % Create new pool with all available workers
        d.Indeterminate = 'on';
        d.Message = 'Creating parallel pool. Please, wait...';
        drawnow
        % Check if other pools exist
        p = gcp('nocreate');
        % If not, create
        create = false;
        if isempty(p)
            create = true;
        end
        if isfield(p,'NumWorkers')
            if p.NumWorkers <= 3
                create = true;
                delete(p)
            end
        end
        if create
            try
                % Create cluster to use all cores availables
                clus = parcluster;
                if ~isempty(clus.Jobs); delete(clus.Jobs); end % Remove previous jobs
                clus.NumThreads = 2; % Hyperthreading (maybe unused)
                p = parpool(clus,clus.NumWorkers,'IdleTimeout',600);
            catch
                p = parpool('IdleTimeout',600);
            end
        end
        
        % Create temporal files (three files for each worker)
        % File name prefix
        d.Message = 'Creating temporal files. Please, wait...';
        myFnameini = [folderDataPath,'Worker_'];
        spmd
            myFname = [myFnameini,num2str(labindex)]; % each worker gets a unique prefix
            myMatfileIR = matfile([myFname,'_Impulse.mat'], 'Writable', true); % IR temporal file
            myMatfileH = matfile([myFname,'_Frequency.mat'], 'Writable', true); % FR temporal file
            myMatfileINS = matfile([myFname,'_Signal.mat'], 'Writable', true); % Input signal temporal file
            % Initialize matfiles
            myMatfileINS.data = zeros(size(Ins,1),1);
            myMatfileH.data = complex(zeros(idxF,1),0);
            myMatfileIR.data = zeros(size(IR,1),1);
            myMatfileINS.gotResult = false(1, N);
            myMatfileH.gotResult = false(1, N);
            myMatfileIR.gotResult = false(1, N);
        end
        % Constants (matfile) related with each worker to use in parfoor
        myMatfileConstantINS = parallel.pool.Constant(myMatfileINS);
        myMatfileConstantH = parallel.pool.Constant(myMatfileH);
        myMatfileConstantIR = parallel.pool.Constant(myMatfileIR);
        
        % To calulate and show progress
        n_completed = 1;
        startTime = tic;
        q = parallel.pool.DataQueue; % Initialized the queue to get the progress
        afterEach(q, @update_progress);
        
        % Progress bar determinated
        d.Indeterminate = 'off';
        
        parfor n = 2:N
            
            % Get matfile variable
            matfileObjINS = myMatfileConstantINS.Value;
            matfileObjIR = myMatfileConstantIR.Value;
            matfileObjH = myMatfileConstantH.Value;
            
            % Set result for iteration 'n' to true
            matfileObjINS.gotResult(1, n) = true;
            matfileObjIR.gotResult(1, n) = true;
            matfileObjH.gotResult(1, n) = true;
            
            % Load measure 'n'
            fid = fopen(sprintf('%s%d.txt',folder,n));
            Ins = textscan(fid, '%f'); Ins = Ins{:};
            matfileObjINS.data(:,n) = Ins; % Store input signal
            switch type
                case {'mls','sweep'}
                    % Impulse Response
                    IR = impzest(Outs,Ins);
                    Haux = freqz(IR,1,nfft,Fs);
                    matfileObjIR.data(:,n) = IR(:); % Store impulse response
                    auxH = Haux(2:idxF+1);
                    matfileObjH.data(:,n) = auxH(:); % Store frequency response
                otherwise
                    Haux = fft(Ins,2.*nfft).';
                    IR = real(ifft(fft(Ins) ./ fft(Outs)));
                    matfileObjIR.data(:,n) = IR(:); % Store impulse response
                    auxH = 2*Haux(2:idxF+1);
                    matfileObjH.data(:,n) = auxH(:); % Store frequency response
            end
            fclose(fid);
            
            % Show progress
            send(q,'Step 1 of 2. Calculating parameters...');
            
        end
        
        
        % Step 5. Concatenate results
        app.ExtUI.UPVRobotPostProcessRunInfo.Text = 'Join results...';
        
        % Generate filenames based on actual workers
        myFnameV = strings(p.NumWorkers,1);
        for i = 1:p.NumWorkers
            myFnameV(i) = [myFnameini,num2str(i)];
        end
        % Reference to main .mat files
        InsMat = app.ExtVar.UPVRobotPostProcess.InSignal;
        HMat = app.ExtVar.UPVRobotPostProcess.FreqResp;
        IRMat = app.ExtVar.UPVRobotPostProcess.IRResp;
        
        % Remake the queue
        delete(q);
        n_completed = 1;
        startTime = tic;
        q = parallel.pool.DataQueue;
        afterEach(q, @update_progressThree);
        
        
        parfor (w = 1:3,3) % Only three workers, one per each main .mat file
            
            switch w % Distribute workers
                
                case 1 % Signal concatenate worker
                    for i = 1:numel(myFnameV) % For each file
                        mat = matfile([myFnameV{i},'_Signal.mat']);
                        for n = 2:N %#ok<*PFTUSW> % For each measure point
                            if mat.gotResult(1, n) % If exist copy data to main file
                                store_parfor(InsMat,mat,n);
                                send(q,[])
                            end
                        end
                    end
                    
                case 2 % Freq. Response concatenate worker
                    for j = 1:numel(myFnameV)
                        mat = matfile([myFnameV{j},'_Frequency.mat']);
                        for n = 2:N
                            if mat.gotResult(1, n) % If exist copy data to main file
                                store_parfor(HMat,mat,n);
                                send(q,[])
                            end
                        end
                    end
                    
                case 3 % Impulse. Response concatenate worker
                    for k = 1:numel(myFnameV)
                        mat = matfile([myFnameV{k},'_Impulse.mat']);
                        for n = 2:N
                            if mat.gotResult(1, n) % If exist copy data to main file
                                store_parfor(IRMat,mat,n);
                                send(q,[])
                            end
                        end
                    end
                    
            end % End switch
            
        end % End parfor
        
        
        
        % Delete temporal files
        for tmp = 1:numel(myFnameV) % For each file
            delete([myFnameV{tmp},'_Signal.mat'])
            delete([myFnameV{tmp},'_Frequency.mat'])
            delete([myFnameV{tmp},'_Impulse.mat'])
        end
        
    case 0 % Sigle core
        
        % To calulate and show progress
        startTime = tic;
        for n = 2:N
            
            % Load measure 'n'
            fid = fopen(sprintf('%s%d.txt',folder,n));
            
            Ins = textscan(fid, '%f'); Ins = Ins{:};
            
            switch type
                case {'mls','sweep'}
                    IR = impzest(Outs,Ins);
                    Haux = freqz(IR,1,nfft,Fs);
                    H = Haux(2:idxF+1);
                otherwise
                    Haux = fft(Ins,2.*nfft).';
                    H = 2*Haux(2:idxF+1);
                    IR = real(ifft(fft(Ins) ./ fft(Outs)));
            end
            fclose(fid);
            
            % Store data
            app.ExtVar.UPVRobotPostProcess.InSignal.Data(:,n) = Ins(:);
            app.ExtVar.UPVRobotPostProcess.IRResp.Data(:,n) = IR(:);
            app.ExtVar.UPVRobotPostProcess.FreqResp.Data(:,n) = H(:);
            
            % Show progress
            update_progress('Processing...');
            
        end
end

% Close progress box
close(d)


% Store Mesh
ux = unique(coords(:,1));
uy = unique(coords(:,2));
uz = unique(coords(:,3));

app.ExtVar.UPVRobotPostProcess.Mesh = matfile([folderDataPath,'Mesh.mat'],'Writable',true);
[app.ExtVar.UPVRobotPostProcess.Mesh.Xmatrix,...
    app.ExtVar.UPVRobotPostProcess.Mesh.Ymatrix,...
    app.ExtVar.UPVRobotPostProcess.Mesh.Zmatrix] = meshgrid(ux, uy, uz);

% Disable writable
app.ExtVar.UPVRobotPostProcess.TimeVec.Properties.Writable = false;
app.ExtVar.UPVRobotPostProcess.InSignal.Properties.Writable = false;
app.ExtVar.UPVRobotPostProcess.OutSignal.Properties.Writable = false;
app.ExtVar.UPVRobotPostProcess.FreqVec.Properties.Writable = false;
app.ExtVar.UPVRobotPostProcess.FreqResp.Properties.Writable = false;
app.ExtVar.UPVRobotPostProcess.IRResp.Properties.Writable = false;
app.ExtVar.UPVRobotPostProcess.IRtime.Properties.Writable = false;

% Save data
app.ExtUI.UPVRobotPostProcessRunInfo.Text = 'Storing... Wait a few seconds';
drawnow
UPVRobotMeasureInfo(app,'savepostpro');
% Get file size and show
s = dir([folderDataPath,'postprocess.dat']); filesize(1) = s.bytes;
s = dir(app.ExtVar.UPVRobotPostProcess.TimeVec.Properties.Source); filesize(2) = s.bytes;
s = dir(app.ExtVar.UPVRobotPostProcess.InSignal.Properties.Source); filesize(3) = s.bytes;
s = dir(app.ExtVar.UPVRobotPostProcess.OutSignal.Properties.Source); filesize(4) = s.bytes;
s = dir(app.ExtVar.UPVRobotPostProcess.FreqVec.Properties.Source); filesize(5) = s.bytes;
s = dir(app.ExtVar.UPVRobotPostProcess.FreqResp.Properties.Source); filesize(6) = s.bytes;
s = dir(app.ExtVar.UPVRobotPostProcess.IRResp.Properties.Source); filesize(7) = s.bytes;
s = dir(app.ExtVar.UPVRobotPostProcess.IRtime.Properties.Source); filesize(8) = s.bytes;

app.ExtUI.UPVRobotPostProcessRunInfo.Text = sprintf('Done. Size of all files: %.2f GB',sum(filesize)/1e9);

app.ExtUI.UPVRobotPostProcessFrequencydomainButton.Enable = 'on';
app.ExtUI.UPVRobotPostProcessTimedomainButton.Enable = 'on';
if strcmp(app.ExtVar.UPVRobotPostProcess.CoordsType,'Directivity')
    app.ExtUI.UPVRobotPostProcessDirectivityButton.Enable = 'on';
else
    app.ExtUI.UPVRobotPostProcessDirectivityButton.Enable = 'off';
end

drawnow

% Nested Functions
    function update_progress(str)
        
        % Counter
        n_completed = n_completed + 1;
        
        % Progress
        ratio = n_completed/N;
        percent = ratio*100;
        
        % Times
        tElapsed = toc(startTime);
        tRem = (1-ratio) / ratio * tElapsed; % Remaining estimated
        tTot = tElapsed + tRem;
        
        % Update text labels
        d.Value = ratio;
        d.Message = {sprintf('%s [%.1f %%]',str,percent);...
            ' ';...
            ['Estimated time: ',sec2str(tTot)];...
            ' ';...
            ['Remaining time: ',sec2str(tRem)]};
        
    end

    function update_progressThree(~)
        
        % Counter
        n_completed = n_completed + 1;
        
        % Progress
        ratio = n_completed/(N*3);
        percent = ratio*100;
        
        % Times
        tElapsed = toc(startTime);
        tRem = (1-ratio) / ratio * tElapsed; % Remaining estimated
        tTot = tElapsed + tRem;
        
        % Update text labels
        d.Value = ratio;
        d.Message = {sprintf('Step 2 of 2. Merging results... [%.1f %%]',percent);...
            ' ';...
            ['Estimated time: ',sec2str(tTot)];...
            ' ';...
            ['Remaining time: ',sec2str(tRem)]};
        
    end

end

function store_parfor(mat,mattemp,idx)
mat.Data(:,idx) = mattemp.data(:,idx);
end