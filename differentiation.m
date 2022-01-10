function [time,cell_num] = differentiation(X,X0,mu,ap,f,part_2)
if nargin<6
    part_2=0;
end
if part_2~=1
    [time,cell_num] = ode45(@Roifun,[0 100],X); % t[Hours];X,X0
else
    [time,cell_num] = ode45(@Ilayfun,[0 100],X); % t[Hours];X,X0
end
function dxdt = Roifun(t,X)
    dxdt = zeros(3,1);
    dxdt(1) = X0 + X(1)*mu(1)*f-X(1)*mu(1)*(1-f);
    dxdt(2) = X(1)*mu(1)*(1-f) - X(2)*ap(2);
    dxdt(3) = X(2)*mu(2) + X(3)*mu(3) - X(3)*ap(3);
end

function dxdt = Ilayfun(t,X)
    dxdt = zeros(3,1);
    f_new=f.*(dxdt(3)/(X(1)/2 +dxdt(3)));
    dxdt(1) = X0 + X(1)*mu(1)*f_new-X(1)*mu(1)*(1-f_new);
    dxdt(2) = X(1)*mu(1)*(1-f_new) - X(2)*ap(2);
    dxdt(3) = X(2)*mu(2) + X(3)*mu(3) - X(3)*ap(3);
end

end