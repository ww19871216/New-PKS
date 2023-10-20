function KPsToChooseFrom = getKPsToChooseFromBestKPtoLearn(meanPKSforKPs)

global KPcontentMap masteryCutoffs

masteredCutoff=masteryCutoffs.masteredCutoff;
almostMasteredCutoff=masteryCutoffs.almostMasteredCutoff;

[~,index]=unique(KPcontentMap.L3_id);
name=KPcontentMap.L3_textid(index);
index=KPcontentMap.L3_id(index);
nKPsMastered=zeros(size(index));
nKPsGoodToLearn=zeros(size(index));
nKPsTooHard=zeros(size(index));
meanPKSforLesson=zeros(size(index));
for i=1:length(index)
    pos=find(KPcontentMap.L3_id==index(i));
    moduleMeanPKSforKPs=meanPKSforKPs(pos);
    meanPKSforLesson(i)=round(mean(moduleMeanPKSforKPs),2);
    nKPsMastered(i)=length(moduleMeanPKSforKPs(moduleMeanPKSforKPs>=masteredCutoff));
    nKPsTooHard(i)=length(moduleMeanPKSforKPs(moduleMeanPKSforKPs< almostMasteredCutoff));
    nKPsGoodToLearn(i)=length(pos)-nKPsMastered(i)-nKPsTooHard(i);
    
end
indicesProbablyGoodForLearning=find(nKPsGoodToLearn > 0);
indicesTooHardOrTooEasy=setdiff(index,indicesProbablyGoodForLearning);
lessonList=table(index,name,meanPKSforLesson,nKPsGoodToLearn,nKPsTooHard,nKPsMastered);
lessonsGoodToLearn=lessonList(indicesProbablyGoodForLearning,:);
lessonsTooHardOrTooEasy=lessonList(indicesTooHardOrTooEasy,:);
question='Select all lesson indices you want the AI to select the KP from.';
disp(' ')
disp('Below are a list of lessons split into those the AI thinks are good to learn now,')
disp('and those that are probably too hard or too easy. Choose the ones you want the AI to select the KP from.')
lessonsGoodToLearn
lessonsTooHardOrTooEasy
lessonIndicesCovered=getUserAnswerForIndexQuestion(max(index),question,1);
KPsToChooseFrom=unique(KPcontentMap.KP_index(ismember(KPcontentMap.L3_id,lessonIndicesCovered)));

end

