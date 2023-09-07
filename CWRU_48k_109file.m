clc; clear all; close all;

%%  load data
load 'D:\Downloads\CWRUdata\48k Drive End Bearing Fault Data\109.mat';
fs = 48e3;
data = X109_DE_time;
N = length(data);
t = (1: N)/fs;

figure(10);
plot(t(1: 1000), data(1: 1000));
set(gcf, 'Position', [300, 300, 400, 320]);

%%  FFT
f_s = (0: N- 1)./ N.* fs;
NFFT = 2^nextpow2(N);
figure(20);
Y = fft(data, NFFT);
F = fs/ 2* linspace(0, 1, NFFT/2+1);
plot(F, 2* abs(Y(1: NFFT/2+1))/N);
set (gcf, 'Position', [300, 300, 800, 320])
xlim([0, 1200]);