function u = halo_update(u)
% halo_update updates the halo values
%
% Written by: Joel Campo, Jordi Gallart, Martí Santamaria, 2023
% Group 16. AMVO. MUEA.
%
% Inputs:
%   u: Field to be updated
% Outputs:
%   u: Updated field

N = size(u,1)-2;

% Rows updater
u(1,:) = u(N+1,:);
u(N+2,:) = u(2,:);

% Columns updater
u(:,1) = u(:,N+1);
u(:,N+2) = u (:,2);

end