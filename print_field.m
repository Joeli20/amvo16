function print_field(u,label,format)
% print_field prints a field with the notation described in slide 18

% Written by: Joel Campo, Jordi Gallart, Martí Santamaria, 2023
% Group 16. AMVO. MUEA.

% Inputs:
    % u: field to print
    % label: string with a descritpion
    % format: fprintf format
% Outputs:
    % prints the desired field
% Example of use: print_field(up,'predictor vel. u','%+.3e  ');

% We check that the arguments are valid
N = size(u,1)-2; % nº of cells along the hor. axis of the mesh
N2 = size(u,2)-2; % nº of cells along the ver. axis of the mesh
if (N2 ~= N) % we want the mesh to be squared
    error('The matrix is not square')
end
% Now we can obtain the field
fprintf('field %s \n',label);
for j = N+2:-1:1 % we loop for j from N+2 to 1, descending
    fprintf('j =%2d ',j);
    for i = 1:N+2 % then loop in the horizontal direction, left to right
        fprintf(format,u(i,j));
    end
    fprintf('\n'); % change of line
end

end