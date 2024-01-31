clc; close all; clear all;

%%  CWRU    
fs = 12e3;

sig_length = 1024; win_len = 100; noverlap = round(0.9 * win_len);
nfft = 184;
overlap = round(0.15* sig_length);

%   098 for normal, 106, 119, 145 for faulty 110, 130, 140
data_temp = X145_DE_time;

data1 = buffer(data_temp, sig_length, overlap, 'nodelay');

[~, data_count] = size(data1);

%%
% TFRs_CWRU = [];

for iter = 1: 140
    S = [];
    data_iter = data1(:, iter)';
    [S] = spectrogram(data_iter, win_len, noverlap, nfft, fs);
    TFRs_CWRU = [TFRs_CWRU, abs(S)];
end

imagesc(abs(S.^2)); axis xy; axis off;
set(gcf, 'position', [100, 100, 300, 220]);


%%  CWRU figures
S = zeros(93, 93);
figure,
for iiter = 1: 400
    iiter
    index1 = 1 + (iiter - 1)* size(S, 2);
    index2 = iiter* size(S, 2);
    SS = TFRs_CWRU(:, index1: index2);
    imagesc(abs(SS).^2); axis xy;
    axis off;
%     pause(0.01);

    pic_dir = 'D:\Downloads\Multi_dataset\NF\CWRU\F\';
    pic_name = strcat(pic_dir, 'CWRU_F_', num2str(iiter), '.png');
    if exist(pic_dir) == 0
        mkdir(pic_dir);
    end
    
    saveas(gcf, pic_name);
end
close figure 1;

%%  HUST 
%   normal: N400, N500, N600, N700
%   F: I400, B500, O400
fs = 51.2e3;
sig_length = 4096; win_len = 400; noverlap = round(0.9 * win_len);
overlap = round(0.15* sig_length);

data_temp = data;
data1 = buffer(data_temp, sig_length, overlap, 'nodelay');
[~, data_count] = size(data1);

% TFRs_HUST = [];
for iter = 1: 140
    S = [];
    data_iter = data1(:, iter)';
    [S] = spectrogram(data_iter, win_len, noverlap, nfft, fs);
    TFRs_HUST = [TFRs_HUST, abs(S)];
end

%%  HUST figures
figure,
for iiter = 1: 400
    iiter
    index1 = 1 + (iiter - 1)* size(S, 2);
    index2 = iiter* size(S, 2);
    SS = TFRs_HUST(:, index1: index2);
    imagesc(abs(SS).^2); axis xy;
    axis off;
%     pause(0.01);

    pic_dir = 'D:\Downloads\Multi_dataset\NF\HUST\F\';
    pic_name = strcat(pic_dir, 'HUST_F_', num2str(iiter), '.png');
    if exist(pic_dir) == 0
        mkdir(pic_dir);
    end
    
    saveas(gcf, pic_name);
end
close figure 1;

%%  UODS  Normal H_1_0, H_3_0
%   faulty I_5_2, O_6_2, B_11_2, C_16_2;

fs = 42e3;

sig_length = 2048; win_len = 200; noverlap = round(0.9 * win_len);
overlap = round(0* sig_length);

data = C_16_2(:, 1);
data_temp = data;
data1 = buffer(data_temp, sig_length, overlap, 'nodelay');
[~, data_count] = size(data1);

% TFRs_UODS = [];
for iter = 1: 100
    S = [];
    data_iter = data1(:, iter)';
    [S] = spectrogram(data_iter, win_len, noverlap, nfft, fs);
    TFRs_UODS = [TFRs_UODS, abs(S)];
end

imagesc(abs(S.^2)); axis xy;

%%  UODS figures
figure(1),
for iiter = 1: 400
    iiter
    index1 = 1 + (iiter - 1)* size(S, 2);
    index2 = iiter* size(S, 2);
    SS = TFRs_UODS(:, index1: index2);
    imagesc(abs(SS).^2); axis xy;
    axis off;
%     pause(0.01);

    pic_dir =  'D:\Downloads\Multi_dataset\NF\UODS\F\';
    pic_name = strcat(pic_dir, 'UODS_F_', num2str(iiter), '.png');
    if exist(pic_dir) == 0
        mkdir(pic_dir);
    end
    
    saveas(gcf, pic_name);
end
close figure 1;

%%  XJTU    Normal  1, 2, 3, 4
%   F:  Inner 1_1, Inner 2_1, Outer 1_1, Outer 2_1
fs = 25.6e3;

sig_length = 4096; win_len = 400; noverlap = round(0.9 * win_len);
overlap = round(0.15* sig_length);

data = data;
data_temp = data;
data1 = buffer(data_temp, sig_length, overlap, 'nodelay');
[~, data_count] = size(data1);

% TFRs_XJTU = [];
for iter = 1: 100
    S = [];
    data_iter = data1(:, iter)';
    [S] = spectrogram(data_iter, win_len, noverlap, nfft, fs);
    TFRs_XJTU = [TFRs_XJTU, abs(S)];
end

imagesc(abs(S.^2)); axis xy;

%%  XJTU figures
figure(1),
for iiter = 1: 400
    iiter
    index1 = 1 + (iiter - 1)* size(S, 2);
    index2 = iiter* size(S, 2);
    SS = TFRs_XJTU(:, index1: index2);
    imagesc(abs(SS).^2); axis xy;
    axis off;
%     pause(0.01);

    pic_dir = 'D:\Downloads\Multi_dataset\NF\XJTU\N\';
    pic_name = strcat(pic_dir, 'XJTU_N_', num2str(iiter), '.png');
    if exist(pic_dir) == 0
        mkdir(pic_dir);
    end
    
    saveas(gcf, pic_name);
end
close figure 1;


