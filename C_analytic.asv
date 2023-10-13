function [u_an,v_an,p_an] = C_analytic(f_u,f_v,x,y,L,N,t,k)
% C_analytic calculates the analytic results
%
% Written by: Joel Campo, Jordi Gallart, Martí Santamaria, 2023
% Group 16. AMVO. MUEA.
%
% Inputs:
%   f_u, f_v: Input functions to calculate
%   x, y: Symbolic parameters
%   L: length of a side of the analysed square
%   N: Number of cells of one axis of the square mesh
% Outputs:
%   u_an,v_an,p_an: analytic solutions of the u, v and p distributions

% Diapo 58

rho = 1;
Re = 100;
visc = 1*L/Re; % viscositat cinemàtica

F = exp(-8*pi^2*visc*t(k));
f_u_an = F*f_u;
f_v_an = F*f_v;
f_p_an = -rho*F^2*(cos(2*pi*x)^2/2+cos(2*pi*y)^2/2);

[u_an,v_an] = set_velocity_field(N,L,f_u_an,f_v_an);
[p_an] = set_pressure_field(N,L,f_p_an);

% t(k), ve del time step, i F potser s'haurien de posar a fora?