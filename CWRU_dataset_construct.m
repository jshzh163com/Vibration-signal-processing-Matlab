clc; clear all; close all;

%%
fault_index = '1';

save_path = 'D:\Downloads\CWRU_combined_loads\';
if exist(save_path) == 0
    mkdir(save_path);
else
    disp('dir exists');
end

for iter_loc = 1: 2
    if iter_loc == 1
        location = '_DE';
    elseif iter_loc == 2
        location = '_FE';
    end

    %  iter for different sizes
    for iter_size = 1: 3    %   = 4 for normal bearing
        data = [];
        %  iter for different loads
        for iter_hp = 1: 3
            hp = mat2str(iter_hp);
            if iter_size == 4   %   for normal
                size = '';
            elseif iter_size == 1
                size = '007';
            elseif iter_size == 2
                size = '014';
            elseif iter_size == 3
                size = '021';
            end

            if  fault_index == '1'
                fault_type = 'B';          %   for ball fault
                vv = [118, 185, 222];
                fault = strcat(fault_type, size, '');

            elseif  fault_index == '2'
                fault_type = 'OR';         %   for outer race fault
                vv = [130, 197, 234];
                fault = strcat(fault_type, size, '@6');

            elseif  fault_index == '3'
                fault_type = 'IR';         %   for inner race fault
                vv = [105, 169, 209];
                fault = strcat(fault_type, size, '');

            elseif  fault_index == '4'
                fault_type = 'normal';     %   for normal
                vv = [97, 97, 97];
                fault = strcat(fault_type, size, '');
            end

            fault_file = strcat(fault, '_', hp);
            file_str = strcat('D:\Downloads\Mechanical-datasets-master\dataset\', fault_file, '.mat');
            load(file_str);

            %  fault types
            if fault_index == '1'
                vv = [118, 185, 222];   %   ball fault
            elseif fault_index == '2'
                vv = [130, 197, 234];   %   outer race fault
            elseif fault_index == '3'
                vv = [105, 169, 209];   %   inner race fault
            elseif fault_index == '4'
                vv = [97, 97, 97, 97];  %   normal
            end

            % judge the name of the variable, three numbers, i.e., 97->097
            numm = vv(iter_size) + iter_hp;
            if numm < 100
                num_str = strcat('0',num2str(numm));
            else
                num_str = num2str(numm);
            end
            variable_name = strcat('X', num_str, location, '_time');
            data_tem = eval(variable_name);
            data = [data; data_tem - mean(data_tem)];

            %         save_path = '';
            filename = strcat(save_path, fault_type, '_', size, location, '.mat');

            %             filename1 = strcat(save_path, fault_type, '_', size, location);
            %             if exist(filename1, 'dir')==0
            %                 mkdir(filename1);
            %             end
            %             newfilename = strcat(filename1, '\', fault, location, '.mat');

        end
        save(filename, 'data');
    end
end