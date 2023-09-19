function u_new = halo_update(u)
% Written by: Joel Campo, Jordi Gallart, Martí Santamaria, 2023
% Group 16
% halo_update updates the halo values
% Inputs:
    % u: arbitrary matrix
% Outputs:
    % u_new: new matrix u with the halo updated

u_new = u;
N = size(u,1)-2;
for i = 2:N+1 % Loop to update the halo along the horizontal axis
    u_new(i,1) = u(i,N+1);
    u_new(i,N+2) = u(i,2);
end
for j = 2:N+1 % Loop to update the halo along the vertical axis
    u_new(1,j) = u(N+1,j);
    u_new(N+2,j) = u(2,j);
end

end