function [Oct,fc,fl,fu] = FFT2octave(f,fftdata,b,varargin)
% Filter FFT array to Octave-band or fractional octave-band
% Input:
%   - f: Frequency array from FFT 
%   - fftdata: FFT array 
%   - b: Bandwidth. Examples: 1/3-octave b=3, 1-octave b=1, 1/24-octave b=24, 2/3-octave b = 3/2
%   - type: If values of 'fftdata' are in dB, set type to 'db', otherwise by default it will 
%           work in linear
%   - normalized: Boolean to get normalized frequencies if b==1 or b==3,
%                 true by default
% Output:
%   - Oct: Array with data filtered
%   - fc: Frequency array
%   - fl: Lower edge array
%   - fu: Upper edge array
%
% USE:
%   To get in one-octave frequencies
%   [Oct,fc,fl,fu] = FFT2octave(f,fftdata,1)
%   To get in one-octave frequencies if the data is in dB
%   [Oct,fc,fl,fu] = FFT2octave(f,fftdata,1,'dB')
%   To get in one-octave frequencies normalized if the data is in dB
%   [Oct,fc,fl,fu] = FFT2octave(f,fftdata,1,'dB',true)
%   To get in third-octave frequencies
%   [Oct,fc,fl,fu] = FFT2octave(f,fftdata,3)
%
% Jose M. Requena Plens (2021) - joreple@upv.es


% Check inputs
p = inputParser;
addRequired(p,'f',...
    @(x) isnumeric(x) && (size(x,1)==1 || size(x,2)==1));
addRequired(p,'fftdata',...
    @(x) isnumeric(x) && (size(x,1)==1 || size(x,2)==1));
addRequired(p,'b',...
    @(x) isnumeric(x) && isscalar(x) && x>=1);
addOptional(p,'type','',...
    @(x) ischar(x) || isempty(x));
addOptional(p,'normalized',false,...
    @(x) (isnumeric(x) && (x==0 || x==1)) || islogical(x));
addOptional(p,'limits',[f(1),f(end)],...
    @(x) isnumeric(x) && numel(x)==2 && x(1) < x(2) || isempty(x));
addOptional(p,'fccustom',[]);
parse(p,f,fftdata,b,varargin{:});
% Unpacking
type       = p.Results.type;
normalized = p.Results.normalized;
limits = p.Results.limits;
fccustom = p.Results.fccustom;

% Frequency increment from input data
deltaf = f(2)-f(1);

% Get frequeices
if min(f)<=0; fftdata(f<=0)=[]; f(f<=0) = [];  end % Remove zero-frequency and negative if exist
if isempty(fccustom)
[fc,fl,fu] = getANSIfrequencies(b,limits,normalized);
else
    fc = fccustom;
    g = 10^(3 / 10);
    fl = fc / g^(1/(2 * b));
    fu = fc * g^(1/(2 * b));
end

% Octave-band bandwith for each center frequency
BW = fu-fl;

Oct = zeros(size(fc));
% Proceso de un bloque de datos acotados por un 1/n de octava
for nOct = 1:length(fc)
    
    % Data index between upper and lower frequencies.
    idxA = find(f>=fl(nOct),1,'first');
    idxB = find(f<=fu(nOct),1,'last');
    % If the end has been reached, the last index is taken
    if isempty(idxB); idxB = length(f); end
    % Array with data between upper and lower frequencies.
    OctArr = fftdata(idxA:idxB);
    
    % Acumulate
    switch lower(type)
        case 'db' % Logarithmic
            Oct(nOct) = 10*log10(sqrt(sum((10.^(OctArr/10)).^2))); % rms
            if floor(BW(nOct)/deltaf) <= numel(OctArr)
                % Correction factor. Product by frequency increment
                Oct(nOct) = Oct(nOct) + 10*log10( BW(nOct)/(deltaf*numel(OctArr)) );
            end
            
        otherwise % Linear
            Oct(nOct) = sqrt(sum(OctArr.^2)); %  rms
            if floor(BW(nOct)/deltaf) <= numel(OctArr)
                % Correction factor. Product by frequency increment
                Oct(nOct) = Oct(nOct) * BW(nOct)/(deltaf*numel(OctArr));
            end 
    end
end

