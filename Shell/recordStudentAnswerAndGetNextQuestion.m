function testCompletelyDone=recordStudentAnswerAndGetNextQuestion

global grv_fn grv lrv_fn lrv

%Parallel Part A
correctness=displayQuestionInfoAndGetStudentAnswer;
                                                   
%Parallel Part B
testCompletelyDone=updateModelInParallel;

%Final sync-up between parts only to update the correctness in the studentHistory for the last question answered. 
if testCompletelyDone==1
    if correctness==-1
        correctness=0;
        grv.studentHistory.is_IDontKnow(end)=1;
    end
    grv.studentHistory.correctness(end)=correctness;
    grv.areaPos=4;
else
    if correctness==-1
        correctness=0;
        grv.studentHistory.is_IDontKnow(end-1)=1;
    end
    grv.studentHistory.correctness(end-1)=correctness; 
end
save(lrv_fn,'lrv')
save(grv_fn,'grv')


end

