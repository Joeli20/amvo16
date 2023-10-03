%% MUEA - AMVO
% ESEIAAT, UPC - MUEA (2023)
% Joel Campo, Jordi Gallart, Martí Santamaria

% Main de la part C

clc ; clear all ; close all ;

syms x y
L = 1;
f_u = cos(2*pi*x)*sin(2*pi*y);
f_v = -sin(2*pi*x)*cos(2*pi*y);
N = size(u,1)-2;
h = L/N;

V = h^2;
visc = 0.02; % viscosity

% avancem amb un time step

% Diapo 57
% Convective time limit

conv_time_u = min(h/abs(u));
conv_time_v = min(h/abs(v));

% Diffusive time limit

diff_time = (1/2)*min((h^2)/visc);

f = 0.5; % safety factor (0.2-0.5)
time_step = f*min(conv_time,diff_time);

% R = -convective/volume + diffusive/volume (diapo 39)
R_n = ;
R_ant = ;

u_p = u_n + time_step*((3/2)*R_n - (1/2)*R_ant);




u_ant = u;
u = u_post;