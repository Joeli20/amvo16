function [u] = halo_update(u)

%Halo Update function

%Input:
%   u: Field to update

% Halo update function
N = size(u,1)-2; % Mesh size

%Rows updater
u(1,:) = u(N+1,:);
u(N+2,:) = u(2,:);

%Columns updater
u(:,1) = u(:,N+1);
u(:,N+2) = u (:,2);
end