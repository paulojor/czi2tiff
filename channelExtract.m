function [imageCh,cellImageCh,lut,metadata] = channelExtract(data)
%This function separates the original czi data into the respective
%channels.

%There are two outputs:
%imageCh is a 4 dimensional uint8 array, with the following 4 axis:
%x,y,z,channel. 

%cellImageCh is a cell array in which each cell corresponds to one of the
%channels. The array inside each cell is a 3-dimensional uint8 array, with
%the following 3 axis:
%x,y,z

if size(data,1)==1
    
    if size(data{1,1},1)>1
        simpleMetaInf = data{1,1}{1,2};
        markers1 = strfind(simpleMetaInf,'/');
        markers2 = strfind(simpleMetaInf,';');
        nCh = str2num(simpleMetaInf(markers1(end)+1:end));
        nZ = str2num(simpleMetaInf(markers1(end-1)+1:markers2(end)-1));
    
        imageCh = nan(size(data{1,1}{1,1},1),size(data{1,1}{1,1},2),nZ,nCh);
    
        for i=1:size(data{1,1},1)
            metaInf = data{1,1}{i,2};
            markerZ = strfind(metaInf,'Z');
            markerC = strfind(metaInf,'C');
            marker1 = strfind(metaInf,'/');
            Z = str2num(metaInf(markerZ+2:marker1(2)-1));
            C = str2num(metaInf(markerC+2:marker1(end)-1));
    
            imageCh(:,:,Z,C) = data{1,1}{i,1};
        end
    else 
        %in case there is only one plane and one channel:
        nCh = 1;
        nZ = 1;
        imageCh(:,:,1,1) = data{1,1}{1,1};
    end

    if isa(data{1,1}{1,1},'uint8')
        imageCh = uint8(imageCh);
    else
        imageCh = uint16(imageCh);
    end

    %for packing the output into a cell array, where each cel corresponds
    %to a channel.
    cellImageCh = cell(1,nCh);
    for i=1:nCh
        cellImageCh{i} = imageCh(:,:,:,i);
    end

    %Extracting the lookup table for each channel (LUT):
    lut = cell(1,nCh);
    for i=1:nCh
        lut{i} = data{1,3}{1,i};
    end

    %extract metadata in structure form.
    omeMeta = data{1, 4};
    omeXML = char(omeMeta.dumpXML());
    metadata = xml2struct2(omeXML);

end




    