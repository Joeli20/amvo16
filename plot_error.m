function plot_error(h,e_conv,e_diff)
% plot_error plots the error

% Written by: Joel Campo, Jordi Gallart, Martí Santamaria, 2023
% Group 16. AMVO. MUEA.

% Inputs:
    % e_u_conv, e_v_conv, e_u_diff, e_v_diff: difference errors comparing
    % the analytic and the numerical solutions of the convective and
    % diffusive terms
% Outputs:
    % Plot of the error vs h

figure
loglog(h,e_conv,Color='blue',Marker='o')
hold on
loglog(h,e_diff,Color='red',Marker='o')
loglog(h,h.^2,Color='black')