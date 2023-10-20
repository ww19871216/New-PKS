function eventLessonResults=getEventLessonResults(eventMeanPKSforKPs,eventKPsCoveredVector)

global KPcontentMap

L3_index=unique(KPcontentMap.L3_index);
lessonMeanPKS=zeros(length(L3_index),1);
lessonIsCoveredByEvent=zeros(length(L3_index),1);
for i=1:length(L3_index)
    KPindicesForModule=find(KPcontentMap.L3_index==L3_index(i))';
    masteryKPsRounded = round(eventMeanPKSforKPs(KPindicesForModule),2);
    lessonMeanPKS(i) = mean(masteryKPsRounded);
    lessonIsCoveredByEvent(i) = eventKPsCoveredVector(KPindicesForModule(1));
end
eventLessonResults=table(L3_index,lessonMeanPKS,lessonIsCoveredByEvent);
end
