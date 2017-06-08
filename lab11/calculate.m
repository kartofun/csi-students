Cp = 3.2E6;
m = 0.025;
K0 = 6.5;
Kd = 80;
Tu = 0.00005;
F_B = 2*0;
Um = 10;
UPm = 300;
U = 10;

%Расчёт параметров | Ku, Kf, Kv, Kx
Ku = UPm/Um;
Kx = 10/3.78E-5/80;
Kv = 1;
Kf = 10/1510;
%open('D:\DOMASHKA\TAU\Labs\lab_11\model.slx');
stop_time = 0.01;
step = 0.00001;
%set_param('model','StopTime','stop_time','FixedStep','step'); 
%sim('model');

%Ku_data = [out.time out.signals.values(:,1)];
%Kf_data = [out.time out.signals.values(:,2)];
%Kv_data = [out.time out.signals.values(:,3)];
%Kx_data = [out.time out.signals.values(:,4)];

Ku_data = out.time;
Kf_data = out.time;
Kv_data = out.time;
Kx_data = out.time;

Ku_Tp = [];
Ku_sigma = [];
Kf_Tp = [];
Kf_sigma = [];
Kv_Tp = [];
Kv_sigma = [];
Kx_Tp = [];
Kx_sigma = [];

%m_data = 0.5*m:0.25*m:1.5*m;
%Tu_data = 2*Tu:2*Tu:6*Tu;
Cp_data = [0.5*Cp 2*Cp];
%U = 0;
%for i=1:length(Cp_data)
%    Cp = Cp_data(i);
%    sim('model');
%    %Ku_data(:,i+1) = out.signals.values(:,1);
%    Kf_data(:,i+1) = out.signals.values(:,2);
%    Kv_data(:,i+1) = out.signals.values(:,3);
%    Kx_data(:,i+1) = out.signals.values(:,4);
%end
%for i=2:size(Ku_data(1,:))
 %   Ku_sigma = max(Ku_data);
 %   Kv_sigma = max(Kv_data);
 %   Kf_sigma = max(Kf_data);
 %   Kx_sigma = max(Kx_data);
%end
%for i=2:length(Kv_data(1,:))
 %   X = Kv_data(:,i); 
   % ust=X(end);
   %  Xmin=ust+ust*0.05;
   %  Xmax=ust-ust*0.05;
   % for j=1:length(X)
   %     x=X(X<Xmin|X>Xmax);
  %      f=find(X==x(end));
 %       Kv_Tp(i-1)=Kv_data(f,1);
%    end
%end
%Tu = 6*Tu;
%sim('model');
%data = [out.time Ku_data Kf_data Kv_data Kx_data];
%Tu = 6*Tu;
omega = 1:10^6;
w = 1000000;
p = 1i*w;
s = tf('s');
Ws = Ku*(K0*UPm+F_B)/((Tu*s+1)*(m*s^2+Kd*s+Cp))
%Aw = sqrt(real(Ws)^2+imag(Ws)^2)
%Lw = 20*log10(Aw)
%korni = pole(Ws)
[A,phase,wout] =  bode(Ws)
for i=1:69
    Amplitude(i) = 20*log10(A(:,:,i));
end
data = [wout Amplitude'];