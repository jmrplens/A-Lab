function [Time,TimeEach] = UPVRobotTimeTravel(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% ===============================================================
% Get coordinates
coords = app.ExtVar.UPVRobot.MeasurePoints;

if isempty(coords)
    Time = 0;
    TimeEach = 0;
    return;
end
% =======================================================
% UPV  robot details

% Speed - each axis (m/s)
XYSpeed = app.ExtVar.UPVRobot.XYSpeed*1e-3;
ZSpeed = app.ExtVar.UPVRobot.ZSpeed*1e-3;

% Aceleration - each axis (m/s^2)
XYAcel = app.ExtVar.UPVRobot.XYAcel*1e-3;
ZAcel = app.ExtVar.UPVRobot.ZAcel*1e-3;

% =======================================================================
% Add displacement Z to Z origin in every change in X or in Y.
% aux = 0;
% coordaux(1,:) = coords(1,:);
% ZOri = app.ExtVar.UPVRobot.ZOri;
% for ii = 2:size(coords,1)
%     % If move X or Y axis, and Z is not Z origin, Z axis equal to Z origin
%     if  (coords(ii,1) ~= coords(ii-1,1) || coords(ii,2) ~= coords(ii-1,2)) && coords(ii-1,3) ~= ZOri
%         coordaux(aux+ii,:) = [coords(ii-1,1),coords(ii-1,2),ZOri]; % Add new coord with Z = 0
%         aux = aux + 1;
%         coordaux(aux+ii,:) = coords(ii,:); % Store actual coord in next index
%     else
%         coordaux(aux+ii,:) = coords(ii,:); % Store actual coord
%     end
% end
coordaux = coords;
% =======================================================================
% Distances betwen points (only X and Y axes, same speed and acel) [m]
v = diff(coordaux(:, 1:2));
distXY = sqrt(sum(v .^ 2,2)); % = sqrt( (x(i+1)-x(i))^2 + (y(i+1)-y(i))^2 ) ... Euclidian
distXY(distXY==0) = []; % Remove zero displacement

% =======================================================================
% Distances betwen points (only Z axis)
distZ = abs(diff(coordaux(:,3)));
distZ(distZ==0) = []; % Remove zero displacement

% =======================================================================
% Calculate time

% Initialize time between points
tXY = zeros(size(distXY));
tZ = zeros(size(distZ));

% Time in aceleration/deceleration to reach max speed
taceXY = XYSpeed/XYAcel;
taceZ = ZSpeed/ZAcel;

% Distance traveled until reaching maximum speed or to stop
v_0 = 0;
daceXY = v_0 * taceXY + 1/2 * XYAcel * taceXY^2;
daceZ = v_0 * taceZ + 1/2 * ZAcel * taceZ^2;

% Has the max speed been reached?
%
% If not the displacement is only in acceleration, half the distance in
% acceleration and half in deceleration, since acceleration and
% deceleration is the same, it is calculated as twice the time that elapses
% while accelerating half the distance.
% From d = v * t + 1/2 * a * t^2  --> v = 0; --> d = 1/2 * a * t^2;
% Get t = sqrt(2*d/a)  --> t_total = 2 * sqrt(2*(d/2)/a)
%
% XY
idx = find(distXY<2*daceXY);  % Distances where the maximum speed is not reached
tXY(idx) = 2 * sqrt(2* (distXY(idx)/2) /XYAcel); % Displacement time when max speed not reached (only aceleration)
% Z
idx = find(distZ<2*daceZ);  % Distances where the maximum speed is not reached
tZ(idx) = 2 * sqrt(2* (distZ(idx)/2) /ZAcel); % Displacement time when max speed not reached (only aceleration)

% Time for normal displacements (acel - constant speed - deacel)
% XY
idx = find(distXY>2*daceXY); % Distances where the maximum speed is reached
t1 = taceXY;
t2 = (distXY(idx) - 2*daceXY) / XYSpeed;
t3 = taceXY;
tXY(idx) = t1+t2+t3;
% Z
idx = find(distZ>2*daceZ); % Distances where the maximum speed is reached
t1 = taceZ;
t2 = (distZ(idx) - 2*daceZ) / ZSpeed;
t3 = taceZ;
tZ(idx) = t1+t2+t3;

% Check
if isempty(tXY); tXY = 0; end
if isempty(tZ); tZ = 0; end

% =======================================================================
% Other times

% Run time  move script (estimated with profile app)
tDelays(1) = 1.05;
% Run time for the other commands in measureUPVRobot
tDelays(2) = 0.2;
% Signal time
try
[~,timesig] = signalGenerator(app);
catch
    timesig = 1.035;
end
tDelays(3) = timesig * app.Averages;
% Measure OutIn subroutines
tDelays(4) = 0.25;
% Audio hardware latency time
if isempty(app.Latency)
    tDelays(5) = app.SamplesPerFrame/app.SampleRate * 2;
else
    tDelays(5) = app.Latency;
end
% Robot hardware delay
tDelays(6) = 0.55;
% Pause in evry coord
pauseeach = 1;



% Total time
Time = sum(tXY) + sum(tZ) + sum(tDelays*size(coordaux,1)) + pauseeach*(size(coordaux,1));
% Mean time each travel
TimeEach = mean([tXY;tZ]) + sum(tDelays);
% To project
app.ExtVar.UPVRobot.MeasureSingleTime = TimeEach;
app.ExtVar.UPVRobot.MeasureTime = Time;
