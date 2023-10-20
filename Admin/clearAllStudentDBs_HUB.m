function clearAllStudentDBs_HUB

pathsep = getPathSeparator;
keyPaths = getAllKeyPaths_HUB;

studentDBs=struct2table(dir(keyPaths.studentDBfolder));
pos=find(startsWith(studentDBs.name, '.')==1);
studentDBs(pos,:)=[];
for i=1:length(studentDBs.name)
    studentDBlocation=[keyPaths.studentDBfolder studentDBs.name{i}];
    pathSetting = getCurrentPathSettingForFolder(studentDBlocation);
    if pathSetting==1
        rmpath(studentDBlocation)
    end
    rmpath(studentDBlocation)
    rmdir(studentDBlocation,'s')
    mkdir(studentDBlocation)
    addpath(studentDBlocation)
    student_id=[];
    class_id=[];
    tempy = table(student_id,class_id);
    pos=find(ismember(studentDBs.name{i}, 'SD')==1);
    writetable(tempy, [studentDBlocation pathsep 'allStudents_' studentDBs.name{i}(1:pos(1)-2) '.csv'])
end


