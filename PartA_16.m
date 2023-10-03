%% MUEA - AMVO
% ESEIAAT, UPC - MUEA (2023)
% Joel Campo, Jordi Gallart, Martí Santamaria

% Main de la part A

clc; clear; close;

syms x y
L = 1;
f_u = cos(2*pi*x)*sin(2*pi*y);
f_v = -sin(2*pi*x)*cos(2*pi*y);
n = [8,16,32,64,128];

for i = 1:length(n)
N = n(i);
h = L/N;

% Velocity field
[u,v] = set_velocity_field(N,L,f_u,f_v);

% Halo update
u = halo_update(u);
v = halo_update(v);

% Analytic (Diapos 7-8)
[u_conv,v_conv,u_diff,v_diff] = analytic(f_u,f_v,x,y);

[u_conv_an,v_conv_an] = set_velocity_field(N,L,u_conv,v_conv);
[u_diff_an,v_diff_an] = set_velocity_field(N,L,u_diff,v_diff);

% Numeric solution
[u_conv_num,v_conv_num] = convective(u,v,L);
[u_diff_num,v_diff_num] = diffusive(u,v);

% Error
[e_u_conv(i),e_v_conv(i),e_u_diff(i),e_v_diff(i)] = d_error(h,u_conv_an, ...
    v_conv_an,u_diff_an,v_diff_an,u_conv_num,v_conv_num,u_diff_num, ...
    v_diff_num);

end

h = L./n;
% Plot error
plot_error(h,e_u_conv,e_u_diff,'Horitzontal velocity')
plot_error(h,e_v_conv,e_v_diff, 'Vertical velocity')
