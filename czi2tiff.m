function czi2tiff(filename)

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
