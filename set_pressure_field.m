function [p_field] = set_pressure_field(N,L,p)
% set_pressure_field creates a field with an analytic pressure distribution
%
% Written by: Joel Campo, Jordi Gallart, Martí Santamaria, 2023
% Group 16. AMVO. MUEA.
%
% Inputs:
%   N: number of cells of one axis of the square mesh
%   L: length of a side of the analysed square
%   p: symbolic function to be transformed into a field
% Outputs:
%   p_field: field obtained from the symbolic function

syms x y

p_field = zeros(N+2);

p = matlabFunction(p,'Vars',[x y]) ;

delta = L/N;

for i = 2:N+1
    for j = 2:N+1
        py = (j-1) * delta - delta/2;
        px = (i-1) * delta - delta/2;
        p_field(i,j) = p(px,py);
    end
end

end