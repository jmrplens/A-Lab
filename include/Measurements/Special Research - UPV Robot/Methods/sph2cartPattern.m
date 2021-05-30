function [X,Y,Z] = sph2cartPattern(phi, theta, r)
% For angles in degrees. Used in Polar 3D plot and Generate Directivity coords
X  = r.*sind(theta).*cosd(phi);
Y  = r.*sind(theta).*sind(phi);
Z  = r.*cosd(theta);