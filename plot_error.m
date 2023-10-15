function plot_error(h,e_conv,e_diff,fnc_tit)
% plot_error plots the error
%
% Written by: Joel Campo, Jordi Gallart, Martí Santamaria, 2023
% Group 16. AMVO. MUEA.
%
% Inputs:
%   e_conv: difference errors comparing the analytic and the numerical 
%   solutions of the convective term
%   e_diff: difference errors comparing the analytic and the numerical 
%   solutions of the diffusive term
%   fnc_tit: title of the plot
% Outputs:
%   Plot of the error vs h


figure
loglog(h,e_conv,Color='blue',Marker='o')
hold on
loglog(h,e_diff,Color='red',Marker='o')
loglog(h,h.^2,Color='black')
legend('Convective Term', 'Diffusive Term' , 'h^2')
title(fnc_tit)
end