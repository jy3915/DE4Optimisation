M = csvread('rua1.csv');% read edited csvfile
W_data = M(1,:).';% row #1: arm width data
H_data = M(2,:).';% row #2: thickness data
M_data = M(3,:).';% row #3: mass data
D_data = M(4,:).';% row #4: deflection data
ST_data = M(5,:).';% row #5: stress data
% figure (1)
% tri = delaunay(D_data,W_data);
% C = H_data.*W_data;
% h1 = trisurf(tri, W_data,H_data,D_data,C);
% axis vis3d
% title('3D-Plot');
% xlabel('Width/mm');
% ylabel('Thickness/mm');
% zlabel('Deflection/mm');
% figure (2)
% tri = delaunay(ST_data,W_data);
% C = H_data.*W_data;
% h2 = trisurf(tri, W_data,H_data,ST_data,C);
% axis vis3d
% title('3D-Plot');
% xlabel('Width/mm');
% ylabel('Thickness/mm');
% zlabel('Stress/Mpa');
figure (3)
ff = fit([W_data,H_data],ST_data,'poly23');
plot(ff,[W_data,H_data],ST_data);
title('3D-Plot');
xlabel('Width/mm');
ylabel('Thickness/mm');
zlabel('Stress/Mpa');