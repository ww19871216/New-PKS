function KPtoLearn = getBestKPtoLearnForGivenKPs(KPsToChooseFrom,meanPKSforKPs)

global grv masteryCutoffs adaptiveTestParameters


expLearn=5;
expy=adaptiveTestParameters.expForRepeatKPandQ_M;

KP_index=KPsToChooseFrom(:);
meanPKSforKPs=meanPKSforKPs(:);
meanPKSforKPs=meanPKSforKPs(KP_index);

KPpi=table(KP_index,meanPKSforKPs);

if grv.KPindicesSeenSinceLastComprehensiveQuiz==-1
    KPsRecentlyLearned=[];
else
    KPsRecentlyLearned=grv.KPindicesSeenSinceLastComprehensiveQuiz;
    [~,indices]=unique(KPsRecentlyLearned,'last');
    indices=sort(indices);
    KPsRecentlyLearned=KPsRecentlyLearned(indices);
    if length(indices) > 5
        KPsRecentlyLearned=KPsRecentlyLearned(end-4:end);
    end
end

if ~isempty(KPsRecentlyLearned)
    M=0;
    for i=length(KPsRecentlyLearned):-1:1
        KPalreadyAsked_M(i)=M;
        M=M+0.02;
    end
    KPalreadyAsked_M=KPalreadyAsked_M.^expy;
end

KPpi.KPalreadyAsked_M=ones(size(KPpi.KP_index));
for i=1:length(KPsRecentlyLearned)
    if ismember(KPsRecentlyLearned(i),KPpi.KP_index)
        KPpi.KPalreadyAsked_M(KPpi.KP_index==KPsRecentlyLearned(i))=KPalreadyAsked_M(i);
    end
end

selectionFlavor=1;
masteryCutoffForSelection=masteryCutoffs.masteredCutoff;
if all(meanPKSforKPs >= masteryCutoffForSelection)
    masteryCutoffForSelection=masteryCutoffs.masteredPlusCutoff;
    if all(meanPKSforKPs >= masteryCutoffForSelection)
        selectionFlavor=2;
    end
end

if selectionFlavor==1
    KPpi.KPlearn_M=ones(size(KPpi.KP_index));
    KPpi.KPlearn_M(KPpi.meanPKSforKPs >= masteryCutoffForSelection)=0;
    pos=find(KPpi.meanPKSforKPs < masteryCutoffForSelection);
    KPpi.KPlearn_M(pos) = (1 - masteryCutoffForSelection + KPpi.meanPKSforKPs(pos)).^expLearn;
else
    KPpi.KPlearn_M = (1 - KPpi.meanPKSforKPs + masteryCutoffForSelection).^(5*expLearn);
end

weightKPlearn_M=1;
weightKPalreadyAsked_M=1;
KPpi.combinedMetric=weightKPalreadyAsked_M*KPpi.KPalreadyAsked_M + weightKPlearn_M*KPpi.KPlearn_M;
KPpi=sortTableByColumnName(KPpi,{'combinedMetric'},-1)
finalKPsToChooseFrom=KPpi.KP_index(KPpi.combinedMetric==max(KPpi.combinedMetric))
pos=randi(length(finalKPsToChooseFrom));
KPtoLearn=finalKPsToChooseFrom(pos)

end

