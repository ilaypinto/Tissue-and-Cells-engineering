function solution = morphogenes_diffusion_numeric(D,k,Vmax,borders,bord_cond,gaussian)
if nargin < 6
  gaussian=0;
end
if gaussian==0
    xmesh = linspace(borders(1),borders(2),2000);
    init_guess = bvpinit(xmesh,@guess);
    solution = bvp4c(@(x,C) bvpfcn(D,k,Vmax,C), @(Ca,Cb) bouncon(Ca,Cb,bord_cond), init_guess);
    % if gaussian==true
    %     solution.y(1,:)=solution.y(1,:).*...
    %     (1+gaussmf(solution.x,[0.05,0.5])/(0.05*((2*pi)^(1/2))));
    % end
elseif gaussian==1
    xmesh = linspace(borders(1),borders(2),2000);
    Vmax= @(x) Vmax*(1+gaussmf(x,[0.05,0.5])/(0.05*((2*pi)^(1/2))));
    init_guess = bvpinit(xmesh,@guess);
    solution = bvp4c(@(x,C) bvpfcn(D,k,Vmax(x),C), @(Ca,Cb) bouncon(Ca,Cb,bord_cond), init_guess);
end
end

function dCdx = bvpfcn(D,k,Vmax,C)
dCdx= [C(2);               
   Vmax.*C(1)./(D*(k+C(1)))];  
end

function bc = bouncon(Ca,Cb,bord_cond)
bc = [Ca(1)-bord_cond(1);
    Cb(1)-bord_cond(2)];
end

function g = guess(x)
g = [log(1+x);1/(x+1)];
end