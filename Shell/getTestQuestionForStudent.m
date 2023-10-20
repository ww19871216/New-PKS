function  newQuestionIndex=getTestQuestionForStudent(lastQuestionIndex)

global adaptiveTestParameters
global lrv
if lastQuestionIndex==0
    questionPoolInfoF=lrv.questionPoolInfo;
elseif isempty(lrv.questionPoolInfo.TOTAL_M(ismember(lrv.questionPoolInfo.question_index,lrv.testQuestionHistory)==0))
    questionPoolInfoF=lrv.questionPoolInfo(lrv.questionPoolInfo.question_index~=lastQuestionIndex,:);
else
    questionPoolInfoF=lrv.questionPoolInfo(ismember(lrv.questionPoolInfo.question_index,lrv.testQuestionHistory)==0,:);
end
maxTotal=max(questionPoolInfoF.TOTAL_M);
if lrv.testQuestionN==1
    cutoffProportion=adaptiveTestParameters.performanceFilterForChoosingQuestion;
else
    pf=max(0.97,adaptiveTestParameters.performanceFilterForChoosingQuestion);
    testQuestionInc=(0.995-pf)/16;
    cutoffProportion=(pf+ (lrv.testQuestionN-1)*testQuestionInc);
end
cutoffProportion(cutoffProportion>0.995)=0.995;
if maxTotal >= 0
    cutoff=cutoffProportion*maxTotal;
else
    cutoff=(1/cutoffProportion)*maxTotal;
end
finalQuestionsToChooseFrom=questionPoolInfoF.question_index(questionPoolInfoF.TOTAL_M >= cutoff);
pos=randi(length(finalQuestionsToChooseFrom));
newQuestionIndex=finalQuestionsToChooseFrom(pos);

%
%This part just displays in the simulation how many questions were available in finalQuestionsToChooseFrom.
disp(' ')
disp([num2str(length(finalQuestionsToChooseFrom)) ' acceptable questions out of ' ...
      num2str(size(questionPoolInfoF,1)) ' total questions in test pool'])
%}
end


