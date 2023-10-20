function [student_id,class_id] = getStudentAndClassIds

done=0;
while done==0
    student_id = input(['Please enter your student_id: '],'s');
    if isempty(strfind(student_id,'_')) && length(student_id) <= 25 && length(student_id) >0
        done=1;
    end
end

done=0;
while done==0
    class_id = input(['Please enter your class_id: '],'s');
    if isempty(strfind(class_id,'_')) && length(class_id) <= 25 && length(class_id) >0
        done=1;
    end
end
end

