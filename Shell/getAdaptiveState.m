function [product_area, areaPos,abandonAndRestartTest,question_textid,correctness,nextQuestionId]=getAdaptiveState

global grv lrv

product_area=grv.product_area;
areaPos=grv.areaPos;

if (product_area==1 || product_area==3 || product_area==5) && areaPos==0
    question_textid=[];
    correctness=[];
    nextQuestionId=[];
elseif (product_area==1 || product_area==3 || product_area==5) && areaPos~=4
    shpa=grv.studentHistory(grv.studentHistory.product_area==product_area,:);
    pos=find(shpa.areaPos==1);
    question_textid=shpa.question_textid(pos(end):end);
    correctness=shpa.correctness(pos(end):end);
    if correctness(end)==-1
        nextQuestionId=question_textid(end);
        question_textid=question_textid(1:end-1);
        correctness=correctness(1:end-1);
    end
else
    question_textid=[];
    correctness=[];
    nextQuestionId=[];
end
abandonAndRestartTest=[];
if isfield(lrv,'abandonAndRestartTest')
    abandonAndRestartTest=lrv.abandonAndRestartTest;
end

end

