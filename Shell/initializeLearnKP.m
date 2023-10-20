function initializeLearnKP

global  KPcontentMap questionModelMap
global grv_fn lrv_fn grv lrv


%Parallel Part A
areaPosOrig=grv.areaPos;
if areaPosOrig==0
    lrv.runtimeVarsExist=1;
    meanPKSforKPs=computeMeanPKSForKPs;
    meanPKSforKPs=round(meanPKSforKPs,2);
    if grv.product_area==19
        KPsToChooseFrom=unique(KPcontentMap.KP_index);
        lrv.KPtoLearn=getBestKPtoLearnForGivenKPs(KPsToChooseFrom,meanPKSforKPs);
    elseif grv.product_area==21
        KPsToChooseFrom=getKPsToChooseFromBestKPtoLearn(meanPKSforKPs);
        lrv.KPtoLearn=getBestKPtoLearnForGivenKPs(KPsToChooseFrom,meanPKSforKPs);
    elseif grv.product_area==23
        lrv.KPtoLearn=getKPtoLearnWithGuidance(meanPKSforKPs);
    end
    lrv.PKSforKP=meanPKSforKPs(lrv.KPtoLearn);
    lrv.QtoLearn=getBestQtoLearnFromKP(lrv.KPtoLearn);
    lrv.KPlearnCount=1;
    
    if grv.questionIndicesSinceLastComprehensiveQuiz==-1
        grv.questionIndicesSinceLastComprehensiveQuiz=lrv.QtoLearn;
        grv.questionIndicesSinceLastLocalQuiz=lrv.QtoLearn;
    elseif grv.questionIndicesSinceLastLocalQuiz==-1
        grv.questionIndicesSinceLastComprehensiveQuiz(end+1)=lrv.QtoLearn;
        grv.questionIndicesSinceLastLocalQuiz=lrv.QtoLearn;
    else
        grv.questionIndicesSinceLastComprehensiveQuiz(end+1)=lrv.QtoLearn;
        grv.questionIndicesSinceLastLocalQuiz(end+1)=lrv.QtoLearn;
    end
    if grv.KPindicesSeenSinceLastComprehensiveQuiz==-1
        grv.KPindicesSeenSinceLastComprehensiveQuiz=lrv.KPtoLearn;
    else
        grv.KPindicesSeenSinceLastComprehensiveQuiz(end+1)=lrv.KPtoLearn;
    end
    dataSetNumber=grv.studentHistory.dataSetNumber(end);
    studentQuestionN=grv.studentHistory.studentQuestionN(end)+1;
    question_index=lrv.QtoLearn;
    question_textid=questionModelMap.question_textid(question_index);
    PKSbeforeQ=round(grv.questionPKS(question_index),4);
    

    correctness=-1;
    product_area=grv.product_area;
    areaPos=1;
    is_testQ=0;
    correctnessChanged=0;
    currentQhist=table(studentQuestionN,question_index,question_textid,correctness,is_testQ,dataSetNumber,PKSbeforeQ,product_area,areaPos,correctnessChanged);
    grv.studentHistory=[grv.studentHistory; currentQhist];
end
        
%Parallel Part B
showIntroLearnKPpage;

%End Parallel
if areaPosOrig==0
    grv.areaPos=areaPos;
    save(grv_fn,'grv')
    save(lrv_fn,'lrv')
end
end

