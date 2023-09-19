function [u,v] = set_velocity_field(N,L,x,y,a,b)
% Written by: Joel Campo, Jordi Gallart, Martí Santamaria, 2023
% Group 16
% set_velocity_field creates a field with an analytic velocity distribution
% Inputs:
    % N: number of cells along one axis of the square mesh
    % L: length of a side of the analysed square
    % x,y: symbolic coordinates
    % a,b: symbolic expressions to be transformed into a field
% Outputs:
    % u,v: fields obtained from the symbolic functions  

% We define the fields
u = zeros(N+2,N+2);
v = zeros(N+2,N+2);

% In each cell of the mesh there are different components for each field.
%%%%%%% ux = zeros(N+2,N+2);
%%%%%%% uy = zeros(N+2,N+2);
%%%%%%% vx = zeros(N+2,N+2);
%%%%%%% vy = zeros(N+2,N+2);

% To evaluate numerically we transform the symbolic expressions a and b
% into functions
a_f = matlabFunction(a,'Vars',[x y]);
b_f = matlabFunction(b,'Vars',[x y]);

% We finally loop in order to obtain the desired fields
for j = 2:N+1
    for i = 2:N+1
        u(i,j) = a_f(ux(i,j),uy(i,j));
        v(i,j) = b_f(vx(i,j),vy(i,j));
    end
end

end