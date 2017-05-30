U_n = 52;
n_0 = 1240;
I_n = 18;
M_n = 7.21;
R = 0.3;

%data is changed
T_ya = 10*10^(-3);
J_d = 0.004;
T_y = 10*10^(-3);
i_p = 20;
M_cm = 0;
J_m = 2.48;

U_m = 10;

I_max = 92.4;
alpha_max = 6.294;

w_0 = n_0*pi/30;
k_e = U_n/w_0;
k_y = U_n/U_m;
k_d = 1/R;
k_m = M_n/I_n;
J_sum = J_d + 0.2*J_d + J_m/i_p^2;
U = 5;

K_u = 10/U_n;
K_I = 10/I_max;
K_w = 10/w_0;
K_a = 10/alpha_max;

%easy model
K = k_y/(k_e*i_p);
K_f = R/(k_m*k_e*i_p^2);
T_m = R*J_sum/(k_m*k_e);
K_w_2 = 10/6.492;

%open('D:/DOMASHKA/TAU/Labs/lab10/easy.mdl');
open('D:/DOMASHKA/TAU/Labs/lab10/full.mdl');

stop_time = 1.5;
step = 0.005;

set_param('full','StopTime','stop_time','FixedStep','step') 
sim('full');

K_a = 10/alpha_max;

%set_param('easy','StopTime','stop_time','FixedStep','step') 
%sim('easy');

U_data = [out.time];
I_data = [out.time];
a_data = [out.time];
w_data = [out.time];

%M_cm_array = [0:i_p*M_n/5:i_p*M_n];
%J_m_data = [0.5*J_m:J_m*0.25:J_m*1.5];
i_p_data = [0.25*i_p:0.25*i_p:i_p*1.75]
for i = 1:length(i_p_data)
    %M_cm = M_cm_array(i);
    %J_sum = J_d + 0.2*J_d + J_m_data(i)/i_p^2;
    i_p = i_p_data(i);
    J_sum = J_d + 0.2*J_d + J_m/i_p^2;
    
    set_param('full','StopTime','stop_time','FixedStep','step') 
    simOut = sim('full');
    U_data(:,i+1) = out.signals.values(:,2);
    I_data(:,i+1) = out.signals.values(:,4);
    a_data(:,i+1) = out.signals.values(:,3);
    w_data(:,i+1) = out.signals.values(:,1);
end
time = out.time;
%U_data = out.signals.values(:,3);
%I_data = out.signals.values(:,1);
%a_data = out.signals.values(:,2);
%w_data = out.signals.values(:,4);
%data = [time, U_data, I_data, a_data, w_data];