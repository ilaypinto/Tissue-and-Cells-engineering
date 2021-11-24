%% Parameters
clear all;clc;
D=10^(-5);             %Diffusion rate, cm^2/s
k=[0.8 5 50];%Degragation rate, microM
borders=[0 2];         %Distance, cm
bord_cond=[10,0];      %Steady State Concentration, microM
Vmax=1.1*(10^(-4));    %Consumption rate, M/s
%% Solution for Q1
C1 = morphogenes_wrapper(D,k,Vmax,borders,bord_cond);
%% Solution for Q6
C2 = morphogenes_wrapper(D,k,Vmax,borders,bord_cond,true);
%% Solution for Q7
AP1=[0.015,0.2];AP2=[0.3,0.35];AP3=[0.4,0.5];
AP_cell={AP1,AP2,AP3};
Bicoid=bicoid_in_range(C2, AP_cell);
