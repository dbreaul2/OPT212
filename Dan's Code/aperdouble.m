% aperdouble.m
% Daniel Breault, Jonathan Lai,Sam O'Connor
% OPT 211 Final Project
% 4/19/20
% Function called by fardiff.m
% To construct the double slit aperture, run far-field diffraction,
% and plot the relevant figures

% Define Aperture field
apl=5000; % Size of the aperture field
ap=zeros(apl); % Define actual aperture plane

% Define square aperture
h=2500; % Define slit height
w=175; % Define slit width
sp=500; % Define distance between slits

% Create slit 1 (Left Slit)
ap(round(1+apl/2-h/2):round(1+apl/2+h/2),round(1+apl/2-w/2-sp/2):...
    round(1+apl/2+w/2-sp/2))=1;

% Create slit 2 (Right Slit)
ap(round(1+apl/2-h/2):round(1+apl/2+h/2),round(1+apl/2-w/2+sp/2):...
    round(1+apl/2+w/2+sp/2))=1;

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

% Calls the aperture runner function to plot 4 graphs
aperrun(i2,apl,b1,b2,b3,i1)