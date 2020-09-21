
%%
%IN THIS SECTION, BETA DISTRIBUTIONS ARE CREATED AN PLOTTED FOR DOWNHILL,
%UPHILL AND SAME GRADIENT PROBABILITY DISTRIBUTIONS
function[p_DHILLg1020,p_DHILLg2030,p_DHILLg3040,p_SAMEg0010,p_UPHILLg1020, p_UPHILLg2030,p_UPHILLg3040] = NewBetaDistribution()

%%%%Beta Distribution Domain
Beta.Domain = 0:0.01:1;

%Prob Downhill and Std dev.         
Beta.MeanDownhill=0.52;
Beta.StdDevDownhill=0.13;       %The variances here have been estimated
%Prob Same and Std dev.         %They were estimated to ensure that the 
Beta.MeanSame=0.16;             %the distribution was large enough to intercept        
Beta.StdDevSame=0.13;           %all slope plots for all P(Slope n Elevation) graphs  
%Prob Uphill and Std dev.
Beta.MeanUphill=0.32;
Beta.StdDevUphill=0.13;


%Beta distribution parameters for DOWNHILL distribution
Beta.aDownhill = Beta.MeanDownhill^2 * (((1-Beta.MeanDownhill)/Beta.StdDevDownhill^2) - 1/Beta.MeanDownhill);
Beta.bDownhill = Beta.aDownhill *((1/Beta.MeanDownhill)-1);
%Plot DOWNHILL Beta distribution
Beta.yDownhill = betapdf(Beta.Domain,Beta.aDownhill,Beta.bDownhill);
figure;
plot(Beta.Domain, Beta.yDownhill,'b');
xlabel('x');
ylabel('Probability Density');
legend('Downhill Beta Distribution');

%Beta distribution parameters for SAME distribution
Beta.aSame = Beta.MeanSame^2 * (((1-Beta.MeanSame)/Beta.StdDevSame^2) - 1/Beta.MeanSame);
Beta.bSame = Beta.aSame *((1/Beta.MeanSame)-1);
%Plot SAME Beta distribution
Beta.ySame = betapdf(Beta.Domain,Beta.aSame,Beta.bSame);
figure;
plot(Beta.Domain, Beta.ySame, 'g');
xlabel('x');
ylabel('Probability Density');
legend('Same Beta Distribution');

%Beta distribution parameters for UPHILL distribution
Beta.aUphill = Beta.MeanUphill^2 * (((1-Beta.MeanUphill)/Beta.StdDevUphill^2) - 1/Beta.MeanUphill);
Beta.bUphill = Beta.aUphill *((1/Beta.MeanUphill)-1);
%Plot UPHILL Beta distribution
Beta.yUphill = betapdf(Beta.Domain,Beta.aUphill,Beta.bUphill);
figure;
plot(Beta.Domain, Beta.yUphill,'r');
xlabel('x');
ylabel('Probability Density');
legend('Uphill Beta Distribution');

%Comment out this close all if you'd like to see individual distributions
close all


%%
%IN THIS SECTION , BETA DISTRIBUTIONS ARE CREATED FOR THE SLOPE ANGLES
%(0-10, 10-20, 20-30, 30-40). THIS DATA HAS TO BE ESTIMATED. SLOPE ANGLES
%40+ ARE NOT PLOTTED, AS THE PROBABILITY A SUBJECT (UNLESS CLIMBER) WOULD
%ATTEMPT SUCH SLOPES IS VERY CLOSE TO 0. 

%Variable names should be self-explanatory
Beta.Mean0010 = 0.34;
Beta.StdDev0010 = 0.05;       %The standard deviation is reduced as the slope increases
Beta.Mean1020 = 0.31;         %This is because it as the slopes get steeper, and thus considerably
Beta.StdDev1020 = 0.05;       %Less attractive, the subject is much more likely to be sure it their 
Beta.Mean2030 = 0.25;         %Decision as to whether they will attempt it or not
Beta.StdDev2030 = 0.06;
Beta.Mean3040 = 0.13;
Beta.StdDev3040 = 0.047

%Beta distribution parameters for 0010 distribution
Beta.a0010 = Beta.Mean0010^2 * (((1-Beta.Mean0010)/Beta.StdDev0010^2) - 1/Beta.Mean0010);
Beta.b0010 = Beta.a0010 *((1/Beta.Mean0010)-1);
%Plot 0010 Beta distribution
Beta.y0010 = betapdf(Beta.Domain,Beta.a0010,Beta.b0010);
figure;
plot(Beta.Domain, Beta.y0010,'k');
xlabel('x');
ylabel('Probability Density');
legend('0010 Beta Distribution');

%Beta distribution parameters for 1020 distribution
Beta.a1020 = Beta.Mean1020^2 * (((1-Beta.Mean1020)/Beta.StdDev1020^2) - 1/Beta.Mean1020);
Beta.b1020 = Beta.a1020 *((1/Beta.Mean1020)-1);
%Plot 1020 Beta distribution
Beta.y1020 = betapdf(Beta.Domain,Beta.a1020,Beta.b1020);
figure;
plot(Beta.Domain, Beta.y1020,'k');
xlabel('x');
ylabel('Probability Density');
legend('1020 Beta Distribution');

%Beta distribution parameters for 2030 distribution
Beta.a2030 = Beta.Mean2030^2 * (((1-Beta.Mean2030)/Beta.StdDev2030^2) - 1/Beta.Mean2030);
Beta.b2030 = Beta.a2030 *((1/Beta.Mean2030)-1);
%Plot 2030 Beta distribution
Beta.y2030 = betapdf(Beta.Domain,Beta.a2030,Beta.b2030);
figure;
plot(Beta.Domain, Beta.y2030,'k');
xlabel('x');
ylabel('Probability Density');
legend('2030 Beta Distribution');


%Beta distribution parameters for 3040 distribution
Beta.a3040 = Beta.Mean3040^2 * (((1-Beta.Mean3040)/Beta.StdDev3040^2) - 1/Beta.Mean3040);
Beta.b3040 = Beta.a3040 *((1/Beta.Mean3040)-1);
%Plot 2030 Beta distribution
Beta.y3040 = betapdf(Beta.Domain,Beta.a3040,Beta.b3040);
figure;
plot(Beta.Domain, Beta.y3040,'k');
xlabel('x');
ylabel('Probability Density');
legend('3040 Beta Distribution');

%%
%IN THIS SECTION, THE ELEVATION (DOWNHILL, UPHILL) AND SLOPES(10-20, 20-30, 30-40)
%DISTRIBUTIONS ARE PLOTTED. THE SAME GRADIENT DISTBUTION ONLY USES THE 0-10
%SLOPE AS 0deg-10deg ARE THE ONLY SLOPES CORRESPONDING TO THE SAME GRADIENT

%Downhill elevation plots and slope intersects
figure
plot(Beta.Domain, Beta.yDownhill,'b');
xlabel('x');
ylabel('Probability Density');
ylim([0 10]);
legend('Downhill Beta Distribution');
hold on
plot(Beta.Domain, Beta.y1020,'k');
hold on
plot(Beta.Domain, Beta.y2030,'k');
hold on
plot(Beta.Domain, Beta.y3040,'k');

%Same elevation plot with slope intersect
figure
plot(Beta.Domain, Beta.ySame,'b');
xlabel('x');
ylabel('Probability Density');
ylim([0 10]);
legend('Same Beta Distribution');
hold on
plot(Beta.Domain, Beta.y0010,'k');

%Uphill elevation plots and slope intersects
figure
plot(Beta.Domain, Beta.yUphill,'b');
xlabel('x');
ylabel('Probability Density');
ylim([0 10]);
legend('Uphill Beta Distribution');
hold on
plot(Beta.Domain, Beta.y1020,'k');
hold on
plot(Beta.Domain, Beta.y2030,'k');
hold on
plot(Beta.Domain, Beta.y3040,'k');

%%
%This section calculates the intersection of P(Elevation) and the estimated
%P(slope). This will return P(Slope n Elevation) for each elevation/slope
%combination. 

%The are two intersections per slope/elevation combination. The
%intersection with the highest probability density is selected. 


%Downhill Slope intersection calculation
for i=1:101
    Beta.Ydif1020(i) = Beta.y1020(i)-Beta.yDownhill(i) ; 
    Beta.Ydif2030(i) = Beta.y2030(i)-Beta.yDownhill(i) ;
    Beta.Ydif3040(i) = Beta.y3040(i)-Beta.yDownhill(i) ;  
end 

%Intersection for P(10-20 n downhill)
for i=1:40
  if Beta.Ydif1020(i+1)< 0 & Beta.Ydif1020(i)> 0
 Prob.p_1020nDHILL = (Beta.Domain(i+1)+ Beta.Domain(i))/2;
      break
  else
      if Beta.Ydif1020(i+1)> 0 & Beta.Ydif1020(i)< 0;
Prob.p_1020nDHILL = (Beta.Domain(i+1)+ Beta.Domain(i))/2;
      break
 end 
  end 
end 

%Intersection for P(20-30 n downhill)
for i=1:40
  if Beta.Ydif2030(i+1)< 0 & Beta.Ydif2030(i)> 0
 Prob.p_2030nDHILL = (Beta.Domain(i+1)+ Beta.Domain(i))/2;
      break
  else
      if Beta.Ydif2030(i+1)> 0 & Beta.Ydif2030(i)< 0;
Prob.p_2030nDHILL = (Beta.Domain(i+1)+ Beta.Domain(i))/2;
      break
 end 
  end 
end 

%Intersection for P(30-40 n downhill)
for i=1:40
  if Beta.Ydif3040(i+1)< 0 & Beta.Ydif3040(i)> 0
 Prob.p_3040nDHILL = (Beta.Domain(i+1)+ Beta.Domain(i))/2;
      break
  else
      if Beta.Ydif3040(i+1)> 0 & Beta.Ydif3040(i)< 0;
Prob.p_3040nDHILL = (Beta.Domain(i+1)+ Beta.Domain(i))/2;
      break
 end 
  end 
end 
Prob.p_3040nDHILL = 0.005;


%Same Slope intersection calculation
for i=1:101
    Beta.Ydif0010(i) = Beta.y0010(i)-Beta.ySame(i) ; 
end 

%Intersection for P(0-10 n same)
for i=1:40
  if Beta.Ydif0010(i+1)< 0 & Beta.Ydif0010(i)> 0
 Prob.p_0010nsame = (Beta.Domain(i+1)+ Beta.Domain(i))/2;
      break
  else
      if Beta.Ydif0010(i+1)> 0 & Beta.Ydif0010(i)< 0;
Prob.p_0010nsame = (Beta.Domain(i+1)+ Beta.Domain(i))/2;
      break
 end 
  end 
end 


%Uphill Slope intersection calculation
for i=1:101
    Beta.Ydif1020(i) = Beta.y1020(i)-Beta.yUphill(i) ; 
    Beta.Ydif2030(i) = Beta.y2030(i)-Beta.yUphill(i) ;
    Beta.Ydif3040(i) = Beta.y3040(i)-Beta.yUphill(i) ;  
end 

%Intersection for P(10-20 n Uphill)
for i=1:100
  if Beta.Ydif1020(i+1)< 0 & Beta.Ydif1020(i)> 0
 Prob.p_1020nUPHILL = (Beta.Domain(i+1)+ Beta.Domain(i))/2;
      break
  else
      if Beta.Ydif1020(i+1)> 0 & Beta.Ydif1020(i)< 0;
Prob.p_1020nUPHILL = (Beta.Domain(i+1)+ Beta.Domain(i))/2;
      break
 end 
  end 
end 

%Intersection for P(20-30 n UPHILL)
for i=1:30
  if Beta.Ydif2030(i+1)< 0 & Beta.Ydif2030(i)> 0
 Prob.p_2030nUPHILL = (Beta.Domain(i+1)+ Beta.Domain(i))/2;
      break
  else
      if Beta.Ydif2030(i+1)> 0 & Beta.Ydif2030(i)< 0;
Prob.p_2030nUPHILL = (Beta.Domain(i+1)+ Beta.Domain(i))/2;
      break
 end 
  end 
end 

%Intersection for P(30-40 n UPHILL)
for i=1:40
  if Beta.Ydif3040(i+1)< 0 & Beta.Ydif3040(i)> 0
 Prob.p_3040nUPHILL = (Beta.Domain(i+1)+ Beta.Domain(i))/2;
      break
  else
      if Beta.Ydif3040(i+1)> 0 & Beta.Ydif3040(i)< 0;
Prob.p_3040nUPHILL = (Beta.Domain(i+1)+ Beta.Domain(i))/2;
      break
 end 
  end 
end 

%% 
%Beta graphs returned P(Slope n Elevation)
%IN THIS SECTION, WE WILL CALCULATE P(Slope|Elevation)
p_1020gDHILL = Prob.p_1020nDHILL/((Beta.Mean0010 + Beta.Mean1020)/2);
p_2030gDHILL = Prob.p_2030nDHILL/((Beta.Mean1020 +Beta.Mean2030)/2);
p_3040gDHILL = Prob.p_3040nDHILL/((Beta.Mean2030 +Beta.Mean3040)/2);

p_0010gsame  = Prob.p_0010nsame/((Beta.Mean0010 + Beta.Mean1020)/2);

p_1020gUPHILL = Prob.p_1020nUPHILL/((Beta.Mean0010 + Beta.Mean1020)/2);
p_2030gUPHILL = Prob.p_2030nUPHILL/((Beta.Mean1020 + Beta.Mean2030)/2);
p_3040gUPHILL = Prob.p_3040nUPHILL/((Beta.Mean2030 + Beta.Mean3040)/2);


%%
%IN THIS SECTION, WE WILL CALCULATE P(ELEVATION|SLOPE)
%P(ELEVATION|SLOPE) = (P(Slope|Elevation)*P(ELEVATION))/P(SLOPE)
p_DHILLg1020 = (p_1020gDHILL*Beta.MeanDownhill)/Beta.Mean1020;
p_DHILLg2030 = (p_2030gDHILL*Beta.MeanDownhill)/Beta.Mean2030;
p_DHILLg3040 = (p_3040gDHILL*Beta.MeanDownhill)/Beta.Mean3040;

p_SAMEg0010 = (p_0010gsame*Beta.MeanSame)/Beta.Mean0010;

p_UPHILLg1020 = (p_1020gUPHILL*Beta.MeanUphill)/Beta.Mean1020;
p_UPHILLg2030 = (p_2030gUPHILL*Beta.MeanUphill)/Beta.Mean2030;
p_UPHILLg3040 = (p_3040gUPHILL*Beta.MeanUphill)/Beta.Mean3040;






















































































