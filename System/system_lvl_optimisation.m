clc;
close all;
tic;

M = csvread('ruarua.csv');% read edited csvfile
L_data = M(1,:).';% row #1: arm length data
M_data = M(2,:).';% row #2: mass data
D_data = M(3,:).';% row #3: deflection data
ST_data = M(4,:).';% row #4: stress data
V_data = M(5,:).';% row #5: volume data
figure (1)
ff = fit([L_data,ST_data],V_data,'poly22') 
% Use curve fitting toolbox to fit a surface plot of length_stress_volume(negative)
f = @(x,y) -8.635+0.6908*x+1.618e-13*y-0.01382*x^2-3.234e-15*x*y+6.588e-15*y^2;
% Objective function to find minimum negative volume (max when positive)
plot(ff,[L_data,ST_data],V_data); % plot the surface graph
title('3D-Plot');
xlabel('length/mm');
ylabel('Stress/Mpa');
zlabel('Negative Volume/mm^3');
fun = @(x) f(x(1),x(2));% make a general objective function with two variables
lb = [60,4];% set upper bound and lower bound for the two variables, arm length and maximum stress
ub = [90,8];
A = [];
b = [];
Aeq = [];
beq = [];
x0 = [70,4];% initial value to start optimisation
x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub)% Nonlinear constrained optimisation 

toc;