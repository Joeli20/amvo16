%% MUEA - AMVO
% ESEIAAT, UPC - MUEA (2023)
% Joel Campo, Jordi Gallart, Martí Santamaria

% Main de la part A (cada part s'ha d'entregar individualment)

clc ; clear all ; close all ;

syms x y
L = 1;
N = 3;
f_u = sin(x)*cos(y);
f_v = cos(x)*sin(y);
h = L/N;

% Velocity field
[u,v] = set_velocity_field(N,L,f_u,f_v);

% Halo update
u = halo_update(u);
v = halo_update(v);

% Analytic (Diapos 7-8)
% convective
u_conv = diff(f_u*f_u,x)+diff(f_u*f_v,y);
v_conv = diff(f_v*f_u,x)+diff(f_v*f_v,y);
% diffusive
du_dx = diff(diff(f_u,x),x); % d^2(u)/dx^2
du_dy = diff(diff(f_u,y),y); % d^2(u)/dv^2
dv_dx = diff(diff(f_v,x),x); % d^2(v)/dx^2
dv_dy = diff(diff(f_v,y),y); % d^2(v)/dv^2
u_diff = du_dx + du_dy;
v_diff = dv_dx + dv_dy;

[f_u_conv,f_v_conv] = set_velocity_field(N,L,u_conv,v_conv);
[f_u_diff,f_v_diff] = set_velocity_field(N,L,u_diff,v_diff);
% solution
[u_conv_an,v_conv_an] = convective(f_u_conv,f_v_conv,L);
[u_diff_an,v_diff_an] = diffusive(f_u_diff,f_v_diff);

% Numeric solution
[u_conv_num,v_conv_num] = convective(u,v,L);
[u_diff_num,v_diff_num] = diffusive(u,v);

% Error
[e_u_conv,e_v_conv,e_u_diff,e_v_diff] = d_error(N,L,h,u_conv_an, ...
    v_conv_an,u_diff_an,v_diff_an,u_conv_num,v_conv_num,u_diff_num, ...
    v_diff_num);

% Plot error
