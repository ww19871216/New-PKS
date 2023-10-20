function learnKPdone=recordStudentAnswerAndGetNextQuestionKPlearn

global grv_fn grv lrv_fn lrv

grvOrig=grv;
%Parallel Part A
correctness=displayQuestionInfoAndGetStudentAnswerKPlearn;
                                                   
%Parallel Part B
learnKPdone=updateModelInParallelKPlearn;

if correctness=='l' || correctness=='b' 
    learnKPdone=1;
    grv=grvOrig;
    grv.questionIndicesSinceLastComprehensiveQuiz(end)=[];
    grv.questionIndicesSinceLastLocalQuiz(end)=[];
    if isempty(grv.questionIndicesSinceLastComprehensiveQuiz)
        grv.questionIndicesSinceLastComprehensiveQuiz=-1;
    end
    if isempty(grv.questionIndicesSinceLastLocalQuiz)
        grv.questionIndicesSinceLastLocalQuiz=-1;
    end    
    grv.studentHistory(end,:)=[];
    grv.areaPos=0;
    if correctness=='l' 
        grv.product_area=1000;
    else
        grv.product_area=100;
    end
    lrv=[];
    lrv.runtimeVarsExist=0;
elseif learnKPdone==1
    grv.studentHistory.correctness(end)=correctness;  
    [grv.questionPKS,grv.questionPKSlearn,grv.modelHistory] = updatePKSsystemWithNewQuestion(grv.studentHistory(end,:),grv.modelHistory);
    grv.product_area=100;
    grv.areaPos=0;
    lrv=[];
    lrv.runtimeVarsExist=0;
else
    grv.studentHistory.correctness(end-1)=correctness; 
    grv.questionIndicesSinceLastComprehensiveQuiz(end+1)=grv.studentHistory.question_index(end);
    grv.questionIndicesSinceLastLocalQuiz(end+1)=grv.studentHistory.question_index(end);
end
save(lrv_fn,'lrv') 
save(grv_fn,'grv')


end

