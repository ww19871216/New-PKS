function  updateQuestionPoolInfo(proportionCorrectForTest)

global questionModelMap KPcontentMap adaptiveTestParameters 
global lrv grv

expy=adaptiveTestParameters.expForRepeatKPandQ_M;

shiftDownLimit=-(adaptiveTestParameters.x_plateauMinForPKSmetric - 0.1);
shiftUpLimit=0.9-adaptiveTestParameters.x_plateauMaxForPKSmetric;

PTM=(lrv.testQuestionN-1)/(lrv.NmaxTest-1);
if PTM > 1
    PTM
    disp('******Big Problem******')
    clear expy
end
SPC = proportionCorrectForTest;
if PTM > 0.4 && SPC > 0.77
    PKSwindowShift=-5*(PTM-0.4)*(SPC-0.77);
    PKSwindowShift(PKSwindowShift<shiftDownLimit)= shiftDownLimit;
    NEWlbPKS=adaptiveTestParameters.x_plateauMinForPKSmetric+PKSwindowShift;
    NEWubPKS=adaptiveTestParameters.x_plateauMaxForPKSmetric+0.67*PKSwindowShift;
    %t=table(PTM,SPC,PKSwindowShift,NEWlbPKS,NEWubPKS)
elseif PTM > 0.4 && SPC < 0.45 && SPC >=0
    PKSwindowShift=4*(PTM-0.4)*(0.45-SPC);
    PKSwindowShift(PKSwindowShift>shiftUpLimit)= shiftUpLimit;
    NEWlbPKS=adaptiveTestParameters.x_plateauMinForPKSmetric+0.67*PKSwindowShift;
    NEWubPKS=adaptiveTestParameters.x_plateauMaxForPKSmetric+PKSwindowShift;
    %t=table(PTM,SPC,PKSwindowShift,NEWlbPKS,NEWubPKS)
else
    NEWlbPKS=adaptiveTestParameters.x_plateauMinForPKSmetric;
    NEWubPKS=adaptiveTestParameters.x_plateauMaxForPKSmetric;
end


NEWquestion_index=lrv.testQuestionHistory(end);

contentLevelsAboveKP=sum(contains(KPcontentMap.Properties.VariableNames,'textid'))...
                     - sum(contains(KPcontentMap.Properties.VariableNames,'KP_textid'));

lrv.questionPoolInfo.currentPKS=grv.questionPKS(lrv.questionPoolInfo.question_index);
lrv.questionPoolInfo.currentPKS_M=activationFunction_0_1plateau(lrv.questionPoolInfo.currentPKS,NEWlbPKS,...
                                             NEWubPKS,adaptiveTestParameters.exponentForRampForPKSmetric, 0);

lrv.questionPoolInfo.KPalreadyAsked_M(lrv.questionPoolInfo.KPalreadyAsked_M < 1)...
                =((lrv.questionPoolInfo.KPalreadyAsked_M(lrv.questionPoolInfo.KPalreadyAsked_M < 1)).^(1/expy)+0.02).^expy;      
lrv.questionPoolInfo.KPalreadyAsked_M(lrv.questionPoolInfo.KPalreadyAsked_M > 1) = 1;

lrv.questionPoolInfo.QalreadyAsked_M(lrv.questionPoolInfo.QalreadyAsked_M < 1)...
                =((lrv.questionPoolInfo.QalreadyAsked_M(lrv.questionPoolInfo.QalreadyAsked_M < 1)).^(1/expy)+0.02).^expy;      
lrv.questionPoolInfo.QalreadyAsked_M(lrv.questionPoolInfo.QalreadyAsked_M > 1) = 1;

lrv.questionPoolInfo.KPalreadyAsked_M(lrv.questionPoolInfo.KP_index==questionModelMap.KP_index(NEWquestion_index))=0;
lrv.questionPoolInfo.QalreadyAsked_M(lrv.questionPoolInfo.question_index==NEWquestion_index)=0;

lrv.questionPoolInfo.meanAbsDeltaZ=lrv.questionPoolInfo.currentPKS.*abs(lrv.questionPoolInfo.deltaMeanZShiftCorrect)...
                               +(1 - lrv.questionPoolInfo.currentPKS).*abs(lrv.questionPoolInfo.deltaMeanZShiftIncorrect);
meanAbsDeltaZoverMax=lrv.questionPoolInfo.meanAbsDeltaZ./max(lrv.questionPoolInfo.meanAbsDeltaZ);
lrv.questionPoolInfo.meanAbsDeltaZ_M=activationFunction_0_1plateau(meanAbsDeltaZoverMax,...
                                                       adaptiveTestParameters.x_plateauMinForMADZmetric,...
                                                       adaptiveTestParameters.x_plateauMaxForMADZmetric,...
                                                       adaptiveTestParameters.exponentForRampForMADZmetric, 0);
                                                   
[~, uniqueKPindices]=unique(lrv.questionPoolInfo.KP_index);
totalGroupDistributionMetric=zeros(size(lrv.questionPoolInfo.KP_index));
breakNextTime=0;
for i=1:contentLevelsAboveKP+1   

    if i==contentLevelsAboveKP+1
        KPgroupCategorization=lrv.questionPoolInfo.KP_index(uniqueKPindices);
        questionGroupCategorization=lrv.questionPoolInfo.KP_index;
    else
        eval(['KPgroupCategorization=lrv.questionPoolInfo.L' num2str(i) '_index(uniqueKPindices);']);
        eval(['questionGroupCategorization=lrv.questionPoolInfo.L' num2str(i) '_index;']);
    end
    if length(unique(KPgroupCategorization)) > 1 || i==contentLevelsAboveKP+1
        pos=find(lrv.questionPoolInfo.question_index==NEWquestion_index);
        g=questionGroupCategorization(pos);
        pos=find(lrv.git(i).table.groupID==g);
        lrv.git(i).table.countForGroup(pos)=lrv.git(i).table.countForGroup(pos)+1;
        lrv.git(i).table.actualProportionAskedForGroup=lrv.git(i).table.countForGroup./sum(lrv.git(i).table.countForGroup);
        lrv.git(i).table.expectedMinusActual=lrv.git(i).table.expectedProportionAskedForGroup...
                                         - lrv.git(i).table.actualProportionAskedForGroup;
        pos=find(lrv.git(i).table.expectedMinusActual > 0);
        if isempty(pos)
            lrv.git(i).table.metric=lrv.git(i).table.expectedProportionAskedForGroup./max(lrv.git(i).table.expectedProportionAskedForGroup);
        else
            if length(lrv.git(i).table.groupID) > 2*lrv.testSettings.nQuestionsMaxForTest
                lrv.git(i).table.metric(pos)=1;
            else
                lrv.git(i).table.metric(pos)=adaptiveTestParameters.keyPointForGroupChoiceMetric...
                                         +(1 - adaptiveTestParameters.keyPointForGroupChoiceMetric)...
                                         *lrv.git(i).table.expectedMinusActual(pos)./max(lrv.git(i).table.expectedMinusActual);
            end
        end
        pos=find(lrv.git(i).table.expectedMinusActual < 0 & lrv.git(i).table.expectedMinusActual > -1);
        lrv.git(i).table.metric(pos)=adaptiveTestParameters.keyPointForGroupChoiceMetric*(lrv.git(i).table.expectedMinusActual(pos)+1);
        for j=1:length(lrv.git(i).table.groupID)
            posForGroup=find(questionGroupCategorization==lrv.git(i).table.groupID(j));
            totalGroupDistributionMetric(posForGroup)=totalGroupDistributionMetric(posForGroup)+lrv.git(i).table.metric(j);
        end
        if breakNextTime==1
            break
        end
        if length(lrv.git(i).table.groupID) > 2*lrv.testSettings.nQuestionsMaxForTest
            breakNextTime=1;
        end
    end
end   
lrv.questionPoolInfo.groupDist_M=(totalGroupDistributionMetric./max(totalGroupDistributionMetric)).^2;

lrv.questionPoolInfo.TOTAL_M= adaptiveTestParameters.weightForCurrentPKS_M*(-2+3*lrv.questionPoolInfo.currentPKS_M)...
                          +adaptiveTestParameters.weightForMeanAbsDeltaZ_M*(lrv.questionPoolInfo.meanAbsDeltaZ_M)...
                          +adaptiveTestParameters.weightForGroupDist_M*lrv.questionPoolInfo.groupDist_M...
                          +adaptiveTestParameters.weightForKPAlreadyAsked_M*(-8+9*lrv.questionPoolInfo.KPalreadyAsked_M)...
                          +adaptiveTestParameters.weightForQAlreadyAsked_M*lrv.questionPoolInfo.QalreadyAsked_M;
%{
qpi=lrv.questionPoolInfo;
sh=grv.studentHistory;
save('QPI','sh','qpi','questionModelMap')
%}
end
