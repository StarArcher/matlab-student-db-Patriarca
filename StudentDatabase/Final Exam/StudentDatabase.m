classdef StudentDatabase
    properties
        Students = Student.empty; % Array to store Student objects
    end
    
    methods
        % Add a new student
        function obj = addStudent(obj, id, name, age, gpa, major)
            newStudent = Student(id, name, age, gpa, major);
            obj.Students(end + 1) = newStudent;
        end

        % Find a student by ID
        function student = findStudentByID(obj, id)
            student = [];
            for i = 1:length(obj.Students)
                if strcmp(obj.Students(i).ID, id)
                    student = obj.Students(i);
                    return;
                end
            end
            if isempty(student)
                disp('Student not found');
            end
        end

        % Get list of students by major
        function studentsByMajor = getStudentsByMajor(obj, major)
            studentsByMajor = [];
            for i = 1:length(obj.Students)
                if strcmp(obj.Students(i).Major, major)
                    studentsByMajor = [studentsByMajor, obj.Students(i)];
                end
            end
        end

        % Save the database to a .mat file
        function saveDatabase(obj, filename)
            try
                save(filename, 'obj');
                fprintf("Database saved to %s\n", filename);
            catch
                error("Error saving file.");
            end
        end

        % Load the database from a .mat file
        function obj = loadDatabase(obj, filename)
            try
                loadedData = load(filename, 'obj');
                obj = loadedData.obj;
                fprintf("Database loaded from %s\n", filename);
            catch
                error("Error loading file.");
            end
        end
    end
end
