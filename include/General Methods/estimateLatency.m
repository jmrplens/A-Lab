function latency = estimateLatency(SampleRate,SamplesPerFrame)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

latency = SamplesPerFrame/SampleRate*2;