clc;
clear all;
close all;

msg_amplitude = 1;
msg_frequency = 2;
time = 0:0.001:03;
msg_signal = msg_amplitude*sin(2*pi*msg_frequency*time);
subplot(4,1,1);
plot(time, msg_signal);
title('Message or Modulating Signal');

carrier_amplitude = 1;
carrier_frequency = 30;
carrier_signal = carrier_amplitude*cos(2*pi*carrier_frequency*time);
subplot(4,1,2);
plot(time, carrier_signal);
title('Carrier Signal');

%#... Modulation
kp =  10;
modulated_signal = carrier_amplitude*cos(2*pi*carrier_frequency*time+kp*msg_signal);
subplot(4,1,3);
plot(time, modulated_signal);
title('Modulated signal using phase modulation');

%#... Demodulation
x = abs(diff(modulated_signal));
%pkg load signal;
[a,b] = butter(10, 0.03);
demodulated_signal = filter(a,b,x);
subplot(4,1,4);
plot(demodulated_signal);
title('Demodulated signal using phase demodulation');
