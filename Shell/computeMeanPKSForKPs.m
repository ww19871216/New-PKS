function meanPKSforKPs=computeMeanPKSForKPs

global questionModelMap
global grv

nKPs=max(questionModelMap.KP_index);
meanPKSforKPs=zeros(nKPs,1);
for i=1:nKPs
    meanPKSforKPs(i)=mean(grv.questionPKS(questionModelMap.KP_index==i));
end  
meanPKSforKPs=round(meanPKSforKPs,4);

end
