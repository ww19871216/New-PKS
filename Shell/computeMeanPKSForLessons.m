function meanPKSforLessons=computeMeanPKSForLessons

global KPcontentMap


meanPKSforKPs=computeMeanPKSForKPs;

L3_index=unique(KPcontentMap.L3_index);
meanPKSforLessons=zeros(length(L3_index),1);
for i=1:length(L3_index)
    KPindicesForModule=find(KPcontentMap.L3_index==L3_index(i))';
    masteryKPsPercentage = round(meanPKSforKPs(KPindicesForModule),2);
    meanPKSforLessons(i) = round(mean(masteryKPsPercentage),2);
end

end
