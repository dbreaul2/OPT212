function aperrun(i2, apl, b1, b2, b3, i1)

% Daniel Breault, Jonathan Lai, Sam O'Connor
% 4/21/2020
% Plots figures 2 through 5 of fardiff.m
% (the full far-field diffraction, zoomed far-field diffraction, 
% and the horizontal and vertical 2D intensity cross sections)
% To be called directly by other aperscripts, and indirectly by fardiff.m
% for this purpose
%
% Inputs: i2, or the name assigned to the scaled intensity of the subfunct.
% apl, or the size of the aperture field length
% b1 is the lower bound of the first graph
% b2 is the upper bound of both graphs
% b3 is the lower bound of the second graph
% i1 is the unscaled intensity used in the cross section plots

% Figure 2: Plotting Diffraction
figure(2)
colormap gray
imagesc(i2) % Plot as a scaled color image
caxis([b1 b2]) % Limit the z scale
% Format the graph
title('Full Far Field Diffraction')
c1=colorbar; % Show color bar
c1.Label.String='Intensity [Arb. Units]'; % Label color bar
axis equal
axis([0 apl 0 apl])
xlabel('Length [Pixels]')
ylabel('Width [Pixels]')

% Cut the matrix i2 Down to the Middle 250 x 250
i3=i2(apl/2-125:apl/2+125, apl/2-125:apl/2+125);

% Figure 3: Plotting Zoomed in Diffraction Pattern
figure(3)
imagesc(i3)
caxis([b3 b2]) % Limit the z scale
% Format the graph
colormap gray
title('Zoomed in Far Field Diffraction')
c1=colorbar; % Show color bar
c1.Label.String='Intensity [Arb. Units]'; % Label color bar
axis equal
axis([0 250 0 250])
xlabel('Length [Pixels]')
ylabel('Width [Pixels]')

% Plot the horizontal cross-section
figure(4) 
x=linspace(0,250,251); % Define the x-axis to plot along
y1=i1(apl/2,apl/2-125:apl/2+125); % Take the middle row of the unscaled intensity
plot(x,y1,'linewidth',2) % Plot the intensity of the middle row of pixels
xlim([0 250]) % Set x-axis limit to the middle 250
xlabel('Length [Pixels]')
ylabel('Intensity [Arb. units]')
title('Horizontal Cross-Section')

% Plot the vertical cross-section
figure(5)
y2=i1(apl/2-125:apl/2+125,apl/2); % Take the middle column of the unscaled intensity
plot(x,y2,'linewidth',2) % Plot the intensity of the middle column of pixels
xlim([0 250]) % Set x-axis limit to the middle 250
xlabel('Width [Pixels]')
ylabel('Intensity [Arb. units]')
title('Vertical Cross-Section')