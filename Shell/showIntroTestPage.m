function showIntroTestPage(abandonAndRestartTest)

global grv lrv
if abandonAndRestartTest==1
    if grv.product_area==1 
        introTestPage{1}=' ';
        introTestPage{2}='You were in the midst of the initial comprehensive adaptive test that covers the entire course.';
        introTestPage{3}='But it has been too long since your last log-in. <strong>So, you must restart the test from the beginning.</strong>';
        introTestPage{4}='This test helps the AI figure out YOUR specific knowledge of the entire course at this time.';
        introTestPage{5}='Please do not rush, be careful in your work, and most importantly try your best!';
        introTestPage{6}='Press "return" to continue the adaptive test.';
    elseif ismember(grv.product_area,[3 29])
        introTestPage{1}=' ';
        introTestPage{2}='You were in the midst of an adaptive quiz covering one or more modules.';
        introTestPage{3}='But it has been too long since your last log-in. <strong>So, you must restart the quiz from the beginning.</strong>';
        introTestPage{4}='This quiz helps the AI know exactly YOUR specific knowledge of these modules at this time.';
        introTestPage{5}='Please do not rush, be careful in your work, and most importantly try your best!';
        introTestPage{6}='Press "return" to continue the adaptive quiz.';
    elseif ismember(grv.product_area,[5 27])
        introTestPage{1}=' ';
        introTestPage{2}='You were in the midst of a comprehensive adaptive test covering the entire course and everything you learned.';
        introTestPage{3}='But it has been too long since your last log-in. <strong>So, you must restart the test from the beginning.</strong>';
        introTestPage{4}='This test helps the AI figure out YOUR specific knowledge of the entire course at this time.';
        introTestPage{5}='Please do not rush, be careful in your work, and most importantly try your best!';
        introTestPage{6}='Press "return" to continue the adaptive test.';
    elseif grv.product_area==13
        introTestPage{1}=' ';
        introTestPage{2}='You were in the midst of the comprehensive adaptive FINAL covering the entire course and everything you learned.';
        introTestPage{3}='But it has been too long since your last log-in. <strong>So, you must restart the FINAL from the beginning.</strong>';
        introTestPage{4}='This test will determine your mastery of the course, and if you do well you can earn a course Mastered Badge.';
        introTestPage{5}='Please do not rush, be careful in your work, and most importantly try your best!';
        introTestPage{6}='Press "return" to continue the adaptive test.';
    elseif grv.product_area==15
        introTestPage{1}=' ';
        introTestPage{2}='You were in the midst of a short, comprehensive adaptive quiz covering the entire course and everything you learned.';
        introTestPage{3}='But it has been too long since your last log-in. <strong>So, you must restart the quiz from the beginning.</strong>';
        introTestPage{4}='This test helps the AI figure out YOUR specific knowledge of the entire course at this time.';
        introTestPage{5}='Please do not rush, be careful in your work, and most importantly try your best!';
        introTestPage{6}='Press "return" to continue the adaptive test.';
    elseif grv.product_area==17
        introTestPage{1}=' ';
        introTestPage{2}='You were in the midst of an adaptive quiz mostly covering topics you have recently learned.';
        introTestPage{3}='But it has been too long since your last log-in. <strong>So, you must restart the quiz from the beginning.</strong>';
        introTestPage{4}='This quiz helps the AI figure out YOUR specific knowledge of these topics at this time.';
        introTestPage{5}='Please do not rush, be careful in your work, and most importantly try your best!';
        introTestPage{6}='Press "return" to continue the adaptive quiz.';
    elseif ismember(grv.product_area,[31 33])
        introTestPage{1}=' ';
        introTestPage{2}='You were in the midst of going through the TEST BANK questions in order.';
        introTestPage{3}='But it has been too long since your last log-in. <strong>So, you must restart this process from the beginning.</strong>';
        introTestPage{4}='Press "return" to do this.';
    end
else
    if grv.product_area==1 && grv.areaPos==0
        introTestPage{1}=' ';
        introTestPage{2}='You must first take an initial comprehensive adaptive test that covers the entire course.';
        introTestPage{3}='This test helps the AI figure out YOUR specific knowledge of the entire course at this time.';
        introTestPage{4}='Please do not rush, be careful in your work, and most importantly try your best!';
        introTestPage{5}='Press "return" to begin the adaptive test.';
    elseif grv.product_area==1 
        introTestPage{1}=' ';
        introTestPage{2}='You were in the midst of the initial comprehensive adaptive test that covers the entire course.';
        introTestPage{3}='This test helps the AI figure out YOUR specific knowledge of the entire course at this time.';
        introTestPage{4}='Please do not rush, be careful in your work, and most importantly try your best!';
        introTestPage{5}='Press "return" to continue the adaptive test.';
    elseif ismember(grv.product_area,[3 29]) && grv.areaPos==0
        introTestPage{1}=' ';
        introTestPage{2}='It is time to take an adaptive quiz covering one or modules.';
        introTestPage{3}='This quiz helps the AI know exactly YOUR specific knowledge of these modules at this time.';
        introTestPage{4}='Please do not rush, be careful in your work, and most importantly try your best!';
        introTestPage{5}='Press "return" to begin the adaptive quiz.';
    elseif ismember(grv.product_area,[3 29])
        introTestPage{1}=' ';
        introTestPage{2}='You were in the midst of an adaptive quiz covering one or more modules.';
        introTestPage{3}='This quiz helps the AI know exactly YOUR specific knowledge of these modules at this time.';
        introTestPage{4}='Please do not rush, be careful in your work, and most importantly try your best!';
        introTestPage{5}='Press "return" to continue the adaptive quiz.';
    elseif ismember(grv.product_area,[5 27]) && grv.areaPos==0
        introTestPage{1}=' ';
        introTestPage{2}='It is time to take a comprehensive adaptive TEST covering the entire course and everything you learned.';
        introTestPage{3}='This test helps the AI figure out YOUR specific knowledge of the entire course at this time.';
        introTestPage{4}='Please do not rush, be careful in your work, and most importantly try your best!';
        introTestPage{5}='Press "return" to begin the adaptive test.';
    elseif ismember(grv.product_area,[5 27])
        introTestPage{1}=' ';
        introTestPage{2}='You were in the midst of a comprehensive adaptive TEST covering the entire course and everything you learned.';
        introTestPage{3}='This test helps the AI figure out YOUR specific knowledge of the entire course at this time.';
        introTestPage{4}='Please do not rush, be careful in your work, and most importantly try your best!';
        introTestPage{5}='Press "return" to continue the adaptive test.';
    elseif grv.product_area==13 && grv.areaPos==0
        introTestPage{1}=' ';
        introTestPage{2}='It is time to take the comprehensive adaptive FINAL covering the entire course and everything you learned.';
        introTestPage{3}='This test will determine your mastery of the course, and if you do well you can earn a course Mastered Badge.';
        introTestPage{4}='Please do not rush, be careful in your work, and most importantly try your best!';
        introTestPage{5}='Press "return" to begin the adaptive test.';
    elseif grv.product_area==13
        introTestPage{1}=' ';
        introTestPage{2}='You were in the midst of the comprehensive adaptive FINAL covering the entire course and everything you learned.';
        introTestPage{3}='This test will determine your mastery of the course, and if you do well you can earn a course Mastered Badge.';
        introTestPage{4}='Please do not rush, be careful in your work, and most importantly try your best!';
        introTestPage{5}='Press "return" to continue the adaptive test.';
    elseif grv.product_area==15 && grv.areaPos==0
        introTestPage{1}=' ';
        introTestPage{2}='It is time to take a short, comprehensive adaptive QUIZ covering the entire course and everything you learned.';
        introTestPage{3}='This test helps the AI figure out YOUR specific knowledge of the entire course at this time.';
        introTestPage{4}='Please do not rush, be careful in your work, and most importantly try your best!';
        introTestPage{5}='Press "return" to begin the adaptive test.';
    elseif grv.product_area==15
        introTestPage{1}=' ';
        introTestPage{2}='You were in the midst of a short, comprehensive adaptive QUIZ covering the entire course and everything you learned.';
        introTestPage{3}='This test helps the AI figure out YOUR specific knowledge of the entire course at this time.';
        introTestPage{4}='Please do not rush, be careful in your work, and most importantly try your best!';
        introTestPage{5}='Press "return" to continue the adaptive test.';
    elseif grv.product_area==17 && grv.areaPos==0
        introTestPage{1}=' ';
        introTestPage{2}='It is time to take an adaptive quiz mostly covering topics you have recently learned.';
        introTestPage{3}='This quiz helps the AI know exactly YOUR specific knowledge of these topics at this time.';
        introTestPage{4}='Please do not rush, be careful in your work, and most importantly try your best!';
        introTestPage{5}='Press "return" to begin the adaptive quiz.';
    elseif grv.product_area==17
        introTestPage{1}=' ';
        introTestPage{2}='You were in the midst of an adaptive quiz mostly covering topics you have recently learned.';
        introTestPage{3}='This quiz helps the AI figure out YOUR specific knowledge of these topics at this time.';
        introTestPage{4}='Please do not rush, be careful in your work, and most importantly try your best!';
        introTestPage{5}='Press "return" to continue the adaptive quiz.';
    elseif ismember(grv.product_area,[31 33]) && grv.areaPos==0
        introTestPage{1}=' ';
        introTestPage{2}='You have chosen to go through the TEST BANK questions for this course in order.';
        introTestPage{3}='Press "return" to begin this process.';
    elseif ismember(grv.product_area,[31 33])
        introTestPage{1}=' ';
        introTestPage{2}='You were in the midst of going through the TEST BANK questions for this course.';
        introTestPage{3}='Press "return" to continue this process.';
    end
end    
for i=1:length(introTestPage)-1
    disp(introTestPage{i})
end
input(introTestPage{end},'s');
end

