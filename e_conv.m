function [error, min_error] = e_conv(u,v,L,N)
% e_conv calculates the convective term error
%
% Written by: Joel Campo, Jordi Gallart, Martí Santamaria, 2023
% Group 16. AMVO. MUEA.
%
% Inputs:
%   u: Matrix of the horitzontal components
%   v: Matrix of the vertical components
%   L: Length of a side of the analysed square
%   N: Number of cells of one axis of the square mesh
% Outputs:
%   error: Error for the function
%   min_error: Minimum of all errors

error = zeros(size(N));

h = L/N;

x = 1;
min_error = 5000;

for i = 2:N+1
    y = 1;
    for j = 2:N+1
        error(x,y) = h/(sqrt(u(i,j)^2 + v(i,j)^2));
        trigger = error(x,y);
        y = y + 1;
        if (trigger < min_error)
            min_error = trigger;
        end
    end
    x = x + 1;
end
end