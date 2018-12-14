clc;
close all;
tic;

M = csvread('ruall.csv');% read edited csvfile
W_data = M(1,:).';% row #1: arm width data
H_data = M(2,:).';% row #2: thickness data
M_data = M(3,:).';% row #3: mass data
D_data = M(4,:).';% row #4: deflection data
ST_data = M(5,:).';% row #5: stress data

figure(1)
fs = fit([W_data,H_data],ST_data,'poly23'); % Use curve fitting toolbox to fit a surface plot of width_thickness_stress
fsfun = formula(fs);% extract the formula of the fitted function
fscoe = coeffvalues(fs);% extract the coefficients of the formula
plot(fs,[W_data,H_data],ST_data); % plot the surface graph
title('Width Thickness Stress 3D-Plot');
xlabel('Width/mm');
ylabel('Thickness/mm');
zlabel('Stress/Mpa');

figure(2)
fm = fit([W_data,H_data],M_data,'poly11');% Use curve fitting toolbox to fit a surface plot of width_thickness_mass
fmfun = formula(fm);% extract the formula of the fitted function
fmcoe = coeffvalues(fm);% extract the coefficients of the formula
plot(fm,[W_data,H_data],M_data); % plot the surface graph
title('Mass Stress Width 3D-Plot');
xlabel('Width/mm');
ylabel('Thickness/mm');
zlabel('Mass/g');

figure(3)
fd = fit([W_data,H_data],D_data,'poly23');% Use curve fitting toolbox to fit a surface plot of width_thickness_deflection
fdfun = formula(fd);% extract the formula of the fitted function
fdcoe = coeffvalues(fd);% extract the coefficients of the formula
plot(fd,[W_data,H_data],D_data);% plot the surface graph
title('Width Thickness Deflection 3D-Plot');
xlabel('Width/mm');
ylabel('Thickness/mm');
zlabel('Deflection/mm');

figure(4)% check which constraint is active in this range
plot(fs,[W_data,H_data],ST_data);
hold on;
plot(fm,[W_data,H_data],M_data);
hold on;
plot(fd,[W_data,H_data],D_data);
toc;