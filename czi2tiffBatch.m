function czi2tiffBatch(folder)
% CZI2TIFFBATCH batch converts Carl Zeiss LSM 880 czi files to TIFF files.
% The function will do the concersion to all the czi files present in the
% chosen folder. 
%
% The resulting tiff files will have the same name root as the original czi
% file.
%
% Note: this function will only work if the matlab bio-formats v7.0.0
% folder is present in the same folder as this file. 
% For downloading the pack: https://www.openmicroscopy.org/bio-formats/downloads/
%
% Created by Paulo Girão, NTNU, October 2023.

addpath(pwd);
currentfolder = pwd;

if nargin<1
    folder = uigetdir;
end

cd(folder)
d = dir('*.czi');
cd(currentfolder)

for i=1:numel(d)
    disp(strcat('Processing file:',d(i).name));
    czi2tiff(fullfile(d(i).folder,d(i).name));
end

end