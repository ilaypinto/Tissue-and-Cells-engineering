%% Main code for Cell Morphology Lab %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; clc; close all;
test_flag=0;
main_flag=1;
%% Data acquisition
if main_flag==1
% Control cells
% Find the cells you want to use in the first image,
% then find them manually for each image- their labels change!
% so make sure they are the right ones.
[a1,b1,c1,d1] = find_cells('e_1.tif',[34,35,36,39,38,44,50,76,77,74]);
[a2,b2,c2,d2] = find_cells('e_2.tif',[43,44,45,48,47,51,57,79,80,77]);
[a3,b3,c3,d3] = find_cells('e_3.tif',[31,36,42,45,44,49,55,80,81,78]);
[a4,b4,c4,d4] = find_cells('e_4.tif',[34,38,40,43,42,47,53,77,78,75]);
[a5,b5,c5,d5] = find_cells('e_5.tif',[35,41,44,47,46,52,59,82,83,79]);
[a6,b6,c6,d6] = find_cells('e_6.tif',[35,40,42,45,44,49,56,79,80,77]);
[a7,b7,c7,d7] = find_cells('e_7.tif',[40,45,47,50,49,53,59,86,87,84]);
[a8,b8,c8,d8] = find_cells('e_8.tif',[36,42,44,47,46,50,58,84,85,82]);
[a9,b9,c9,d9] = find_cells('e_9.tif',[35,41,43,46,45,49,56,82,83,80]);
[a10,b10,c10,d10] = find_cells('e_10.tif',[35,41,43,46,45,49,55,83,84,81]);
ecc_e_mean = [a1 a2 a3 a4 a5 a6 a7 a8 a9 a10];
ecc_e_std = [b1 b2 b3 b4 b5 b6 b7 b8 b9 b10];
el_e_mean = [c1 c2 c3 c4 c5 c6 c7 c8 c9 c10];
el_e_std = [d1 d2 d3 d4 d5 d6 d7 d8 d9 d10];
% Test cells
% Find the cells you want to use in the first image,
% then find them manually for each image- their labels change!
% so make sure they are the right ones.
[a1,b1,c1,d1] = find_cells('c_1.tif',[4,5,19,25,20,23,22,24,21],0);
[a2,b2,c2,d2] = find_cells('c_2.tif',[4,5,13,19,14,17,16,18,15],0);
[a3,b3,c3,d3] = find_cells('c_3.tif',[4,5,13,21,14,18,16,20,15],0);
[a4,b4,c4,d4] = find_cells('c_4.tif',[4,5,11,19,12,16,14,18,13],0);
[a5,b5,c5,d5] = find_cells('c_5.tif',[4,5,13,21,14,20,16,22,15],0);
[a6,b6,c6,d6] = find_cells('c_6.tif',[4,7,13,18,14,17,16,19,15],0);
[a7,b7,c7,d7] = find_cells('c_7.tif',[4,5,12,20,13,16,15,21,14],0);
[a8,b8,c8,d8] = find_cells('c_8.tif',[4,5,13,18,14,17,16,19,15],0);
[a9,b9,c9,d9] = find_cells('c_9.tif',[4,5,12,17,13,16,15,18,14],0);
[a10,b10,c10,d10] = find_cells('c_10.tif',[4,5,12,17,13,16,15,18,14],0);
ecc_c_mean = [a1 a2 a3 a4 a5 a6 a7 a8 a9 a10];
ecc_c_std = [b1 b2 b3 b4 b5 b6 b7 b8 b9 b10];
el_c_mean = [c1 c2 c3 c4 c5 c6 c7 c8 c9 c10];
el_c_std = [d1 d2 d3 d4 d5 d6 d7 d8 d9 d10];

%% Plot Generation
time = 0:60:560; %10 images were taken in 1 min intervals.

% Eccentricity
figure(1);
errorbar(time, ecc_e_mean, ecc_e_std, '-*','MarkerSize',20,'MarkerEdgeColor',...
    'blue','MarkerFaceColor','blue')
xlabel('time [sec]'); ylabel('Eccentricity');title('Eccentricity of PBS washed/unwashed cells');
hold on
errorbar(time, ecc_c_mean, ecc_c_std, '-o','MarkerSize',5,'MarkerEdgeColor',...
    'green','MarkerFaceColor','green')
legend('Control(washed)','Test(unwashed)'); hold off

% Elongation Index
figure(2);
errorbar(time, el_e_mean, el_e_std, '-*','MarkerSize',20,'MarkerEdgeColor',...
    'blue','MarkerFaceColor','blue')
xlabel('time [sec]'); ylabel('Elongation Index');title('Elongation Index of PBS washed/unwashed cells');
hold on
errorbar(time, el_c_mean, el_c_std, '-o','MarkerSize',5,'MarkerEdgeColor',...
    'green','MarkerFaceColor','green')
legend('Control(washed)','Test(unwashed)'); hold off
end
%% Test
if test_flag==1
[a1,b1,c1,d1] = improved_image2('c_10.tif',[1,2,3],0);
end


