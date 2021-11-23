%Thomas Karpishin
%OPT 211
%April 23, 2020
%Final Project
%Making a slit aperture

%Define aperture field
apl = 5000; %Size of aperture field
ap = zeros(apl); %Define actual aperture plane

%Define aperture
sql = 2500;
%ap(round(1+apl/2-sql/2):round(1+apl/2+sql/2),round(1+apl/2-sql/2):round(1+apl/2+sql/2)) = 1;
for ijk = round(1+apl/2-sql/2):round(1+apl/2+sql/2)
    for lmn = round(1+apl/2-200/2):round(1+apl/2+200/2)
        ap(ijk,lmn) = 1;
    end
end







