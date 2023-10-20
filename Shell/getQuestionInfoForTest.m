function [questionPoolForTest,randomQuestionPoolForTest,questionsRecentlyTested]...
                            =getQuestionInfoForTest(testSettings,KPsCoveredByTest,questionsRecentlyTested)

global questionModelMap outsideQuestionsToTest


allQuestionsCoveredByTest=questionModelMap.question_index(ismember(questionModelMap.KP_index,KPsCoveredByTest));
testBankQuestions=questionModelMap.question_index(questionModelMap.inTestBank==1);

%Get questionPoolForTest and randomQuestionPoolForTest depending on the test's questionSelectionFlavor.
if  testSettings.questionSelectionFlavor==1 
    questionPoolForTest=allQuestionsCoveredByTest;
    randomQuestionPoolForTest=allQuestionsCoveredByTest;
elseif testSettings.questionSelectionFlavor==2  
    questionPoolForTest=intersect(allQuestionsCoveredByTest,testBankQuestions);
    randomQuestionPoolForTest=allQuestionsCoveredByTest;    
elseif testSettings.questionSelectionFlavor==3  
    questionPoolForTest=intersect(allQuestionsCoveredByTest,testBankQuestions);
    randomQuestionPoolForTest=questionPoolForTest;  
elseif testSettings.questionSelectionFlavor==4
    questionPoolForTest=allQuestionsCoveredByTest;
    randomQuestionPoolForTest=outsideQuestionsToTest.question_textid;
elseif testSettings.questionSelectionFlavor==5 || testSettings.questionSelectionFlavor==6 
    questionPoolForTest=intersect(allQuestionsCoveredByTest,testBankQuestions);
    randomQuestionPoolForTest=outsideQuestionsToTest.question_textid;   
end
questionsRecentlyTested=questionsRecentlyTested(ismember(questionsRecentlyTested,questionPoolForTest));
end

