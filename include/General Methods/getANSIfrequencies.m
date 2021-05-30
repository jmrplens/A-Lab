function [fc,fl,fu] = getANSIfrequencies(b,varargin)
%
% ANSI s1.11-2004 && IEC 61260-1-2014
% Array of frequencies and its edges according to the ANSI and IEC standard.
%
% Input:
%   - b: Bandwidth. Examples: 1/3-octave b=3, 1-octave b=1, 1/24-octave b=24, 2/3-octave b = 3/2
%   - limits: It is a two element array with the minimum and maximum frequency that
%             the array should have. Example: [12,20000]
%   - normalized: Boolean to get normalized frequencies if b==1 or b==3,
%                 true by default
% Output:
%   - fc: Frequency array
%   - fl: Lower edge array
%   - fu: Upper edge array
%
% USE:
%   To get one-octave normalized frequencies between [12, 20000]
%   [fc,fl,fu] = getANSIfrequencies(1)
%   To get one-octave normalized frequencies between [125, 8000]
%   [fc,fl,fu] = getANSIfrequencies(1,[125,8000])
%   To get one-octave calculated frequencies between [12, 20000]
%   [fc,fl,fu] = getANSIfrequencies(1,[],false)
%   To get third-octave calculated frequencies between [12, 20000]
%   [fc,fl,fu] = getANSIfrequencies(3,[],false)
%
% Jose M. Requena Plens (2021) - joreple@upv.es


% Check inputs
p = inputParser;
addRequired(p,'b',...
    @(x) isnumeric(x) && isscalar(x) && x>=1);
addOptional(p,'limits',[12,20000],...
    @(x) isnumeric(x) && numel(x)==2 && x(1) < x(2) || isempty(x));
addOptional(p,'normalized',true,...
    @(x) (isnumeric(x) && (x==0 || x==1)) || islogical(x));
parse(p,b,varargin{:});
% Unpacking
b          = p.Results.b;
limits     = p.Results.limits;
normalized = p.Results.normalized;

if isempty(limits)
    limits = [12,20000];
end

% If bandwith 'b' is 1 or 3, return normalized frequencies for one-octave
% and third-octave band. [IEC 61260-1-2014]
if (b == 1 || b == 3) && normalized
    [fc,fl,fu] = normalizedfrequencies(b,limits);
    return;
end

% Octave ratio g (ANSI s1.11, 3.2, pg. 2)
g = octaveratio();
% Reference frequency (ANSI s1.11, 3.4, pg. 2)
fr = 1000;

% Get starting index 'x' and first center frequency
x = initindex(limits(1), fr, g, b);
fc = getratio(g, x, b) * fr;

% Get each frequency until reach maximum frequency
freq_x = 0;
aux = 1;
while freq_x * bandedge(g, b) < limits(2)
    % Increase index
    aux = aux + 1;
    x = x + 1;
    % New frequency
    freq_x = getratio(g, x, b) * fr;
    % Store new frequency
    fc(aux) = freq_x;
end
% Get band-edges
fl = fc / bandedge(g, b);
fu = fc * bandedge(g, b);

%--------------------------------------------------------------------------
% Initial index
function index = initindex(f, fr, g, b)
if rem(b,2)  % ODD ('x' solve from ANSI s1.11, eq. 3)
    index = round((b * log(f / fr) + 30 * log(g)) / log(g));
else  % EVEN ('x' solve from ANSI s1.11, eq. 4)
    index = round((2 * b * log(f / fr) + 59 * log(g)) / (2 * log(g)));
end

%--------------------------------------------------------------------------
% Octave ratio
function g = octaveratio()
% ANSI s1.11, 3.2, pg. 2
g = 10^(3 / 10);  % Or g = 2

%--------------------------------------------------------------------------
% Ratio
function ratio = getratio(g, x, b)
if rem(b,2)  % ODD (ANSI s1.11, eq. 3)
    ratio = g^((x - 30) / b);
else  % EVEN (ANSI s1.11, eq. 4)
    ratio = g^((2 * x - 59) / (2 * b));
end

%--------------------------------------------------------------------------
% Edges
function edge = bandedge(g, b)
% Band-edge ratio (ANSI s1.11, 3.7, pg. 3)
edge =  g^(1 / (2 * b));

%--------------------------------------------------------------------------
% Normalized frequencies
function [fc,fl,fu] = normalizedfrequencies(b,limits)

if b == 3
    % IEC 61260 - 1 - 2014 (added 12.5, 16, 20 Hz)
    fc = [
        12.5, 16, 20, 25, 31.5, 40, 50, 63, 80, 100, 125, 160, 200, 250,...
        315, 400, 500, 630, 800, 1000, 1250, 1600, 2000, 2500, 3150, 4000,...
        5000, 6300, 8000, 10000, 12500, 16000, 20000
        ];
elseif b == 1
    % IEC 61260 - 1 - 2014 (added 16 Hz)
    fc = [16, 31.5, 63, 125, 250, 500, 1000, 2000, 4000, 8000, 16000];
end

% Remove outers
fc(fc<limits(1)) = [];
fc(fc>limits(2)) = [];

% Octave ratio g (ANSI s1.11, 3.2, pg. 2)
g = octaveratio();

% Get band-edges
fl = fc / bandedge(g, b);
fu = fc * bandedge(g, b);