clc;
close all;
tic;

fs = @(x,y) 299.1-10.87*x-193.4*y+0.1366*x^2+4.904*x*y+43.54*y^2-0.03705*x^2*y-0.5268*x*y^2-3.3334*y^3;
% width_thickness_stress function fitted from dataset.
fm = @(x,y) -25.52+1.157*x+5.614*y;
% width_thickness_mass function fitted from dataset.
fsurf(fm,[12 20 1.5 4.5]);% plot mass function within the ranges of width/thickness 
hold on
fsurf(fs,[12 20 1.5 4.5]);% plot stress function within the ranges of width/thickness 
title('3D-Plot');
xlabel('Width/mm');
ylabel('Thickness/mm');
zlabel('Stress/Mpa');
fun = @(x) fs(x(1),x(2));% make stress function a general objective function with two variables
lb = [12,1.5];% set upper bound and lower bound for the two variables, width and thickness
ub = [20,4.5];
A = [];
b = [];
Aeq = [];
beq = [];
x0 = [15,3];% initial value to start optimisation
x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub) % Nonlinear constrained optimisation 
    
toc;
