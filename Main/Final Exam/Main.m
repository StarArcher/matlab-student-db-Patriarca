% Main script
clear;
clc;

% Create the student database
database = StudentDatabase();

% Add sample students
database = database.addStudent('001', 'Alice', 20, 3.7, 'Physics');
database = database.addStudent('002', 'Bob', 22, 3.5, 'Mathematics');
database = database.addStudent('003', 'Charlie', 21, 3.9, 'Physics');
database = database.addStudent('004', 'Diana', 19, 3.3, 'Engineering');
database = database.addStudent('005', 'Edward', 23, 2.9, 'Mathematics');

% Save the database to a file
database.saveDatabase('studentDatabase.mat');

% Load the database from the file
database = database.loadDatabase('studentDatabase.mat');

% Display a specific student's info
student = database.findStudentByID('003');
if ~isempty(student)
    student.displayInfo();
end

% Display all students in a specific major
physicsStudents = database.getStudentsByMajor('Physics');
disp('Physics Students:');
for i = 1:length(physicsStudents)
    physicsStudents(i).displayInfo();
end

% Generate visualizations
figure;
DataVisualizer.plotGPADistribution(database);

figure;
DataVisualizer.plotAverageGPAByMajor(database);

figure;
DataVisualizer.plotAgeDistribution(database);
