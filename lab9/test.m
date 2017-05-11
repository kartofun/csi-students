k = 3;
T = 5;
epsilon = 0.4;
w_1 = -2:0.25:2;
omega = power(10,w_1);
omega = omega';

w = omega(6);
y_a = [];
phi = [];
y_phi = 0;
g_phi = 0;
psi = [];
log_y = [];
open('D:\DOMASHKA\TAU\Labs\lab_9\iso.mdl')
    
for i=1:length(omega)
    w = omega(i);
    stop_time = 2*pi/(w)*50;
    step = 2*pi/(w*500);
 
    set_param('iso','StopTime','stop_time','FixedStep','step') 
    simOut = sim('iso');
    y = out.signals.values(:,1);
    y_a(i) = max(out.signals.values(:,1));
    for j = 2:(length(out.time))
        if (out.signals.values(j-1,1) > 0) && (out.signals.values(j,1) < 0)
            y_phi = (out.time(j)+out.time(j-1))/2;
            break;
        end
    end
    for j = 2:(length(out.time)-1)
        if (out.signals.values(j-1,2) > 0) && (out.signals.values(j,2) < 0)
            g_phi = (out.time(j)+out.time(j-1))/2;
            break;
        end
    end
    phi(i) = abs(y_phi-g_phi);
    psi(i) = -phi(i)*w*180/pi;
    log_y(i) = 20*log10(y_a(i));
    y_phi = 0;
    g_phi = 0;
end
psi = transpose(psi);
phi = transpose(phi);
y_a = transpose(y_a);
log_y = transpose(log_y);
w_1 = transpose(w_1);

data = [omega, w_1, y_a, log_y, psi];