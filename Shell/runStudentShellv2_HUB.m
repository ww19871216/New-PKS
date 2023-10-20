clear all

global KPcontentMap questionModelMap adaptiveTestParameters initialAdaptiveTestSettings ...
       masteryCutoffs modelParameters nChannels outsideQuestionsToTest contentLevelsTerminology...
       finalExamQuestions PKSserviceVersion grv_fn lrv_fn grv lrv

pathsep = getPathSeparator;
keyPaths = getAllKeyPaths_HUB;
product = getProductForSimulation_HUB;
[student_id,class_id] = getStudentAndClassIds;


[KPcontentMap,questionModelMap,adaptiveTestParameters,initialAdaptiveTestSettings,masteryCutoffs,...
 modelParameters,nChannels,outsideQuestionsToTest,finalExamQuestions,PKSserviceVersion,contentLevelsTerminology]=downloadModelVariables_HUB(product);

[grv_fn,lrv_fn,grv,lrv]=initializeStudentIfNewAndGetStudentDetails_HUB(product,student_id,class_id,PKSserviceVersion);

[product_area,areaPos,abandonAndRestartTest,question_textid,correctness,nextQuestionId]=getAdaptiveState;

loggedOut=0;
while loggedOut==0
    if ismember(grv.product_area,[1 3 5 13 15 17 27 29])
        getKPsCoveredByTest
        takeAdaptiveTestOnAllOrPartOfProduct_BUFFERED
    end

    if grv.product_area==7
        getBatchHistoryForStudent
        updatePKSsystemWithQuestionBatch
    end

    if grv.product_area==9
        getFinalExamHistoryForStudent
        updatePKSsystemWithQuestionBatch
    end

    if ismember(grv.product_area,[2 4 6 8 10 14 16 18 28 30 32 34])
        getKnowledgeReportImmediatelyAfterEvent
    end

    if ismember(grv.product_area,[11 12])
        getEventIndexToReport
        getKnowledgeReportFromStudentHistory('ELO')
    end
        
    %If grv.product_area==19,21,23 --> select KP (using various methods) and have student learn it 
    if ismember(grv.product_area,[19 21 23])
        selectAndLearnKP
    end

    %If grv.product_area==25 --> practice 4 questions from different KPs for mixed practice
    if grv.product_area==25
        mixedPracticeLearning
    end

    %If grv.product_area==31 --> initial test on entire set of testBankQuestions, model selection off.
    if grv.product_area==31
        getKPsCoveredByTest
        takeTestOnTestBankQuestionsInSequence
    end

    %If grv.product_area==33 --> initial test on first 23 testBankQuestions, model selection on.
    if grv.product_area==33
        getKPsCoveredByTest
        takeTestOnTestBankQuestionsInSequence
    end
    
    if grv.product_area==51
        if grv.areaPos==0
            getAllKnowledgeHistoriesForClass_HUB(class_id,product);
        end
        displayStudentHistories
    end


    %If grv.product_area==100 --> Enter the AI Adaptive Learning System
    if grv.product_area==100
        getNextAdaptiveLearningArea
    end

    %If grv.product_area==1000--> This is where the product_area is chosen or log out
    if grv.product_area==1000
        loggedOut=getNextProductArea;
    end
end


%Not For Implementation Python
question='Do you want to (1) download the session history to check it in the Computation Shell, or (2) skip it?';
maxIndexAnswer=2;
answer=getUserAnswerForIndexQuestion(maxIndexAnswer,question);
if answer==1
    sht=grv.studentHistory;
    sht.correctPKSbeforeQ=sht.PKSbeforeQ;
    sht.PKScomputed1behind=zeros(size(sht.correctPKSbeforeQ));
    pos=find(ismember(table2array(grv.studentReportHistory(:, 3)), [1,3,5 7 9]));
    pos=pos(1:2:end);
    for i=1:length(pos)
        if i==1
            correctnessChanged_shrp=table2array(sht(1:table2array(grv.studentReportHistory(pos(i),1)),10)); 
            dataSetNumber=table2array(sht(1:table2array(grv.studentReportHistory(pos(i),1)),6));
            pos1=find(dataSetNumber>0);
            correctnessChanged=table2array(sht(pos1,10));
            if all(correctnessChanged_shrp(:)~=1) || all(correctnessChanged(:)~=1)
                sht.PKScomputed1behind(1:table2array(grv.studentReportHistory(pos(i),1)))=1;          
           end
        else
            correctnessChanged_shrp=table2array(sht(table2array(grv.studentReportHistory(pos(i-1),1))+1:table2array(grv.studentReportHistory(pos(i),1)),10));
            dataSetNumber=table2array(sht(table2array(grv.studentReportHistory(pos(i-1),1))+1:table2array(grv.studentReportHistory(pos(i),1)),6));
            pos1=find(dataSetNumber>0);
            correctnessChanged=table2array(sht(table2array(grv.studentReportHistory(pos(i-1),1))+1:table2array(grv.studentReportHistory(pos(i),1)),10));
            correctnessChanged=correctnessChanged(pos1);
            if (all(correctnessChanged_shrp(:)~=1) || all(correctnessChanged(:)~=1)) && ismember(table2array(grv.studentReportHistory(pos(i), 3)), [1,3,5])
                sht.PKScomputed1behind(table2array(grv.studentReportHistory(pos(i-1),1))+1:table2array(grv.studentReportHistory(pos(i),1)))=1;           
             end
        end
    end

    sht.startPKS1behind=zeros(size(sht.correctPKSbeforeQ));
    temp=grv.studentReportHistory(1:2:end,[1 3 4]);
    for i=1:length(temp.product_area)
        if i==1
            pos=1:temp.studentQuestionN(i);
        else
            pos=temp.studentQuestionN(i-1)+1:temp.studentQuestionN(i);
        end
        dataSetNumber=table2array(sht(pos,6));
        pos2=find(dataSetNumber>0);
        correctnessChanged=table2array(sht(pos(pos2),10));
        if (ismember(temp.product_area(i),[1 3 5])) && ((temp.correctnessChanged(i)==0) || (all(correctnessChanged(:)~=1)))
            if i==1
                sht.startPKS1behind(1)=1;
            else
                sht.startPKS1behind(temp.studentQuestionN(i-1)+1)=1;
            end
        end
    end

    implementationFilesLocation=[keyPaths.implementationFilesFolder product pathsep];

    filename=[implementationFilesLocation 'PKSserviceVersion_' product '.csv'];
    versionInfo=readtable(filename);
    KCversion=['KCv' num2str(versionInfo.adaptiveKCversion)];
    computationShellFileKey=versionInfo.productKey{1};
    writetable(sht,['ADAPTIVEstudentHistory_' product '_' KCversion '_' computationShellFileKey '.csv']);
    
    disp(' ')
    question='Do you want to (1) send the session history to Computation Shell to check it, or (2) skip it?';
    maxIndexAnswer=2;
    answer=getUserAnswerForIndexQuestion(maxIndexAnswer,question);
    
    adaptiveShellHUBrootLocation=[keyPaths.startPath 'MATLAB\Adaptive Shell HUB'];
    if answer==1
        computationShellFolderLocation=keyPaths.computationShellFolderLocation;
        copyfile([pwd pathsep 'ADAPTIVEstudentHistory_' product '_' KCversion '_' computationShellFileKey '.csv'], [computationShellFolderLocation product '_CS_' KCversion '_' computationShellFileKey]) 
    end

    if strcmp(adaptiveShellHUBrootLocation,pwd)==0
       movefile([pwd pathsep 'ADAPTIVEstudentHistory_' product '_' KCversion '_' computationShellFileKey '.csv'], [adaptiveShellHUBrootLocation '\'])      
    end
    
    %{
    disp(' ')
    question='Do you want to (1) send the session history to Rerun Adaptive Test Shell to check question selection, or (2) skip it?';
    maxIndexAnswer=2;
    answer=getUserAnswerForIndexQuestion(maxIndexAnswer,question);
    
    if answer==1
        rerunAdaptiveTestShellFolderLocation=[startPath 'MATLAB/PKS Model/Implementation/Rerun Adaptive Test Shell/Rerun Students Data/'];
        copyfile([adaptiveShellHUBrootLocation '/ADAPTIVEstudentHistory_' product '_' KCversion '_' computationShellFileKey '.csv'], rerunAdaptiveTestShellFolderLocation)
    end
    %}
    
    
end

disp(' ')
disp('Thank you. Logging you out of the system now.')

