# czi2tiff
Matlab functions to convert Zeiss confocal czi files to multilayered tiff files (one for each channel) 

NOTE: This code will only work if you download Bio-formats v7.0.0 (https://www.openmicroscopy.org/bio-formats/downloads/)
and install the pack bfmatlab in the same folder as the one containing these matlab scripts. 

There are two functions in this pack that you can use.

czi2tiff permits the user convert single czi files. 

czi2tiffBatch permits the user choose a folder and the function will convert all czi files in that folder into the equivalent tiff files. 
