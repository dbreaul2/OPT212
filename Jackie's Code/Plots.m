function Plots(apt_Shape)

% Jackie Kaufman w/ Team Pacific
% 4 - 22- 2020
% Prof. Greg Savich
% Final Project
% 
%   In the command window, you must enter the shape in the format
%   'apt_Shape' 
%   for example, if you want the square shape, enter 
%   >>Plots('apt_square')
%   This program will then plot the far-field diffraction pattern of that
%       shape. 
%    Furthermore, it will provide two crossections of intensity through
%       the center of the graph
%   The aperture planes are stored as the matrix:   ap
%   
%    *Do note that the origin is in the top left corner for all sizing



run(apt_Shape); % Runs desired program


E = fft2(ap); % Calculates the energy, which is the fourier transform over the shape
I0 = E.^2; % Calculates the Intensity which is energy squared
I = (abs(fftshift(I0.^.25))); % Centers and graphs the intensity raised to .25 for better viewing

% These following lines take the matrices from the center of the image and
% graph the intensity.
Ix = I(apl/2,:); % Creates a matrix for the intensity values from x = 0-apl with the central y value
Iy = I(:,apl/2); % Creates a matrix for the intensity values from y = 0-apl with the central x value
Mi = [Ix',Iy]; % Creates an apl by 4 matrix for use in figure 5
Titles = ["Aperture Plane","Intensity on Image Plane",...
    "Better View of Intensity on Image Plane",...
    "Inverse Fourier Transform of Energy","x-axis","y-axis",...
    "Distance on Image Plane [ Arb. Units]"]; % String Array to title Figures
ZoomIn = apl/2-75; % Creates a variable just for less calculation representing the inside of the zoom of figure 5
ZoomOut = apl/2+75; % this is the max x-limit for figure 5
indvar = linspace(1,5000,5000); % Creating variable for figure 5

for ijk = 1:5  % Creates a for loop to select figures so that they don't have to be reselected
    figure(ijk) % Designates the active figure
    % This if statement plots, using imagesc(), the variety of matrices
    
    if ijk == 1 
        imagesc(ap) % Graphs the aperture plane
    elseif (ijk == 2)||(ijk == 3)
        imagesc(I) % Graphs intensity
        axis equal % Have to put this here or figure three will not be square
        axis([ZoomIn-50 ZoomOut+50 ZoomIn-50 ZoomOut+50]) % Small inefficiency here, setting fig 2 to this zoom in so the intensity is easily seen
    elseif ijk == 4 %
        Inverse = ifft2(E); % creates the inverse of the fourier transform. Inverse should be the same as ap at this point
        imagesc(Inverse) % Creates image of the inverse fourier transform
        
    else  % Using else statement for figure 5 since it is within the for statement and does not depend on user input
        colorbar('off')
        for lmn = 1:2 % This loops around to graph
            subplot(2,1,lmn) % This selects the subplot
            
            plot(indvar,Mi(:,lmn),'LineWidth',1.5,'Color','k')
            axis([ZoomIn ZoomOut 0 Inf]) 
            title({Titles(1,lmn+ijk-1)});
            xlabel(Titles(7),'FontSize',6)
            ylabel(Titles(2),'FontSize',6)
        end
        sgtitle('Intensity Cross Sections')
        
    end 
    xlabel(Titles(7))
    ylabel(Titles(7))
    c = colorbar; % Creates a colorbar
    c.Label.String = 'Intensity';
    colormap gray % Selects desired colormap
    
    if (ijk == 1)||(ijk == 2)||(ijk == 4) % Is there a way to compare to array terms here?
        axis equal % Sets the rest of the imagesc functions to have 1:1 ratio of x:y distance on the plot
        axis([0 apl 0 apl]) %set axes limits to size of aperture field
    end
    title(Titles(1,ijk))
end

colorbar('off') %Since figure(5) is selected, I just want to get rid of the colorbar
% Also, I'm shrinking the font on figure(5), graph 2 since it was selected
xlabel(Titles(7),'FontSize',6)
ylabel(Titles(2),'FontSize',6)