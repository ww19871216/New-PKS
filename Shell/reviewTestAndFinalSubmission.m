function choice=reviewTestAndFinalSubmission

global grv lrv grv_fn lrv_fn

disp(' ')
disp('The test is done. You can make final changes by using entering "c", or you can enter "s" to submit the test.')

choice=getUserAnswerForNumericOptions(['c' 's'],'What is your choice? [c changePreviousAnswer, s submit test] ');

% change previous questions answer
if choice=='c'
    pos=find(grv.studentHistory.product_area==(grv.product_area));
    pos2=find(grv.studentHistory.areaPos(pos)==1);
    posToUse=pos(pos2(end)):pos(end);
    question='You have chosen to change the answer to one of your previous questions.';
    disp(' ')
    questionsToChange=getUserAnswerForIndexQuestion(length(posToUse),question,0);
    newCorrectnessAll=grv.studentHistory(posToUse,:).correctness(1:end);
    newCorrectnessChangedAll=grv.studentHistory(posToUse,:).correctnessChanged(1:end);
    newIsIDontKnowAll=grv.studentHistory(posToUse,:).is_IDontKnow(1:end);
    for h=1:length(questionsToChange)
        newCorrectness=changeStudentAnswers(questionsToChange(h),grv.studentHistory(posToUse,:));
        if newCorrectness== -1
            newCorrectness=0;
            newIsIDontKnowAll(questionsToChange(h))=1;
        elseif newIsIDontKnowAll(questionsToChange(h))==1 && newCorrectness~=-1
            newIsIDontKnowAll(questionsToChange(h))=0;
        end
        newCorrectnessAll(questionsToChange(h))=newCorrectness;
    end
    grv.studentHistory(posToUse,:).is_IDontKnow(1:end)=newIsIDontKnowAll;
    
    if lrv.correctnessChanged==1
        pos=find(newCorrectnessAll~=grv.studentHistory(posToUse,:).correctness(1:end));
        newCorrectnessChangedAll(pos)=double(logical(newCorrectnessChangedAll(pos)-1));
        
        grv.studentHistory(posToUse,:).correctness(1:end)=newCorrectnessAll;
        grv.studentHistory(posToUse,:).correctnessChanged(1:end)=newCorrectnessChangedAll;
        %{
        if ~isempty(pos)
            save(grv_fn,'grv')
            save(lrv_fn,'lrv')
        end
        %}
    end
    save(grv_fn,'grv')
    save(lrv_fn,'lrv')
    choice=reviewTestAndFinalSubmission;
end

end

