clc; close all; clear all;

%%  
cls2= [200, 200];
cls3 = [130, 130, 140];

%%  CWRU
%   098, 099 for normal, 109, 135, 122 for faulty 130, 130, 140
fs = 48e3;
load('D:\Downloads\CWRUdata\Normal Baseline Data\98.mat');
load('D:\Downloads\CWRUdata\Normal Baseline Data\99.mat');
sig_length = 4096; 
overlap = round(0.5* sig_length);
%   manually load data
data_temp1 = X098_DE_time;
data_temp2 = X099_DE_time;

data1 = buffer(data_temp1, sig_length, overlap, 'nodelay');
data2 = buffer(data_temp2, sig_length, overlap, 'nodelay');
CWRU_Vib_N = [data1(:, 1: cls2(1)), data2(:, 1: cls2(2))];
save('CWRU_Vib_N.mat', 'CWRU_Vib_N');

kurt1 = compute_kurtosis(data_temp1, floor(length(data_temp1)/1e4)*1e4);
kurt2 = compute_kurtosis(data_temp2, floor(length(data_temp2)/1e4)*1e4);
CWRU_Kurt_N = [kurt1(:, 1: cls2(1)), kurt2(:, 1: cls2(1))];
save('CWRU_Kurt_N.mat', 'CWRU_Kurt_N');
load('D:\Downloads\CWRUdata\48k Drive End Bearing Fault Data\109.mat');
load('D:\Downloads\CWRUdata\48k Drive End Bearing Fault Data\135.mat');
load('D:\Downloads\CWRUdata\48k Drive End Bearing Fault Data\122.mat');
data_temp1 = X109_DE_time;
data_temp2 = X135_DE_time;
data_temp3 = X122_DE_time;

overlap = round(0.6* sig_length);
data1 = buffer(data_temp1, sig_length, overlap, 'nodelay');
data2 = buffer(data_temp2, sig_length, overlap, 'nodelay');
data3 = buffer(data_temp3, sig_length, overlap, 'nodelay');
CWRU_Vib_F = [data1(:, 1: cls3(1)), data2(:, 1: cls3(2)), data3(:, 1: cls3(3))];
save('CWRU_Vib_F.mat', 'CWRU_Vib_F');

kurt1 = compute_kurtosis(data_temp1, floor(length(data_temp1)/1e4)*1e4);
kurt2 = compute_kurtosis(data_temp2, floor(length(data_temp2)/1e4)*1e4);
kurt3 = compute_kurtosis(data_temp2, floor(length(data_temp3)/1e4)*1e4);
CWRU_Kurt_F = [kurt1(:, 1: cls3(1)), kurt2(:, 1: cls3(2)), kurt3(:, 1: cls3(3))];
save('CWRU_Kurt_F.mat', 'CWRU_Kurt_F');

%%  HUST 
%   normal: N400, N500, N600, N700
%   F: I400, B500, O400
fs = 51.2e3;
data_dir = 'D:\Downloads\HUST bearing\HUST bearing dataset\';

sig_length = 4096; 
overlap = round(0.5* sig_length);

load(strcat(data_dir, 'N400'));
data_temp1 = data - mean(data);
data1 = buffer(data_temp1, sig_length, overlap, 'nodelay');

load(strcat(data_dir, 'N500'));
data_temp2 = data - mean(data);
data2 = buffer(data_temp2, sig_length, overlap, 'nodelay');

HUST_Vib_N = [data1(:, 1: cls2(1)), data2(:, 1: cls2(2))];
save('HUST_Vib_N.mat', 'HUST_Vib_N');

kurt1 = compute_kurtosis(data_temp1, floor(length(data_temp1)/1e4)*1e4);
kurt2 = compute_kurtosis(data_temp2, floor(length(data_temp2)/1e4)*1e4);
HUST_Kurt_N = [kurt1(:, 1: cls2(1)), kurt2(:, 1: cls2(1))];
save('HUST_Kurt_N.mat', 'HUST_Kurt_N');

load(strcat(data_dir, 'I400')); data_temp1 = data - mean(data);
load(strcat(data_dir, 'O400')); data_temp2 = data - mean(data);
load(strcat(data_dir, 'B500')); data_temp3 = data - mean(data);

overlap = round(0.5* sig_length);
data1 = buffer(data_temp1, sig_length, overlap, 'nodelay');
data2 = buffer(data_temp2, sig_length, overlap, 'nodelay');
data3 = buffer(data_temp3, sig_length, overlap, 'nodelay');
HUST_Vib_F = [data1(:, 1: cls3(1)), data2(:, 1: cls3(2)), data3(:, 1: cls3(3))];
save('HUST_Vib_F.mat', 'HUST_Vib_F');

kurt1 = compute_kurtosis(data_temp1, floor(length(data_temp1)/1e4)*1e4);
kurt2 = compute_kurtosis(data_temp2, floor(length(data_temp2)/1e4)*1e4);
kurt3 = compute_kurtosis(data_temp2, floor(length(data_temp3)/1e4)*1e4);
HUST_Kurt_F = [kurt1(:, 1: cls3(1)), kurt2(:, 1: cls3(2)), kurt3(:, 1: cls3(3))];
save('HUST_Kurt_F.mat', 'HUST_Kurt_F');


%%  UODS  Normal H_1_0, H_3_0
%   faulty I_5_2, O_6_2, B_11_2;
fs = 42e3;

data_dir = 'D:\Downloads\UODS\UODS\MatLab\';
sig_length = 4096; 
overlap = round(0.5* sig_length);

load(strcat(data_dir, '1_Healthy\', 'H_1_0.mat'));
data_temp1 = H_1_0(:, 1) - mean(H_1_0(:, 1));
data1 = buffer(data_temp1, sig_length, overlap, 'nodelay');

load(strcat(data_dir, '1_Healthy\', 'H_3_0.mat'));
data_temp2 = H_3_0(:, 1) - mean(H_3_0(:, 1));
data2 = buffer(data_temp2, sig_length, overlap, 'nodelay');

UODS_Vib_N = [data1(:, 1: cls2(1)), data2(:, 1: cls2(2))];
save('UODS_Vib_N.mat', 'UODS_Vib_N');

kurt1 = compute_kurtosis(data_temp1, floor(length(data_temp1)/1e4)*1e4);
kurt2 = compute_kurtosis(data_temp2, floor(length(data_temp2)/1e4)*1e4);
UODS_Kurt_N = [kurt1(:, 1: cls2(1)), kurt2(:, 1: cls2(1))];
save('UODS_Kurt_N.mat', 'UODS_Kurt_N');

load(strcat(data_dir, '2_Inner_Race_Faults\', 'I_5_2.mat')); data_temp1 = I_5_2(:, 1) - mean(I_5_2(:, 1));
load(strcat(data_dir, '3_Outer_Race_Faults\', 'O_6_2.mat')); data_temp2 = O_6_2(:, 1) - mean(O_6_2(:, 1));
load(strcat(data_dir, '4_Ball_Faults\', 'B_11_2.mat'));     data_temp3 = B_11_2(:, 1) - mean(B_11_2(:, 1));

overlap = round(0.5* sig_length);
data1 = buffer(data_temp1, sig_length, overlap, 'nodelay');
data2 = buffer(data_temp2, sig_length, overlap, 'nodelay');
data3 = buffer(data_temp3, sig_length, overlap, 'nodelay');
UODS_Vib_F = [data1(:, 1: cls3(1)), data2(:, 1: cls3(2)), data3(:, 1: cls3(3))];
save('UODS_Vib_F.mat', 'UODS_Vib_F');

kurt1 = compute_kurtosis(data_temp1, floor(length(data_temp1)/1e4)*1e4);
kurt2 = compute_kurtosis(data_temp2, floor(length(data_temp2)/1e4)*1e4);
kurt3 = compute_kurtosis(data_temp2, floor(length(data_temp3)/1e4)*1e4);
UODS_Kurt_F = [kurt1(:, 1: cls3(1)), kurt2(:, 1: cls3(2)), kurt3(:, 1: cls3(3))];
save('UODS_Kurt_F.mat', 'UODS_Kurt_F');



%%  XJTU    Normal  bearing 1-1
%   F:  Inner 2_1, Inner 1_1
fs = 25.6e3;
data_dir = 'D:\Downloads\XJTU-SY_Bearing_Datasets\';
sig_length = 4096; 
overlap = round(0.5* sig_length);

data_temp1 = [];
for iter = 1: 13
    data = xlsread(strcat(data_dir, '35Hz12kN\Bearing1_1\', num2str(iter), '.csv'));
    data_temp1 = [data_temp1; data(:, 1) - mean(data(:, 1))];
end
data1 = buffer(data_temp1, sig_length, overlap, 'nodelay');

data_temp2 = [];
for iter = 1: 13
    data = xlsread(strcat(data_dir, '37.5Hz11kN\Bearing2_1\', num2str(iter), '.csv'));
    data_temp2 = [data_temp2; data(:, 1) - mean(data(:, 1))];
end
data2 = buffer(data_temp2, sig_length, overlap, 'nodelay');

XJTU_Vib_N = [data1(:, 1: cls2(1)), data2(:, 1: cls2(2))];
save('XJTU_Vib_N.mat', 'XJTU_Vib_N');

kurt1 = compute_kurtosis(data_temp1, floor(length(data_temp1)/1e4)*1e4);
kurt2 = compute_kurtosis(data_temp2, floor(length(data_temp2)/1e4)*1e4);
XJTU_Kurt_N = [kurt1(:, 1: cls2(1)), kurt2(:, 1: cls2(1))];
save('XJTU_Kurt_N.mat', 'XJTU_Kurt_N');


data_temp1 = [];
for iter = 111: 123
    data = xlsread(strcat(data_dir, '35Hz12kN\Bearing1_1\', num2str(iter), '.csv'));
    data_temp1 = [data_temp1; data(:, 1) - mean(data(:, 1))];
end
data1 = buffer(data_temp1, sig_length, overlap, 'nodelay');

data_temp2 = [];
for iter = 479: 491
    data = xlsread(strcat(data_dir, '37.5Hz11kN\Bearing2_1\', num2str(iter), '.csv'));
    data_temp2 = [data_temp2; data(:, 1)] - mean(data(:, 1));
end
data2 = buffer(data_temp2, sig_length, overlap, 'nodelay');

XJTU_Vib_F = [data1(:, 1: cls2(1)), data2(:, 1: cls2(2))];
save('XJTU_Vib_F.mat', 'XJTU_Vib_F');

kurt1 = compute_kurtosis(data_temp1, floor(length(data_temp1)/1e4)*1e4);
kurt2 = compute_kurtosis(data_temp2, floor(length(data_temp2)/1e4)*1e4);
XJTU_Kurt_F = [kurt1(:, 1: cls2(1)), kurt2(:, 1: cls2(1))];
save('XJTU_Kurt_F.mat', 'XJTU_Kurt_F');
