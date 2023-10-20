function computeAndSaveReportDetailsIntoLocalRuntimeVars

global KPcontentMap 
global lrv_fn grv lrv


if lrv.runtimeVarsExist==0
    lrv.reportIndex=[];
end


if lrv.runtimeVarsExist <= 1
    if isempty(lrv.reportIndex)
        pos=find(grv.studentReportHistory.product_area==grv.product_area-1);
        pos=pos(end-1:end);
    else
        pos=round(2*lrv.reportIndex - 1);
        pos(2)=pos+1;
    end

    meanPKSforKPs=cell2mat(table2cell(grv.studentReportHistory(pos(1),5:end)));
    KPsCoveredByTest=find(cell2mat(table2cell(grv.studentReportHistory(pos(2),5:end)))==1);

    if any(cell2mat(table2cell(grv.studentReportHistory(pos(2),5:end)))==0)
        reportComprehensive=0;
    else
        reportComprehensive=1;
    end


    [~,pos]=unique(KPcontentMap.L3_index(KPsCoveredByTest));
    L3_index=KPcontentMap.L3_index(KPsCoveredByTest(pos));
    nameKey=KPcontentMap.L3_textid(KPsCoveredByTest(pos));
    masteryPercentage=zeros(length(L3_index),1);
    for i=1:length(L3_index)
        KPindicesForModule{i,:}=find(KPcontentMap.L3_index==L3_index(i))';
        masteryKPsPercentage = round(meanPKSforKPs(KPindicesForModule{i}),2)*100;
        masteryPercentage(i) = round(mean(masteryKPsPercentage));
    end
    lrv.resultsModule=table(nameKey,L3_index,masteryPercentage,KPindicesForModule);
    nameKey=unique(KPcontentMap.L1_textid(KPsCoveredByTest));
    if reportComprehensive==1
        masteryPercentage=round(mean(lrv.resultsModule.masteryPercentage));
    else
        masteryPercentage=-1;
    end
    lrv.resultsProduct=table(nameKey,masteryPercentage);

    nameKey=KPcontentMap.KP_textid;
    lrv.resultsKP=table(nameKey);
    kptidsN=sum(contains(KPcontentMap.Properties.VariableNames,'KP_textid'));
    for i=2:kptidsN
        eval(['nameKey' num2str(i) '=KPcontentMap.KP_textid' num2str(i) ';'])
        lrv.resultsKP=[lrv.resultsKP eval(['table(nameKey' num2str(i) ');'])];
    end

    KP_index=KPcontentMap.KP_index;
    masteryPercentage=round(meanPKSforKPs*100)';
    lrv.resultsKP=[lrv.resultsKP table(KP_index,masteryPercentage)];

    lrv.runtimeVarsExist=2;
    lrv.reportIndex=[];
    save(lrv_fn,'lrv')
end

end

