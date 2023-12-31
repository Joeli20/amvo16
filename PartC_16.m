%% MUEA - AMVO
% ESEIAAT, UPC - MUEA (2023)
% Joel Campo, Jordi Gallart, Martí Santamaria
%
% Part C main
%
% VERY IMPORTANT --> READ BEFORE USE
% This script outputs two different plots that have to be selected.
% In order to obtain the first plot, mesh convergence using error, use the
% current script as it is.
% If the user wants to obtain the plot that compares analytic and numeric 
% in one particular position vs the time, change the comments in variable 
% n and in the plots. The changes are also explained in the script.

clc ; clear; close;

% Initialization
syms x y
f_u = cos(2*pi*x)*sin(2*pi*y);
f_v = -cos(2*pi*y)*sin(2*pi*x);

%THE FOLLOWING PARAMETERS DEFINE THE USE OF THE SCRIPT, CHANGE DE COMMENT
%IF DESIRED.
n = [10,20,50]; %Number of control volumes. (PLOT 1)
%n=[10]   Control volume used for convergence calculation (PLOT 2)


error_u = zeros(length(n),1);
error_v = zeros(length(n),1);

for i = 1:length(n)
N = n(i);

L = 1; %Dimension of the problem.
h = L/N; %Control volum length and height. 
rho = 1; %Density equal to 1. Will not change --> incompressible
f = 0.2; %Relaxation constant in order to help convergence of the problem. Value has to be between 0.2 and 0.5
H(i) = h;
Laplace = laplacianMatrix(N); %Laplace matrix



% Velocity field
[u_0,v_0] = set_velocity_field(N,L,f_u,f_v);

% Halo update
u_0 = halo_update(u_0);
v_0 = halo_update(v_0);

%Time_step calculation

%Obtention of horizontal, and vertical maximum velocities.
umax = max(max(abs(u_0)));
vmax = max(max(abs(v_0)));


%The maximum of the previous ones will be used to perform Reynolds
%calculation.
 v_reynolds = max([umax,vmax]);

%Viscosity calculation
visc = v_reynolds/100; %The reynolds is defined by the problem equal to 100. Therefore, visc is obtained.

%Minimum convective time step
min_T_cu = h/umax;
min_T_cv = h/vmax;

%Diffusive time step
min_T_d = 0.5*(h^2/visc);

%Obtention of the smallest time_step
time_step = min([min_T_cu,min_T_cv,min_T_d]);

%Time step calculation using relaxation constant
time_step = f*time_step;

%Saving the time
t = time_step;

%Starting of the variables needed for the bucle that is used.
n_iter=1;
n_iter_max=3/time_step; %The simulated time is defined as 3 segons. It can be changed by modifying this variable.

n_iter_max_int = round(n_iter_max,0);
%Initialization of some matrix.
u_test = zeros(N+2,N+2,n_iter_max_int-1);%A matrix is created in order to be able to save all the horizontal velocities.

%Bucle used for the calculation
while n_iter<n_iter_max_int

    %Analytic part
    [u_an,v_an,p_an] = analytic_c(f_u,f_v,x,y,L,N,t,visc);

    u_an=halo_update(u_an);
    v_an=halo_update(v_an);

    %Numerical part
    [u_conv_num,v_conv_num] = convective(u_0,v_0,L); %Convective calculation
    [u_diff_num,v_diff_num] = diffusive(u_0,v_0); %Difusive calculation

    %The script has to perform different in the first iteration.
    if n_iter == 1
        R_nx = -u_conv_num + u_diff_num*visc; %R_x calculation of the previous time step n-1 
        R_ny = -v_conv_num + v_diff_num*visc; %R_y calculation of the previous time step n-1

        %In the first case both R, are considered to be equal as there is no previous time step.
        R_n1x = R_nx; 
        R_n1y = R_ny;
    else
        R_n1x = -u_conv_num + u_diff_num*visc; %R_x calculation of the current time step n
        R_n1y = -v_conv_num + v_diff_num*visc; %R_y calculation of the current time step n
    end

    upx = u_0 + time_step*((3/2)*R_n1x-0.5*R_nx); %Upx obtention
    upy = v_0 + time_step*((3/2)*R_n1y-0.5*R_ny); %Upy obtention

    upx = halo_update(upx);
    upy = halo_update(upy);

    %Initialization of the code created in part B, in order to gather the
    %new velocities and the new pressure.

    %Divergence of the previous velocities
    div_up = diverg(upx,upy,L);

    % Field2Vector
    vector_up = field2vector(div_up);
    
    %Poisson calculation
    p_vector = Laplace\vector_up;

    % Vector2Field to obtaint the new P prima
    p_field = vector2field(p_vector);

    p_field = halo_update(p_field);

    % New P prima gradient
    [px,py] = gradient(p_field,L);

    px = halo_update(px);
    py = halo_update(py);

    % Equation u^n+1 = u^p - divPprima
    new_u = upx - px;
    new_v = upy - py;

    % New U^n+1 -> Must fulfill the continuity equation
    new_div_U = diverg(new_u,new_v,L);

    %Obtention of the real Pressure

    P_new_real = (rho/time_step)*p_field;

    P_new_real = halo_update(P_new_real);


    % Error
    [e_u(i)] = d_error(u_an,new_u);
    [e_v(i)] = d_error(v_an,new_v);
    if e_u(i) > error_u(i)
        error_u(i)=e_u(i);
    end
    if e_v(i) > error_v(i)
        error_v(i)=e_v(i);
    end

    %The calculations are finished. Modifying of the variables for the
    %following time step.

    R_nx = R_n1x;
    R_ny = R_n1y;
    u_0 = new_u;
    v_0 = new_v;

    %Storing the data needed
    u_tres_tres(n_iter,i)=new_u(3,3);
    v_tres_tres(n_iter,i)=new_v(3,3);
    u_tres_tres_an(n_iter,i)=u_an(3,3);
    v_tres_tres_an(n_iter,i)=v_an(3,3);
    u_test(:,:,n_iter) = new_u;

    %Storing time
    if n_iter == 1
        time(n_iter,i)=time_step;
    else
        time(n_iter,i)=time(n_iter-1)+time_step;
    end

    %Upgrading bucle variables and time step
    t = t + time_step;
    n_iter=n_iter+1;
    
end
end

%CHANGE THE COMMENTS IN ORDER TO CHANGE THE PLOTS OBTAINED IN EACH CASE

% Plot error (PLOT 1)
figure
loglog(H,error_u,Color='blue',Marker='o')
hold on
loglog(H,H.^2,Color='black')
legend('Horizontal velocity', 'h^2')

%(PLOT 2)
%plot that compares analytic and numeric in one particular position vs the time.
%nexttile
%plot(time(:,1),u_tres_tres(:,1))
%hold on
%grid on
%plot(time(:,1),v_tres_tres(:,1))
%plot(time(:,1),u_tres_tres_an(:,1))
%plot(time(:,1),v_tres_tres_an(:,1))
%legend('u_n','v_n','u_a','v_a')
%title('Plot of the numerical and analytical velocities vs time N=10')
%xlabel('Time (s)')
%ylabel('Velocities (m/s)')