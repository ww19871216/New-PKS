function loggedOut=getNextProductArea

global grv_fn grv

disp(' ')
disp(' ')
preamble=('What would you like to do now?');
nCategories=11;
categories=cell(nCategories,1);
categories{1}=['Reset the AI and retake the Initial Comprehensive Test.'];
categories{2}=['Take a shorter adaptive test on one or more modules.'];
categories{3}=['Take a Comprehensive Adaptive Test that will reset your Knowledge State.'];
categories{4}=['Update the model with a batch of questions that the student has answered.'];
categories{5}=['Update the model with the student''s non-adaptive final exam.'];
categories{6}=['View the knowledge report for your last submitted work in the system.'];
categories{7}=['View past knowledge reports that you select.'];
categories{8}=['VIEW KNOWLEDGE HISTORIES FOR ALL STUDENTS IN COURSE.'];
categories{9}=['Take a Test Consisting of All Questions In Test Bank.'];
categories{10}=['Take a Test over a fixed set of questions in order from Test Bank.'];
categories{11}=['Logout.'];
answer=getUserAnswerForOptions(categories,nCategories,preamble);
loggedOut=0;
if answer==1
    disp('Okay you have chosen to reset the AI and retake the Initial Comprehensive Test.')
    grv.product_area=5;
    grv.areaPos=0;
elseif answer==2
    disp('Okay you have chosen to take a shorter adaptive test on one or more modules.')
    grv.product_area=3;
    grv.areaPos=0;
elseif answer==3
    disp('Okay you have chosen to take a Comprehensive Adapative Test that will reset your Knowledge State.')
    grv.product_area=5;
    grv.areaPos=0;
elseif answer==4
    disp('Okay you have chosen to update the model with a batch of questions that the student has answered.')
    grv.product_area=7;
    grv.areaPos=0;
elseif answer==5
    disp('Okay you have chosen to update the model with the student''s non-adaptive final exam.')
    grv.product_area=9;
    grv.areaPos=0;
elseif answer==6
    disp('Okay you have chosen to view the knowledge report for your last submitted work in the system.')
    grv.product_area=11;
    grv.areaPos=0;
elseif answer==7
    disp('Okay you have chosen to view past knowledge reports that you select.')
    grv.product_area=12;
    grv.areaPos=0;
elseif answer==8
    disp('Okay you have chosen to VIEW KNOWLEDGE HISTORIES FOR ALL STUDENTS IN COURSE.')
    grv.product_area=51;
    grv.areaPos=0;
elseif answer==9
    disp('Okay you have chosen to take a test with all the test bank questions.')
    grv.product_area=31;
    grv.areaPos=0;
elseif answer==10
    disp('Okay you have chosen to take a test over a fit set of questions in order.')
    grv.product_area=33;
    grv.areaPos=0;
elseif answer==11
    disp('Okay you have chosen to Logout.')
    grv.product_area=1000;
    grv.areaPos=0;
    loggedOut=1;
end

save(grv_fn,'grv')

disp(' ')
if loggedOut==0
    pause(2)
end
end

