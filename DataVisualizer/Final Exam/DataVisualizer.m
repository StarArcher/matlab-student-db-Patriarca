classdef DataVisualizer
    methods (Static)
        % GPA distribution histogram
        function plotGPADistribution(database)
            gpas = [database.Students.GPA];
            histogram(gpas, 'BinWidth', 0.2);
            title('GPA Distribution');
            xlabel('GPA');
            ylabel('Number of Students');
        end

        % Average GPA by major
        function plotAverageGPAByMajor(database)
            majors = unique({database.Students.Major});
            avgGPA = zeros(size(majors));
            for i = 1:length(majors)
                studentsByMajor = database.getStudentsByMajor(majors{i});
                avgGPA(i) = mean([studentsByMajor.GPA]);
            end
            bar(categorical(majors), avgGPA);
            title('Average GPA by Major');
            xlabel('Major');
            ylabel('Average GPA');
        end

        % Age distribution histogram
        function plotAgeDistribution(database)
            ages = [database.Students.Age];
            histogram(ages);
            title('Age Distribution');
            xlabel('Age');
            ylabel('Number of Students');
        end
    end
end
