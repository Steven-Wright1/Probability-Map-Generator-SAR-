clear all
close all
clc

%IGrid.nput xyGrid.z for half dome
%[Grid.x,Grid.y,Grid.z] = xyzread('HalfDomeCopy.xyz');



% IGrid.nput ArcGIS Latitude
Grid.x = [-119.560433:0.001389:-119.527091];
Grid.y =[37.746596:-0.001389:37.713254];
Grid.z = [1322
1357
1371
1351
1326
1308
1279
1251
1272
1289
1325
1425
1532
1601
1674
1726
1826
1928
2032
2183
2582
2513
2528
2387
2350
1261
1281
1300
1286
1271
1259
1250
1250
1292
1334
1410
1518
1674
1697
1762
1841
1899
1955
2286
2660
2636
2469
2339
2300
2267
1238
1237
1240
1246
1248
1244
1249
1293
1322
1397
1529
1611
1797
1810
1852
2003
2119
2360
2643
2670
2574
2263
2213
2202
2190
1234
1235
1244
1223
1235
1259
1303
1345
1424
1535
1682
1703
1794
2098
2261
2310
2476
2547
2599
2528
2204
2145
2134
2112
2118
1234
1241
1237
1247
1247
1300
1479
1547
1671
1814
1923
2026
2201
2202
2222
2342
2448
2491
2290
2110
2077
2047
2034
2049
2052
1241
1240
1237
1254
1288
1483
1619
1833
1939
1988
2070
2146
2170
2179
2189
2254
2262
2126
2074
2021
1986
1962
1961
1978
1993
1236
1238
1240
1271
1367
1591
1755
1837
1931
2001
2075
2135
2151
2125
2113
2111
2074
2036
1977
1938
1928
1922
1914
1908
1920
1243
1231
1244
1278
1353
1551
1699
1800
1862
2012
2088
2117
2099
2067
2034
1974
1949
1943
1942
1909
1903
1906
1914
1907
1905
1251
1246
1245
1263
1354
1466
1681
1790
1885
1988
2076
2082
2048
1997
1953
1881
1880
1902
1923
1912
1901
1891
1892
1889
1890
1249
1254
1235
1259
1367
1535
1670
1772
1875
1976
2009
2033
1970
1920
1858
1853
1892
1929
1990
1977
1941
1898
1871
1879
1883
1256
1255
1237
1262
1380
1535
1669
1750
1859
1936
1960
1971
1901
1849
1838
1883
1949
2005
2039
1973
1850
1904
1927
1922
1911
1244
1247
1253
1307
1383
1520
1640
1724
1836
1894
1911
1895
1783
1785
1803
1800
1932
1989
1970
1784
1933
2001
1977
1969
1944
1245
1242
1259
1319
1414
1548
1749
1895
1816
1777
1744
1694
1679
1661
1662
1686
1733
1779
1745
1903
2082
2096
2008
1952
1900
1265
1264
1279
1390
1515
1682
1632
1620
1548
1531
1550
1568
1588
1580
1599
1624
1665
1686
1719
2018
2133
2052
1944
1900
1883
1302
1264
1353
1444
1469
1440
1431
1424
1428
1415
1429
1440
1537
1562
1569
1587
1619
1640
1674
1739
1944
1891
1870
1860
1878
1332
1292
1294
1296
1314
1330
1340
1382
1420
1442
1517
1618
1632
1607
1600
1612
1625
1639
1675
1705
1773
1807
1837
1870
1895
1380
1324
1298
1308
1309
1324
1360
1416
1470
1525
1611
1706
1694
1692
1680
1661
1660
1664
1689
1796
1827
1843
1892
1924
1930
1415
1368
1323
1315
1329
1369
1422
1471
1540
1582
1716
1792
1781
1752
1743
1757
1748
1735
1801
1839
1848
1888
1952
1986
1998
1609
1496
1361
1365
1386
1466
1533
1612
1879
1996
1983
1939
1928
1879
1852
1873
1882
1894
1873
1874
1897
1953
2008
2074
2075
1555
1464
1473
1595
1690
1906
1988
2024
2061
2067
2065
2033
2017
2015
2020
2016
1982
1958
1952
1949
2017
2050
2099
2132
2141
1627
1493
1585
1782
1948
2006
2050
2091
2113
2096
2089
2083
2071
2063
2047
2034
2037
2021
2030
2041
2065
2099
2143
2152
2171
1563
1565
1801
1930
1971
2037
2100
2113
2093
2076
2109
2109
2087
2068
2055
2055
2067
2082
2092
2100
2109
2155
2184
2196
2212
1622
1829
1893
1930
1994
2081
2110
2075
2050
2037
2065
2089
2100
2093
2090
2095
2123
2131
2158
2185
2212
2230
2229
2227
2246
1810
1843
1884
1927
1984
2048
2037
2036
2027
2030
2035
2068
2110
2122
2124
2128
2149
2159
2188
2220
2257
2285
2291
2289
2285
1816
1840
1871
1919
1945
1995
2001
2012
2021
2032
2037
2057
2100
2133
2139
2157
2184
2205
2228
2258
2291
2319
2351
2354
2346];






%%
%Reshape the arrays iGrid.nto a grid format compataible with meshgrid
Grid.n=25;
%Grid.x = Grid.x(1:Grid.n);
%Grid.y = Grid.y(1:Grid.n:(Grid.n*Grid.n));
Grid.z=reshape(Grid.z,[Grid.n,Grid.n]);
%State data resolution gained from ArcGIS
Grid.resolution=130;

%Compute meshgrid
[Grid.x,Grid.y]=meshgrid(Grid.x,Grid.y);

%Surf Plot Terrain
figure
surf(Grid.x,Grid.y,Grid.z,'FaceColor', 'g');
xlabel('Longitude (DD)')
ylabel('Latitude (DD)')
zlabel('Elevation (m)')
title('Terrain Data')
xlim([min(Grid.x,[],'all'),max(Grid.x,[],'all')])
ylim([min(Grid.y,[],'all'),max(Grid.y,[],'all')])
view([225 25])


%Call the Gradient Function to Calculate Cell to Cell Gradients
[GM] = GithubGradientFunction(Grid);



%%
%Beta Distribution Function

%Specify the number of timesteps, m
m=1; 

%Call Beta Distribution Function to find the probabilities.
[Prob.p_DHILLg1020,Prob.p_DHILLg2030,Prob.p_DHILLg3040,Prob.p_SAMEg0010,Prob.p_UPHILLg1020, Prob.p_UPHILLg2030,Prob.p_UPHILLg3040] = NewBetaDistribution

%normalise probabilities
norm_factor = Prob.p_DHILLg1020+Prob.p_DHILLg2030+Prob.p_DHILLg3040+Prob.p_SAMEg0010+Prob.p_UPHILLg1020+Prob.p_UPHILLg2030+Prob.p_UPHILLg3040;
Prob.p_DHILLg1020 = Prob.p_DHILLg1020/norm_factor;
Prob.p_DHILLg2030 = Prob.p_DHILLg2030/norm_factor;
Prob.p_DHILLg3040 = Prob.p_DHILLg3040/norm_factor;
Prob.p_SAMEg0010 = Prob.p_SAMEg0010/norm_factor;
Prob.p_UPHILLg1020 = Prob.p_UPHILLg1020/norm_factor;
Prob.p_UPHILLg2030 = Prob.p_UPHILLg2030/norm_factor;
Prob.p_UPHILLg3040 = Prob.p_UPHILLg3040/norm_factor;



%%
%Transition Matrix

%Blank Probability Vector
Grid.InitialVector= zeros(1,Grid.n*Grid.n);
%State LKP Vertex
Grid.LKPvertex=313;
%State LKP Vertex Probability
Grid.InitialVector(1,Grid.LKPvertex)=1;
%Set the Counter
Count=Grid.n*Grid.n;

%Preallocate Transition Matrix Memory
TransitionMatrix=zeros(Grid.n^2);


%%%Begin Inputting Probability Arrays Based Upon Z difference, Calculated
%%%Calculated Using Inclination Angles as the Main Driving Parameter
for p=1:m
for i=1:Count
    for j=1:Count
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SAME GRADIENTS%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
%Fill Up Diagonal with Same Gradient Inputs  
TransitionMatrix(i,i) = Prob.p_SAMEg0010(p);
%Set Same Gradient to be Between -10 and 10 degree incline
   if GM(i,j)<0 & GM(i,j)> -tand(10)
        TransitionMatrix(i,j) = Prob.p_SAMEg0010(p);
    else if GM(i,j)> 0 & GM(i,j)<tand(10)
        TransitionMatrix(i,j) =  Prob.p_SAMEg0010(p);
  
   
%%%%%%%%%%%%%%%%%%%%%%%%% DOWNHILL GRADIENTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %else if GM(i,j)< -tand(5) & GM(i,j)>-tand(10)
        %TransitionMatrix(i,j) = Prob.z_DHILL0510(p);
    else if GM(i,j)< -tand(10) & GM(i,j)> -tand(20)
        TransitionMatrix(i,j) = Prob.p_DHILLg1020(p);
    else if GM(i,j)< -tand(20) & GM(i,j)> -tand(30)
        TransitionMatrix(i,j) = Prob.p_DHILLg2030(p);
    else if GM(i,j)< -tand(30) & GM(i,j)> -tand(40)
        TransitionMatrix(i,j) = Prob.p_DHILLg3040(p);
    else if GM(i,j)< -tand(40) & GM(i,j)> -tand(50)
        TransitionMatrix(i,j) = 0;
%CRASHES IF THE GRADIENT IS NOT SUFFICIENT TO EMPLOY THE LINES OF CODE,
%THEREFORE COMMENT OUT LINES NOT REQUIRED
   %else if GM(i,j)<  -tand(50)
        %TransitionMatrix(i,j) = Prob.z_DHILL50plus(p);
        
        
        
%%%%%%%%%%%%%%%%%%%%%%% UPHILL GRADIENTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %else if GM(i,j)> tand(5) & GM(i,j)< tand(10)
        %TransitionMatrix(i,j) = Prob.z_UPHILL0510(p);
    else if GM(i,j)> tand(10) & GM(i,j)< tand(20)
        TransitionMatrix(i,j) = Prob.p_UPHILLg1020(p);        
    else if GM(i,j)> tand(20) & GM(i,j)< tand(30)
        TransitionMatrix(i,j) = Prob.p_UPHILLg2030(p);
    else if GM(i,j)> tand(30) & GM(i,j)< tand(40)
        TransitionMatrix(i,j) = Prob.p_UPHILLg3040(p);
    else if GM(i,j)> tand(40) & GM(i,j)< tand(50)
        TransitionMatrix(i,j) = 0;
    else if GM(i,j)> tand(50)
        TransitionMatrix(i,j) = 0;    
        end 
        end 
        end 
        end
        
        end
        end 
        end
        end
        end
        end
        %end Commented to change same gradient to -10 to 10
        %end Commented to change same gradient to -10 to 10

   
end
end 
end 

%Perfrom row by row transition matrix normalisation so that all rows sum to one. 
for i=1:Count
    for j=1:Count
RowSum = sum(TransitionMatrix,2);
Norm(i,1)=1/RowSum(i);
NormalisedTM(i,j)= TransitionMatrix(i,j).*Norm(i);
    end
end

%%%%%%%%%Times normalised transition by initial vector to yield elevation
%%%%%%%%%probabilities in vector form
 VectElevationProbabilities = Grid.InitialVector*NormalisedTM^m;

end


%Change Elev probs form from vector in matrix to plot using surf
 MatrixElevationProbabilities = reshape(VectElevationProbabilities,[Grid.n,Grid.n]);
 MatrixElevationProbabilities= MatrixElevationProbabilities ;


%PLOT THE ELEVATION PROBABILITY MAP
 %Plots the Elevation and Distance-Ring Probabilities
 figure
 surf(Grid.x,Grid.y,Grid.z, MatrixElevationProbabilities, 'FaceColor', 'Interp')
 colorbar
 view([225 25])
 legend('PDM','Location','north')
 xlabel('Longitude (DD)')
 ylabel('Latitude (DD)')
 zlabel('Elevation (m)')
 
 %%
 %Incorporating Distance-Ring Model 
 
%Finding the Last Known Position Coordinates
InitialMatrix=reshape(Grid.InitialVector, Grid.n,Grid.n);
[LKPlat, LKPlon] = find(InitialMatrix == 1);
%LKPlat = Grid.y(LKPlat);
LKPlat = 37.729928;
LKPlon = -119.543765;

%Convert meters into Lat Lon Values
LatConversion = 8.98311175e-06+2.38311175e-06;
LonConversion = 360/(40075000*cos(LKPlat));

%Hard-Code Converstion from meters to avg lat and lon
HikerFlatTemp1=1000*(LatConversion+LonConversion)/2;
HikerFlatTemp2=1900*(LatConversion+LonConversion)/2;
HikerFlatTemp3=3100*(LatConversion+LonConversion)/2;
HikerFlatTemp4=6100*(LatConversion+LonConversion)/2;

%Circle Drawing Parameter
th = 0:pi/50:2*pi;


%Plots the SAR Map and the LKP using Surf
figure 
surf(Grid.x,Grid.y,Grid.z,'FaceColor', 'g');
hold on
%max(Grid.z,[],'all')
p3=plot3(LKPlon,LKPlat,1800,'ro','linewidth',3)
xlabel('Longitude (DD)')
ylabel('Latitude (DD)')
zlabel('Elevation (m)')
%Distance-ring 1
hold on
xunit = HikerFlatTemp1 * cos(th) + LKPlon;
yunit = HikerFlatTemp1 * sin(th) + LKPlat;
p4 = plot(xunit, yunit,'linewidth',2,'color',[0,0,0]);
%Distance-ring 2
hold on
xunit = HikerFlatTemp2 * cos(th) + LKPlon;
yunit = HikerFlatTemp2 * sin(th) + LKPlat;
p5 = plot(xunit, yunit,'linewidth',2,'color',[0.75,0.75,0.75]);
%Distance-ring 3
hold on
xunit = HikerFlatTemp3 * cos(th) + LKPlon;
yunit = HikerFlatTemp3 * sin(th) + LKPlat;
p6 = plot(xunit, yunit,'linewidth',2,'color',[0.51,0.51,0.51]);
%Distance-ring 4
hold on
xunit = HikerFlatTemp4 * cos(th) + LKPlon;
yunit = HikerFlatTemp4 * sin(th) + LKPlat;
p7 = plot(xunit, yunit,'linewidth',2,'color',[0.74,0.74,0.74]);

legend([p3, p4, p5, p6,p7],'LKP','Distance-Ring1','Distance-Ring2')%'Distance-Ring3','Distance-Ring4','Distance-Ring5')
title('SAR Map with Distance-Ring Model')
xlim([min(Grid.x,[],'all'),max(Grid.x,[],'all')])
ylim([min(Grid.y,[],'all'),max(Grid.y,[],'all')])
view([225 25])

%Calculate Distance in Terms of Lat and Lon Difference
for (i=1:Grid.n*Grid.n)
    
    Distance(1,i)= sqrt((LKPlat-Grid.y(i))^2+(LKPlon-Grid.x(i))^2);
end

%Assign Distance Based Probabilities
for (i=1:Grid.n*Grid.n) 
   
    if Distance(i) < HikerFlatTemp1
    DistanceProb(i,1)=0.25;
    else if Distance(i) < HikerFlatTemp2 & Distance(i)>HikerFlatTemp1
     DistanceProb(i,1)=0.25;
        else if Distance(i) < HikerFlatTemp3 & Distance(i)> HikerFlatTemp2
     DistanceProb(i,1)=0.25;
            else if Distance(i) < HikerFlatTemp4 & Distance(i)> HikerFlatTemp3
     DistanceProb(i,1)=0.20;
     else if Distance(i)> HikerFlatTemp4
      DistanceProb(i,1)=0.05;
         end
         end
         end
         end
         end 
end

%Reshape the DistanceProb Matrix into ElevationProb Format to be Added
 %Together
 DistanceProb=reshape(DistanceProb, Grid.n, Grid.n);
 %Add the two Probabilities Together
 CombinedProb=DistanceProb+MatrixElevationProbabilities;
 
 %Find the Normalisation Value to Ensure all Probabilities Sum to One
 NormParameter=sum(CombinedProb, 'all');
 
 %Perform the Final Normalisation of the Probability Matrix
 CombinedProb=CombinedProb/NormParameter;
 
 %Final sanity check
 sane=sum(CombinedProb, 'all')
 
 %Plots the Elevation and Distance-Ring Probabilities
 figure
 surf(Grid.x,Grid.y,Grid.z, CombinedProb, 'FaceColor', 'interp')
 hold on
 p3=plot3(LKPlon,LKPlat,1800,'ro','linewidth',3)
 colorbar
 xlim([min(Grid.x,[],'all'),max(Grid.x,[],'all')])
 ylim([min(Grid.y,[],'all'),max(Grid.y,[],'all')])
 legend('PDM','LKP')
 xlabel('Longitude (DD)')
 ylabel('Latitude (DD)')
 zlabel('Elevation (m)')
 view([225 25])

x=tand(10)
y=tand(20)

