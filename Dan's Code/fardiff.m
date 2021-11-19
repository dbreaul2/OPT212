function fardiff(type,apl)
% fardiff.m
% Daniel Breault, Jonathan Lai, Sam O'Connor
% To Simulate Far-field Diffraction
% 
% Inputs:
%   type: aperture type of choice
%       Possible Inputs:       
%       - "'square'"
%               a square aperture
%       - "'slit'"
%               a single slit aperture
%       - "'double'"
%               two slit apertures with a distance between them
%       - "'circle'"
%               a circular aperture 
%       - "'triangle'"
%               a right triangle aperture with its right angle to its 
%               bottom left
%
%   Input 2: apl = aperture field length
%
% For whichever aperture chosen, the program will call up a relevant script
% which will generate the aperture (figure 1)
%
% Then, the intensity of the far-field diffraction will be calculated
%
% From then a second subfunction (aperrun) is called with the aperture, 
% field length, and color scales of the graphs as inputs. 
% 
% aperrun.m will do four things:
% Figure 2:
% - plot the full far-field diffraction of the relevant aperture
% Figure 3:
% - display the center 250x250 pixels of the far-field diffraction
% Figure 4:
% - plot the center 250x250 as a 2D horizontal cross section of intensity
% Figure 5:
% - plot the center 250x250 as a 2D vertical cross section of intensity
%
% The function, having accomplished all it set out to do ends with that
% Except for the case of the triangle aperture, whose script will then
% plot the center 250x250 as a 2D diagonal cross section of intensity
% along the hypotenuse.


% Distinguish and call the relevant script
if strcmp(type,'square')==1 % Square Aperture
    promptsi1 = 'Input the side length of the square aperture = ';
    si1 = input(promptsi1);
    apersquare(apl,si1); % Run the square aperture script

elseif strcmp(type,'slit')==1 % Slit Aperture
    promptsi1 = 'Input the height of the slit aperture = ';
    si1 = input(promptsi1);
    promptsi2 = 'Input the width of the slit aperture = ';
    si2 = input(promptsi1);
    aperslit(apl,si1,si2); % Run the slit aperture script

elseif strcmp(type,'double')==1 % Double Slit Aperture
    promptsi1 = 'Input the heights of the slit apertures = ';
    si1 = input(promptsi1);
    promptsi2 = 'Input the widths of the slit apertures = ';
    si2 = input(promptsi2);
    promptsi3 = 'Input the center distance between the slit apertures = ';
    si3 = input(promptsi3);
    aperdouble(apl,si1,si2,si3); % Run the double slit aperture script
    
elseif strcmp(type,'circle')==1 % Circular Aperture
    promptsi1 = 'Input the radius of the circular aperture = ';
    si1 = input(promptsi1);
    apercircle(apl,si1); % Run the circular aperture script
    
elseif strcmp(type,'triangle')==1 % Triangular Aperture
    promptsi1 = 'Input the side length of the triangular aperture = ';
    si1 = input(promptsi1);
    apertriangle(apl,si1); % Run the triangular aperture script
    
else
    % Error Message
    header=('ERROR: Incorrect Aperture Type Input');
    msg1=('List of valid inputs:');
    msg2=('''square'',''slit'',''double'',''circle'', and ''triangle''.');
    msg3=('See the help file for more information');
    disp(header) % Display the error message
    disp(msg1)
    disp(msg2)
    disp(msg3)
    return % End the program
end
