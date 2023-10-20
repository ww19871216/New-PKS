function getFinalExamHistoryForStudent

global finalExamQuestions questionModelMap
global lrv_fn lrv

N=length(finalExamQuestions.question_textid);
question_textid=cell(N,1);
for i=1:N
    question_textid(i)=questionModelMap.question_textid(ismember(questionModelMap.question_textid,finalExamQuestions.question_textid(i)));
end

nC=round(0.4*N);
maxCother=floor(0.55*N);
Cother=randi(maxCother,1);
nC=nC+Cother;
correctness=[ones(nC,1); zeros(N-nC,1)];
correctness=correctness(randperm(N));
is_testQ=ones(size(correctness));
lrv.batchHistory=table(question_textid,correctness,is_testQ);
lrv.runtimeVarsExist=1;
lrv.correctnessChanged=0;
lrv.startNewDataSetWithBatch=1;
lrv.goToReportingAfterBatch=1;
save(lrv_fn,'lrv')
end




