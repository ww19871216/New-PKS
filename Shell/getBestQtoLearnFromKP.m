function QtoLearn = getBestQtoLearnFromKP(KPtoChooseFrom)

global grv masteryCutoffs questionModelMap adaptiveTestParameters

expy=adaptiveTestParameters.expForRepeatKPandQ_M;

question_index=questionModelMap.question_index(questionModelMap.KP_index==KPtoChooseFrom);

questionPKS=grv.questionPKS(question_index);

Qpi=table(question_index,questionPKS);

if grv.questionIndicesSinceLastComprehensiveQuiz==-1
    QsRecentlyLearned=[];
else
    QsRecentlyLearned=grv.questionIndicesSinceLastComprehensiveQuiz ;
    [~,indices]=unique(QsRecentlyLearned,'last');
    indices=sort(indices);
    QsRecentlyLearned=QsRecentlyLearned(indices);
    if length(indices) > 5
        QsRecentlyLearned=QsRecentlyLearned(end-4:end);
    end
end

if ~isempty(QsRecentlyLearned)
    M=0;
    for i=length(QsRecentlyLearned):-1:1
        QalreadyAsked_M(i)=M;
        M=M+0.02;
    end
    QalreadyAsked_M=QalreadyAsked_M.^expy;
end

Qpi.QalreadyAsked_M=ones(size(Qpi.question_index));
for i=1:length(QsRecentlyLearned)
    Qpi.QalreadyAsked_M(Qpi.question_index==QsRecentlyLearned(i))=QalreadyAsked_M(i);
end

lb=masteryCutoffs.someMasteryCutoff;
ub=masteryCutoffs.masteredCutoff;
plateauWeight=0.5;
plateauExp=adaptiveTestParameters.exponentForRampForPKSmetric;
Qpi.Qlearn_M = plateauWeight*activationFunction_0_1plateau(Qpi.questionPKS,lb,ub,plateauExp,0);
Qpi.Qlearn_M(Qpi.questionPKS>=lb & Qpi.questionPKS<=ub)=Qpi.Qlearn_M(Qpi.questionPKS>=lb & Qpi.questionPKS<=ub)...
                                + (1-plateauWeight)/(ub-lb)*(Qpi.questionPKS(Qpi.questionPKS>=lb & Qpi.questionPKS<=ub)-lb);
weightQlearn_M=1;
weightQalreadyAsked_M=1;
Qpi.combinedMetric=weightQalreadyAsked_M*Qpi.QalreadyAsked_M + weightQlearn_M*Qpi.Qlearn_M;
Qpi=sortTableByColumnName(Qpi,{'combinedMetric'},-1)
finalQsToChooseFrom=Qpi.question_index(Qpi.combinedMetric==max(Qpi.combinedMetric))
pos=randi(length(finalQsToChooseFrom));
QtoLearn=finalQsToChooseFrom(pos);

end

