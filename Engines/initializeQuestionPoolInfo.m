function [questionPoolInfo, git]=initializeQuestionPoolInfo(testQuestionsRecentlyAsked,KPsRecentlyAsked)


global questionModelMap KPcontentMap adaptiveTestParameters 
global lrv grv

expy=adaptiveTestParameters.expForRepeatKPandQ_M;

contentLevelsAboveKP=sum(contains(KPcontentMap.Properties.VariableNames,'textid'))...
                     - sum(contains(KPcontentMap.Properties.VariableNames,'KP_textid'));
nQuestionsThatCouldBeAsked=length(lrv.questionPoolForTest);

question_index=sort(lrv.questionPoolForTest);
questionPoolInfo=table(question_index);
questionPoolInfo.KP_index=questionModelMap.KP_index(question_index);
questionPoolInfo.deltaMeanZShiftCorrect=questionModelMap.deltaMeanZShiftCorrect(question_index);
questionPoolInfo.deltaMeanZShiftIncorrect=questionModelMap.deltaMeanZShiftIncorrect(question_index);
for i=1:contentLevelsAboveKP
    eval(['questionPoolInfo.L' num2str(i) '_index=KPcontentMap.L' num2str(i) '_index(questionPoolInfo.KP_index);']);
end

questionPoolInfo.currentPKS=grv.questionPKS(question_index);
questionPoolInfo.currentPKS_M=activationFunction_0_1plateau(questionPoolInfo.currentPKS,...
                                             adaptiveTestParameters.x_plateauMinForPKSmetric,...
                                             adaptiveTestParameters.x_plateauMaxForPKSmetric,...
                                             adaptiveTestParameters.exponentForRampForPKSmetric, 0);

questionPoolInfo.KPalreadyAsked_M=ones(nQuestionsThatCouldBeAsked,1);
questionPoolInfo.QalreadyAsked_M=ones(nQuestionsThatCouldBeAsked,1);

if ~isempty(testQuestionsRecentlyAsked)
    M=0;
    for i=length(testQuestionsRecentlyAsked):-1:1
        questionPoolInfo.QalreadyAsked_M(questionPoolInfo.question_index==testQuestionsRecentlyAsked(i))=M;
        if M < 1
            M=M+0.02;
        else
            break
        end
    end
    questionPoolInfo.QalreadyAsked_M(questionPoolInfo.QalreadyAsked_M > 1) = 1;
    questionPoolInfo.QalreadyAsked_M=questionPoolInfo.QalreadyAsked_M.^expy;
end

if ~isempty(KPsRecentlyAsked)
    M=0;
    for i=length(KPsRecentlyAsked):-1:1
        questionPoolInfo.KPalreadyAsked_M(questionPoolInfo.KP_index==KPsRecentlyAsked(i))=M;
        M=M+0.02;
    end
    questionPoolInfo.KPalreadyAsked_M=questionPoolInfo.KPalreadyAsked_M.^expy;
end


questionPoolInfo.meanAbsDeltaZ=questionPoolInfo.currentPKS.*abs(questionPoolInfo.deltaMeanZShiftCorrect)...
                               +(1 - questionPoolInfo.currentPKS).*abs(questionPoolInfo.deltaMeanZShiftIncorrect);
meanAbsDeltaZoverMax=questionPoolInfo.meanAbsDeltaZ./max(questionPoolInfo.meanAbsDeltaZ);

questionPoolInfo.meanAbsDeltaZ_M=activationFunction_0_1plateau(meanAbsDeltaZoverMax,...
                                                       adaptiveTestParameters.x_plateauMinForMADZmetric,...
                                                       adaptiveTestParameters.x_plateauMaxForMADZmetric,...
                                                       adaptiveTestParameters.exponentForRampForMADZmetric, 0);

[~, uniqueKPindices]=unique(questionPoolInfo.KP_index);
totalGroupDistributionMetric=zeros(nQuestionsThatCouldBeAsked,1);
breakNextTime=0;
for i=1:contentLevelsAboveKP+1   
    if i==contentLevelsAboveKP+1
        KPgroupCategorization=questionPoolInfo.KP_index(uniqueKPindices);
        questionGroupCategorization=questionPoolInfo.KP_index;
    else
        eval(['KPgroupCategorization=questionPoolInfo.L' num2str(i) '_index(uniqueKPindices);']);
        eval(['questionGroupCategorization=questionPoolInfo.L' num2str(i) '_index;']);
    end
    if length(unique(KPgroupCategorization)) > 1 || i==contentLevelsAboveKP+1
        t=tabulate(KPgroupCategorization);
        groupID=t(:,1);
        expectedProportionAskedForGroup=t(:,3)./100;
        countForGroup=zeros(size(expectedProportionAskedForGroup));
        actualProportionAskedForGroup=zeros(size(expectedProportionAskedForGroup));
        expectedMinusActual=expectedProportionAskedForGroup-actualProportionAskedForGroup;
        metric=zeros(size(expectedMinusActual));
        gitTemp=table(groupID,expectedProportionAskedForGroup,countForGroup,actualProportionAskedForGroup,expectedMinusActual,metric);
        gitTemp=gitTemp(gitTemp.expectedProportionAskedForGroup > 0,:);
        pos=find(gitTemp.expectedMinusActual > 0);
        if isempty(pos)
            gitTemp.metric=gitTemp.expectedProportionAskedForGroup./max(gitTemp.expectedProportionAskedForGroup);
        else
            if length(gitTemp.groupID) > 2*lrv.testSettings.nQuestionsMaxForTest
                gitTemp.metric(pos)=1;
            else
                gitTemp.metric(pos)=adaptiveTestParameters.keyPointForGroupChoiceMetric...
                                  +(1 - adaptiveTestParameters.keyPointForGroupChoiceMetric)...
                                  *gitTemp.expectedMinusActual(pos)./max(gitTemp.expectedMinusActual);
            end
        end
        pos=find(gitTemp.expectedMinusActual < 0 & gitTemp.expectedMinusActual > -1);
        gitTemp.metric(pos)=adaptiveTestParameters.keyPointForGroupChoiceMetric*(gitTemp.expectedMinusActual(pos)+1);           
        for j=1:length(gitTemp.groupID)
            posForGroup=find(questionGroupCategorization==gitTemp.groupID(j));
            totalGroupDistributionMetric(posForGroup)=totalGroupDistributionMetric(posForGroup)+gitTemp.metric(j);
        end
        
        git(i).table=gitTemp;
        
        if breakNextTime==1
            break
        end
        if length(gitTemp.groupID) > 2*lrv.testSettings.nQuestionsMaxForTest
            breakNextTime=1;
        end
    end
end
questionPoolInfo.groupDist_M=(totalGroupDistributionMetric./max(totalGroupDistributionMetric)).^2;

questionPoolInfo.TOTAL_M= adaptiveTestParameters.weightForCurrentPKS_M*(-2+3*questionPoolInfo.currentPKS_M)...
                          +adaptiveTestParameters.weightForMeanAbsDeltaZ_M*(questionPoolInfo.meanAbsDeltaZ_M)...
                          +adaptiveTestParameters.weightForGroupDist_M*questionPoolInfo.groupDist_M...
                          +adaptiveTestParameters.weightForKPAlreadyAsked_M*(-8+9*questionPoolInfo.KPalreadyAsked_M)...
                          +adaptiveTestParameters.weightForQAlreadyAsked_M*questionPoolInfo.QalreadyAsked_M;

%questionPoolInfo
%{
qpi=questionPoolInfo;
sh=grv.studentHistory;
save('QPIinitial','sh','qpi','questionModelMap')
%}
end

