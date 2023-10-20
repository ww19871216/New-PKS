function getKPsCoveredByTest

global KPcontentMap questionModelMap grv_fn grv

                                          
if grv.studentReportHistory.product_area(end) < 0 || grv.studentReportHistory.studentQuestionN(end) ~= -1
    if ismember(grv.product_area,[1 5 13 15 27 31 33])
        KPsCoveredByTest=KPcontentMap.KP_index';
    elseif ismember(grv.product_area,[3 29])
        [~,index]=unique(KPcontentMap.L3_index);
        name=KPcontentMap.L3_textid(index);
        index=KPcontentMap.L3_index(index);
        moduleList=table(index,name);
        question='Select all modules you want the adaptive test to cover.';
        disp(' ')
        disp('Below are a list of modules. Choose the ones you want the adaptive test to cover.')
        moduleList
        lessonIndicesCovered=getUserAnswerForIndexQuestion(max(index),question,1);
        KPsCoveredByTest=KPcontentMap.KP_index(ismember(KPcontentMap.L3_index,lessonIndicesCovered))';
    elseif grv.product_area==17
        KPsCoveredByTest=unique(questionModelMap.KP_index(grv.questionsSinceLastComprehensiveQuiz));
        grv.questionIndicesSinceLastLocalQuiz=-1;
    end 

    if grv.studentReportHistory.product_area(end-1)==-1 %first Lines
        KPsCovered0_1=zeros(1, size(KPcontentMap,1));
        KPsCovered0_1(KPsCoveredByTest)=1;
        grv.studentReportHistory(end,5:end)=num2cell(KPsCovered0_1);
        grv.studentReportHistory.product_area(end-1:end)=grv.product_area;
    elseif grv.studentReportHistory.studentQuestionN(end-1)~=-1 %we have had previous incidents add new rows
        newStudentReportHistory=initializeStudentReportHistory;
        grv.studentReportHistory=[grv.studentReportHistory; newStudentReportHistory];
        KPsCovered0_1=zeros(1, size(KPcontentMap,1));
        KPsCovered0_1(KPsCoveredByTest)=1;
        grv.studentReportHistory(end,5:end)=num2cell(KPsCovered0_1);
        grv.studentReportHistory.product_area(end-1:end)=grv.product_area;
    end
    save(grv_fn,'grv')
end



end

