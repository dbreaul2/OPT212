function [ap,b1,b2,b3,i1,i2] = aperslit(apl,si1,si2)
% Daniel Breault, Jonathan Lai, Sam O'Connor
% OPT 211 Final Project
% 4/19/20
% Function called by fardiff.m
% To construct the single slit aperture, run far-field diffraction,
% and plot the relevant figures

% ap1 = size of the aperture field
% si1 = height of the slit
% si2 = width of the slit

ap=zeros(apl); % Define actual aperture plane


% Create the aperture using the inputted width and height
ap(round(1+apl/2-si1/2):round(1+apl/2+si1/2),round(1+apl/2-si2/2):...
    round(1+apl/2+si2/2))=1;

% Plot the aperture field
figure(1)
imagesc(ap) % Plot image of the aperture field
colormap gray % Set the color of the aperture field plot
axis equal % Set the display scale of the axes
axis([0 apl 0 apl]) % Set axes limits to size of aperture field
title('Slit Aperture')
xlabel('Length [Pixels]')
ylabel('Width [Pixels]')

% Diffraction - The square of the real component of the Fourier Transform
figure(2)
colormap gray
f1=(real(fft2(ap))); % The real component of the Fourier Transform
f2=fftshift(f1); % Shift the zero frequency to the center
i1=(f2.^2); % The Intensity
i2=(i1.^0.08); % The Scaled Intensity

b1=1; % Lower z axis bound of the full field graph
b2=8; % Upper z axis bound of both graphs
b3=3; % Lower bound of the zoomed in graph

aperrun(i2, apl, b1, b2, b3, i1)