function drivers = getAvailableDrivers()
% This function gets all available audio drivers.
%
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

devices = getAvailableDevices();
drivers = strings(1,numel(devices));
for i = 1:numel(devices)
playRec = audioPlayerRecorder('Device',devices(i));
infoD = info(playRec);
drivers(i) = string(infoD.Driver);
release(playRec) % Needed??
end
drivers = unique(drivers);