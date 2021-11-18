function C = morphogenes_wrapper(D,k,Vmax,borders,bord_cond,gaussian)
if nargin < 6
  gaussian=0;
end
for i = 1:length(k)   
    C(i).sol = morphogenes_diffusion_numeric(D,k(i),Vmax,borders,bord_cond,gaussian);
end
figure;
for i = 1:length(k)
    plot(C(i).sol.x,C(i).sol.y(1,:))
    hold on;
end
if gaussian==0
    title('Fick II Law for different k values','FontSize', 24)
    xlabel('Distance[cm]','FontSize', 24);
    ylabel('Concentration[microM]','FontSize', 24);
    legend('k1=0.8[microM]','k2=5[microM]','k3=50[microM]','FontSize', 24)
    ylim([0,10]);
    hold off;
elseif gaussian==1
    title('Fick II Law for different k values, Vmax is Gaussian','FontSize', 24)
    xlabel('Distance[cm]','FontSize', 24);
    ylabel('Concentration[microM]','FontSize', 24);
    legend('k1=0.8[microM]','k2=5[microM]','k3=50[microM]','FontSize', 24)
    ylim([0,10]);
    hold off; 
end
end
