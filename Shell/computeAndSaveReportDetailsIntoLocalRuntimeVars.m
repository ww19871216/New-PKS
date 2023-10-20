function computeAndSaveReportDetailsIntoLocalRuntimeVars

global KPcontentMap modelParameters contentLevelsTerminology
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
    
    if modelParameters(end)==1
        index=unique(KPcontentMap.L1_index(KPsCoveredByTest));
        nameKey=unique(KPcontentMap.L1_textid(KPsCoveredByTest));
        if reportComprehensive==1
            masteryPercentage=round(mean(meanPKSforKPs(KPsCoveredByTest)),2)*100;
        else
            masteryPercentage=-1;
        end
        nextLevelCategoriesCovered{1}=unique(KPcontentMap.L3_index(KPsCoveredByTest))';
        reportInfoTable{1}=table(index, nameKey, masteryPercentage, nextLevelCategoriesCovered);
        reportLevelContentLable{1}=contentLevelsTerminology.nameForLevel(ismember(contentLevelsTerminology.level, 'L1'));
        
        [~,pos]=unique(KPcontentMap.L3_index(KPsCoveredByTest));
        index=KPcontentMap.L3_index(KPsCoveredByTest(pos));
        nameKey=KPcontentMap.L3_textid(KPsCoveredByTest(pos));
        masteryPercentage=zeros(length(index),1);
        nextLevelCategoriesCovered=cell(length(index),1);
        for i=1:length(index)
            pos=find(KPcontentMap.L3_index==index(i))';
            nextLevelCategoriesCovered{i,:}=unique(KPcontentMap.KP_index(pos));
            masteryKPsPercentage = round(meanPKSforKPs(nextLevelCategoriesCovered{i}),2)*100;
            masteryPercentage(i) = round(mean(masteryKPsPercentage));
        end
        reportInfoTable{2}=table(index, nameKey, masteryPercentage, nextLevelCategoriesCovered);
        reportLevelContentLable{2}=contentLevelsTerminology.nameForLevel(ismember(contentLevelsTerminology.level,'L3'));
        
        index=KPcontentMap.KP_index;
        nameKey=KPcontentMap.KP_textid;
        masteryPercentage=round(meanPKSforKPs*100)';
        nextLevelCategoriesCovered=-1*ones(size(index));
        reportInfoTable{3}=table(index, nameKey, masteryPercentage, nextLevelCategoriesCovered);
        reportLevelContentLable{3}=contentLevelsTerminology.nameForLevel(ismember(contentLevelsTerminology.level, 'KP'));
        lrv.reportInfoTable=reportInfoTable';
        lrv.reportLevelContentLabel=reportLevelContentLable';
    elseif modelParameters(end)==2
        index=unique(KPcontentMap.L1_index(KPsCoveredByTest));
        nameKey=unique(KPcontentMap.L1_textid(KPsCoveredByTest));
        if reportComprehensive==1
            masteryPercentage=round(mean(meanPKSforKPs(KPsCoveredByTest)),2)*100;
        else
            masteryPercentage=-1;
        end
        nextLevelCategoriesCovered{1}=unique(KPcontentMap.L2_index(KPsCoveredByTest))';
        reportInfoTable{1}=table(index, nameKey, masteryPercentage, nextLevelCategoriesCovered);
        reportLevelContentLable{1}=contentLevelsTerminology.nameForLevel(ismember(contentLevelsTerminology.level, 'L1'));
        
        [~,pos]=unique(KPcontentMap.L2_index(KPsCoveredByTest));
        index=KPcontentMap.L2_index(KPsCoveredByTest(pos));
        nameKey=KPcontentMap.L2_textid(KPsCoveredByTest(pos));
        masteryPercentage=zeros(length(index),1);
        nextLevelCategoriesCovered=cell(length(index),1);
        for i=1:length(index)
            pos=find(KPcontentMap.L2_index==index(i))';
            nextLevelCategoriesCovered{i,:}=unique(KPcontentMap.KP_index(pos));
            masteryKPsPercentage = round(meanPKSforKPs(nextLevelCategoriesCovered{i}),2)*100;
            masteryPercentage(i) = round(mean(masteryKPsPercentage));
        end
        reportInfoTable{2}=table(index, nameKey, masteryPercentage, nextLevelCategoriesCovered);
        reportLevelContentLable{2}=contentLevelsTerminology.nameForLevel(ismember(contentLevelsTerminology.level,'L2'));
        
        index=KPcontentMap.KP_index;
        nameKey=KPcontentMap.KP_textid;
        masteryPercentage=round(meanPKSforKPs*100)';
        nextLevelCategoriesCovered=-1*ones(size(index));
        reportInfoTable{3}=table(index, nameKey, masteryPercentage, nextLevelCategoriesCovered);
        reportLevelContentLable{3}=contentLevelsTerminology.nameForLevel(ismember(contentLevelsTerminology.level, 'KP'));
        lrv.reportInfoTable=reportInfoTable';
        lrv.reportLevelContentLabel=reportLevelContentLable';
    elseif modelParameters(end)==3
        index=unique(KPcontentMap.L1_index(KPsCoveredByTest));
        nameKey=unique(KPcontentMap.L1_textid(KPsCoveredByTest));
        if reportComprehensive==1
            masteryPercentage=round(mean(meanPKSforKPs(KPsCoveredByTest)),2)*100;
        else
            masteryPercentage=-1;
        end
        nextLevelCategoriesCovered{1}=unique(KPcontentMap.L2_index(KPsCoveredByTest))';
        reportInfoTable{1}=table(index, nameKey, masteryPercentage, nextLevelCategoriesCovered);
        reportLevelContentLable{1}=contentLevelsTerminology.nameForLevel(ismember(contentLevelsTerminology.level, 'L1'));
        
        [~,pos]=unique(KPcontentMap.L2_index(KPsCoveredByTest));
        index=KPcontentMap.L2_index(KPsCoveredByTest(pos));
        nameKey=KPcontentMap.L2_textid(KPsCoveredByTest(pos));
        masteryPercentage=zeros(length(index),1);
        nextLevelCategoriesCovered=cell(length(index),1);
        for i=1:length(index)
            pos=find(KPcontentMap.L2_index==index(i))';
            nextLevelCategoriesCovered{i,:}=unique(KPcontentMap.L3_index(pos));
            masteryKPsPercentage = round(meanPKSforKPs(nextLevelCategoriesCovered{i}),2)*100;
            masteryPercentage(i) = round(mean(masteryKPsPercentage));
        end
        reportInfoTable{2}=table(index, nameKey, masteryPercentage, nextLevelCategoriesCovered);
        reportLevelContentLable{2}=contentLevelsTerminology.nameForLevel(ismember(contentLevelsTerminology.level,'L2'));
        
        [~,pos]=unique(KPcontentMap.L3_index(KPsCoveredByTest));
        index=KPcontentMap.L3_index(KPsCoveredByTest(pos));
        nameKey=KPcontentMap.L3_textid(KPsCoveredByTest(pos));
        masteryPercentage=zeros(length(index),1);
        nextLevelCategoriesCovered=cell(length(index),1);
        for i=1:length(index)
            pos=find(KPcontentMap.L3_index==index(i))';
            nextLevelCategoriesCovered{i,:}=unique(KPcontentMap.KP_index(pos));
            masteryKPsPercentage = round(meanPKSforKPs(nextLevelCategoriesCovered{i}),2)*100;
            masteryPercentage(i) = round(mean(masteryKPsPercentage));
        end
        reportInfoTable{3}=table(index, nameKey, masteryPercentage, nextLevelCategoriesCovered);
        reportLevelContentLable{3}=contentLevelsTerminology.nameForLevel(ismember(contentLevelsTerminology.level,'L3'));
        
        index=KPcontentMap.KP_index;
        nameKey=KPcontentMap.KP_textid;
        masteryPercentage=round(meanPKSforKPs*100)';
        nextLevelCategoriesCovered=-1*ones(size(index));
        reportInfoTable{4}=table(index, nameKey, masteryPercentage, nextLevelCategoriesCovered);
        reportLevelContentLable{4}=contentLevelsTerminology.nameForLevel(ismember(contentLevelsTerminology.level, 'KP'));
        lrv.reportInfoTable=reportInfoTable';
        lrv.reportLevelContentLabel=reportLevelContentLable';
    elseif modelParameters(end)==4
        index=unique(KPcontentMap.L1_index(KPsCoveredByTest));
        nameKey=unique(KPcontentMap.L1_textid(KPsCoveredByTest));
        if reportComprehensive==1
            masteryPercentage=round(mean(meanPKSforKPs(KPsCoveredByTest)),2)*100;
        else
            masteryPercentage=-1;
        end
        nextLevelCategoriesCovered{1}=unique(KPcontentMap.L2_index(KPsCoveredByTest))';
        reportInfoTable{1}=table(index, nameKey, masteryPercentage, nextLevelCategoriesCovered);
        reportLevelContentLable{1}=contentLevelsTerminology.nameForLevel(ismember(contentLevelsTerminology.level, 'L1'));
        
        [~,pos]=unique(KPcontentMap.L2_index(KPsCoveredByTest));
        index=KPcontentMap.L2_index(KPsCoveredByTest(pos));
        nameKey=KPcontentMap.L2_textid(KPsCoveredByTest(pos));
        masteryPercentage=zeros(length(index),1);
        nextLevelCategoriesCovered=cell(length(index),1);
        for i=1:length(index)
            pos=find(KPcontentMap.L2_index==index(i))';
            nextLevelCategoriesCovered{i,:}=unique(KPcontentMap.L3_index(pos));
            masteryKPsPercentage = round(meanPKSforKPs(nextLevelCategoriesCovered{i}),2)*100;
            masteryPercentage(i) = round(mean(masteryKPsPercentage));
        end
        reportInfoTable{2}=table(index, nameKey, masteryPercentage, nextLevelCategoriesCovered);
        reportLevelContentLable{2}=contentLevelsTerminology.nameForLevel(ismember(contentLevelsTerminology.level,'L2'));
        
        [~,pos]=unique(KPcontentMap.L3_index(KPsCoveredByTest));
        index=KPcontentMap.L3_index(KPsCoveredByTest(pos));
        nameKey=KPcontentMap.L3_textid(KPsCoveredByTest(pos));
        masteryPercentage=zeros(length(index),1);
        for i=1:length(index)
            pos=find(KPcontentMap.L3_index==index(i))';
            tempy{i,:}=unique(KPcontentMap.L3_index(pos));
            masteryKPsPercentage = round(meanPKSforKPs(tempy{i}),2)*100;
            masteryPercentage(i) = round(mean(masteryKPsPercentage));
        end
        nextLevelCategoriesCovered=-1*ones(size(index));
        reportInfoTable{3}=table(index, nameKey, masteryPercentage, nextLevelCategoriesCovered);
        reportLevelContentLable{3}=contentLevelsTerminology.nameForLevel(ismember(contentLevelsTerminology.level,'L3'));
        lrv.reportInfoTable=reportInfoTable';
        lrv.reportLevelContentLabel=reportLevelContentLable';
    elseif modelParameters(end)==5
        index=unique(KPcontentMap.L1_index(KPsCoveredByTest));
        nameKey=unique(KPcontentMap.L1_textid(KPsCoveredByTest));
        if reportComprehensive==1
            masteryPercentage=round(mean(meanPKSforKPs(KPsCoveredByTest)),2)*100;
        else
            masteryPercentage=-1;
        end
        nextLevelCategoriesCovered{1}=unique(KPcontentMap.L3_index(KPsCoveredByTest))';
        reportInfoTable{1}=table(index, nameKey, masteryPercentage, nextLevelCategoriesCovered);
        reportLevelContentLable{1}=contentLevelsTerminology.nameForLevel(ismember(contentLevelsTerminology.level, 'L1'));
        
        [~,pos]=unique(KPcontentMap.L3_index(KPsCoveredByTest));
        index=KPcontentMap.L3_index(KPsCoveredByTest(pos));
        nameKey=KPcontentMap.L3_textid(KPsCoveredByTest(pos));
        masteryPercentage=zeros(length(index),1);
        nextLevelCategoriesCovered=cell(length(index),1);
        for i=1:length(index)
            pos=find(KPcontentMap.L3_index==index(i))';
            nextLevelCategoriesCovered{i,:}=unique(KPcontentMap.L4_index(pos));
            masteryKPsPercentage = round(meanPKSforKPs(nextLevelCategoriesCovered{i}),2)*100;
            masteryPercentage(i) = round(mean(masteryKPsPercentage));
        end
        reportInfoTable{2}=table(index, nameKey, masteryPercentage, nextLevelCategoriesCovered);
        reportLevelContentLable{2}=contentLevelsTerminology.nameForLevel(ismember(contentLevelsTerminology.level,'L3'));
        
        [~,pos]=unique(KPcontentMap.L4_index(KPsCoveredByTest));
        index=KPcontentMap.L4_index(KPsCoveredByTest(pos));
        nameKey=KPcontentMap.L4_textid(KPsCoveredByTest(pos));
        masteryPercentage=zeros(length(index),1);
        for i=1:length(index)
            pos=find(KPcontentMap.L4_index==index(i))';
            tempy{i,:}=unique(KPcontentMap.L4_index(pos));
            masteryKPsPercentage = round(meanPKSforKPs(nextLevelCategoriesCovered{i}),2)*100;
            masteryPercentage(i) = round(mean(masteryKPsPercentage));
        end
        nextLevelCategoriesCovered=-1*ones(size(index));
        reportInfoTable{3}=table(index, nameKey, masteryPercentage, nextLevelCategoriesCovered);
        reportLevelContentLable{3}=contentLevelsTerminology.nameForLevel(ismember(contentLevelsTerminology.level,'L4'));
        lrv.reportInfoTable=reportInfoTable';
        lrv.reportLevelContentLabel=reportLevelContentLable';
    elseif modelParameters(end)==6
        index=unique(KPcontentMap.L1_index(KPsCoveredByTest));
        nameKey=unique(KPcontentMap.L1_textid(KPsCoveredByTest));
        if reportComprehensive==1
            masteryPercentage=round(mean(meanPKSforKPs(KPsCoveredByTest)),2)*100;
        else
            masteryPercentage=-1;
        end
        nextLevelCategoriesCovered{1}=unique(KPcontentMap.L3_index(KPsCoveredByTest))';
        reportInfoTable{1}=table(index, nameKey, masteryPercentage, nextLevelCategoriesCovered);
        reportLevelContentLable{1}=contentLevelsTerminology.nameForLevel(ismember(contentLevelsTerminology.level, 'L1'));
        
        [~,pos]=unique(KPcontentMap.L3_index(KPsCoveredByTest));
        index=KPcontentMap.L3_index(KPsCoveredByTest(pos));
        nameKey=KPcontentMap.L3_textid(KPsCoveredByTest(pos));
        masteryPercentage=zeros(length(index),1);
        nextLevelCategoriesCovered=cell(length(index),1);
        for i=1:length(index)
            pos=find(KPcontentMap.L3_index==index(i))';
            nextLevelCategoriesCovered{i,:}=unique(KPcontentMap.L4_index(pos));
            masteryKPsPercentage = round(meanPKSforKPs(nextLevelCategoriesCovered{i}),2)*100;
            masteryPercentage(i) = round(mean(masteryKPsPercentage));
        end
        reportInfoTable{2}=table(index, nameKey, masteryPercentage, nextLevelCategoriesCovered);
        reportLevelContentLable{2}=contentLevelsTerminology.nameForLevel(ismember(contentLevelsTerminology.level,'L3'));
        
        [~,pos]=unique(KPcontentMap.L4_index(KPsCoveredByTest));
        index=KPcontentMap.L4_index(KPsCoveredByTest(pos));
        nameKey=KPcontentMap.L4_textid(KPsCoveredByTest(pos));
        masteryPercentage=zeros(length(index),1);
        nextLevelCategoriesCovered=cell(length(index),1);
        for i=1:length(index)
            pos=find(KPcontentMap.L4_index==index(i))';
            nextLevelCategoriesCovered{i,:}=unique(KPcontentMap.KP_index(pos));
            masteryKPsPercentage = round(meanPKSforKPs(nextLevelCategoriesCovered{i}),2)*100;
            masteryPercentage(i) = round(mean(masteryKPsPercentage));
        end
        reportInfoTable{3}=table(index, nameKey, masteryPercentage, nextLevelCategoriesCovered);
        reportLevelContentLable{3}=contentLevelsTerminology.nameForLevel(ismember(contentLevelsTerminology.level,'L4'));
        
        index=KPcontentMap.KP_index;
        nameKey=KPcontentMap.KP_textid;
        masteryPercentage=round(meanPKSforKPs*100)';
        nextLevelCategoriesCovered=-1*ones(size(index));
        reportInfoTable{4}=table(index, nameKey, masteryPercentage, nextLevelCategoriesCovered);
        reportLevelContentLable{4}=contentLevelsTerminology.nameForLevel(ismember(contentLevelsTerminology.level, 'KP'));
        lrv.reportInfoTable=reportInfoTable';
        lrv.reportLevelContentLabel=reportLevelContentLable';
    elseif modelParameters(end)==7
        index=unique(KPcontentMap.L1_index(KPsCoveredByTest));
        nameKey=unique(KPcontentMap.L1_textid(KPsCoveredByTest));
        if reportComprehensive==1
            masteryPercentage=round(mean(meanPKSforKPs(KPsCoveredByTest)),2)*100;
        else
            masteryPercentage=-1;
        end
        nextLevelCategoriesCovered{1}=unique(KPcontentMap.L2_index(KPsCoveredByTest))';
        reportInfoTable{1}=table(index, nameKey, masteryPercentage, nextLevelCategoriesCovered);
        reportLevelContentLable{1}=contentLevelsTerminology.nameForLevel(ismember(contentLevelsTerminology.level, 'L1'));
        
        [~,pos]=unique(KPcontentMap.L2_index(KPsCoveredByTest));
        index=KPcontentMap.L2_index(KPsCoveredByTest(pos));
        nameKey=KPcontentMap.L2_textid(KPsCoveredByTest(pos));
        masteryPercentage=zeros(length(index),1);
        nextLevelCategoriesCovered=cell(length(index),1);
        for i=1:length(index)
            pos=find(KPcontentMap.L2_index==index(i))';
            nextLevelCategoriesCovered{i,:}=unique(KPcontentMap.L3_index(pos));
            masteryKPsPercentage = round(meanPKSforKPs(nextLevelCategoriesCovered{i}),2)*100;
            masteryPercentage(i) = round(mean(masteryKPsPercentage));
        end
        reportInfoTable{2}=table(index, nameKey, masteryPercentage, nextLevelCategoriesCovered);
        reportLevelContentLable{2}=contentLevelsTerminology.nameForLevel(ismember(contentLevelsTerminology.level,'L2'));
        
        [~,pos]=unique(KPcontentMap.L3_index(KPsCoveredByTest));
        index=KPcontentMap.L3_index(KPsCoveredByTest(pos));
        nameKey=KPcontentMap.L3_textid(KPsCoveredByTest(pos));
        masteryPercentage=zeros(length(index),1);
        nextLevelCategoriesCovered=cell(length(index),1);
        for i=1:length(index)
            pos=find(KPcontentMap.L3_index==index(i))';
            nextLevelCategoriesCovered{i,:}=unique(KPcontentMap.L4_index(pos));
            masteryKPsPercentage = round(meanPKSforKPs(nextLevelCategoriesCovered{i}),2)*100;
            masteryPercentage(i) = round(mean(masteryKPsPercentage));
        end
        reportInfoTable{3}=table(index, nameKey, masteryPercentage, nextLevelCategoriesCovered);
        reportLevelContentLable{3}=contentLevelsTerminology.nameForLevel(ismember(contentLevelsTerminology.level,'L3'));
        
        [~,pos]=unique(KPcontentMap.L4_index(KPsCoveredByTest));
        index=KPcontentMap.L4_index(KPsCoveredByTest(pos));
        nameKey=KPcontentMap.L4_textid(KPsCoveredByTest(pos));
        masteryPercentage=zeros(length(index),1);
        for i=1:length(index)
            pos=find(KPcontentMap.L4_index==index(i))';
            tempy{i,:}=unique(KPcontentMap.L4_index(pos));
            masteryKPsPercentage = round(meanPKSforKPs(nextLevelCategoriesCovered{i}),2)*100;
            masteryPercentage(i) = round(mean(masteryKPsPercentage));
        end
        nextLevelCategoriesCovered=-1*ones(size(index));
        reportInfoTable{4}=table(index, nameKey, masteryPercentage, nextLevelCategoriesCovered);
        reportLevelContentLable{4}=contentLevelsTerminology.nameForLevel(ismember(contentLevelsTerminology.level,'L4'));
        lrv.reportInfoTable=reportInfoTable';
        lrv.reportLevelContentLabel=reportLevelContentLable';
    end

    lrv.runtimeVarsExist=2;
    lrv.reportIndex=[];
    save(lrv_fn,'lrv')
end

end

