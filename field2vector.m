function [b] = field2vector(d)
% field2vector transforms the matrix into a vector
%
% Written by: Joel Campo, Jordi Gallart, Martí Santamaria, 2023
% Group 16. AMVO. MUEA.
%
% Inputs:
%   d: scalar field d(N+2,N+2) -> Must be square
% Outputs:
%   b: algebraic vector b(N*N)

N = size(d,1) - 2;

b = zeros(N*N,1);

k = 1;

for i = 2:N+1
    for j = 2:N+1

        b(k,1) = d(i,j);
        k = k + 1;

    end
end

end