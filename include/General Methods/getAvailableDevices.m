function devices = getAvailableDevices()
% This function fetches all available audio devices.

playRec = audioPlayerRecorder;
devices = getAudioDevices(playRec);
release(playRec) % Needed??
devices = string(devices);