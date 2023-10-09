%% MUEA - AMVO
% ESEIAAT, UPC - MUEA (2023)
% Joel Campo, Jordi Gallart, Martí Santamaria
%
% Part C main

clc ; clear; close;

% Initialization
syms x y
f_u = cos(2*pi*x)*sin(2*pi*y);
f_v = -cos(2*pi*y)*sin(2*pi*x);

N=3;
L=1;
h=L/N;
rho = 1;
u_test = zeros(N+2,N+2,50);
time_step=0;

visc = 0.0086;

% Velocity field
[u_0,v_0] = set_velocity_field(N,L,f_u,f_v);

% Halo update
u_0 = halo_update(u_0);
v_0 = halo_update(v_0);

% Numeric solution
[u_conv_num,v_conv_num] = convective(u_0,v_0,L);
[u_diff_num,v_diff_num] = diffusive(u_0,v_0);

%Part B
div_u_0 = diverg(u_0,v_0,L);

% Field2Vector
vector_u_0 = field2vector(div_u_0);

% Equation A*p = b where A is the laplacian Matrix
Laplace = laplacianMatrix(N);

p_vector_0 = Laplace^(-1)*vector_u_0;

% Vector2Field to obtaint the new P
p_field_0 = vector2field(p_vector_0);

p_field_0 = halo_update(p_field_0);

% New P gradient
[px_0,py_0] = gradient(p_field_0,L);

px_0 = halo_update(px_0);
py_0 = halo_update(py_0);

% Equation u^n+1 = u^p - divP
new_u = u_0 - px_0;
new_v = v_0 - py_0;

% New U^n+1 -> Must fulfill the continuity equation
new_div_U = diverg(new_u,new_v,L)

%Calculs time_step

%Time_steps convectiu
[T_c, min_T_c] = e_conv(new_u,new_v,L,N);

%Time_step_difusiu
min_T_d = (h^2/visc);

%Escollim nou Time_Step
if min_T_c<min_T_d
    time_step = min_T_c;
else
    time_step = min_T_d;
end

%Funcio resta de time steps
n_iter=1;

while n_iter<50
    [u_conv_num_new,v_conv_num_new] = convective(new_u,new_v,L); %Càlcul nous convectius
    [u_diff_num_new,v_diff_num_new] = diffusive(new_u,new_v); %Càlcul nous difusius
    R_nx = -u_conv_num/h^2 + u_diff_num/h^2; %Càlcul Rx de la velocitat de time step n-1
    R_ny = -v_conv_num/h^2 + v_diff_num/h^2; %Càlcul Ry de la velocitat de time step n-1
    R_n1x = -u_conv_num_new/h^2 + u_diff_num_new/h^2; %Càlcul Rx de la velocitat de time step n
    R_n1y = -v_conv_num_new/h^2 + v_diff_num_new/h^2; %Càlcul Ry de la velocitat de time step n

    upx = new_u + time_step*((3/2)*R_n1x-0.5*R_nx); %Trobem Upx
    upy = new_v + time_step*((3/2)*R_n1y-0.5*R_ny); %Trobem Upy

    upx = halo_update(upx);
    upy = halo_update(upy);

    %Comencem Part B, per trobar noves velocitats i pressió
    div_up = diverg(upx,upy,L);

    % Field2Vector
    vector_up = field2vector(div_up);

    p_vector = Laplace^(-1)*vector_up;

    % Vector2Field to obtaint the new P
    p_field = vector2field(p_vector);

    p_field = halo_update(p_field);

    % New P gradient
    [px,py] = gradient(p_field,L);

    px = halo_update(px);
    py = halo_update(py);

    % Equation u^n+1 = u^p - divP
    new_u = upx - px;
    new_v = upy - py;

    % New U^n+1 -> Must fulfill the continuity equation
    new_div_U = diverg(new_u,new_v,L);

    %Trobem la P real

    P_new_real = (rho/time_step)*p_field;

    P_new_real = halo_update(P_new_real);

    %Calculs time_step

    %Time_steps convectiu
    [T_c, min_T_c] = e_conv(new_u,new_v,L,N);

    %Time_step_difusiu
    min_T_d = (h^2/visc);

    %Escollim nou Time_Step
    if min_T_c<min_T_d
        time_step = min_T_c;
    else
        time_step = min_T_d;
    end

    %Recuperem dades per al proper
    u_conv_num=u_conv_num_new;
    u_diff_num=u_diff_num_new;
    v_conv_num=v_conv_num_new;
    v_diff_num=v_diff_num_new;
    u_test(:,:,n_iter) = new_u;
    n_iter=n_iter+1;
end