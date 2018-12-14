clc;
close all;
tic;

M = csvread('rual.csv');% read edited csvfile
L_data = M(1,:);% row #1: arm length data
M_data = M(2,:);% row #2: mass data
ST_data = M(4,:);% row #4: stress data

coeff = polyfit(L_data,ST_data,1);% polynomial function fitting (1 as linear)
figure(1)
plot(L_data,ST_data,'r.',L_data,polyval(coeff,L_data));% plot linear curve
title('Stress Length Polyfit1');
xlabel('Length/mm');
ylabel('Stress/MPa');

toc;