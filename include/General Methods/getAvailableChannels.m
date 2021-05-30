function [Nin,Nout] = getAvailableChannels(app)
% This function returns the number of input and output channels of the
% requested device.
%
%  [Nin,Nout] = getAvailableChannels(app)
%
% where 'device' is a string or char array with the name of the device.
%
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Channels
switch app.Device
    case 'No detected'
        Nin = 1;
        Nout = 1;
    otherwise
        aPR = audioPlayerRecorder('Device', app.Device);
        release(aPR)
        infoD = info(aPR);
        Nin = infoD.MaximumRecorderChannels;
        Nout = infoD.MaximumPlayerChannels;
end
