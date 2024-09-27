clc;
clear all;


fileName = 'jump.txt';

% Read the text file using readtable with HeaderLines option
dataTable = readtable(fileName, 'Delimiter', ',' , 'HeaderLines', 1);

% Extract numeric data from the table
numericData = table2array(dataTable(:, 1:end));



%% Accel
AccelZ= dataTable{:, 4}; 
AccelY= dataTable{:, 3};
AccelX = dataTable{:, 2};



% Plot the data
figure;
plot(AccelX, 'DisplayName', 'Column 2','color','blue');
hold on;
plot(AccelY, 'DisplayName', 'Column 3','color','green');
plot(AccelZ, 'DisplayName', 'Column 4','color','red');
title('Accel');
legend('AccelX', 'AccelY', 'AccelZ', 'AccelX', 'AccelY', 'AccelZ');
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



