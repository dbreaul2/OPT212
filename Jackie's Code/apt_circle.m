%Thomas Karpishin
%OPT 211
%April 23, 2020
%Final Project
%Making a circle aperture model

%Define aperture field
apl = 5000; %Size of aperture field
ap = zeros(apl); %Define actual aperture plane

r = linspace(0,275,10000);
x = linspace(0,(2.*pi),10000);

%Define circle aperture

for ijk = 1:10000
    for lmn = 1:10000

        ap(round((apl/2)+r(lmn)*cos(x(ijk))),round((apl/2)+r(lmn)*sin(x(ijk)))) = 1;
        
    end
end





