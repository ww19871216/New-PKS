function KPrecommendToLearn = getRecommendItemToLearn

global KPcontentMap grv masteryCutoffs

[~,index]=unique(KPcontentMap.L3_id);
name=KPcontentMap.L3_textid(index);
index=KPcontentMap.L3_id(index);
lessonList=table(index,name);
question='Select a lesson you want to learn an item from.';
disp(' ')
disp('Below are a list of lessons. Choose a Lesson to start an item learning.')
lessonList
lessonIndicesToChoose=getUserAnswerForIndexQuestion(max(index),question,1);

KPsCoveredByChosenLesson=KPcontentMap.KP_index(ismember(KPcontentMap.L3_id, lessonIndicesToChoose));

PKSforAllKPS=table2array(grv.studentReportHistory(end-1,4:end));
PKSforSelectedKPs=PKSforAllKPS(KPsCoveredByChosenLesson);
if all(PKSforSelectedKPs>=masteryCutoffs.KPmasteryCutoffUpperBound)
    disp('You have mastered all KPs(ELOs) from this lesson you chosen.')
    disp('Will give you the KP(ELO) which has lowest PKS.')
    PKStoChoose=min(PKSforSelectedKPs);
else
    PKStoChoose=max(PKSforSelectedKPs(PKSforSelectedKPs<masteryCutoffs.KPmasteryCutoffUpperBound));   
end
KPrecommendToLearn=find(ismember(PKSforAllKPS, PKStoChoose));
end

