% apercircle.m
% Daniel Breault, Jonathan Lai, Sam O'Connor
% OPT 211 Final Project
% 4/19/20
% Function called by fardiff.m
% To construct the circular aperture, run far-field diffraction,
% and plot the relevant figures

% Define Aperture field
apl=5000; % Size of the aperture field
ap=zeros(apl); % Define actual aperture plane

% Define bounds of Aperture
r=275; % Radius of Aperture

% Painting vertical strips from the bottom of the circle to the top
% via the equation y=sqrt(r^2-x^2)

for ijk=round(1+apl/2-r):round(1+apl/2+r)
 for lmn=real(round(1+apl/2-sqrt(r^2-(2500-ijk)^2))):real(round...
         (1+apl/2+sqrt(r^2-(2500-ijk)^2)))
 ap(ijk,lmn)=1;
 end
end

% Plot the aperture field
figure(1)
imagesc(ap) % Plot image of the aperture field
colormap gray % Set the color of the aperture field plot
axis equal % Set the display scale of the axes
axis([0 apl 0 apl]) % Set axes limits to size of aperture field
title('Circular Aperture')
xlabel('Length [Pixels]')
ylabel('Width [Pixels]')

% Diffraction - The square of the real component of the Fourier Transform
f1=(real(fft2(ap))); % The real component of the Fourier Transform
f2=fftshift(f1); % Shift the zero frequency to the center
i1=(f2.^2); % The Intensity
i2=(i1.^0.22); % The Scaled Intensity

b1=2; % Lower z axis bound of the full field graph
b2=232; % Upper bound of both graphs
b3=16; % Lower bound of the zoomed in graph

% Calls the aperture runner function to plot 2 graphs
aperrun(i2,apl,b1,b2,b3,i1) 