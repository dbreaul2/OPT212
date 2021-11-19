function [ap,b1,b2,b3,i1,i2] = aperdouble(apl,si1,si2,si3)
% Daniel Breault, Jonathan Lai,Sam O'Connor
% OPT 211 Final Project
% 4/19/20
% Function called by fardiff.m
% To construct the double slit aperture, run far-field diffraction,
% and plot the relevant figures

% apl = size of the aperture field
% s1 = Define slit height
% s2 = Define slit width
% s3 = Define distance between slits

% Define Aperture field
ap=zeros(apl); % Define actual aperture plane

% Create slit 1 (Left Slit)
ap(round(1+apl/2-si1/2):round(1+apl/2+si1/2),round(1+apl/2-si2/2-si3/2):...
    round(1+apl/2+si2/2-si3/2))=1;

% Create slit 2 (Right Slit)
ap(round(1+apl/2-si1/2):round(1+apl/2+si1/2),round(1+apl/2-si2/2+si3/2):...
    round(1+apl/2+si2/2+si3/2))=1;

% Plot the aperture field
figure(1)
imagesc(ap) % Plot image of the aperture field
colormap gray % Set the color of the aperture field plot
axis equal % Set the display scale of the axes
axis([0 apl 0 apl]) % Set axes limits to size of aperture field
title('Double Slit Aperture')
xlabel('Distance [Pixels]')
ylabel('Distance [Pixels]')

% Diffraction - The square of the real component of the Fourier Transform
f1=(real(fft2(ap))); % The real component of the Fourier Transform
f2=fftshift(f1); % Shift the zero frequency to the center
i1=(f2.^2); % The Intensity
i2=(i1.^0.14); % The Scaled Intensity

b1=2; % Lower z axis bound of the full field graph
b2=40; % Upper  bound of the graphs
b3=6.5; % Lower bound of the zoomed in graph

aperrun(i2, apl, b1, b2, b3, i1)