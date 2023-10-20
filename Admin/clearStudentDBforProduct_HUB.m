function clearStudentDBforProduct_HUB

pathsep = getPathSeparator;
keyPaths = getAllKeyPaths_HUB;
product = getProductForSimulation_HUB;

studentDBlocation=[keyPaths.studentDBfolder product ' Student DB'];
pathSetting = getCurrentPathSettingForFolder(studentDBlocation);
if pathSetting==1
    rmpath(studentDBlocation)
end
rmdir(studentDBlocation,'s')
mkdir(studentDBlocation)
addpath(studentDBlocation)
student_id=[];
class_id=[];
tempy = table(student_id,class_id);
writetable(tempy, [studentDBlocation pathsep 'allStudents_' product '.csv'])

end

