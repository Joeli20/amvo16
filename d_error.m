function [e_u_conv,e_v_conv,e_u_diff,e_v_diff] = d_error(h,u_conv_an, ...
    v_conv_an,u_diff_an,v_diff_an,u_conv_num,v_conv_num,u_diff_num, ...
    v_diff_num)
% set_velocity_field creates a field with an analytic velocity distribution

% Written by: Joel Campo, Jordi Gallart, Martí Santamaria, 2023
% Group 16. AMVO. MUEA.

% Inputs:
    % h: delta -> L/N
    % u_conv_an, v_conv_an, u_diff_an, v_diff_an: analytic solutions of the
    % convective and diffusive terms
    % u_conv_num, v_conv_num, u_diff_num, v_diff_num: numerical solutions
    % of the convective and diffusive terms
% Outputs:
    % e_u_conv, e_v_conv, e_u_diff, e_v_diff: difference errors comparing
    % the analytic and the numerical solutions of the convective and
    % diffusive terms

% Diapos 30-32

e_u_conv = max(max((u_conv_an-u_conv_num)*h^2)); % Busquem l'error màxim
e_v_conv = max(max((v_conv_an-v_conv_num)*h^2));
e_u_diff = max(max((u_diff_an-u_diff_num)*h^2));
e_v_diff = max(max((v_diff_an-v_diff_num)*h^2));

end