function czi2tiff(filename)
% CZI2TIFF converts Carl Zeiss LSM 880 czi files to TIFF files.
%
% The resulting tiff files will have the same name root as the original czi
% file.
%
% Note: this function will only work if the matlab bio-formats v7.0.0
% folder is present in the same folder as this file. 
% For downloading the pack: https://www.openmicroscopy.org/bio-formats/downloads/
%
% Created by Paulo Girão, NTNU, October 2023.

addpath(strcat(pwd,'\bfmatlab'))

if nargin<1
    [file,folder] = uigetfile('*.czi');
    filename = fullfile(folder,file);
end

data = bfopen(filename);
[~,cellImageCh,~,~] = channelExtract(data);
convert2tiff(cellImageCh,filename(1:end-4));

disp('Done!')

end
