clc;
clear all;


% Specify the file name
fileName = 'r1.txt';
fileName1 = 'w1.txt';

% Read the text file using readtable with HeaderLines option
dataTable = readtable(fileName, 'Delimiter', ',' , 'HeaderLines', 1);
dataTable1 = readtable(fileName1, 'Delimiter', ',' , 'HeaderLines', 1);
% Extract numeric data from the table
numericData = table2array(dataTable(:, 1:end));
numericData1 = table2array(dataTable1(:, 1:end));
% Display the content of the matrix

%% Accel
AccelZrun = dataTable{:, 4}; 
AccelY= dataTable{:, 3};
AccelX = dataTable{:, 2};
AccelZwalk = dataTable1{:, 4};
column4Data3 = dataTable{:, 3}; 
column4Data2 = dataTable{:, 2};


% Plot the data
figure;
% plot(AccelX, 'DisplayName', 'Column 2','color','blue');

% plot(AccelY, 'DisplayName', 'Column 3','color','green');
plot(AccelZrun, 'DisplayName', 'Column 4','color','red');
hold on;

% plot(column4Data2, 'DisplayName', 'Column 2','color','green');
% plot(column4Data3, 'DisplayName', 'Column 3','color','red');
plot(AccelZwalk, 'DisplayName', 'Column 4','color','blue');


title('Accel');
legend('AccelZrun', 'AccelZwalk' );
% legend('AccelX', 'AccelY', 'AccelZ', 'AccelX', 'AccelY', 'AccelZ');
hold off;

%% Gyro
GyroX = dataTable{:, 5}; 
GyroY = dataTable{:, 6};
GyroZ = dataTable{:, 7};


figure;
plot(GyroX, 'DisplayName', 'Column 5','color','blue');
hold on;
plot(GyroY, 'DisplayName', 'Column 6','color','green');
plot(GyroZ, 'DisplayName', 'Column 7','color','red');
title('Gyro');
legend('GyroX', 'GyroY', 'GyroZ', 'GyroX', 'GyroY', 'GyroZ');

hold off;

%% AccAngle
AccAngleX = dataTable{:, 8}; 
AccAngleY = dataTable{:, 9};


figure;
plot(AccAngleX, 'DisplayName', 'Column 8','color','blue');
hold on;
plot(AccAngleY, 'DisplayName', 'Column 9','color','green');
title('AccAngle');
legend('AccAngleX', 'AccAngleY',  'AccAngleX', 'AccAngleY');
hold off;


%% Angle
AngleZ = dataTable{:, 12}; 
AngleY = dataTable{:, 11};
AngleX = dataTable{:, 10};


figure;
plot(AngleX, 'DisplayName', 'Column 10','color','blue');
hold on;
plot(AngleY, 'DisplayName', 'Column 11','color','green');
plot(AngleZ, 'DisplayName', 'Column 12','color','red');
title('Angle');
legend('AngleX', 'AngleY', 'AngleZ', 'AngleX', 'AngleY', 'AngleZ');
hold off;