function convert2tiff(cellImageCh,filename)
%This function converts the variable cellImageCh into tiff format. 

for n=1:numel(cellImageCh) %for each channel
    if numel(cellImageCh)==1
        %in case there is only one channel, then it will only create one
        %file.
        filenameCh = strcat(filename,'.tiff');
    else
        filenameCh = strcat(filename,'_Ch',num2str(n),'.tiff');
    end
    for i=1:size(cellImageCh{n},3)
        if i==1
            imwrite(cellImageCh{n}(:,:,i),filenameCh);
        else
            imwrite(cellImageCh{n}(:,:,i),filenameCh,'WriteMode','append');
        end
    end
end