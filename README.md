# czi2tiff
Matlab functions to convert Zeiss confocal czi files to multilayered tiff files (one for each channel) 

Paulo Girão, NTNU, October 2023, v1.0

Contact: paulo.girao@ntnu.no

Blog: https://paulosmicrotips.blogspot.com

NOTE: This code will only work if you download Bio-formats v7.0.0 (https://www.openmicroscopy.org/bio-formats/downloads/)
and install the pack bfmatlab in the same folder as the one containing these matlab scripts. 

---

czi2tiff.m permits the user convert single czi files. 

czi2tiffBatch.m permits the user to choose a folder and the function will convert all czi files in that folder into the equivalent tiff files. 

---

Both functions will create tiff files corresponding to the number of channels of the original czi file. 
For example, if the original czi file (ex: "A.czi") contains 3 channels z-stack with 15 layers, then it will create three independent tiff files called "A_Ch1.tiff", "A_Ch2.tiff" and "A_Ch3.tiff", each of them with 15 layers.  

All tiff files generated will be saved in the same folder as the original czi files and will have the same name root. 

These functions were only tested with czi files generated by ZEN black for the model Zeiss LSM 880, and up to a size of 1.38 GB. 
I tested both z-stacks, tiled (mosaic) images and a combination of both. 

The function xml2struct2.m is adapted from code originally writen by W. Falkena (2010). 
