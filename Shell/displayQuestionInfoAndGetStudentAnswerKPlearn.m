function correctness=displayQuestionInfoAndGetStudentAnswerKPlearn

global questionModelMap KPcontentMap

global grv lrv

question_index=grv.studentHistory.question_index(end);
PKSbeforeQ=grv.studentHistory.PKSbeforeQ(end);
studentQuestionN=grv.studentHistory.studentQuestionN(end);
question_textid=questionModelMap.question_textid(question_index);
if iscell(question_textid)==0
    question_textid=cellstr(num2str(question_textid));
end

KP_textid=KPcontentMap.KP_textid(questionModelMap.KP_index(question_index));



disp(['StudentQ_N: ' num2str(studentQuestionN) '   KP_Q_N: ' num2str(lrv.KPlearnCount) ...
      '   Question: ' char(question_textid) '   KP: ' char(KP_textid)])
disp(['CurrentQuestionPKS=' num2str(PKSbeforeQ) '  CurrentKPmeanPKS=' num2str(lrv.PKSforKP)])

disp(' ')

correctness=getUserAnswerForNumericOptions([0 1 'l' 'b'],'Student Answer? [0 incorrect, 1 correct, l leave AL, b back to AL home] ');

end

