function aperturestuff(apshape,len1,len2)
% OPT 211 Final Project
% We Can Etendue It (Group 9)
% Plots the far-field diffraction pattern for the apertures described below,
%   as well as the aperture itself, zoomed in images of the pattern,
%   and intensity profiles along center crosssections in the x and y directions
% apshape is the shape of the aperture, which must be input as a string
% Options are: 'circle','rectangle','triangle','slit', or 'double slit'
% For the cirle, len1 is the radius of the aperture (len2 not used)
% For the rectangle, len1 is the height of the aperture and len2 is width
% For the triangle, len1 is the height of the aperture and len2 is the width
% For the slit, len1 is the size/height of the slit (len2 not used)
% For the double slit, len1 is the size and len2 is the slit spacing (center-to-center)

%% Defining the Aperture
% Define Aperture field
apl=5000; % Size of the aperture field
ap=zeros(apl); % Define actual aperture plane

if strcmp(apshape,'circle')
    apname = 'Circular'; % Define the name of the aperure using for the title
    % for every x, for every y
    for ijk=1:apl
        for lmn=1:apl
            % if the the point ap(ijk,lmn) is within the radius of the 
            % circle from the center of the aperture, 
            % the ap value at that point changes from 0 to 1
            if round((1+apl/2-ijk)^2+(1+apl/2-lmn)^2) <= len1^2
              ap(ijk,lmn)=1;
            end
        end
    end
    
elseif strcmp(apshape,'rectangle')
    if len1 == len2 % Distinguish square and rectangle
        apname = 'Square'; % Define the name of the aperure using for the title
    else
        apname = 'Rectangular'; % Define the name of the aperure using for the title
    end
    % changes ap value from 0 to 1 in range of +- len1/2 heightwise and
    % +- len2/2 lengthwise about the center of the aperture
    ap(round(1+apl/2-len1/2):round(1+apl/2+len1/2),round(1+apl/2-len2/2):round(1+apl/2+len2/2))=1;
    
elseif strcmp(apshape,'triangle')
    apname = 'Triangular'; % Define the name of the aperure using for the title
    m = 0; % multiplier for step length
    dis = len2/len1; % increase in width for one increase in height
    for ijk=round(1+apl/2-len1/2):round(1+apl/2+len1/2)
        % m*dis is step size, increases as ijk increases
        for lmn=round(1+apl/2-len2/2):round(1+apl/2-len2/2+m*dis)
            ap(ijk,lmn)=1;
        end
        m = m+1;
    end
    
elseif strcmp(apshape,'slit')
    apname = 'Single-Slit'; % Define the name of the aperure using for the title
    slitw = 200; % Define the slit-width
    % changes ap value from 0 to 1 in range of +- len1/2 heightwise and
    % +- 100 lengthwise about the center of the aperture
    ap(round(1+apl/2-len1/2):round(1+apl/2+len1/2),round(1+apl/2-slitw/2):round(1+apl/2+slitw/2))=1;
    
elseif strcmp(apshape,'double slit')
    apname = 'Double-Slit'; % Define the name of the aperure using for the title
    slitw = 175; % Define the slit-width
    % changes ap value from 0 to 1 in range of +- len1/2 heightwise and
    % +- 175/2 lengthwise about the points center +- len2/2 lengthwise
    ap(round(1+apl/2-len1/2):round(1+apl/2+len1/2),round(1+apl/2-slitw/2-len2/2):round(1+apl/2+slitw/2-len2/2))=1;
    ap(round(1+apl/2-len1/2):round(1+apl/2+len1/2),round(1+apl/2-slitw/2+len2/2):round(1+apl/2+slitw/2+len2/2))=1;
    
else
    disp('You have entered an invalid aperture shape. Please see the help file for more information :)')
    return
end

%% Plot the five aperture field

figure(1)
imagesc(ap); % Plot image of the aperture field
xlabel('x [Arb. Units]'); % Label the x-axis
ylabel('y [Arb. Units]'); % Label the y-axis
colormap gray; % Set the color of the aperture field plot
axis equal; % Set the display scale of the axes
axis([0 apl 0 apl]); % Set axes limits to size of aperture field
title(['Visualize a ',apname,' Aperture']); % Set the title for each plot


%% Plot diffraction patterns

% Do the Fourier Transform for each aperture
U = fftshift(fft2(ap));

% Draw the full-field far field diffraction pattern
figure(2)
I_ff = abs(U).^2; % Take the magnitude of the results and square it to get the irradiance
imagesc(I_ff.^0.2); % Visualize the full-field irradiance
xlabel('x [Arb. Units]'); % Label the x-axis
ylabel('y [Arb. Units]'); % Label the y-axis
colormap gray; % Set the color of the aperture field plot
axis equal; % Set the display scale of the axes
axis([0 apl 0 apl]); % Set axes limits to size of aperture field
title({'Full-Field Far Field Diffraction Pattern', ['of a ',apname,' Aperture']}); % Set the title for each plot

% Draw the center-field far field diffraction pattern
figure(3)
apl_cf = 250; % Define the length for the side of the close-field
I_cf = I_ff([1+apl/2-apl_cf/2:apl/2+apl_cf/2],[1+apl/2-apl_cf/2:apl/2+apl_cf/2]);
% Use a new matrix to select the region for center-field
imagesc(I_cf.^0.2); % Visualize the full-field irradiance
xlabel('x [Arb. Units]'); % Label the x-axis
ylabel('y [Arb. Units]'); % Label the y-axis
colormap gray; % Set the color of the aperture field plot
axis equal; % Set the display scale of the axes
axis([0 apl_cf 0 apl_cf]) % Set the range for axes
title({'Center-Field Far Field Diffraction Pattern', ['of a ',apname,' Aperture']}); % Set the title for each plot

% Draw the intensity cross sections
figure(4)
plot(I_cf(apl_cf/2+1,:)); % Choose the center of x and plot the intensity cross section for y
xlabel('x [Arb. Units]'); % Label the x-axis
ylabel('Irradiance'); % Label the y-axis
xlim([0,apl_cf]); % Set the range for x-axis
title({'The Intensity Cross Section for y = 2501', ['of a ',apname,' Aperture']}); % Set the title for each plot

figure(5)
plot(I_cf(:,apl_cf/2+1)); % Choose the center of y and plot the intensity cross section for x
xlabel('y [Arb. Units]'); % Label the x-axis
ylabel('Irradiance');  % Label the y-axis
xlim([0,apl_cf]); % Set the range for x-axis
title({'The Intensity Cross Section for x = 2501', ['of a ',apname,' Aperture']}); % Set the title for each plot