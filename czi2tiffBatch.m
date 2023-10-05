function czi2tiffBatch(folder)

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