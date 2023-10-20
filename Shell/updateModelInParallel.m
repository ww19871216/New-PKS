function testCompletelyDone=updateModelInParallel

global questionModelMap adaptiveTestParameters masteryCutoffs
global grv lrv

if lrv.testMainDone==0
    if lrv.testQuestionN>1
        lrv.totalQuestionsCorrectForTest=lrv.totalQuestionsCorrectForTest+grv.studentHistory.correctness(end-1);
        [grv.questionPKS,grv.questionPKSlearn,grv.modelHistory] = updatePKSsystemWithNewQuestion(grv.studentHistory(end-1,:),grv.modelHistory);
    end
    lrv.meanPKSallQuestions=mean(grv.questionPKS);

    if lrv.testQuestionN==lrv.NmaxTest
        lrv.testMainDone=1;
    elseif lrv.testQuestionN>=lrv.NminTest
        PKSforQuestionsCoveredByAdaptiveTest=grv.questionPKS(lrv.questionPoolForTest);
        proportionUncertain=length(find(PKSforQuestionsCoveredByAdaptiveTest >=masteryCutoffs.QuestionMasteryCutoffLowerBound...
                                        & PKSforQuestionsCoveredByAdaptiveTest<=masteryCutoffs.QuestionMasteryCutoffUpperBound))...
                                        /length(lrv.questionPoolForTest);    
        proportionCorrectForTest=lrv.totalQuestionsCorrectForTest / (lrv.testQuestionN-1);
        if proportionCorrectForTest < adaptiveTestParameters.proportionCorrectPerformanceCutoff
            proportionUncertainCutoff=adaptiveTestParameters.proportionUncertainCutoffForLow;
        else
            proportionUncertainCutoff=adaptiveTestParameters.proportionUncertainCutoffForHigh;
        end
        if proportionUncertain < proportionUncertainCutoff || grv.modelHistory.SAsBeforeQ_TESTraw(1) < -4.5
            lrv.testMainDone=1;
        end
    elseif lrv.testQuestionN > 1
        proportionCorrectForTest=lrv.totalQuestionsCorrectForTest / (lrv.testQuestionN-1);
    else
        proportionCorrectForTest=-1;
    end
    if lrv.testMainDone==0
        lrv.testQuestionN=lrv.testQuestionN+1;
        updateQuestionPoolInfo(proportionCorrectForTest)
        question_index=getTestQuestionForStudent(grv.studentHistory.question_index(end));
        studentQuestionN=grv.studentHistory.studentQuestionN(end)+1;
        lrv.testQuestionHistory(lrv.testQuestionN,:)=question_index;  
        question_textid=questionModelMap.question_textid(question_index);
        PKSbeforeQ=round(grv.questionPKS(question_index),4);
        correctness=-1;
        is_testQ=1;
        dataSetNumber=grv.studentHistory.dataSetNumber(end);
        product_area=grv.product_area;
        areaPos=2;
        grv.areaPos=areaPos;
        correctnessChanged=0;
        is_IDontKnow=0;
        currentQhist=table(studentQuestionN,question_index,question_textid,correctness,is_testQ,dataSetNumber,PKSbeforeQ,product_area,areaPos,correctnessChanged,is_IDontKnow); 
        testCompletelyDone=0;
    elseif lrv.testSettings.nRandomQuestionsNotInModel>0
        lrv.EQcount=1;
        dataSetNumber=-1;
        lrv.randomQuestionPoolForTest(ismember(lrv.randomQuestionPoolForTest,lrv.testQuestionHistory))=[];
        lrv.testQuestionN=lrv.testQuestionN + 1;
        PKSbeforeQ=-1;
        studentQuestionN=grv.studentHistory.studentQuestionN(end) + 1;
        index=randi(length(lrv.randomQuestionPoolForTest));
        if lrv.testSettings.questionSelectionFlavor <= 3
            question_index=lrv.randomQuestionPoolForTest(index);
            question_textid=questionModelMap.question_textid(question_index);
            lrv.randomQuestionPoolForTest(index)=[];
        else
            question_index=-1;
            question_textid=lrv.randomQuestionPoolForTest(index);
            lrv.randomQuestionPoolForTest(index)=[];
        end
        correctness=-1;
        is_testQ=1;
        product_area=grv.product_area;
        areaPos=3;
        grv.areaPos=areaPos;
        correctnessChanged=0;
        is_IDontKnow=0;
        currentQhist=table(studentQuestionN,question_index,question_textid,correctness,is_testQ,dataSetNumber,PKSbeforeQ,product_area,areaPos,correctnessChanged,is_IDontKnow);
        testCompletelyDone=0;
    else
        currentQhist=[];
        testCompletelyDone=1;
    end
    
    %End Parallel
    grv.studentHistory=[grv.studentHistory; currentQhist];
else
    if lrv.EQcount==1
        [grv.questionPKS,grv.questionPKSlearn,grv.modelHistory] = updatePKSsystemWithNewQuestion(grv.studentHistory(end-1,:),grv.modelHistory);
        if lrv.testSettings.questionSelectionFlavor <= 3
            lrv.randomQuestionPoolForTest(ismember(lrv.randomQuestionPoolForTest,grv.studentHistory.question_index))=[];
        end
    end

    if lrv.EQcount < lrv.testSettings.nRandomQuestionsNotInModel
        lrv.EQcount=lrv.EQcount+1;
        lrv.testQuestionN=lrv.testQuestionN + 1;
        studentQuestionN=grv.studentHistory.studentQuestionN(end) + 1;
        index=randi(length(lrv.randomQuestionPoolForTest));
        if lrv.testSettings.questionSelectionFlavor <= 3
            question_index=lrv.randomQuestionPoolForTest(index);
            question_textid=questionModelMap.question_textid(question_index);
            lrv.randomQuestionPoolForTest(index)=[];
        else
            question_index=-1;
            question_textid=lrv.randomQuestionPoolForTest(index);
            lrv.randomQuestionPoolForTest(index)=[];
        end
        PKSbeforeQ=-1;
        lrv.meanPKSallQuestions=mean(grv.questionPKS);
        correctness=-1;
        is_testQ=1;
        dataSetNumber=-1;
        areaPos=3;
        grv.areaPos=areaPos;
        product_area=grv.product_area;
        correctnessChanged=0;
        is_IDontKnow=0;
        currentQhist=table(studentQuestionN,question_index,question_textid,correctness,is_testQ,dataSetNumber,PKSbeforeQ,product_area,areaPos,correctnessChanged,is_IDontKnow); 
        testCompletelyDone=0;
    else
        currentQhist=[];
        testCompletelyDone=1;
    end

    %End Parallel
    grv.studentHistory=[grv.studentHistory; currentQhist];

    
end
end

