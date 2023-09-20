function [u_field,v_field] = set_velocity_field(N,L,u,v)
% Written by: Joel Campo, Jordi Gallart, Martí Santamaria, 2023
% Group 16

% set_velocity_field creates a field with an analytic velocity distribution
% Inputs:
    % N: number of cells along one axis of the square mesh
    % L: length of a side of the analysed square
    % u,v: symbolic functions to be transformed into a field
% Outputs:
    % u_out,v_out: fields obtained from the symbolic functions 

u_field = zeros(N+2);
v_field = zeros(N+2);

u = matlabFunction(u,'Vars',[x y]) ;
v = matlabFunction(v,'Vars',[x y]) ;


for i = 2:N+1
    for j = 2:N+1

        xu = (i-1) * L/N;
        yu = (j-1) * L/N - L/(2*N);
        xv = (i-1) * L/N - L/(2*N);
        yv = (j-1) * L/N;
        
        u_field(i,j) = u(xu,yu);
        v_field(i,j) = v(xv,yv);
    end
end

disp(u_field);
disp(v_field);
end