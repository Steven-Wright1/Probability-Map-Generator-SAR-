function [GM] = GithubGradientFunction(Grid)


%BegiGrid.n GradieGrid.nt CalculatioGrid.ns


%Create Blank Gradient Matrix
GM=zeros((Grid.n)*(Grid.n),(Grid.n)*(Grid.n));


%corner cell 1 (-119.54 37.75)
GM(1,2) = (Grid.z(2)- Grid.z(1))/Grid.resolution;  
GM(1,Grid.n+1) = (Grid.z(Grid.n+1)-Grid.z(1))/Grid.resolution;
GM(1,Grid.n+2) = (Grid.z(Grid.n+2)-Grid.z(1))/(sqrt(2)*Grid.resolution);

%Corner Cell n (-119.54 37.735)
GM(Grid.n,Grid.n-1) = (Grid.z(Grid.n-1)- Grid.z(Grid.n))/Grid.resolution;  
GM(Grid.n,Grid.n*2) = (Grid.z(Grid.n*2)-Grid.z(Grid.n))/Grid.resolution;
GM(Grid.n,((Grid.n*2)-1)) = (Grid.z((Grid.n*2)-1)-Grid.z(Grid.n))/(sqrt(2)*Grid.resolution);

%Corner Cell (n*n-1)+1 (-119.526 37.75)
GM((Grid.n*(Grid.n-1)+1),(Grid.n*(Grid.n-1)+2)) = (Grid.z((Grid.n*(Grid.n-1)+2))- Grid.z((Grid.n*(Grid.n-1)+1)))/Grid.resolution;  
GM((Grid.n*(Grid.n-1)+1),(Grid.n*(Grid.n-2)+1)) = (Grid.z((Grid.n*(Grid.n-2)+1))-Grid.z(Grid.n*(Grid.n-1)+1))/Grid.resolution;
GM((Grid.n*(Grid.n-1)+1),(Grid.n*(Grid.n-2)+2)) = (Grid.z((Grid.n*(Grid.n-2)+2))-Grid.z(Grid.n*(Grid.n-1)+1))/(sqrt(2)*Grid.resolution);

%CorGrid.ner Cell Grid.n*Grid.n (-119.526 37.735)
GM((Grid.n*Grid.n),(Grid.n*Grid.n)-1) = (Grid.z((Grid.n*Grid.n)-1)- Grid.z((Grid.n*Grid.n)))/Grid.resolution;  
GM((Grid.n*Grid.n),Grid.n*(Grid.n-1)) = (Grid.z(Grid.n*(Grid.n-1))-Grid.z((Grid.n*Grid.n)))/Grid.resolution;
GM((Grid.n*Grid.n),Grid.n*(Grid.n-1)-1) = (Grid.z(Grid.n*(Grid.n-1)-1)-Grid.z((Grid.n*Grid.n)))/(sqrt(2)*Grid.resolution);

%Grid.now have to move oGrid.nto the edges, without overwritiGrid.ng the values
%for each corGrid.ner cell computed before. This does Grid.not cover movemeGrid.nts
%betweeGrid.n iGrid.nside cells as edge cells have 5 possible paths, iGrid.nside cells
%have 8 possible paths

%%%%%%%%%%%%%%%%%%%% EDGE CELL COGrid.nGrid.nECTIVITY %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%These are the cells aloGrid.ng the x=1,y=1-Grid.n directioGrid.n
for i=1:Grid.n-2;
%Cells 1 to Grid.n
GM(i+1,i+2)= (Grid.z(i+2)-Grid.z(i+1))/Grid.resolution; 
%Cells Grid.n-1 (opposite of 1 to Grid.n)
GM(i+1,i)= (Grid.z(i)-Grid.z(i+1))/Grid.resolution; 
%MoviGrid.ng DiagoGrid.nally (cells 2 to Grid.n+1, 3 to Grid.n+2 etc...)
GM(i+1,Grid.n+i)= (Grid.z(Grid.n+i)-Grid.z(i+1))/(sqrt(2)*Grid.resolution);
%MoviGrid.ng to the opposite diagoGrid.nal (cells 2 to Grid.n+3)
GM(i+1,Grid.n+i+2)=(Grid.z(Grid.n+i+2)-Grid.z(i+1))/(sqrt(2)*Grid.resolution);
%MoviGrid.ng from cells 2 to (2+Grid.n), 3 to (3+Grid.n) etc. 
GM(i+1,Grid.n+i+1)=(Grid.z(Grid.n+i+1)-Grid.z(i+1))/Grid.resolution;

%%%%%%%%%These are the cells aloGrid.ng the y=Grid.n, X=1-Grid.n directioGrid.n
%MoviGrid.ng from cells 2i*Grid.n - i*Grid.n (ie - aloGrid.ng the edge)
GM(Grid.n*(i+1),Grid.n*i)= (Grid.z(Grid.n*i)-Grid.z(Grid.n*(i+1)))/Grid.resolution; 
%MoviGrid.ng from cells i*Grid.n - 2i*Grid.n (ie - aloGrid.ng the edge but opposite directioGrid.n)
GM(Grid.n*(i+1),Grid.n*(i+2))= (Grid.z(Grid.n*(i+2))-Grid.z(Grid.n*(i+1)))/Grid.resolution; 
%MoviGrid.ng DiagoGrid.nally dowGrid.nwards from cells (2i*Grid.n to (i*Grid.n)-1) e.g for Grid.n = 5,
%this is moviGrid.ng from cell 10 to 4, cell 15 to 9 , cell 20 to 14 etc. 
GM((Grid.n*(i+1)),(Grid.n*i)-1)= (Grid.z(Grid.n*(i)-1)- Grid.z(Grid.n*(i+1)))/(sqrt(2)*Grid.resolution);
%e.g for Grid.n = 5, this is moviGrid.ng diagoGrid.nally upwards from cell 10 to 14, 15 to19, 20 to 24 
GM(Grid.n*(i+1),(Grid.n*(i+2)-1))= (Grid.z(Grid.n*(i+2)-1)- Grid.z(Grid.n*(i+1)))/(sqrt(2)*Grid.resolution);
%MoviGrid.ng from the cell edge horiGrid.zoGrid.ntally iGrid.nto the ceGrid.ntre (ie if Grid.n= 5, this
%is 10-9, 15,14 etc. etc.)
GM(Grid.n*(i+1),Grid.n*(i+1)-1)= (Grid.z(Grid.n*(i+1)-1)-Grid.z(Grid.n*(i+1)))/Grid.resolution;

%%%%%%%%%These are the cells aloGrid.ng the x=Grid.n, y=1-Grid.n directioGrid.n
%DeceGrid.ndiGrid.ng aloGrid.ng the edge (ie - for Grid.n=5, moviGrid.ng from cells 24 to 23, 23 to
%22 etc.)
GM((Grid.n*Grid.n)-i,(Grid.n*Grid.n)-i-1) = (Grid.z((Grid.n*Grid.n)-i-1)-Grid.z((Grid.n*Grid.n)-i))/Grid.resolution;
%AdvaGrid.nciGrid.ng AloGrid.ng the Cell Edge (ie - for Grid.n=5, moviGrid.ng from cells 22 to 23, 23 to
%24 etc.)
GM((Grid.n*Grid.n)-i,(Grid.n*Grid.n)+1-i) = (Grid.z((Grid.n*Grid.n)+1-i)-Grid.z((Grid.n*Grid.n)-i))/Grid.resolution;
%MoviGrid.ng diagoGrid.nally (for Grid.n = 5, moviGrid.ng from cells 24 to 20, 23 to 19 etc.)
GM((Grid.n*Grid.n)-i,Grid.n*(Grid.n-1)+1-i) = (Grid.z(Grid.n*(Grid.n-1)+1-i)-Grid.z((Grid.n*Grid.n)-i))/(sqrt(2)*Grid.resolution);
%MoviGrid.ng DiagoGrid.nally the other way (ie- 24 to 18, 23 to 17, 22 to 16)
GM((Grid.n*Grid.n)-i,Grid.n*(Grid.n-1)-1-i) = (Grid.z(Grid.n*(Grid.n-1)-1-i)-Grid.z((Grid.n*Grid.n)-i))/(sqrt(2)*Grid.resolution);
%MoviGrid.ng from the cell edge vertically dowGrid.n iGrid.nto the grid ceGrid.ntre
GM(((Grid.n*Grid.n)-i),(Grid.n*(Grid.n-1)-i)) = (Grid.z(Grid.n*(Grid.n-1)-i)-Grid.z((Grid.n*Grid.n)-i))/Grid.resolution;

%Edge Cell CoGrid.nGrid.nectivity (Bottom Side)
%MoviGrid.ng Upwards
GM(Grid.n*(Grid.n-1-i)+1,(Grid.n*(Grid.n-1-i))+2) = (Grid.z((Grid.n*(Grid.n-1-i))+2)-Grid.z(Grid.n*(Grid.n-1-i)+1))/Grid.resolution;
%MoviGrid.ng Right
GM(Grid.n*(Grid.n-i-1)+1, Grid.n*(Grid.n-2-i)+1) = (Grid.z(Grid.n*(Grid.n-2-i)+1)- Grid.z(Grid.n*(Grid.n-i-1)+1))/Grid.resolution;
%MoviGrid.ng Left
GM((1+(Grid.n*i)), 1+Grid.n*(i+1)) = (Grid.z(1+Grid.n*(i+1)) - Grid.z(1+(Grid.n*i)))/Grid.resolution;
%MoviGrid.ng DiagoGrid.nally Right
GM((i*Grid.n)+1, (i*Grid.n)-(Grid.n-2)) = (Grid.z((i*Grid.n)-(Grid.n-2)) - Grid.z((i*Grid.n)+1))/(sqrt(2)*Grid.resolution);
%MoviGrid.ng DiagoGrid.nally Left
GM((i*Grid.n)+1, Grid.n*(i+1)+2) = (Grid.z(Grid.n*(i+1)+2) - Grid.z((i*Grid.n)+1))/(sqrt(2)*Grid.resolution);


end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Grid.now MoviGrid.ng OGrid.nto the IGrid.nside Cells Which PreseGrid.nts 8 Possible TraGrid.nslatioGrid.ns
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:Grid.n-2
for j=1:Grid.n-2
%This calculates gradieGrid.nt traGrid.nslatioGrid.ns advaGrid.nciGrid.ng iGrid.n the x-directioGrid.n. (ie-
%for Grid.n=5, traGrid.nslatioGrid.ns iGrid.nclude 7-12, 12-17, 17-22, 8-13, 13-18, 18-23 etc.
%for all middle cells
GM(Grid.n*(Grid.n-(j+1))+1+i,Grid.n*(Grid.n-j)+1+i) = (Grid.z(Grid.n*(Grid.n-j)+1+i) - Grid.z(Grid.n*(Grid.n-(j+1))+1+i))/Grid.resolution ; 
%Calculates gradieGrid.nt traGrid.nslatioGrid.ns advaGrid.nciGrid.ng iGrid.n the y-directioGrid.n (ie- for
%Grid.n=5, 7-8, 9-10, 10-11, 12-13, 13-14, 14-15,17-18 etc... for all middle
%cells
GM(Grid.n*(Grid.n-(j+1))+1+i,Grid.n*(Grid.n-(j+1))+2+i) = (Grid.z(Grid.n*(Grid.n-(j+1))+2+i) - Grid.z(Grid.n*(Grid.n-(j+1))+1+i))/Grid.resolution;
%Calcultes GradieGrid.nt TraGrid.nslatioGrid.ns RetreatiGrid.ng iGrid.n the y-directioGrid.n (ie-
%opposite of above... for Grid.n=5, 8-7, 10-9, 11-10 etc.
GM(Grid.n*(Grid.n-(j+1))+1+i,Grid.n*(Grid.n-(j+1))+i) = (Grid.z(Grid.n*(Grid.n-(j+1))+i) - Grid.z(Grid.n*(Grid.n-(j+1))+1+i))/Grid.resolution;
%MoviGrid.ng DiagoGrid.nally iGrid.n RetreatiGrid.ng y-directioGrid.n, advaGrid.nciGrid.ng x directioGrid.n (ie-
%for Grid.n=5, 7-11, 8-12, 9-13, 12-16 13-17,14-18 etc. etc. 
GM(Grid.n*(Grid.n-(j+1))+1+i,Grid.n*(Grid.n-j)+i) = (Grid.z(Grid.n*(Grid.n-j)+i) - Grid.z(Grid.n*(Grid.n-(j+1))+1+i))/(sqrt(2)*Grid.resolution);
%GradieGrid.nt TraGrid.nslatioGrid.ns iGrid.n the RetreatiGrid.ng x-directioGrid.n, advaGrid.nciGrid.ng y-directioGrid.n
%(ie- for Grid.n=5, 7-3, 8-4,9-5, 12-8, 13-9, 14-10, 17-13 etc etc. 
GM(Grid.n*(Grid.n-(j+1))+1+i,Grid.n*(Grid.n-(j+2))+2+i) = (Grid.z(Grid.n*(Grid.n-(j+2))+2+i) - Grid.z(Grid.n*(Grid.n-(j+1))+1+i))/(sqrt(2)*Grid.resolution);
%GradieGrid.nt TraGrid.nslatioGrid.ns iGrid.n the AdvaGrid.nciGrid.ng x aGrid.nd y directioGrid.ns for all middle
%cells (ie - 7-13, 8-14, 9-15, 12-18, 13-19, 14-20, 17-23 etc.)
GM(Grid.n*(Grid.n-(j+1))+1+i,Grid.n*(Grid.n-j)+2+i) = (Grid.z(Grid.n*(Grid.n-j)+2+i) - Grid.z(Grid.n*(Grid.n-(j+1))+1+i))/(sqrt(2)*Grid.resolution);
%GradieGrid.nt TrabslatioGrid.ns iGrid.n the RetreatiGrid.ng x aGrid.nd y directioGrid.ns (ie- 7-1, 8-2,
%9-3, 10-4, 12-6, 13-7, 14-8, 15-9, 17-11 etc.) 
GM(Grid.n*(Grid.n-(j+1))+1+i,Grid.n*(Grid.n-(j+2))+i) = (Grid.z(Grid.n*(Grid.n-(j+2))+i) - Grid.z(Grid.n*(Grid.n-(j+1))+1+i))/(sqrt(2)*Grid.resolution);
%GradieGrid.nt TraGrid.nslatioGrid.ns iGrid.n the RetreatiGrid.ng X DirectioGrid.n (ie- 7-2, 8-3, 9-4,
%12-7, 13-8 14-9, 17-12 etc. etc.)
GM(Grid.n*(Grid.n-(j+1))+1+i,Grid.n*(Grid.n-(j+2))+1+i) = (Grid.z(Grid.n*(Grid.n-(j+2))+1+i) - Grid.z(Grid.n*(Grid.n-(j+1))+1+i))/Grid.resolution;
end
end

end
