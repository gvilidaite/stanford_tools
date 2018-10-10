% This script computes an average of several images and saves a jpeg of it.

% G Vilidaite 21/8/2018


clear all
close all

[images imagepath] = uigetfile('*.*', 'Multiselect', 'on');


for im = 1:length(images)
    currimage = imread(strcat(imagepath,'/',images{im}));
    
    if length(size(currimage)) == 2 % greyscale
        imageMatrix(im,:,:) = imadjust(currimage);
    else
        imageMatrix(im,:,:,:) = currimage;
    end
end

averageImage = uint8(squeeze(mean(imageMatrix)));

imshow(averageImage)

x = input('Save Image?(y/n)','s');

if strcmp(x, 'y')||strcmp(x, 'yes')

    [savefile savepath] = uiputfile({'*.jpeg'});
    
    imwrite(averageImage, strcat(savepath,'/',savefile));
end

