function getKnowledgeReportImmediatelyAfterEvent

global grv_fn lrv_fn grv lrv
    
computeAndSaveReportDetailsIntoLocalRuntimeVars


if grv.areaPos==0
    showIntroReportPage
    grv.areaPos=1;
    save(grv_fn,'grv')
end

if grv.areaPos==1
    displayStudentMastery
    showOutroReportPage
    if grv.product_area==2
        grv.areaPos=2;
        save(grv_fn,'grv')
    else
        if ismember(grv.product_area,[4 6 8 10 32 34])
            grv.product_area=1000;
        elseif ismember(grv.product_area,[14 16 18 28 30])
            grv.product_area=100;
        end
        grv.areaPos=0;
        lrv=[];
        lrv.runtimeVarsExist=0;  
        save(grv_fn,'grv')
        save(lrv_fn,'lrv')
    end
end

if grv.areaPos==2
    displayInstructionsForReport
    showInstructionsReportPage
    if grv.product_area==2
        grv.product_area=1000;
    end
    grv.areaPos=0;
    lrv=[];
    lrv.runtimeVarsExist=0;  
    save(grv_fn,'grv')
    save(lrv_fn,'lrv')
end

end


