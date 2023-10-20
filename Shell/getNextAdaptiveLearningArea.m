function getNextAdaptiveLearningArea

global KPcontentMap initialAdaptiveTestSettings masteryCutoffs
global grv_fn grv

masteredCutoff=masteryCutoffs.masteredCutoff;
nKPsForCourse=length(KPcontentMap.KP_index);

meanPKSforLessons=computeMeanPKSForLessons;
meanPKSforLessons=round(meanPKSforLessons,2);

checkWithStudent=1;
disp(' ')
disp(' ')
disp('Welcome to the AI Adaptive Learning Area.')
if all(meanPKSforLessons >= masteredCutoff) && grv.questionIndicesSinceLastLocalQuiz(1)==-1
    %totalMaxTestN = initialAdaptiveTestSettings.nQuestionsMaxForTest + initialAdaptiveTestSettings.nRandomQuestionsNotInModel;
    disp(' ')
    disp(' ')
    disp('CONGRATULATIONS! Your knowledge is a least "Mastered" for all modules in the course.')
    disp(['So you can now take the Adaptive Final Exam and possibly complete the course.'])
    disp('Or, you can postpone the Adaptive Final Exam for now, and continue to work through the course further.')
    disp(' ')
    preamble=('What would you like to do?');
    nCategories=2;
    categories=cell(nCategories,1);
    categories{1}=['Take the Final Exam and possibly complete the course.'];
    categories{2}=['Postpone the Final Exam for now, and continue to work through the course further.'];
    answer=getUserAnswerForOptions(categories,nCategories,preamble);
    if answer==1
        grv.product_area=13;
        grv.areaPos=0;
        grv.questionIndicesSinceLastComprehensiveQuiz=-1;
        grv.questionIndicesSinceLastLocalQuiz=-1;
        grv.KPindicesSeenSinceLastComprehensiveQuiz=-1;
        checkWithStudent=0;     
        disp(' ')
        disp(' ')
        disp(['Okay you have chosen to take the Final Exam.'])
    elseif answer==2
        disp('Okay you have chosen to postpone the Final Exam and continue to work through the course further.')
    end
end
if checkWithStudent==1
    if length(grv.questionIndicesSinceLastComprehensiveQuiz) >= 80 && length(grv.questionIndicesSinceLastLocalQuiz)>=20 
        %[regTestN, EQtotalN]= getMaxAdaptiveTestLength(nKPsForCourse,nKPsForCourse,initialAdaptiveTestSettings.nQuestionsMaxForTest,2);
        %totalMaxTestN=regTestN+EQtotalN;
        grv.product_area=15; %Comprehensive Quiz with no PKS reset.
        grv.areaPos=0;
        checkWithStudent=0;  
        grv.questionIndicesSinceLastComprehensiveQuiz =-1;
        grv.questionIndicesSinceLastLocalQuiz=-1;
        grv.KPindicesSeenSinceLastComprehensiveQuiz=-1;
        disp(' ')
        disp(' ')
        disp('It is time to take an AI Adaptive Quiz over all the course content.')
    elseif length(grv.questionIndicesSinceLastLocalQuiz)>=20 
        nKPsCoveredSinceLastQuiz=length(unique(questionModelMap.KP_index(grv.questionIndicesSinceLastLocalQuiz)));
        %[regTestN, EQtotalN]= getMaxAdaptiveTestLength(nKPsCoveredSinceLastQuiz,nKPsForCourse,initialAdaptiveTestSettings.nQuestionsMaxForTest,2);
        %totalMaxTestN=regTestN+EQtotalN;
        grv.product_area=17; %Local Quiz covering KPs last 20 questions came from 
        grv.areaPos=0;
        checkWithStudent=0;  
        disp(' ')
        disp(' ')
        disp('It is time to take a short AI Adaptive Quiz covering the material you have recently worked on.')
    end
end
if checkWithStudent==1
    %totalMaxTestN = initialAdaptiveTestSettings.nQuestionsMaxForTest + initialAdaptiveTestSettings.nRandomQuestionsNotInModel;
    disp(' ')
    disp(' ')
    preamble=('What would you like to do now?');
    nCategories=7;
    categories=cell(nCategories,1);
    categories{1}=['Practice a Knowledge Point (KP), chosen over the entire course, that the AI thinks is best.'];
    categories{2}=['Practice a Knowledge Point (KP), chosen from modules you choose, that the AI thinks is best.'];
    categories{3}=['Practice any Knowledge Point (KP) that you choose (with some guidance from the AI).'];
    categories{4}=['Work on a burst of questions from different KPs, chosen by the AI over the entire course, for mixed practice.'];
    categories{5}=['Take a Comprehensive Adaptive Test to reset your Knowledge State.'];
    categories{6}=['Take an Adaptive Quiz on modules of your choosing.'];
    categories{7}=['Leave the AI Adaptive Learning Area.'];
    answer=getUserAnswerForOptions(categories,nCategories,preamble);
    if answer==1
        disp('Okay you now will practice a KP chosen by the AI over the entire course.')
        grv.product_area=19;
        grv.areaPos=0;
    elseif answer==2
        disp('Okay you now will practice a KP chosen by the AI over any Modules you choose.')
        grv.product_area=21;
        grv.areaPos=0;
    elseif answer==3
        disp('Okay you now will practice a KP chosen by you (with some guidance from the AI).')
        grv.product_area=23;
        grv.areaPos=0;
    elseif answer==4
        disp('Okay you now will practice 4 questions from different KPs chosen by the AI for some mixed practice learning.')
        grv.product_area=25;
        grv.areaPos=0;
    elseif answer==5
        disp(['Okay you will now take a Comprehensive Adaptive Test to reset your Knowledge State.'])
        grv.product_area=27;
        grv.areaPos=0;
    elseif answer==6
        disp('Okay you will now take an Adaptive Quiz on modules of your choosing.')
        grv.product_area=29;
        grv.areaPos=0;
    elseif answer==7
        disp('Okay you will now leave the AI Adaptive Learning Area.')
        grv.product_area=1000;
        grv.areaPos=0;
    end
end


save(grv_fn,'grv')

disp(' ')
pause(2)


end

