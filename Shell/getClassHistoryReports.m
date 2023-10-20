function [chrKP, chrL3]=getClassHistoryReports(classStudentInfo)

global grv KPcontentMap

for i=1:length(classStudentInfo.filename)
    load(classStudentInfo.filename{i});
    srh=grv.studentReportHistory;
    rowN=size(srh,1);
    if rowN > 2 && srh.studentQuestionN(end)==-1
        srh(end-1:end,:)=[];
        rowN=rowN-2;
    elseif rowN == 2 && srh.studentQuestionN(end)==-1
        srh.timeStamp(:)={'No Student Data Yet'};
    end
    student_id=cell(rowN,1);
    student_id(:)=classStudentInfo.student_id(i);
    srh=[table(student_id) srh];
    if i==1
        chrKP=srh;
    else
        chrKP=[chrKP;srh];
    end
end

chrKP=sortrows(chrKP,1);
N=size(chrKP,1);

lessonN=length(unique(KPcontentMap.L3_index));
meanPKSforLessons=zeros(N,lessonN);
meanPKSforKPs=table2array(chrKP(:,6:end));

course_all=round(mean(meanPKSforKPs,2),4);
pos=2:2:size(course_all,1);
classifier=course_all(pos);
classifier(classifier>0.9999)=1;
classifier(classifier>0 & classifier<1)=0;
course_all(pos)=classifier;
for i=1:round(N/2)
    elr=getEventLessonResults(meanPKSforKPs(2*i-1,:),meanPKSforKPs(2*i,:));
    meanPKSforLessons(2*i-1,:)=round(elr.lessonMeanPKS',4);
    meanPKSforLessons(2*i,:)=round(elr.lessonIsCoveredByEvent');
end
chrL3=chrKP(:,1:5);
for j=1:lessonN
    eval(['chrL3.L3_' num2str(j) '=meanPKSforLessons(:,j);'])
end
chrL3.correctnessChanged=[];
chrKP.correctnessChanged=[];

for i=5:size(chrKP,2)
    oldTitle=['KPindex_' num2str(i-4)];
    newTitle=['KP' num2str(i-4) '_L3_' num2str(KPcontentMap.L3_index(i-4))];
    chrKP=changeTableVariableName(chrKP,oldTitle,newTitle);
end


chrL3=[chrL3(:,1:4) table(course_all) chrL3(:,5:end)];
chrKP=[chrKP(:,1:4) table(course_all) chrKP(:,5:end)];

end

