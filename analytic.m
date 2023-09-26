function [u_conv,v_conv,u_diff,v_diff] = analytic(fnc_u,fnc_v,x,y)

% analytic calculates the analytic results

% Written by: Joel Campo, Jordi Gallart, Martí Santamaria, 2023
% Group 16. AMVO. MUEA.

% Inputs:
    % fnc_u, fnc_v: Input functions to calculate
    % x, y: Symbolic parameters
% Outputs:
    % u_conv, v_conv, u_diff, v_diff: analytic results of
    % convective and diffusive terms

% Diapos 7-8
% convective
u_conv = diff(fnc_u,x)*fnc_u+diff(fnc_u,y)*fnc_v;
v_conv = diff(fnc_v,x)*fnc_u+diff(fnc_v,y)*fnc_v;
% diffusive
du_dx = diff(diff(fnc_u,x),x); % d^2(u)/dx^2
du_dy = diff(diff(fnc_u,y),y); % d^2(u)/dv^2
dv_dx = diff(diff(fnc_v,x),x); % d^2(v)/dx^2
dv_dy = diff(diff(fnc_v,y),y); % d^2(v)/dv^2
u_diff = du_dx + du_dy;
v_diff = dv_dx + dv_dy;

end