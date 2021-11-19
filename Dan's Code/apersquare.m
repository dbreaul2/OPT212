function [ap,b1,b2,b3,i1,i2] = apersquare(apl,si1)
% Daniel Breault, Jonathan Lai, Sam O'Connor
% OPT 211 Final Project
% 4/19/20
% Function called by fardiff.m
% To construct the square aperture, run far-field diffraction,
% and plot the relevant figures

% apl = size of the aperture field
% si1 = side length of the square

% Define Aperture field
ap=zeros(apl); % Define actual aperture plane

% Create the aperture using the inputted width and height
ap(round(1+apl/2-si1/2):round(1+apl/2+si1/2),...
    round(1+apl/2-si1/2):round(1+apl/2+si1/2))=1;

% Figure 1: Plotting the Aperture Field
figure(1)
imagesc(ap) % Plot image of the aperture field
colormap gray % Set the color of the aperture field plot
axis equal % Set the display scale of the axes
axis([0 apl 0 apl]) % Set axes limits to size of aperture field
title('Square Aperture')
xlabel('Length [Pixels]')
ylabel('Width [Pixels]')

% Diffraction - The square of the real component of the Fourier Transform
f1=(real(fft2(ap))); % The real component of the Fourier Transform
f2=fftshift(f1); % Shift the zero frequency to the center
i1=(f2.^2); % The Intensity
i2=(i1.^0.18); % The Scaled Intensity

b1=6; % Lower z axis bound of the full field graph
b2=87; % Upper bound of both graphs
b3=12; % Lower bound of the zoomed in graph 

aperrun(i2, apl, b1, b2, b3, i1)