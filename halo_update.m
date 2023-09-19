function u = halo_update(u)
% Written by: Joel Campo, Jordi Gallart, Martí Santamaria, 2023
% Group 16

% halo_update updates the halo values
% Inputs:
    % u: Field to be updated
% Outputs:
    % u: Updated field

% Halo update function
N = size(u,1)-2; % Mesh size

%Rows updater
u(1,:) = u(N+1,:);
u(N+2,:) = u(2,:);

%Columns updater
u(:,1) = u(:,N+1);
u(:,N+2) = u (:,2);

end