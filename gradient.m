function [gx,gy] = gradient(s,L)

% gradient calculates the gradient of the input scalar field.

% Written by: Joel Campo, Jordi Gallart, Martí Santamaria, 2023
% Group 16. AMVO. MUEA.

% Inputs:
    % s: scalar field
    % L: length of a side of the analysed square
% Outputs:
    % gx, gy: are the gradients in each direction

N = size(s,1) - 2;
delta = L/N;

gx = zeros(N+2,N+2);
gy = zeros(N+2,N+2);

for j = 2:N+1
    for i = 2:N+1
        gx = (s(i+1,j) - s(i,j))/delta;
        gy = (s(i+1,j) - s(i,j))/delta;
    end
end

end