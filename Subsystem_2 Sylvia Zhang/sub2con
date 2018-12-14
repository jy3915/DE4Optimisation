%nonlinear constrints of subsystem 2

function [c,ceq] = sylviacons(x)
c(1) = x(1)-130*sin(pi/x(3));
%c(2) = (x(3)*(((1/cos(pi/x(3)))^(1/5)*(((x(1)^(1/5)*x(3)*cot(pi/x(3)))/4)^(1/5) - ...
    %((x(2)^(1/5)*x(3)*cot(pi/x(3)))/4)^(1/5))^(1/5))^(1/2) + cot(pi/x(3))*(((x(1)^(1/5)*x(3)*cot(pi/x(3)))/4)^(1/5) + ...
    %((x(2)^(1/5)*x(3)*cot(pi/x(3)))/4)^(1/5)) + 4*x(4)^(1/5)*((x(1)^(1/5)*x(3)*cot(pi/x(3)))/4 + ...
    %(x(2)^(1/5)*x(3)*cot(pi/x(3)))/4)^(1/5)))/4 - 30000;
    %This is the relationship between a,b,n,h,and the sureface area of the frustum, however does not give the right result
ceq = [];
end
