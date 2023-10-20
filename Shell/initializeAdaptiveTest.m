function initializeAdaptiveTest

global questionModelMap initialAdaptiveTestSettings KPcontentMap
global grv_fn lrv_fn grv lrv

if lrv.runtimeVarsExist==0
    abandonAndRestartTest=0;
else 
    abandonAndRestartTest=lrv.abandonAndRestartTest;
    if abandonAndRestartTest==1
        abandonAndHideIncompleteAdaptiveTest;
    end  
end


%Parallel Part A
areaPosOrig=grv.areaPos;
if areaPosOrig==0
    lrv.KPsCoveredByTest=find(cell2mat(table2cell(grv.studentReportHistory(end,5:end)))==1);
    lrv.runtimeVarsExist=1;
    lrv.abandonAndRestartTest=0;
    lrv.correctnessChanged=0;
    lrv.is_IDontKnow=0;
    if ismember(grv.product_area,[1 5 13 27]) %Comprehensive Test with dataSetNumber Reset
        lrv.testSettings=initialAdaptiveTestSettings;
    elseif ismember(grv.product_area,[3 15 17 29]) %Short Adaptive Test same dataSetNumber
        lrv.testSettings=initialAdaptiveTestSettings;
        lrv.testSettings.startNewDataSetWithTest=0;
        [nqm,nr]= getMaxAdaptiveTestLength(length(lrv.KPsCoveredByTest),size(KPcontentMap,1),...
                                           initialAdaptiveTestSettings.nQuestionsMaxForTest,2);
        lrv.testSettings.nQuestionsMaxForTest=nqm;
        lrv.testSettings.nRandomQuestionsNotInModel=nr;
    elseif ismember(grv.product_area,31) %All Question Test
        lrv.testSettings=initialAdaptiveTestSettings;
        lrv.testSettings.startNewDataSetWithTest=1;
        lrv.testSettings.nQuestionsMaxForTest =length(questionModelMap.question_index(questionModelMap.inTestBank==1));
        lrv.testSettings.nRandomQuestionsNotInModel=0;
    elseif ismember(grv.product_area,33) %All Question Test
        lrv.testSettings=initialAdaptiveTestSettings;
        lrv.testSettings.startNewDataSetWithTest=1;
        [nqm,nr]= getMaxAdaptiveTestLength(length(lrv.KPsCoveredByTest),size(KPcontentMap,1),...
                                           initialAdaptiveTestSettings.nQuestionsMaxForTest,1);

        lrv.testSettings.nQuestionsMaxForTest =nqm+nr;
        lrv.testSettings.nRandomQuestionsNotInModel=0;
    end
    if isempty(grv.studentHistory)
        testQuestionsRecentlyAsked=[];
        KPsRecentlyAsked=[];
    else
        wholeHistoryBuffer=50;
          
        pos=find(questionModelMap.inTestBank(grv.studentHistory.question_index)==1);
        
        posEQ=find(grv.studentHistory.dataSetNumber==-1);
        EQids=grv.studentHistory.question_textid(posEQ);
        nEQids=length(EQids);
        EQisTestQ=zeros(nEQids,1);
        for i=1:nEQids
            indy=ismember(questionModelMap.question_textid,EQids(i));
            if ~isempty(indy)
                EQisTestQ(i)=questionModelMap.inTestBank(indy);
            end
        end
        posToKill=posEQ(EQisTestQ==0);
        pos(ismember(pos,posToKill))=[];
        if length(pos) > wholeHistoryBuffer
            testQuestionsSoFar=grv.studentHistory.question_index(pos);
            lessonsForTestQuestionsSoFar=KPcontentMap.L3_index(questionModelMap.KP_index(testQuestionsSoFar));
            uLessons=unique(lessonsForTestQuestionsSoFar);
            nLessons=length(uLessons);
            pos2=zeros(nLessons,1);
            for i=1:nLessons
                t=find(lessonsForTestQuestionsSoFar==uLessons(i));
                pos2(i)=pos(t(end));
            end
            pos3=setdiff(pos,pos2);
            nn=wholeHistoryBuffer-nLessons;
            pos=unique([pos3(end-nn+1:end); pos2]);
        end
        testQuestionsRecentlyAsked=grv.studentHistory.question_index(pos); 
        KPsh=questionModelMap.KP_index(grv.studentHistory.question_index);
        [~,indy]=unique(KPsh,'last');
        indy=sort(indy);
        if length(indy) > 5
            indy = indy(end-4:end);
        end
        KPsRecentlyAsked=KPsh(indy);
        KPsRecentlyAsked(ismember(KPsRecentlyAsked,lrv.KPsCoveredByTest)==0)=[];
        
    end
                
            
    [lrv.questionPoolForTest,lrv.randomQuestionPoolForTest,testQuestionsRecentlyAsked]...
         =getQuestionInfoForTest(lrv.testSettings,lrv.KPsCoveredByTest,testQuestionsRecentlyAsked);

    if isempty(grv.studentHistory)
        studentQuestionN=0;
        dataSetNumber=1;
    elseif lrv.testSettings.startNewDataSetWithTest==1
        [grv.questionPKS,grv.questionPKSlearn,grv.modelHistory] = initializePKSsystem;
        dataSetNumber=max(grv.studentHistory.dataSetNumber) + 1;
        studentQuestionN=max(grv.studentHistory.studentQuestionN);
    else
        dataSetNumber=max(grv.studentHistory.dataSetNumber);
        studentQuestionN=max(grv.studentHistory.studentQuestionN);
    end
    lrv.modelHistoryTemp=grv.modelHistory;
    lrv.questionPKSTemp=grv.questionPKS;
    lrv.questionPKSlearnTemp=grv.questionPKSlearn;

    %Set the Nmax and Nmin for number of questions the student can get in the test.
    lrv.NmaxTest=lrv.testSettings.nQuestionsMaxForTest;
    if ismember(grv.product_area,[31,33])
        lrv.NminTest=lrv.NmaxTest;
    else
        lrv.NminTest=ceil(0.42*lrv.NmaxTest);
    end

    [lrv.questionPoolInfo,lrv.git]=initializeQuestionPoolInfo(testQuestionsRecentlyAsked,KPsRecentlyAsked);
    lrv.testQuestionN=1;
    nextQuestion=getTestQuestionForStudent(0);
    if ismember(grv.product_area,[31,33])
        questionTestBankALL=questionModelMap.question_index(questionModelMap.inTestBank==1);
        nextQuestion=questionTestBankALL(lrv.testQuestionN);        
    end
    studentQuestionN=studentQuestionN+1;
    question_index=nextQuestion;
    question_textid=questionModelMap.question_textid(question_index);
    PKSbeforeQ=round(grv.questionPKS(question_index),4);
    lrv.meanPKSallQuestions=mean(grv.questionPKS);
    correctness=-1;
    product_area=grv.product_area;
    areaPos=1;
    lrv.testQuestionHistory=nextQuestion;
    lrv.totalQuestionsCorrectForTest=0;
    lrv.testMainDone=0;
    lrv.EQcount=0;
    is_testQ=1;
    correctnessChanged=0;
    is_IDontKnow=0;
    currentQhist=table(studentQuestionN,question_index,question_textid,correctness,is_testQ,...
                       dataSetNumber,PKSbeforeQ,product_area,areaPos,correctnessChanged,is_IDontKnow);
    grv.studentHistory=[grv.studentHistory; currentQhist];
end

%Parallel Part B
showIntroTestPage(abandonAndRestartTest);

%End Parallel
if areaPosOrig==0
    dt=clock;
    dt=getCiscoFormattedTime(dt);
    lrv.testStartTimestamp=dt;
    grv.areaPos=areaPos;
    save(grv_fn,'grv')
    save(lrv_fn,'lrv')
end
end

