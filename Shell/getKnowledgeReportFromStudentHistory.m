function getKnowledgeReportFromStudentHistory(subContentAreaName)

global grv_fn lrv_fn grv lrv
    
if nargin==0
    subContentAreaName='sub-area';
end

computeAndSaveReportDetailsIntoLocalRuntimeVars



if grv.areaPos==0
    showIntroReportPage
    grv.areaPos=1;
    save(grv_fn,'grv')
end

if grv.areaPos==1
    displayStudentMastery(subContentAreaName)
    showOutroReportPage
    grv.product_area=1000;
    grv.areaPos=0;
    lrv=[];
    lrv.runtimeVarsExist=0;  
    save(grv_fn,'grv')
    save(lrv_fn,'lrv')
end

end


