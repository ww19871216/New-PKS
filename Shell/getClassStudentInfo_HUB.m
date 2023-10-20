function classStudentInfo=getClassStudentInfo_HUB(class_id,product)

pathsep = getPathSeparator;
keyPaths = getAllKeyPaths_HUB;
studentDBlocation=[keyPaths.studentDBfolder product ' Student DB' pathsep];
allStudentsFilename=[studentDBlocation 'allStudents_' product '.csv'];
opts=detectImportOptions(allStudentsFilename);
opts.VariableTypes(1:end)={'char'};
allStudents=readtable(allStudentsFilename,opts);

classStudentInfo=allStudents(ismember(allStudents.class_id,class_id),:);
studentN=size(classStudentInfo,1);

classStudentInfo.filename=cell(studentN,1);
classStudentInfo.filename(:)={' '*ones(200,1)};
for i=1:studentN
    sid=classStudentInfo.student_id{i};
    cid=classStudentInfo.class_id{i};
    classStudentInfo.filename{i}=[studentDBlocation 'student_' sid pathsep 'class_' cid pathsep 'globalRuntimeVars_' product '.mat'];
end
end

