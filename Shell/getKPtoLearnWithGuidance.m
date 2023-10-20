function KPchosen = getKPtoLearnWithGuidance(meanPKSforKPs)

global KPcontentMap masteryCutoffs

recommendations=cell(4,1);
recommendations(1)={'Probably Too Difficult'};
recommendations(2)={'Maybe Too Difficult But Maybe Okay to Learn'};
recommendations(3)={'Probably GOOD to Learn'};
recommendations(4)={'Probably Too Easy But Maybe Good To Review'};
recommendations(5)={'Probably Too Easy'};

name=KPcontentMap.KP_textid;
index=KPcontentMap.KP_index;
currentMasteryLevel=meanPKSforKPs;
guidance=cell(size(index));

guidance(currentMasteryLevel >= masteryCutoffs.masteredPlusCutoff)=recommendations(5);
guidance(currentMasteryLevel < masteryCutoffs.masteredPlusCutoff & currentMasteryLevel >= masteryCutoffs.masteredCutoff)=recommendations(4);
guidance(currentMasteryLevel < masteryCutoffs.masteredCutoff & currentMasteryLevel >= masteryCutoffs.almostMasteredCutoff)=recommendations(3);
guidance(currentMasteryLevel < masteryCutoffs.almostMasteredCutoff & currentMasteryLevel >= masteryCutoffs.someMasteryCutoff)=recommendations(2);
guidance(currentMasteryLevel < masteryCutoffs.someMasteryCutoff)=recommendations(1);

KPinfoTable=table(index, name, currentMasteryLevel, guidance);
KPinfoTable=sortrows(KPinfoTable,-3);
question='Select the index of the KP you wish to practice now..';
disp(' ')
disp('Below is a list of all KPs in the course. The current mastery level is also shown,')
disp('and the AI also gives some guidance as to whether the KP is good to learn now.') 
KPinfoTable
KPchosen=getUserAnswerForIndexQuestion(max(index),question,1);

end

