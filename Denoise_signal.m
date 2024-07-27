clc; clear all; close all;

% Defining the Signal
dt=0.001;
t=0:dt:1;
fclean=sin(2*pi*50*t)+sin(2*pi*120*t);
f=fclean+2.5*randn(size(t));

figure;
plot(t,f,'r','LineWidth',1);
hold on;
plot(t,fclean,'b','LineWidth',1);
hold off;
ylim([-10 10]);
title('Original vs Noisy Signal');
l1=legend('Noisy','Clean');
grid on;

% Computing the Fast Fourier Transform (FFT)
n=length(t);
fhat=fft(f,n);
PSD=fhat.*conj(fhat)/n;
freq=1/(dt*n)*(0:n);
L=1:floor(n/2);

figure;
plot(freq(L), PSD(L), 'r')
xlabel('Frequency');
ylabel('Power Spectral Density');
title('PSD vs Freq Plot');
grid on;

% Using Power Spectral Density (PSD) to filter out the Noise
indices=PSD>100;
PSDclean=PSD.*indices;
fhat=indices.*fhat;
ffilt=ifft(fhat);

figure;
plot(freq(L),PSDclean(L),'r');
title('Filtered PSD');
grid on;

figure;
plot(t,ffilt,'b'); ylim([-10 10]);
title('Clean Output Signal');
grid on;