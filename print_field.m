function print_field(field,label,format)

% prints a generic 2d matrix in the order we are using for velocity 
% components and pressure, respecting our conventions for the halo.

% GRUP 16

% Input:
%   field: Field to print
%   label: String with a description; Default value: 
%   format: fprintf format; Default value: '

% if isempty(label)
%     label = '';
% end
% if isempty(format)
%     format = '%+.3e';
% end

N = size(field,1)-2; % Mesh size
fprintf('field %s \n',label);

for j = N+2:-1:1
    fprintf('j=%2d ',j);
    for i = 1:N+2
        fprintf(format, field(i,j));
    end
    fprintf('\n');
end
end