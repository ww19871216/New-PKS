function chrDisplay=convertClassHistoryReportForDisplay(chr)

groupN=size(chr,2)-4;
results=chr(1:2:end,1:4);

productAreaToEventConverter(1,:)={'Initial Comprehensive Adaptive Test'};
productAreaToEventConverter(3,:)={'Adaptive Quiz on Module Subset'};
productAreaToEventConverter(5,:)={'Comprehensive Adaptive Test Resetting Knowledge'};
productAreaToEventConverter(7,:)={'Various Course Work'};
productAreaToEventConverter(9,:)={'Final Exam'};
results.eventType=productAreaToEventConverter(results.product_area);
results.product_area=[];

studentN=round(size(chr,1)/2);
eventMeanPKSforGroups=table2array(chr(1:2:end,5:end));
eventGroupsCoveredVector=table2array(chr(2:2:end,5:end));
for i=1:groupN
    groupName=chr.Properties.VariableNames{i+4};
    tempy=100*eventMeanPKSforGroups(:,i);
    tempy(tempy==-100)=-1;
    tempy = formatNumericPercentages(tempy,0);
    tempy=[tempy ' '*ones(studentN,2)];
    tempy(eventGroupsCoveredVector(:,i)==1,end)='*';
    w=size(tempy,2);
    pos=find(eventMeanPKSforGroups(:,i)==-1);
    tempy(pos,:)=expandrowvector('-'*ones(1,w),length(pos));
    if size(tempy,1)==1
        eval([groupName '={tempy};'])
    else
        eval([groupName '=tempy;'])
    end
    eval(['results=[results table(' groupName ')];'])
end  

chrDisplay=results;
end

