clc; clear all; close all;

%% Your
data = csvread('D:\Matlab codes\B_B_7.csv', 1);

%
sig = data(:, 2)';
% sig_mean = mean(sig);
% sig = sig - mean(hilbert(sig- mean(sig)));
N = length(sig);
sig = sig(1: round(N));

%
fs = 42e3;
win_len = 4e4;
noverlap = round(0.95* win_len);
nfft = 2^nextpow2(win_len);
[S, F, T] = spectrogram(sig, win_len, noverlap, nfft, fs, 'yaxis');

figure,
imagesc(T, F, log(abs(S.^1))); axis xy;
set(gca, 'ylim', [0, fs/2]);

%% Huang
load '';
sig1 = Channel_1;
% sig_mean = mean(sig);
% sig = sig - mean(hilbert(sig- mean(sig)));
N1 = length(sig1);
sig1 = sig1(1: round(N1));

%
fs = 200e3;
win_len = 2e4;
noverlap = round(0.95* win_len);
nfft = 2^nextpow2(win_len);
[S1, F1, T1] = spectrogram(sig1, win_len, noverlap, nfft, fs, 'yaxis');

figure,
imagesc(T1, F1, log(abs(S1.^1))); axis xy;
set(gca, 'ylim', [0, fs/2]);


