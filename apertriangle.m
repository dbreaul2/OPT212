% apertriangle.m
% Daniel Breault, Jonathan Lai, Sam O'Connor
% OPT 211 Final Project
% 4/19/20
% Function called by fardiff.m
% To construct the right triangle aperture, run far-field diffraction,
% and plot the relevant figures

% Define Aperture field
apl=5000; % Size of the aperture field
ap=zeros(apl); % Define actual aperture plane

% Define bounds of Aperture
sil=1500; % Side Length of Aperture

% Painting vertical strips from the base to the slope lmn=ijk
for ijk=round(1+apl/2-sil/2):round(1+apl/2+sil/2)
 for lmn=round(1+apl/2-sil/2):round(ijk)
 ap(ijk,lmn)=1;
 end
end

% Plot the aperture field
figure(1)
imagesc(ap) % Plot image of the aperture field
colormap gray % Set the color of the aperture field plot
axis equal % Set the display scale of the axes
axis([0 apl 0 apl]) % Set axes limits to size of aperture field
title('Triangular Aperture')
xlabel('Length [Pixels]')
ylabel('Width [Pixels]')

% Diffraction - The square of the real component of the Fourier Transform
f1=(real(fft2(ap))); % The real component of the Fourier Transform
f2=fftshift(f1); % Shift the zero frequency to the center
i1=(f2.^2); % The Intensity
i2=(i1.^0.18); % The Scaled Intensity

b1=0; % Lower z axis bound of full field graph
b2=150; % Upper z axis bound of both graphs
b3=10;% Lower bound of the zoomed in graph

% Calls the aperture runner function to plot 4 graphs
aperrun(i2,apl,b1,b2,b3,i1) 

% Plot the diagonal cross-section
figure(6) 
x=linspace(0,250,251); % Set the x-axis from 0 to 250 pixels
% Define the Diagonal Cross-Section, a line y=x cut across the grid for
% the middle 250 pixels
for opq=2375:2625
    y3(1,opq)=i1(opq,opq);
end
y4=y3(2375:2625); % Cut it down so that the graph shows 0x250 dimensions
plot(x,y4,'linewidth',2) % Plot the intensity of the middle column of pixels
xlim([0 250]) % Set x-axis limit to maximize data readability 
xlabel('Width [Pixels]')
ylabel('Intensity [Arb. units]')
title('Diagonal Cross Section')