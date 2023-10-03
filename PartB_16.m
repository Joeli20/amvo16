%% MUEA - AMVO
% ESEIAAT, UPC - MUEA (2023)
% Joel Campo, Jordi Gallart, Martí Santamaria
%
% Part B main

clc ; clear all ; close all ;

syms x y
L = 1;
f_u = cos(2*pi*x)*sin(2*pi*y);
f_v = -sin(2*pi*x)*cos(2*pi*y);
N = 3;

h = L/N;

% Velocity field
[u,v] = set_velocity_field(N,L,f_u,f_v);

% Halo update
u = halo_update(u);
v = halo_update(v);

%Divergencia velocitat

Div_U = diverg(u,v,L);

%Fieldtovector

Vector_U = field2vector(Div_U);

%Use equation Ap = b where A is the laplacian Matrix

Laplace = laplacianMatrix(N);

P_vector = Laplace^(-1).*Vector_U;

%Then vector to field in order to have the new P

P_field = vector2field(P_vector);

%gradient de la nova P

[Px,Py] = gradient(P_field,L);

%Equation u^n+1=u^p-divP

New_Ux = u - Px;
New_Vx= v - Py;

%New U^n+1 must fulfill the continuity equation

New_div_U = diverg(New_Ux,New_Vx,L);






% Diapo 52