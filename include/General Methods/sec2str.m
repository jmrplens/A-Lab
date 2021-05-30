function str = sec2str(t)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

    hours = floor(t / 3600);
    t = t - hours * 3600;
    mins = floor(t / 60);
    secs = floor(t - mins * 60);
    str = sprintf('%d:%02d:%02.f', hours, mins, secs);
end