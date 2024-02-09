function [kurt] = compute_kurtosis(data, len)
%%  author: Zehui Hua, email:  zhua079@uottawa.ca

%   input:      data, 
%   output:     kurtosis of corresponding data.

%% 
data_temp = data(1: min(length(data), len));
data1 = buffer(data_temp, 5, 1, 'nodelay');

kurt_temp = kurtosis(data1)';

kurt = buffer(kurt_temp, 784, 392, 'nodelay');

end