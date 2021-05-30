function measureUPVRobot(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% ====================================================
% Check robot connection
done = UPVRobotCheckConnection(app);
if ~done
    return;
end

% ====================================================
% Deactivate measure button
app.ExtUI.StartmeasureButton.Enable = 'off';

% ====================================================
% Title in execute button action panel and show
app.ExtUI.UPVRobotRunningPanel.Title = 'Running...';
app.ExtUI.UPVRobotRunningPanel.Visible = 'on';
app.ExtUI.UPVRobotPauseButton.Text = 'Pause';


% ====================================================
% Get coordinates
coords = app.ExtVar.UPVRobot.MeasurePoints;
totalcoords = size(coords,1);

% ====================================================
% Save coords to text
fileID = fopen([app.ExtVar.UPVRobot.FolderPath,filesep,'Coordinate list.txt'],'wt');
fprintf(fileID,'%d\t%.5f\t%.5f\t%.5f\n',[1:size(coords,1);coords']);
fclose(fileID);

% If directivity measure save angles
if strcmp(app.ExtVar.UPVRobot.CoordsType,'Directivity')
fileID = fopen([app.ExtVar.UPVRobot.FolderPath,filesep,'Angles list.txt'],'wt');
fprintf(fileID,'%d\t%.2f\t%.2f\n',...
    [1:size(coords,1);app.ExtVar.UPVRobot.DirThetaCoords(:)';app.ExtVar.UPVRobot.DirPhiCoords(:)']);
fclose(fileID);
end

% ====================================================
% Initialize pause/resume and stop button
app.ExtVar.UPVRobot.Pause = 0;
app.ExtVar.UPVRobot.Stop = 0;

% ====================================================
% Homing
UPVRobotHoming(app);

% ====================================================
% Calculate time travel
Time = UPVRobotTimeTravel(app);

% ====================================================
% SizeRobot
XLen = app.ExtVar.UPVRobot.XLen;
YLen = app.ExtVar.UPVRobot.YLen;
ZLen = app.ExtVar.UPVRobot.ZLen;
% Z origin
ZOri = app.ExtVar.UPVRobot.ZOri;

% ====================================================
% Signal
[app.ExtVar.UPVRobot.Output,~] = signalGenerator(app);

% ====================================================
% Resume measure
if app.ExtVar.UPVRobot.Resumed
    pathIter = [app.ExtVar.UPVRobot.FolderPath,filesep,'iter.bak'];
    iter = load(pathIter,'-mat');
    idx = iter.ii;
    elapaux = iter.elap;
    % Next point info
    app.ExtUI.UPVRobotStatusNextPoint.Text = sprintf('[%.3f, %.3f, %.3f]',...
        coords(idx,1),coords(idx,2),coords(idx,3));
    app.ExtUI.UPVRobotStatusCompleted.Text = sprintf('%d of %d',idx-1,totalcoords);
else
    idx = 1;
    elapaux = 0;
    % Next point info
    app.ExtUI.UPVRobotStatusNextPoint.Text = sprintf('[%.3f, %.3f, %.3f]',...
        coords(1,1),coords(1,2),coords(1,3));
    app.ExtUI.UPVRobotStatusCompleted.Text = sprintf('%d of %d',0,totalcoords);
end

% ====================================================
% Save measure data
UPVRobotMeasureInfo(app,'save');

% ====================================================
% Info data
% Time info
Timeaux = Time - elapaux;
app.ExtUI.UPVRobotStatusElapsed.Text = sec2str(elapaux);
if abs(Timeaux) > 20
    app.ExtUI.UPVRobotStatusRemaining.Text = sec2str(Timeaux);
else
    app.ExtUI.UPVRobotStatusRemaining.Text = 'A few seconds';
end

% ====================================================
% Before, move to the first coordinate X,Y
% UPVRobotMoveXYZ(app,'Z',0);
% UPVRobotMoveXYZ(app,coords(idx,1)*1e3,coords(idx,2)*1e3,0);

% ====================================================
% Disable UI panels
UPVRobotUIDisableMeasuring(app,0)

% ====================================================
% Run time
runt = tic();

% ====================================================
% Loop that goes through each coordinate

tic
%profile on
for ii = idx:totalcoords

    % ====================================================
    % Temporary file to continue the measurement if it has been interrupted
    elap = toc(runt) + elapaux;
    save([app.ExtVar.UPVRobot.FolderPath,filesep,'iter.bak'],'ii','elap','-mat');
    
    
    % Check if the movement crosses the restricted area, if it crosses it, make a detour.
    UPVRobotUncrossRestrictedArea(app,ii)
    
    
    % ==================
    % Coordinates
    x = coords(ii,1);
    y = coords(ii,2);
    z = coords(ii,3);
    
%     % ==================
%     % Z to 0
%     % If the first point move X or Y axis, move X Y with Z = Zori
%     if ii == 1
%         if  (coords(1,1) ~= 0 || coords(1,2) ~= 0) && coords(1,3) ~= ZOri
%             xp = coords(1,1);
%             yp = coords(1,2);
%             % Move
%             UPVRobotMoveXYZ(app,'X',xp*1e3,'Y',yp*1e3,'Z',ZOri);
%         end
%     else
%         % If move X or Y axis, and Z is not Z=0, Z axis equal to Z = 0
%         if  (coords(ii,1) ~= coords(ii-1,1) || coords(ii,2) ~= coords(ii-1,2)) && coords(ii-1,3) ~= ZOri
%             % Previous X and Y coords
%             xp = coords(ii-1,1);
%             yp = coords(ii-1,2);
%             % Move
%             UPVRobotMoveXYZ(app,'X',xp*1e3,'Y',yp*1e3,'Z',ZOri);
%         end
%     end
    
    
    % ==================
    % Move robot
    UPVRobotMoveXYZ(app,x*1e3,y*1e3,z*1e3);
    
    % ==================
    % Info data
    % Next point info
    if ii < totalcoords
        app.ExtUI.UPVRobotStatusNextPoint.Text = sprintf('[%.3f, %.3f, %.3f]',...
            coords(ii+1,1),coords(ii+1,2),coords(ii+1,3));
        drawnow
    end
    
    pause(1)
    % ==================
    % Measure and store
    UPVRobotAudioOutIn(app,ii);
    
    % Measure done
    
    
    % ==================
    % PLOT
    % Delete red point
    set(app.ExtVar.UPVRobot.ScatterRedPlot,'XData',coords(ii+1:end,1),'YData',coords(ii+1:end,2),'ZData',coords(ii+1:end,3))
    % Plot green point
    set(app.ExtVar.UPVRobot.ScatterGreenPlot,'XData',coords(1:ii,1),'YData',coords(1:ii,2),'ZData',coords(1:ii,3))
    
    % ==================
    % Info data
    % Measures completed
    app.ExtUI.UPVRobotStatusCompleted.Text = sprintf('%d of %d',ii,totalcoords);
    % Time info
    elap = toc(runt) + elapaux;
    Timeaux = Time - elap;
    app.ExtUI.UPVRobotStatusElapsed.Text = sec2str(elap);
    if abs(Timeaux) > 20 && elap < Time
        app.ExtUI.UPVRobotStatusRemaining.Text = sec2str(Timeaux);
    else
        app.ExtUI.UPVRobotStatusRemaining.Text = 'A few seconds';
    end
    drawnow 
    
    % ==================
    % CHECK PAUSE/STOP
    UPVRobotPauseStop(app,[],[])
    
end
%profile viewer
t = toc
Time = UPVRobotTimeTravel(app)
diffff = t - Time


% ====================================================
% Store real measure time
app.ExtVar.UPVRobot.MeasureTime = elap;

% ====================================================
% Delete temporary file
delete([app.ExtVar.UPVRobot.FolderPath,filesep,'iter.bak']);

app.ExtUI.UPVRobotStatusNextPoint.Text = 'Finished';
app.ExtUI.UPVRobotStatusRemaining.Text = 'Finished';
app.ExtUI.UPVRobotRunningPanel.Title = ' ';
app.ExtUI.UPVRobotRunningPanel.Visible = 'off';
app.ExtUI.StartmeasureButton.Text = 'Start measure';

% ====================================================
% Enable UI panels
UPVRobotUIDisableMeasuring(app,1)

