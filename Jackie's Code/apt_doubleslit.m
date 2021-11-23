%Thomas Karpishin
%OPT 211
%April 23, 2020
%Final Project
%Making a double slit aperture

%Define aperture field
apl = 5000; %Size of aperture field
ap = zeros(apl); %Define actual aperture plane

slit_width = 175;
dist = 500; %distance between slits

%Define aperture
sql = 2500;
%ap(round(1+apl/2-sql/2):round(1+apl/2+sql/2),round(1+apl/2-sql/2):round(1+apl/2+sql/2)) = 1;
for ijk = round(1+apl/2-sql/2):round(1+apl/2+sql/2)
    for lmn = round(1+apl/2+dist/2-slit_width/2):round(1+apl/2+dist/2+slit_width/2)
        ap(ijk,lmn) = 1;
    end
end

sql = 2500;
%ap(round(1+apl/2-sql/2):round(1+apl/2+sql/2),round(1+apl/2-sql/2):round(1+apl/2+sql/2)) = 1;
for ijk = round(1+apl/2-sql/2):round(1+apl/2+sql/2)
    for lmn = round(1+apl/2-dist/2-slit_width/2):round(1+apl/2-dist/2+slit_width/2)
        ap(ijk,lmn) = 1;
    end
end


