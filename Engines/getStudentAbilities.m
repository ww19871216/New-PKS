function [newSAforChannel,fitDetailsForDEBUG]=getStudentAbilities(newQweightsForChannel,newQcenter,newQadj,newQcorrectness,...
                                                                  costParam,currentSAforChannel,shiftsSoFar)

%In this function we find the new student abilities, newSAforChannel, using Newton's Method.
%To do this, we first compute the NLL, including the cost, for the results of that question for 3 abilities:
%   abilities(1)=currentSAforChannel --> These were the abilities that were optimal from the previous question.
%   abilities(2)=currentSAforChannel - delta
%   abilities(3)=currentSAforChannel + delta
%Then, using the corresponding results NLLs(1), NLLs(2) and NLLs(3) we use Newton to estimate 
%what should be the optimal abilities, abilities(4), for this question.
%Finally, we find the minimal value amongst the 4 computed NLLs, and its corresponding abilities.
%These abilities are assigned to newSAforChannel, the new optimal abilities for the channel.
%
%Note that the second output variable, fitDetailsForDebug, is only for debugging. 
%It shows the 4 abilities and their output NLLs.

delta=0.001;

abilities=zeros(4,1);
NLLs=zeros(4,1);
i=1;
abilities(i)=currentSAforChannel;
normcdfParallel(newQcenter + shiftsSoFar + newQadj + abilities(i)*newQweightsForChannel);
NLLs(i)=normcdfParallel(newQcenter + shiftsSoFar + newQadj + abilities(i)*newQweightsForChannel);
NLLs(i)=-log(NLLs(i).^newQcorrectness.*(1-NLLs(i)).^(1-newQcorrectness));
NLLs(i)=NLLs(i) + costParam.*(abilities(i)-currentSAforChannel).^2;

i=2;
abilities(i)=abilities(1)-delta;
NLLs(i)=normcdfParallel(newQcenter + shiftsSoFar + newQadj + abilities(i)*newQweightsForChannel);
NLLs(i)=-log(NLLs(i).^newQcorrectness.*(1-NLLs(i)).^(1-newQcorrectness));
NLLs(i)=NLLs(i) + costParam.*(abilities(i)-currentSAforChannel).^2;

i=3;
abilities(i)=abilities(1)+delta;
NLLs(i)=normcdfParallel(newQcenter + shiftsSoFar + newQadj + abilities(i)*newQweightsForChannel);
NLLs(i)=-log(NLLs(i).^newQcorrectness.*(1-NLLs(i)).^(1-newQcorrectness));
NLLs(i)=NLLs(i) + costParam.*(abilities(i)-currentSAforChannel).^2;

y15=(NLLs(1)-NLLs(2))./delta;
y25=(NLLs(3)-NLLs(1))./delta;
y2=(y15+y25)./2;


i=4;
abilities(i)=abilities(1)-y2./((y25-y15)./delta);
NLLs(i)=normcdfParallel(newQcenter + shiftsSoFar + newQadj + abilities(i)*newQweightsForChannel);
NLLs(i)=-log(NLLs(i).^newQcorrectness.*(1-NLLs(i)).^(1-newQcorrectness));
NLLs(i)=NLLs(i) + costParam.*(abilities(i)-currentSAforChannel).^2;


[~, pos]=min(NLLs);
newSAforChannel=abilities(pos(1));
iteration=(1:i)';
fitDetailsForDEBUG=table(iteration,NLLs,abilities);
end

