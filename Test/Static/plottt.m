clc;
clear all;

% Specify the file name
fileName = 'DATA.txt';
fileName1 = 'nom2.txt';

% Read the text file using readtable with HeaderLines option
dataTable = readtable(fileName, 'Delimiter', ',' , 'HeaderLines', 1);
dataTable1 = readtable(fileName1, 'Delimiter', ',' , 'HeaderLines', 1);
% Extract numeric data from the table
numericData = table2array(dataTable(:, 1:end));
numericData1 = table2array(dataTable1(:, 1:end));
% Display the content of the matrix

column4Data = dataTable{:, 4}; 
column3Data = dataTable{:, 3};
column2Data = dataTable{:, 2};

% Plot the data
figure;
plot(column2Data, 'DisplayName', 'Column 2','color','blue');
hold on;
plot(column3Data, 'DisplayName', 'Column 3','color','green');
plot(column4Data, 'DisplayName', 'Column 4','color','red');
hold off;


ytickvalues = 0:0.2:max([column2Data; column4Data]);
yticks(ytickvalues);


column12Data = dataTable{:, 12}; 
column11Data = dataTable{:, 11};
column10Data = dataTable{:, 10};



figure;
plot(column10Data, 'DisplayName', 'Column 10','color','blue');
hold on;
plot(column11Data, 'DisplayName', 'Column 11','color','green');
plot(column12Data, 'DisplayName', 'Column 12','color','red');
hold off;



% ytickvalues = 0:0.2:max([column2Data; column4Data]);
% yticks(ytickvalues);





