function [error] = d_error(analytic,numeric)
% d_error calculates the max error between analytic and numerical solutions
%
% Written by: Joel Campo, Jordi Gallart, Martí Santamaria, 2023
% Group 16. AMVO. MUEA.
%
% Inputs:
%   analytic: input of the analytic result
%   numeric: input of the numerical result
% Outputs:
%   error: error comparing the analytic and the numerical solutions

% M = max(X,[],"all") returns the largest element of X. (from help max)
error = max(abs(analytic - numeric),[],"all");

end