function learnKPdone=updateModelInParallelKPlearn

global questionModelMap adaptiveTestParameters masteryCutoffs
global grv_fn lrv_fn grv lrv

maxQuestionsForPractice=4;
if lrv.KPlearnCount>0
    [grv.questionPKS,grv.questionPKSlearn,grv.modelHistory] = updatePKSsystemWithNewQuestion(grv.studentHistory(end-1,:),grv.modelHistory);
    lrv.PKSforKP=round(mean(grv.questionPKS(questionModelMap.KP_index==lrv.KPtoLearn)),2);
end



if lrv.KPlearnCount==maxQuestionsForPractice
    learnKPdone=1;
%    save(grv_fn,'grv')
else
    lrv.KPlearnCount=lrv.KPlearnCount+1;
    learnKPdone=0;
    lrv.QtoLearn=getBestQtoLearnFromKP(lrv.KPtoLearn);
    dataSetNumber=grv.studentHistory.dataSetNumber(end);
    studentQuestionN=grv.studentHistory.studentQuestionN(end)+1;
    question_index=lrv.QtoLearn;
    question_textid=questionModelMap.question_textid(question_index);
    PKSbeforeQ=round(grv.questionPKS(question_index),4);

    correctness=-1;
    product_area=grv.product_area;
    areaPos=1;
    is_testQ=0;
    correctnessChanged=0;
    currentQhist=table(studentQuestionN,question_index,question_textid,correctness,is_testQ,dataSetNumber,PKSbeforeQ,product_area,areaPos,correctnessChanged);
    grv.studentHistory=[grv.studentHistory; currentQhist];
%    save(lrv_fn,'lrv')
%    save(grv_fn,'grv')
end




end

