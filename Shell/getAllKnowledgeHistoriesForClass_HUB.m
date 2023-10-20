function getAllKnowledgeHistoriesForClass_HUB(class_id,product)

global grv grv_fn lrv lrv_fn

classStudentInfo=getClassStudentInfo_HUB(class_id,product);
[chrKP,chrL3]=getClassHistoryReports(classStudentInfo);
chrKPdisplay=convertClassHistoryReportForDisplay(chrKP);
chrL3display=convertClassHistoryReportForDisplay(chrL3);


grv.areaPos=1;
lrv.abandonAndRestartTest=0;
lrv.startNewDataSetWithBatch=0;
lrv.reportIndex=[];
lrv.runtimeVarsExist=1;
lrv.chrKP=chrKP;
lrv.chrL3=chrL3;
lrv.chrKPdisplay=chrKPdisplay;
lrv.chrL3display=chrL3display;
lrv.studentToShow=-1;
save(grv_fn,'grv')
save(lrv_fn,'lrv')  

end

