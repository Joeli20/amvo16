%% MUEA - AMVO
% ESEIAAT, UPC - MUEA (2023)
% Joel Campo, Jordi Gallart, Martí Santamaria
%
% Part B main

clc ; clear; close;

% Initialization
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

% Velocity divergence
div_u = diverg(u,v,L);

% Field2Vector
vector_u = field2vector(div_u);

% Equation A*p = b where A is the laplacian Matrix
Laplace = laplacianMatrix(N);

p_vector = Laplace^(-1)*vector_u;

% Vector2Field to obtaint the new P
p_field = vector2field(p_vector);

p_field = halo_update(p_field);

% New P gradient
[px,py] = gradient(p_field,L);

px = halo_update(px);
py = halo_update(py);

% Equation u^n+1 = u^p - divP
new_xu = u - px;
new_xv = v - py;

% New U^n+1 -> Must fulfill the continuity equation
new_div_U = diverg(new_xu,new_xv,L);
