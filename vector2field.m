function [d] = vector2field(b)
% vector2field transforms the vector into a matrix
%
% Written by: Joel Campo, Jordi Gallart, Martí Santamaria, 2023
% Group 16. AMVO. MUEA.
%
% Inputs:
%   b: algebraic vector b(N*N)
% Outputs:
%   d: scalar field d(N+2,N+2)

N = sqrt(length(b));

d = zeros(N+2,N+2);

k = 1;

for i = 2:N+1
    for j = 2:N+1

        d(i,j) = b(k);
        k = k + 1;

    end
end

end