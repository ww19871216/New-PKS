function abandonAndHideIncompleteAdaptiveTest

global grv lrv grv_fn lrv_fn

studentQuestionNtoDeleteFrom=find(grv.studentHistory.areaPos==1);
studentQuestionNtoDeleteFrom=studentQuestionNtoDeleteFrom(end);

if isempty(grv.studentHistoryHIDDEN)
    startHiddenQnumbering=round(studentQuestionNtoDeleteFrom-1);
else
    startHiddenQnumbering=(max(studentQuestionNtoDeleteFrom-1,max(grv.studentHistoryHIDDEN.studentQuestionN)));
end 

grv.modelHistory=lrv.modelHistoryTemp;
grv.questionPKS=lrv.questionPKSTemp;
grv.questionPKSlearn=lrv.questionPKSlearnTemp;

toMoveHistory=grv.studentHistory(studentQuestionNtoDeleteFrom:end-1,:);
newNumbering=(1:length(toMoveHistory.studentQuestionN))';
toMoveHistory.studentQuestionN=round((startHiddenQnumbering+newNumbering*.001),3);

grv.studentHistoryHIDDEN=[grv.studentHistoryHIDDEN; toMoveHistory];
grv.studentHistory=grv.studentHistory(1:startHiddenQnumbering,:);

grv.areaPos=0;
lrv=[];
lrv.runtimeVarsExist=0;




end

