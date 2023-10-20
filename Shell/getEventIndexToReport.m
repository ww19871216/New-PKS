function getEventIndexToReport

global lrv_fn grv lrv

if grv.product_area==11
    lrv.reportIndex=round(size(grv.studentReportHistory,1)/2);
elseif grv.product_area==12
    eventType=cell(33,1);
    eventType{1}='Initial Comprehensive Adaptive Test';
    eventType{3}='Shorter Adaptive Quiz/Test';
    eventType{5}='Comprehensive Adaptive Test with PKS reset';
    eventType{7}='Generic, Non-adaptive Batch of Questions';
    eventType{9}='Non-adaptive Final Exam';
    eventType{13}='Comprehensive Adaptive Test with PKS reset';
    eventType{15}='Shorter Adaptive Quiz/Test';
    eventType{17}='Shorter Adaptive Quiz/Test';
    eventType{27}='Comprehensive Adaptive Test with PKS reset';
    eventType{29}='Shorter Adaptive Quiz/Test';
    eventType{31}='Test With All Test Bank Questions';
    eventType{33}='Test With sequential fixed questions';

    index=(1:round(size(grv.studentReportHistory,1)/2))';
    timeStamp=grv.studentReportHistory.timeStamp(2*index-1);
    event=eventType(grv.studentReportHistory.product_area(2*index-1));
    eventList=table(index,timeStamp,event);
    question='Which report index do you want to see?';
    disp(' ')
    disp('Below are the student events recorded so far. You must select one to see.')
    eventList
    lrv.reportIndex=getUserAnswerForIndexQuestion(max(index),question,1);
end
lrv.runtimeVarsExist=1;
lrv.resultsProduct=-1;
lrv.resultsModule=-1;
lrv.resultsKP=-1;
save(lrv_fn,'lrv')

end

