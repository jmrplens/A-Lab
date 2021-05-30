function latency = getLatencyFromSignals(output,input,fs)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

latency = zeros(1,size(input,2));
for i = 1:size(input,2)
    [cross,time] = xcorr(input(:,i),output);
    [~,Midx]     = max(abs(cross)); % Find peak
    latency(i)   = time(Midx)/fs;   % Latency time value in seconds
end

