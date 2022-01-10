%% Main code for Tissue Eng second matlab assignement
clear all; clc; close all;
% Without adjusting f
load_params
[t,cell_num] = differentiation(X,X0,mu,ap,f);
figure;
plot(t,cell_num); xlabel('Time[Hours]');ylabel('Cell number');
title('Hematopoiesis- T-Cells');xline([24,48,72,96],':'...
    ,{'Day 1', 'Day 2','Day 3','Day 4'});
legend('HSC','Progenitor Cells','T-cells');
% With adjusting f
[t,cell_num] = differentiation(X,X0,mu,ap,f,1);
figure;
plot(t,cell_num); xlabel('Time[Hours]');ylabel('Cell number');
title('Hematopoiesis- T-Cells, Negative Feedback');xline([24,48,72,96],':'...
    ,{'Day 1', 'Day 2','Day 3','Day 4'});
legend('HSC','Progenitor Cells','T-cells');
