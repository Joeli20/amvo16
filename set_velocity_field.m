function [u_field,v_field] = set_velocity_field(N,L,u,v)
% set_velocity_field creates a field with an analytic velocity distribution
%
% Written by: Joel Campo, Jordi Gallart, Martí Santamaria, 2023
% Group 16. AMVO. MUEA.
%
% Inputs:
%   N: number of cells of one axis of the square mesh
%   L: length of a side of the analysed square
%   u, v: symbolic functions to be transformed into a field
% Outputs:
%   u_field,v_field: fields obtained from the symbolic functions

syms x y

u_field = zeros(N+2);
v_field = zeros(N+2);

u = matlabFunction(u,'Vars',[x y]) ;
v = matlabFunction(v,'Vars',[x y]) ;

delta = L/N;

for j = 2:N+1
    for i = 2:N+1

        xu = (i-1) * delta;
        yu = (j-1) * delta - delta/2;
        xv = (i-1) * delta - delta/2;
        yv = (j-1) * delta;
        
        u_field(i,j) = u(xu,yu);
        v_field(i,j) = v(xv,yv);
    end
end

end