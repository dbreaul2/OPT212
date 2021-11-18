function fardiff(type)
% fardiff.m
% Daniel Breault, Jonathan Lai, Sam O'Connor
% To Simulate Far-field Diffraction
% 
% Inputs:
%   type: aperture type of choice
%       Possible Inputs:       
%       - "'square'"
%               a 500 x 500 pixel square aperture
%       - "'slit'"
%               a 200 x 2500 single slit aperture
%       - "'double'"
%               two 175 x 2500 slit apertures with 500 pixels between them
%               horizontally
%       - "'circle'"
%               a circular aperture with a radius of 275 pixels
%       - "'triangle'"
%               a right triangle aperture with 1500 pixel side lengths
%               and its right angle to its bottom left
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
    apersquare % Run the square aperture script

elseif strcmp(type,'slit')==1 % Slit Aperture
    aperslit % Run the single slit aperture script

elseif strcmp(type,'double')==1 % Double Slit Aperture
    aperdouble % Run the double slit aperture script

elseif strcmp(type,'circle')==1 % Circular Aperture
    apercircle % Run the circular aperture script
    
elseif strcmp(type,'triangle')==1 % Triangular Aperture
    apertriangle % Run the triangular aperture script
    
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
