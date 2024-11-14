classdef Student
    properties
        ID
        Name
        Age
        GPA
        Major
    end
    
    methods
        % Constructor method
        function obj = Student(id, name, age, gpa, major)
            obj.ID = id;
            obj.Name = name;
            obj.Age = age;
            obj.GPA = gpa;
            obj.Major = major;
        end

        % Display student information
        function displayInfo(obj)
            fprintf("ID: %s, Name: %s, Age: %d, GPA: %.2f, Major: %s\n", obj.ID, obj.Name, obj.Age, obj.GPA, obj.Major);
        end

        % Update GPA
        function obj = updateGPA(obj, newGPA)
            obj.GPA = newGPA;
            fprintf("Updated GPA for %s: %.2f\n", obj.Name, obj.GPA);
        end
    end
end
