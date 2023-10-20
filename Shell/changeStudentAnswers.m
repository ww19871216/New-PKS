function newCorrectness=changeStudentAnswers(questionsToChange,sh_filtered)

global questionModelMap modelParameters KPcontentMap

global grv lrv

origCorrectness=sh_filtered.correctness(questionsToChange);

question_index=sh_filtered.question_index(questionsToChange);
dataSetNumber=sh_filtered.dataSetNumber(questionsToChange);
PKSbeforeQ=sh_filtered.PKSbeforeQ(questionsToChange);
SAsTestALLstream=grv.modelHistory.SAsBeforeQ_TESTraw;
studentQuestionN=sh_filtered.studentQuestionN(questionsToChange);

question_textid=questionModelMap.question_textid(question_index);
if iscell(question_textid)==0
    question_textid=cellstr(num2str(question_textid));
end
if dataSetNumber > 0  % display all information about each test questions in initial test
    KP_textid=KPcontentMap.KP_textid(questionModelMap.KP_index(question_index));
    L3_textid=KPcontentMap.L3_textid(questionModelMap.KP_index(question_index));
    SAsTestForQlesson=grv.modelHistory.SAsBeforeQ_LessonTESTraw{KPcontentMap.L3_index(questionModelMap.KP_index(question_index))};
    questionWeights=questionModelMap.weights(question_index,:);
    questionCenterPKS=normcdfParallel(questionModelMap.centerValue(question_index)...
                                  +questionModelMap.iqta(question_index)+modelParameters(11));
    questionCenterPKS=round(questionCenterPKS,4);

    weightsText=[];
    abilitiesText=[];
    abilitiesTextL=[];
    for i=1:length(questionWeights)
        if i < length(questionWeights)
            weightsText=[weightsText num2str(round(questionWeights(i),3)) ' '];
            abilitiesText=[abilitiesText num2str(round(SAsTestALLstream(i),3)) ' '];
            abilitiesTextL=[abilitiesTextL num2str(round(SAsTestForQlesson(i),3)) ' '];
        else
            weightsText=[weightsText num2str(round(questionWeights(i),3))];
            abilitiesText=[abilitiesText num2str(round(SAsTestALLstream(i),3))];
            abilitiesTextL=[abilitiesTextL num2str(round(SAsTestForQlesson(i),3))];
        end
    end
    disp(' ')

    disp(['StudentQ_N: ' num2str(studentQuestionN) '   TestQ_N: ' num2str(questionsToChange) ...
          '   Question: ' char(question_textid) '   KP: ' char(KP_textid) '   Lesson: ' char(L3_textid) ])
    disp(['QuestionCenterPKS=' num2str(questionCenterPKS) '  CurrentQuestionPKS=' num2str(PKSbeforeQ) ...
          '  CurrentMeanPKSallQuestions=' num2str(round(lrv.meanPKSallQuestions,4))])
    disp(['questionWeights=[' weightsText ']  currentSAsTestALL=[' abilitiesText ']  currentSAsTestQlesson=[' abilitiesTextL ']' ])
else  % display all information about each random questions in initial test
    disp(' ')
    disp('*****This Question is Not Used In The Model!!!*****')
    disp(['StudentQ_N: ' num2str(studentQuestionN) '   TestQ_N:' num2str(questionsToChange) '   Question: ' char(question_textid)])
    disp(['CurrentQuestionPKS=' num2str(round(PKSbeforeQ,4)) '  CurrentMeanPKSallQuestions=' num2str(round(lrv.meanPKSallQuestions,4))])
end
disp(' ')
% get answers for each questions
newCorrectness=getUserAnswerForNumericOptions([0 1 'd'],'Student Answer? [0 incorrect, 1 correct, d IDontKnow] ');
if (lrv.correctnessChanged==0) && (newCorrectness ~= origCorrectness)
    lrv.correctnessChanged=1;
end
if newCorrectness=='d'
    newCorrectness=-1;
end
        
end

