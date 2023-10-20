function [grv_fn,lrv_fn,grv,lrv]=initializeStudentIfNewAndGetStudentDetails_HUB(product,student_id,class_id,PKSserviceVersion)

pathsep = getPathSeparator;
keyPaths = getAllKeyPaths_HUB;
studentDBlocation=[keyPaths.studentDBfolder product ' Student DB' pathsep];
allStudentsFilename=[studentDBlocation 'allStudents_' product '.csv'];
opts=detectImportOptions(allStudentsFilename);
opts.VariableTypes(1:end)={'char'};
allStudents=readtable(allStudentsFilename,opts);


student_id={student_id};
class_id={class_id};
newStudent=0;
if isempty(allStudents)
    allStudents=table(student_id,class_id);
    newStudent=1;
elseif ismember(student_id,allStudents.student_id(:))==0
    allStudents=[allStudents; table(student_id,class_id)];
    newStudent=1;
else
    pos=find(ismember(allStudents.student_id(:),student_id));
    if ismember(class_id,allStudents.class_id(pos))==0
        allStudents=[allStudents; table(student_id,class_id)];
        newStudent=1;  
    end
end

grv_fn=[studentDBlocation 'student_' student_id{1} pathsep 'class_' class_id{1} pathsep 'globalRuntimeVars_' product '.mat'];
lrv_fn=[studentDBlocation 'student_' student_id{1} pathsep 'class_' class_id{1} pathsep 'localRuntimeVars_' product '.mat'];

if newStudent==1
    [grv.questionPKS,grv.questionPKSlearn,grv.modelHistory]=initializePKSsystem;
    grv.studentHistory=initializeStudentHistory;
    grv.studentHistoryHIDDEN=initializeStudentHistory;
    grv.studentReportHistory=initializeStudentReportHistory;
    grv.product_area=1;
    grv.areaPos=0;
    grv.questionIndicesSinceLastComprehensiveQuiz =-1;
    grv.questionIndicesSinceLastLocalQuiz=-1;
    grv.KPindicesSeenSinceLastComprehensiveQuiz =-1;
    grv.PKSserviceVersion=PKSserviceVersion;
    mkdir(studentDBlocation,['student_' student_id{1} pathsep 'class_' class_id{1}])
    writetable(allStudents,[studentDBlocation 'allStudents_' product '.csv'])
    save(grv_fn,'grv')
    lrv.runtimeVarsExist=0;
    save(lrv_fn,'lrv')  
else
    load(grv_fn,'grv')
    load(lrv_fn,'lrv')
    if ismember(grv.studentHistory.Properties.VariableNames,'is_IDontKnow')==0
        grv.studentHistory.is_IDontKnow=-1*ones(size(grv.studentHistory,1),1);
        grv.studentHistoryHIDDEN.is_IDontKnow=-1*ones(size(grv.studentHistoryHIDDEN,1),1);
    end
    if ismember(grv.product_area,[1 3 5 13 15 17 27 29 31 33]) && grv.areaPos > 1
        timeMaxBetweenCurrentAndLast=5;
        currentTime=convertDateDataToDecimalFromStart2015(clock);
        if ~isfield(lrv,'testStartTimestamp') && grv.areaPos < 4
            lrv.testStartTimestamp=0;
            lrv.abandonAndRestartTest=1;
        else 
            testStartTime=extractDecimalTimeFromSingleCiscoFormattedTime(lrv.testStartTimestamp);
            elapsedTimeInDecimalDays=currentTime-testStartTime;
            if elapsedTimeInDecimalDays > timeMaxBetweenCurrentAndLast
                lrv.abandonAndRestartTest=1;
            end
        end
    end
end
end

