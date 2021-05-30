function [H,f] = frequencyResponse(emitted,received,fs,varargin)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% ========================================================================================
% Inputs
p = inputParser;
addRequired(p,'Output');
addRequired(p,'Input');
addRequired(p,'fs',...
    @(x) isnumeric(x) && isscalar(x) && x>0);
addParameter(p,'type',[],...
    @(x) ischar(x) || isempty(x));
addParameter(p,'windo',[],...
    @(x) isnumeric(x) || isempty(x));
addParameter(p,'noverlap',[],...
    @(x) x>0 || isempty(x));
addParameter(p,'nfft',[],...
    @(x) isnumeric(x) && isscalar(x) && x>0 || isempty(x));
parse(p,emitted,received,fs,varargin{:});
% Unpacking
type     = p.Results.type;
windo    = p.Results.windo;
noverlap = p.Results.noverlap;
nfft     = p.Results.nfft;


% ========================================================================================
% Calc
switch lower(type)
    case {'mls','sweep'}
        
        ir  = impzest(emitted,received);
        for i=1:size(ir,2) % Channels
            [H(:,i),f] = freqz(ir(:,i),1,nfft,fs); %#ok<AGROW>
        end
        
    case {'pink noise','white noise','pure tone'}
        
        [H,f] = tfestimate(received,emitted,windo,noverlap,nfft,fs);
        
    case 'uncorrelated'
        
        if isempty(nfft); nfft = length(received); end 
        H = fft(received,2.*nfft).';
        H = 2*H(1:nfft);
        H = H(:);
        deltaF = fs/2/nfft;
        f = linspace(0,fs/2-deltaF,nfft);
        f(nfft) = fs/2-fs/2/nfft;
        f = f(:);
        
        
    otherwise
        
        if isempty(emitted)
            if isempty(nfft); nfft = length(received); end
            H = fft(received,2.*nfft).';
            H = 2*H(1:nfft);
            H = H(:);
            deltaF = fs/2/nfft;
            f = linspace(0,fs/2-deltaF,nfft);
            f(nfft) = fs/2-fs/2/nfft;
            f = f(:);
        else
            [H,f] = tfestimate(received,emitted,windo,noverlap,nfft,fs);
        end
end

