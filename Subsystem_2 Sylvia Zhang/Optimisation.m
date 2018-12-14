clc
clear all
tic

%calculate volume
f1 = @(x) 1/(12*tan(pi/x(3))/x(3)/x(4)/((x(1))^2+(x(1))*(x(2))+(x(2)^2)));

%calculate centre of mass
f2 = @(x) x(4)*((x(1))^2+2*(x(1))*(x(2))+3*(x(2))^2)/4/((x(1))^2+(x(1))*(x(2))+(x(2)^2));

%objective function
fun = @(x) 12*584022*tan(pi/x(3))/x(3)/x(4)/((x(1))^2+(x(1))*(x(2))+(x(2)^2))+ x(4)*((x(1))^2+2*(x(1))*(x(2))+3*(x(2))^2)/4/22/((x(1))^2+(x(1))*(x(2))+(x(2)^2));

x0 = [80,80,4,44]; %initial guess
nvars = 4;
lb = [0,0,4,22];
ub = [80,80,128,44];
A = [-1,1,0,0]; % a>=b
b = 0;
Aeq = [];
beq = [];
nonlcon = @sub2con;

%options = optimoptions(@ga,'Display','iter');

%%Solving the optimization problem
x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon);

%x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
%x = ga(fun,nvars,A,b,Aeq,beq,lb,ub,nonlcon,options);

toc
