f = @(x,y) 299.1-10.87*x-193.4*y+0.1366*x^2+4.904*x*y+43.54*y^2-0.03705*x^2*y-0.5268*x*y^2-3.3334*y^3;
%f = @(x,y) 73.72-1.799*x-22.06*y+0.02042*x^2+0.2899*x*y+1.845*y^2;
g = @(x,y) -25.52+1.157*x+5.614*y;
fsurf(g,[12 20 1.5 4.5]);
title('3D-Plot');
xlabel('Width/mm');
ylabel('Thickness/mm');
zlabel('Stress/Mpa');
hold on
fsurf(f,[12 20 1.5 4.5],'ShowContours','on');
fun = @(x) f(x(1),x(2));
lb = [12,1.5];
ub = [20,4.5];
A = [];
b = [];
Aeq = [];
beq = [];
x0 = [12,1.5];
x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub);
    

