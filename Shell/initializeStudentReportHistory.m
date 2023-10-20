function studentReportHistory=initializeStudentReportHistory

global KPcontentMap

studentQuestionN=-1;
studentQuestionN(2,:)=-1;
timeStamp{1}='NA';
timeStamp{2,:}='NA';
product_area=-1;
product_area(2,:)=-1;
correctnessChanged=0;
correctnessChanged(2,:)=0;
tabletext=['t=table(studentQuestionN,timeStamp,product_area,correctnessChanged'];
for i=1:length(KPcontentMap.KP_index)
    eval(['KPindex_' num2str(i) '=-1;'])
    eval(['KPindex_' num2str(i) '(2,:)=-1;'])
    tabletext=[tabletext ',KPindex_' num2str(i)];
end
tabletext=[tabletext ');'];
eval(tabletext)
studentReportHistory=t;

end

