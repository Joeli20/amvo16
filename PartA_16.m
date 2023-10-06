%% MUEA - AMVO
% ESEIAAT, UPC - MUEA (2023)
% Joel Campo, Jordi Gallart, Martí Santamaria
%
% Part A main

clc; clear; close;

syms x y
L = 1;
f_u = cos(2*pi*x)*sin(2*pi*y);
f_v = -sin(2*pi*x)*cos(2*pi*y);
n = [8,16,32,64,128];

% Preallocating for speed
h = zeros(size(n));
e_u_conv = zeros(size(n));
e_v_conv = zeros(size(n));
e_u_diff = zeros(size(n));
e_v_diff = zeros(size(n));


for i = 1:length(n)
N = n(i);
h(i) = L/N;

% Velocity field
[u,v] = set_velocity_field(h,N,f_u,f_v);

% Halo update
u = halo_update(u);
v = halo_update(v);

% Analytic (NS2 Slides 7-8)
[u_conv,v_conv,u_diff,v_diff] = analytic(f_u,f_v,x,y);

[u_conv_an,v_conv_an] = set_velocity_field(h,N,u_conv,v_conv);
[u_diff_an,v_diff_an] = set_velocity_field(h,N,u_diff,v_diff);

% u_conv_an = halo_update(u_conv_an);
% v_conv_an = halo_update(v_conv_an);
% u_diff_an = halo_update(u_diff_an);
% v_diff_an = halo_update(v_diff_an);

% Numeric solution
[u_conv_num,v_conv_num] = convective(u,v,L);
[u_diff_num,v_diff_num] = diffusive(u,v);

% Halo update
% u_conv_num = halo_update(u_conv_num);
% v_conv_num = halo_update(v_conv_num);
% u_diff_num = halo_update(u_diff_num);
% v_diff_num = halo_update(v_diff_num);

% Error
[e_u_conv(i)] = d_error(u_conv_an,u_conv_num);
[e_u_diff(i)] = d_error(u_diff_an,u_diff_num);
[e_v_conv(i)] = d_error(v_conv_an,v_conv_num);
[e_v_diff(i)] = d_error(v_diff_an,v_diff_num);

end

% Plot error
plot_error(h,e_u_conv,e_u_diff,'Horitzontal velocity')
plot_error(h,e_v_conv,e_v_diff, 'Vertical velocity')
