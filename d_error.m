function [e_u_conv,e_v_conv,e_u_diff,e_v_diff] = d_error(h,u_conv_an, ...
    v_conv_an,u_diff_an,v_diff_an,u_conv_num,v_conv_num,u_diff_num, ...
    v_diff_num)
% d_error calculates the max error between analytic and numerical solutions
%
% Written by: Joel Campo, Jordi Gallart, Martí Santamaria, 2023
% Group 16. AMVO. MUEA.
%
% Inputs:
%   h: delta -> L/N
%   u_conv_an, v_conv_an, u_diff_an, v_diff_an: analytic solutions of the
%   convective and diffusive terms
%   u_conv_num, v_conv_num, u_diff_num, v_diff_num: numerical solutions
%   of the convective and diffusive terms
% Outputs:
%   e_u_conv, e_v_conv, e_u_diff, e_v_diff: difference errors comparing
%   the analytic and the numerical solutions of the convective and
%   diffusive terms

% NS2 Slide 30-32
% Searching for the maximum error
e_u_conv = max(max((u_conv_an-u_conv_num)*h^2));
e_v_conv = max(max((v_conv_an-v_conv_num)*h^2));
e_u_diff = max(max((u_diff_an-u_diff_num)*h^2));
e_v_diff = max(max((v_diff_an-v_diff_num)*h^2));

end