function  takeTestOnTestBankQuestionsInSequence
global grv lrv grv_fn lrv_fn

initializeAdaptiveTest

if grv.areaPos < 4
    testCompletelyDone=0;
else
    testCompletelyDone=1;
end

while testCompletelyDone==0
    testCompletelyDone=recordStudentAnswerAndGetNextQuestionSPECIAL;
end

if testCompletelyDone==1
    choice=reviewTestAndFinalSubmission;
    if lrv.correctnessChanged==1
        pos=find(grv.studentHistory.areaPos==1);
        pos=pos(end):length(grv.studentHistory.correctnessChanged);
        pos2=find(grv.studentHistory.dataSetNumber(pos)>0);
        if any(grv.studentHistory.correctnessChanged(pos(pos2)))
            disp(' ')
            disp('****** PKS recomputed ******')
            disp(' ')
            updatePKSsystemAfterChangedAnswer;
        end
    elseif lrv.testSettings.nRandomQuestionsNotInModel==0
        [grv.questionPKS,grv.questionPKSlearn,grv.modelHistory] = updatePKSsystemWithNewQuestion(grv.studentHistory(end,:),grv.modelHistory);
    end
    currentMeanPKSforKPs=computeMeanPKSForKPs;
    dt=clock;
    dt=getCiscoFormattedTime(dt);
    grv.studentReportHistory.studentQuestionN(end-1:end)=grv.studentHistory.studentQuestionN(end);
    grv.studentReportHistory.timeStamp(end-1:end)={dt};
    grv.studentReportHistory(end-1,5:end)=num2cell(currentMeanPKSforKPs');
    grv.studentReportHistory(end-1:end,4)={lrv.correctnessChanged};
    grv.product_area=grv.product_area+1;
    grv.areaPos=0;
   

    lrv=[];
    lrv.runtimeVarsExist=0;
    lrv.resultsProduct=-1;
    lrv.resultsModule=-1;
    lrv.resultsKP=-1;
    lrv.reportIndex=[];
    save(lrv_fn,'lrv')
    save(grv_fn,'grv')
end

end
    



