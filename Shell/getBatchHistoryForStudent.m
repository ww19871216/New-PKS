function getBatchHistoryForStudent

global KPcontentMap questionModelMap
global lrv_fn lrv

[~,index]=unique(KPcontentMap.L3_index);
name=KPcontentMap.L3_textid(index);
index=KPcontentMap.L3_index(index);
lessonList=table(index,name);
question='Select all lessons you want the batch to cover.';
disp(' ')
disp('Below are a list of lessons. Choose the ones you want the batch to cover.')
lessonList
lessonIndicesCovered=getUserAnswerForIndexQuestion(max(index),question,1);
KPsCoveredByBatch=KPcontentMap.KP_index(ismember(KPcontentMap.L3_index,lessonIndicesCovered))';
nKPsCoveredByBatch=length(KPsCoveredByBatch);

if nKPsCoveredByBatch < 4
    N=nKPsCoveredByBatch + randi(nKPsCoveredByBatch,1)+1;
else
    N=nKPsCoveredByBatch + randi(nKPsCoveredByBatch-2,1)+3;
end

testBankQuestions=questionModelMap.question_index(questionModelMap.inTestBank==1);
questionIndicesCovered=find(ismember(questionModelMap.KP_index,KPsCoveredByBatch));
questionIndicesCoveredTEST=intersect(testBankQuestions,questionIndicesCovered);
questionIndicesCoveredNOTtest=setdiff(questionIndicesCovered,questionIndicesCoveredTEST);
questionIndicesCoveredTEST=questionIndicesCoveredTEST(randperm(length(questionIndicesCoveredTEST)));
questionIndicesCoveredNOTtest=questionIndicesCoveredNOTtest(randperm(length(questionIndicesCoveredNOTtest)));

if rand < 0.75
    if isempty(questionIndicesCoveredNOTtest)
        nTestQ=min(length(questionIndicesCoveredTEST),N);
        nNOTtestQ=0;
    else
        nTestQ=ceil((40+randi(20,1))/100*N);
        nTestQ=min(length(questionIndicesCoveredTEST),nTestQ);
        nNOTtestQ=min(length(questionIndicesCoveredNOTtest),N-nTestQ);
    end
    N=nTestQ+nNOTtestQ;
    is_testQ=zeros(N,1);
    is_testQ(end-nTestQ+1:end)=1;
else
    nNOTtestQ=min(N,length(questionIndicesCoveredNOTtest));
    if nNOTtestQ==0
        nTestQ=min(N,length(questionIndicesCoveredTEST));
        N=nTestQ;
        is_testQ=ones(N,1);
    else
        nTestQ=0;
        N=nNOTtestQ;
        is_testQ=zeros(N,1);
    end
end

question_textid=[questionModelMap.question_textid(questionIndicesCoveredNOTtest(1:nNOTtestQ));...
                 questionModelMap.question_textid(questionIndicesCoveredTEST(1:nTestQ))];

nC=round(0.5*N);
maxCother=ceil(0.45*N);
Cother=randi(maxCother,1);
nC=nC+Cother;
correctness=[ones(nC,1); zeros(N-nC,1)];
correctness=correctness(randperm(N));

lrv.batchHistory=table(question_textid,correctness,is_testQ);
lrv.correctnessChanged=0;
lrv.runtimeVarsExist=1;
lrv.startNewDataSetWithBatch=0;
lrv.goToReportingAfterBatch=0;
save(lrv_fn,'lrv')
end




