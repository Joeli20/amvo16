function A = laplacianMatrix(N)
% laplacianMatrix computes the Laplacian matrix given the dimension N
%
% Written by: Joel Campo, Jordi Gallart, Martí Santamaria, 2023
% Group 16. AMVO. MUEA.
%
% Inputs:
%   N: Number of cells of one axis of the square mesh
% Outputs:
%   A: Laplacian matrix

% NS2 Slide 46
% Laplacian Matrix
A = zeros(N^2,N^2);
v = 1:N^2;
a = vector2field(v);
a = halo_update(a);

for i = 2:N+1
    for j = 2:N+1
        e_n = a(i+1,j); % East neighbour
        w_n = a(i-1,j); % West neighbour
        n_n = a(i,j+1); % North neighbour
        s_n = a(i,j-1); % South neighbour
        A(a(i,j),e_n) = 1;
        A(a(i,j),w_n) = 1;
        A(a(i,j),n_n) = 1;
        A(a(i,j),s_n) = 1;
        A(a(i,j),a(i,j)) = -4;
    end
end
A(1,1) = -5;

end