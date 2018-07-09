% This equalizes luminance and/or the amplitude of the frequency
% spectrum, depending on the flags used

% This uses the SHINE toolbox, May 2010
% (c) Verena Willenbockel, Javid Sadr, Daniel Fiset, Greg O. Horne,
% Frederic Gosselin, James W. Tanaka

% NOTE: only works for grayscale

% G Vilidaite 31st May 2018

clear all
close all

% flags to set:
equalLuminance = 1; % equalize the luminance
equalAmplitude = 1; % equalize the amplitude of the fourier spectrum

inputdir = uigetdir('~/Users/','Select directory containing the images');
savedir = uigetdir('~/Users/','Select directory to save output images');

inputimages = dir(strcat(inputdir,'/*.jpg'));

for im = 1:length(inputimages)
    currimage = imread(strcat(inputdir,'/',inputimages(im).name));
    imagecell{im} = currimage;
end


if equalLuminance == 1
    imagecell = lumMatch(imagecell);
end


if equalAmplitude == 1
    imagecell = specMatch(imagecell);
end



for im = 1:length(inputimages)
    imwrite(imagecell{im}, strcat(savedir,'/',inputimages(im).name))
end