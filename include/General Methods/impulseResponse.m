function irEstimate = impulseResponse(type,excitation,rec)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

n = size(rec,2);

% Obtain Impulse response
switch lower(type)
    case {'mls','sweep'}
        for ii = 1:n
            irEstimate(:,ii) = impzest(excitation,rec(:,ii)); %#ok<AGROW>
        end
    case {'white noise','pink noise','pure tone'}
        for ii = 1:n
            irEstimate(:,ii) = real(ifft(fft(rec(:,ii)) ./ fft(excitation))); %#ok<AGROW>
        end    
    otherwise
        for ii = 1:n
            irEstimate(:,ii) = real(ifft(fft(rec(:,ii)) ./ fft(excitation))); %#ok<AGROW>
        end 
end