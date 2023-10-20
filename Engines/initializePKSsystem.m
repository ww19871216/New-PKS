function [questionPKS,questionPKSlearn,modelHistory]=initializePKSsystem

global questionModelMap modelParameters nChannels KPcontentMap

SAsBeforeQ_GLOBAL=zeros(1,nChannels);
SAsBeforeQ_TESTraw=zeros(1,nChannels);

lessons=unique(KPcontentMap.L3_index);
nLessons=length(lessons);
SAsBeforeQ_LessonTESTraw=cell(1,nLessons);
NtestLesson=zeros(1,nLessons);
lastQtestLesson=NaN(1,nLessons);
correctnessLastQtestLesson=NaN(1,nLessons);
for i=1:nLessons
    SAsBeforeQ_LessonTESTraw{i}=zeros(1,nChannels);
end

units=unique(KPcontentMap.L2_index);
nUnits=length(units);
SAsBeforeQ_UnitTESTraw=cell(1,nUnits);
NtestUnit=zeros(1,nUnits);
lastQtestUnit=NaN(1,nUnits);
correctnessLastQtestUnit=NaN(1,nUnits);
for i=1:nUnits
    SAsBeforeQ_UnitTESTraw{i}=zeros(1,nChannels);
end

lastQglobal=NaN;
correctnessLastQglobal=NaN;
Nglobal=0;
lastQtest=NaN;
correctnessLastQtest=NaN;
Ntest=0;
KPsSeenSoFar=NaN;
modelHistory=table(SAsBeforeQ_GLOBAL,SAsBeforeQ_TESTraw,SAsBeforeQ_LessonTESTraw,SAsBeforeQ_UnitTESTraw,...
                   lastQglobal,correctnessLastQglobal,Nglobal,lastQtest,correctnessLastQtest,Ntest,...
                   lastQtestLesson,correctnessLastQtestLesson,NtestLesson,lastQtestUnit,correctnessLastQtestUnit,...
                   NtestUnit,KPsSeenSoFar);
questionPKS=normcdfParallel(questionModelMap.centerValue+questionModelMap.iqta+modelParameters(11));
questionPKS(questionPKS>0.993)=0.993;
questionPKSlearn=normcdfParallel(questionModelMap.centerValue+modelParameters(13));
questionPKSlearn=round(questionPKSlearn,4);
questionPKSlearn(questionPKSlearn>0.993)=0.993;
questionPKS=round(questionPKS,4);
end



