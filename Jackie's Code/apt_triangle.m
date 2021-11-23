%Thomas Karpishin
%OPT 211
%April 23, 2020
%Final Project
%Making a triangular aperture

%Define aperture field
apl = 5000; %Size of aperture field
ap = zeros(apl); %Define actual aperture plane

side = 1500;

for ijk = round(1+apl/2-side/2) : round(1+apl/2+side/2)
    for lmn = round(1+apl/2-side/2) : round(1+apl/2+side/2)
        if lmn < ijk
            ap(ijk,lmn) = 1;
        else
            ap(ijk,lmn) = 0;
        end
    end
end







