function varargout = patternFromSlices(vertSlice,theta,varargin)
%PATTERNFROMSLICES  Reconstruct an approximate 3D radiation pattern from two
%                   orthogonal pattern slices
%
%
% patternFromSlices(vertSlice,theta,horizSlice,phi) plots the
% approximate 3D pattern reconstructed from the input data.
%
% patternFromSlices(vertSlice,theta,horizSlice), with "horizSlice"
% provided as a real-valued scalar, does the same as the above, except with
% the assumption of omnidirectionality of the antenna (with symmetry about
% the z-axis, i.e. azimuthal symmetry).
%
% patternFromSlices(vertSlice,theta) does the same as above, using only
% the vertical pattern data, along with the assumption of azimuthal
% omnidirectionality and the additional assumption that "horizSlice" is
% equal to the maximum value of "vertSlice".
%
% [pat3D,theta,phi] = patternFromSlices(____) returns the reconstructed
% pattern (in dBI) as a matrix along with the vectors of phi and theta
% values in degrees.  For the matrix "pat3D", the number of rows/columns
% should correspond to the number of elements of "phi"/"theta").
%
% ____ = patternFromSlices(____,Name,Value) provides a way to specify
% customization and tuning options, such as the reconstruction method to
% use and any associated parameters therein.
%
%
% List of required Input Arguments:
%
%	theta: Polar/inclination angles (in degrees) in the spherical
%          coordinate system, specified as a real-valued vector
%
%	vertSlice: 2D pattern slice data (in units of dBI) along the
%              vertical/elevation plane, specified as a real-valued vector
% 
%
% List of optional Input Arguments:
%
%   phi: Azimuthal angles (in degrees) in the spherical coordinate
%        system, specified as a real-valued vector
%
%   horizSlice: 2D pattern slice data (in units of dBI) along the
%               horizontal/azimuthal plane, specified as either a real-
%               valued scalar or real-valued vector; if scalar, then
%               omnidirectionally (with azimuthal symmetry) is assumed,
%               and the provided scalar is used for all angles on the
%               azimuthal plane
%
%
% List of available Name-Value pairs:
%
%   Method: Approximation or interpolation algorithm used to perform the
%           reconstruction, specified as 'Summing' | 'CrossWeighted', the
%           default being 'Summing'
%
%   CrossWeightedNormalization: The normalization parameter used for the
%                               Cross-Weighted summing method, specified as
%                               a real-valued, positive scalar; as this
%                               parameter value increases/decreases, the
%                               reconstruction tends to a more
%                               pessimistic/optimistic approximation in
%                               regard to the estimated directivity/gain
%
%
% See also <a href="matlab:help patternCustom">patternCustom</a>, <a href="matlab:help em.FieldAnalysisWithFeed.pattern">pattern</a>

% Copyright 2018 The MathWorks, Inc.


%% Check for the correct number of input/output arguments
narginchk(2,14)
if nargout > 3
    error(message('antenna:antennaerrors:IncorrectNumArguments', ...
        'output','output','3'));
end


%% Parse and validate the input arguments
%Enable support for strings
if nargin > 2
    [varargin{:}] = convertStringsToChars(varargin{:});
end

%Parse input arguments
expectedMethod = {'Summing','CrossWeighted'};
parseObj = parseHelper(vertSlice,theta,varargin,expectedMethod);

%Ensure that the dimensions of the pattern data are consistent with those
%of their respective angular coordinate sample points
if numel(vertSlice) ~= numel(theta)
    error(message('antenna:antennaerrors:DimensionMismatchSlices', ...
        'vertSlice','theta'))
end
phi = parseObj.Results.phi;
if isscalar(parseObj.Results.horizSlice)
    horizSlice = parseObj.Results.horizSlice.*ones(size(phi));
elseif numel(parseObj.Results.horizSlice) ~= numel(phi)
    error(message('antenna:antennaerrors:DimensionMismatchSlices', ...
        'horizSlice','phi'))
else %horizSlice has dimensions that are consistent with those of phi
    horizSlice = parseObj.Results.horizSlice;
end

%For each pattern slice, if there are repeated angles, then ensure that
%directivity/gain values for each set of repeated angles are equal
checkRepeatedPoints(vertSlice,theta,'el');
checkRepeatedPoints(horizSlice,phi,'az');

%Verify that the input data conforms to the reconstruction algorithm's
%requirements, within the pre-specified tolerance
% checkReconstructionRequirements(vertSlice,theta,horizSlice,phi, ...
%     parseObj.Results.TolNearestAngleFromBoresight, ...
%     parseObj.Results.TolGainMaxVsBoresight, ...
%     parseObj.Results.TolGainDiffAtSliceIntersect)


%% Calculate reconstructed 3D pattern "pat3D"
%Normalize the data as per the maximum directivity/gain
maxDirectivity = max(max(vertSlice),max(horizSlice));
vertSliceNorm = vertSlice - maxDirectivity;
horizSliceNorm = horizSlice - maxDirectivity;

% %Perform additional pre-processing of the data
% [vertMeshLog,horizMeshLog] = meshgrid(vertSliceNorm,horizSliceNorm);
% thetaOut = theta;
% phiOut = phi;

% Determine the reconstruction algorithm to use
switch validatestring(parseObj.Results.Method,expectedMethod)
    case 'Summing'
        [vertMeshLog,thetaOut,horizMeshLog,phiOut,backPlane,frontPlane] = ...
            preprocessData(vertSliceNorm,theta,horizSliceNorm,phi, ...
            'Summing');
        pat3D = vertMeshLog + horizMeshLog;
    case 'CrossWeighted'
        [vertMeshLog,thetaOut,horizMeshLog,phiOut,backPlane,frontPlane] = ...
            preprocessData(vertSliceNorm,theta,horizSliceNorm,phi, ...
            'CrossWeighted');
        k = parseObj.Results.CrossWeightedNormalization;
        vertMeshLin = 10.^(vertMeshLog/10);
        horizMeshLin = 10.^(horizMeshLog/10);
        w1 = vertMeshLin.*(1-horizMeshLin);
        w2 = horizMeshLin.*(1-vertMeshLin);
        pat3D = (horizMeshLog.*w1+vertMeshLog.*w2)./nthroot(w1.^k+w2.^k,k);
        pat3D(w1 == 0 & w2 == 0) = 0;
    otherwise
        %This case should not occur, due to input parser's checks
        assert(false)
end

%Denormalize/unnormalize the reconstructed result
pat3D = pat3D + maxDirectivity;

%% Determine the output arguments to return
if nargout == 0
    figure
    patternCustom(pat3D,thetaOut,phiOut);
else
    %nargout <= 3
    % The structure of pat3D follows the convention in "patternCustom",
    % where "pat3D" is a matrix of size "numel(phi)" by "numel(theta)"
    varargout{1} = pat3D;
    varargout{2} = thetaOut;
    varargout{3} = phiOut;
end
end %End of "patternFromSlices"


function parseObj = parseHelper(vertSlice,theta,args,expectedMethod)
%PARSEHELPER  Helper function to parse and validate the input arguments

%Set up the type-validation sets
typeValidationVec = @(x) validateattributes(x,{'numeric'}, ...
    {'vector','nonempty','real','finite','nonnan'}, 'patternFromSlices');
typeValidationPosScalar = @(x) validateattributes(x,{'numeric'}, ...
    {'scalar','nonempty','real','finite','nonnan','positive'}, 'patternFromSlices');
typeValidationPosScalarPair = @(x) validateattributes(x,{'numeric'}, ...
    {'vector','numel',2,'nonempty','real','finite','nonnan','positive'}, ...
    'patternFromSlices');

%Configure the input parser
parseObj = inputParser;
parseObj.FunctionName = 'patternFromSlices';
addRequired(parseObj,'vertSlice',typeValidationVec)
addRequired(parseObj,'theta',typeValidationVec)
addOptional(parseObj,'horizSlice',max(vertSlice),typeValidationVec)
addOptional(parseObj,'phi',0:5:360,typeValidationVec)
addParameter(parseObj,'Method','Summing',@(x) any(validatestring(x,expectedMethod)))
addParameter(parseObj,'CrossWeightedNormalization',2,typeValidationPosScalar)
addParameter(parseObj,'TolNearestAngleFromBoresight',10,typeValidationPosScalar)       %undocumented
addParameter(parseObj,'TolGainMaxVsBoresight',3,typeValidationPosScalar)               %undocumented
addParameter(parseObj,'TolGainDiffAtSliceIntersect',[1,3],typeValidationPosScalarPair) %undocumented
parse(parseObj,vertSlice,theta,args{:});
end %End of parseHelper


function checkRepeatedPoints(vals,angles,azVsEl)
%CHECKREPEATEDPOINTS  Helper function to check if directivity/gain values
%                     for each set of "repeated angles" are equal

angs = mod(angles,360);
% angs = angles;

%Approach #1: simpler, but limited to only be able to capture one angle for
%each group of repeated points ("rep. pts.")
[c,~,ic] = uniquetol(angs);
valsUnequalAtRepPts = accumarray(ic,vals,[],@(x) (numel(uniquetol(x)) > 1));
repPtsWithUnequalVals = c(valsUnequalAtRepPts);

% %Approach #2: more complex, but more versatile (e.g. can capture all angles
% %for each/every group of repeated points ("rep. pts.")
% [~,ia,~] = uniquetol(angs,'OutputAllIndices',true);
% repPts = ia(cellfun(@(x) (numel(x) > 1),ia));
% valsUnequalAtRepPts = cellfun(@(x) (numel(uniquetol(vals(x))) > 1),repPts);
%     %Option #1: Extract only one angle for each group of repeated points
%     repPtsWithUnequalVals = angs(cellfun(@(x) x(1), ...
%         repPts(valsUnequalAtRepPts)));
%     % %Option #2: Extract all angles for every group of repeated points;
%     % %           this can be useful when the provided angles are not within
%     % %           the range [0,360)
%     % idxRepPtsWithUnequalVals = cellfun(@transpose, ...
%     %     repPts(valsUnequalAtRepPts),'UniformOutput',false);
%     % repPtsWithUnequalVals = angles(sort([idxRepPtsWithUnequalVals{:}]));

%Error if there are any repeated points with different directivity/gain values
if any(valsUnequalAtRepPts)
    %Option #1: Display the angle for only the first such repeated point
    modVal = 360;
    repPtsWithUnequalValsStr = sprintf('%g(mod %g)', repPtsWithUnequalVals(1),modVal);
    
    % %Option #2: Display the angles for every such repeated points
    % repPtsWithUnequalValsStr = ['[', regexprep(num2str(repPtsWithUnequalVals(:)'),'\s+',', '), ']'];
    
    switch azVsEl
        case 'az'
            error(message('antenna:antennaerrors:RepeatedPoints', ...
                '0',repPtsWithUnequalValsStr))
        case 'el'
            error(message('antenna:antennaerrors:RepeatedPoints', ...
                repPtsWithUnequalValsStr,'0'))
        otherwise
            %This case should not occur
            assert(false)
    end
end
end %End of "checkRepeatedPoints"


function checkReconstructionRequirements(vertSlice,theta,horizSlice,phi, ...
    tolNearestAngleFromBS,tolGainMaxVsBS,tolGainDiffAtSliceIntersect)
%CHECKRECONSTRUCTIONREQUIREMENTS  Helper function to verify that the input
%                                 data conforms to the reconstruction
%                                 algorithm's requirements

%As of now, the boresight direction (i.e. the direction of maximum
%directivity/gain) is assumed to occur at phi = 0 and theta = 90 degrees;
%a large deviation from this assumption is likely to lead to a
%deterioration in the reconstruction accuracy
phiBS = 0;
thetaBS = 90;
[minAbsThetaFromBS,idxMinAbsTheta] = findAngleClosestToBS(theta,thetaBS);
[minAbsPhiFromBS,idxMinAbsPhi] = findAngleClosestToBS(phi,phiBS);

%Error if either of the pattern slices does not contain a directivity/gain
%sample whose corresponding angular coordinates are within the prespecified
%angular tolerance from the assumed direction of the boresight/maximum;
%otherwise, the reconstruction accuracy is likely to suffer
if minAbsThetaFromBS > tolNearestAngleFromBS
    error(message('antenna:antennaerrors:NoAnglesNearBoresightVert', ...
        num2str(tolNearestAngleFromBS), num2str(thetaBS)))
end
if minAbsPhiFromBS > tolNearestAngleFromBS
    error(message('antenna:antennaerrors:NoAnglesNearBoresightHoriz', ...
        num2str(tolNearestAngleFromBS), num2str(phiBS)))
end

%Error if, for either pattern slice, the directivity/gain at the angular
%coordinates (in the input data) closest to the assumed boresight direction
%is not within the prespecified tolerance from the input data's maximum;
%otherwise, the reconstruction accuracy is likely to suffer
if (max(vertSlice)-vertSlice(idxMinAbsTheta)) > tolGainMaxVsBS
    error(message('antenna:antennaerrors:GainAtBoresightVsMaxGainVert', ...
        num2str(thetaBS),num2str(tolGainMaxVsBS)))
end
if (max(horizSlice)-horizSlice(idxMinAbsPhi)) > tolGainMaxVsBS
    error(message('antenna:antennaerrors:GainAtBoresightVsMaxGainHoriz', ...
        num2str(phiBS),num2str(tolGainMaxVsBS)))
end

%Issue an error or a warning if there is a sufficiently large discrepancy
%between the directivities/gains of the two pattern slices at (or near)
%their intersection, because it should be expected that the two slices
%agree at their intersection (within a reasonable measurement uncertainty)
if abs(vertSlice(idxMinAbsTheta)-horizSlice(idxMinAbsPhi)) > tolGainDiffAtSliceIntersect(2)
    error(message('antenna:antennaerrors:GainDiffAtSliceIntersect', ...
        num2str(tolGainDiffAtSliceIntersect(2))))
elseif abs(vertSlice(idxMinAbsTheta)-horizSlice(idxMinAbsPhi)) > tolGainDiffAtSliceIntersect(1)
    warning(message('antenna:antennaerrors:GainDiffAtSliceIntersect', ...
        num2str(tolGainDiffAtSliceIntersect(1))))
else %the absolute difference is below the tolerance threshold
    %do nothing
end
end %End of "checkReconstructionRequirements"


function [m,idx] = findAngleClosestToBS(angles,angleBS)
%FINDANGLECLOSESTTOBS  Helper function to find the angle with minimum
%                      deviation from provided boresight angle

%Helper function to wrap angles to the range (alpha-360,alpha]
wrapToAlpha = @(x,alpha) x-360.*ceil((x-alpha)./360);

%Here alpha is chosen below such that the interval (alpha-360,alpha] is
%centered around angleBS
[m,idx] = min(abs(wrapToAlpha(angles,angleBS+180)-angleBS));
end %End of "findAngleClosestToBS"


function [vertMeshLog,thetaOut,horizMeshLog,phiOut,backPlane,frontPlane] = ...
    preprocessData(vertSliceNorm,theta,horizSliceNorm,phi,reconstructMethod)
%PREPROCESSDATA  Helper function to perform additional, algorithm-specific
%                pre-processing of the data

thetaMod360 = mod(theta,360);
phiMod360 = mod(phi,360);
isOmni = ~any(abs(diff(horizSliceNorm)) > 0);

switch reconstructMethod
    case 'Summing'
        %Except for omni-directional antennas, only use vertical and
        %horizontal pattern slice data corresponding to "front plane"
        %measurements, because the "Summing" method is neither intended nor
        %well-suited for 3D pattern reconstruction in the "back plane"
%         if isOmni
%             idxTheta = 1:numel(theta);
            idxPhi = 1:numel(phi);
%         else
            idxTheta = thetaMod360 <= 180;
%         end
    case 'CrossWeighted'
        %Only use vertical pattern slice data corresponding to
        %"front plane" measurements, because the "CrossWeighted" method is
        %not designed/intended to utilize "back plane" vertical slice data;
        %for omni-directional antennas, "back plane" and "front plane"
        %measurements are expected/assumed to be [nearly] equivalent
        idxTheta = thetaMod360 <= 180;
        idxPhi = 1:numel(phi);
    otherwise
        %This case should not occur
        assert(false)
end
idxP = phiMod360 <= 90 | phiMod360 >= 270;
idxT = thetaMod360<=180 | thetaMod360>=0;
backPlane.P = find(~idxP);
backPlane.T = find(~idxT);
frontPlane.P = find(idxP);
frontPlane.T = find(idxT);
thetaOut = theta(idxTheta);
phiOut = phi(idxPhi);
[vertMeshLog,horizMeshLog] = ...
    meshgrid(vertSliceNorm(idxTheta),horizSliceNorm(idxPhi));

end %End of "preprocessData"