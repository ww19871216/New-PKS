function studentHistory=initializeStudentHistory
    
studentQuestionN=[];
question_index=[];
question_textid=cell(0);
correctness=[];
is_testQ=[];
dataSetNumber=[];
PKSbeforeQ=[];
product_area=[];
areaPos=[];
correctnessChanged=[];
is_IDontKnow=[];
studentHistory=table(studentQuestionN,question_index,question_textid,correctness,is_testQ,dataSetNumber,PKSbeforeQ,product_area,areaPos,correctnessChanged,is_IDontKnow); 
end

