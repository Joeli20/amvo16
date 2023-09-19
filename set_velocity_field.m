function [u,v] = set_velocity_field(N,L)
% Written by: Joel Campo, Jordi Gallart, Martí Santamaria, 2023
% Group 16

% set_velocity_field creates a field with an analytic velocity distribution
% Inputs:
    % N: number of cells along one axis of the square mesh
    % L: length of a side of the analysed square
% Outputs:
    % u,v: fields obtained from the symbolic functions 

u = zeros(N+2);
v = zeros(N+2);

x = L/N;
y = L/N; %square

for i = 2:N+1
    for j = 2:N+1
        u(i,j) = sin(x*(i-1));
        v(i,j) = cos(y*(j-1));
    end
end

disp(u);
disp(v);
end