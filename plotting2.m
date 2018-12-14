M = csvread('rual.csv');% read edited csvfile
L_data = M(1,:);% row #1: arm length data
M_data = M(2,:);% row #2: mass data
ST_data = M(4,:);% row #3: stress data
figure(1)
plot3(L_data,ST_data,M_data,"-o");% 3D plot to see relationship between 3 variables
title('3D-Plot');
xlabel('Length/mm');
ylabel('Stress/MPa');
zlabel('Mass/g');

wq = M(1,1):0.1:M(1,end);% Define sample range and intervals 
stq1 = interp1(L_data,ST_data,wq,'spline');% Data interpolation 
figure(2)
plot(L_data,ST_data,'o',wq,stq1,':.');% plot length vs stress interpolation curve 
title('Length-Stress interpolation');
xlabel('Length/mm');
ylabel('Stress/MPa');

coeff = polyfit(L_data,ST_data,1);% polynomial function fitting (1 as linear)
figure(3)
plot(L_data,ST_data,'r.',L_data,polyval(coeff,L_data));% plot linear curve
title('Length-Stress polyfit1');
xlabel('Length/mm');
ylabel('Stress/MPa');

f=fit(L_data.',ST_data.','poly1');% another way to fit curve to data, poly2 as quadratic.
figure(4)
plot(f,L_data,ST_data,'bo');% plot quadratic curve
title('Length-Stress polyfit1');
xlabel('Width/mm');
ylabel('Stress/MPa');

