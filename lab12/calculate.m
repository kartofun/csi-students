a = [2 3 4 0]; b = [2 1];
W = tf(b, a); % Create transfer function
%% 1.2 
%pzmap(W);
%pol = roots(a);
%zer = roots(b);
%plot(real(pol),imag(pol),'*',real(zer),imag(zer),'o');
%legend('poles','zeros');
%grid;
%% 1.3
%bode(W);
%A = mag(1, :)'; phi = phase(1, :)';
%csvwrite('data/bode.txt', [w, mag(1, :)', 20*log10(mag(1, :)'), phase(1, :)']);
%% 1.4
[Re, Im] = nyquist(W);
R = Re(1,:)';
I = Im(1,:)';
%csvwrite('data/nyquist.txt', [R I]);
%% Feedback
%clear;
a = [2 3 4 0]; b = [2 1]; K = 2.5;
W = tf(b, a); %F = feedback(W, K)
s=tf('s');
F = (2*s+1)/(2*s^3+3*s^2+(4+2*K)*s+K)
%% 2.1
%rlocus(F);
Re1 = real(r(1, :))'; Re2 = real(r(2, :))'; Re3 = real(r(3, :))';
Im1 = imag(r(1, :))'; Im2 = imag(r(2, :))'; Im3 = imag(r(3, :))';
%csvwrite('data/rlocus.txt', [Re1, Im1, Re2, Im2, Re3, Im3]);
%% 2.3
%[p,z] = pzmap(F);
%plot(real(p),imag(p),'*',real(z),imag(z),'o');
%legend('poles','zeros');
%grid;
%% 2.4
S = stepinfo(F, 'SettlingTimeThreshold', 0.05);
%sys1 = tf(1.05*0.357,1);
%sys2 = tf(0.95*0.357,1);
%[y, t] = 
%step(F,30);
%csvwrite('data/step.txt', [t, y]);
%[delta, t] = impulse(F,30);
%csvwrite('data/impulse.txt', [t, delta]);
%%ยัย
[A,B,C,D]=tf2ss(b,a);
ctrb(A,B)
obsv(A,C)