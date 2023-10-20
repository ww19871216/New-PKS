function correctness=displayQuestionInfoAndGetStudentAnswer

global questionModelMap modelParameters KPcontentMap

global grv lrv grv_fn lrv_fn

question_index=grv.studentHistory.question_index(end);
dataSetNumber=grv.studentHistory.dataSetNumber(end);
PKSbeforeQ=grv.studentHistory.PKSbeforeQ(end);
SAsTestALLstream=grv.modelHistory.SAsBeforeQ_TESTraw;
studentQuestionN=grv.studentHistory.studentQuestionN(end);

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
            weightsText=[weightsText num2str(round(questionWeights(i),2)) ' '];
            abilitiesText=[abilitiesText num2str(round(SAsTestALLstream(i),2)) ' '];
            abilitiesTextL=[abilitiesTextL num2str(round(SAsTestForQlesson(i),2)) ' '];
        else
            weightsText=[weightsText num2str(round(questionWeights(i),2))];
            abilitiesText=[abilitiesText num2str(round(SAsTestALLstream(i),2))];
            abilitiesTextL=[abilitiesTextL num2str(round(SAsTestForQlesson(i),2))];
        end
    end
    disp(' ')


    disp(['StudentQ_N: ' num2str(studentQuestionN) '   TestQ_N: ' num2str(lrv.testQuestionN) ...
          '   Question: ' char(question_textid) '   KP: ' char(KP_textid) '   Lesson: ' char(L3_textid) ])
    disp(['QuestionCenterPKS=' num2str(questionCenterPKS) '  CurrentQuestionPKS=' num2str(PKSbeforeQ) ...
          '  CurrentMeanPKSallQuestions=' num2str(round(lrv.meanPKSallQuestions,4))])
    disp(['questionWeights=[' weightsText ']  currentSAsTestALL=[' abilitiesText ']  currentSAsTestQlesson=[' abilitiesTextL ']' ])
else  % display all information about each random questions in initial test
    disp(' ')
    disp('*****This Question is Not Used In The Model!!!*****')
    disp(['StudentQ_N: ' num2str(studentQuestionN) '   TestQ_N:' num2str(lrv.testQuestionN) '   Question: ' char(question_textid)])
    disp(['CurrentQuestionPKS=' num2str(round(PKSbeforeQ,3)) '  CurrentMeanPKSallQuestions=' num2str(round(lrv.meanPKSallQuestions,3))])
end
disp(' ')
% get answers for each questions
if lrv.testQuestionN==1
    correctness=getUserAnswerForNumericOptions([0 1 'd'],'Student Answer? [0 incorrect, 1 correct, d IDontKnow] ');
else
    correctness=getUserAnswerForNumericOptions([0 1 'd' 'c'],'Student Answer? [0 incorrect, 1 correct, d IDontKnow, c changePreviousAnswer] ');
end
if correctness=='d'
    correctness=-1;
end

% change previous questions answer
if correctness=='c'
    pos=find(grv.studentHistory.product_area==(grv.product_area));
    pos2=find(grv.studentHistory.areaPos(pos)==1);
    posToUse=pos(pos2(end)):pos(end);
    question='You have chosen to change the answer to one of your previous questions.';
    disp(' ')
    questionsToChange=getUserAnswerForIndexQuestion(length(posToUse)-1,question,0);
    newCorrectnessAll=grv.studentHistory(posToUse,:).correctness(1:end-1);
    newCorrectnessChangedAll=grv.studentHistory(posToUse,:).correctnessChanged(1:end-1);
    newIsIDontKnowAll=grv.studentHistory(posToUse,:).is_IDontKnow(1:end-1);
    for h=1:length(questionsToChange)
        newCorrectness=changeStudentAnswers(questionsToChange(h),grv.studentHistory(posToUse,:));
        if newCorrectness==-1
            newCorrectness=0;
            newIsIDontKnowAll(questionsToChange(h))=1;
        elseif newIsIDontKnowAll(questionsToChange(h))==1 && newCorrectness~=-1
            newIsIDontKnowAll(questionsToChange(h))=0;
        end
        newCorrectnessAll(questionsToChange(h))=newCorrectness;
    end
    grv.studentHistory(posToUse,:).is_IDontKnow(1:end-1)=newIsIDontKnowAll;
    
    if lrv.correctnessChanged==1
        pos=find(newCorrectnessAll~=grv.studentHistory(posToUse,:).correctness(1:end-1));
        newCorrectnessChangedAll(pos)=double(logical(newCorrectnessChangedAll(pos)-1));
        
        grv.studentHistory(posToUse,:).correctness(1:end-1)=newCorrectnessAll;
        grv.studentHistory(posToUse,:).correctnessChanged(1:end-1)=newCorrectnessChangedAll;
        %{
        if ~isempty(pos)
            save(grv_fn,'grv')
            save(lrv_fn,'lrv')
        end
        %}
    end
    save(grv_fn,'grv')
    save(lrv_fn,'lrv')
    correctness=displayQuestionInfoAndGetStudentAnswer;
end
end

