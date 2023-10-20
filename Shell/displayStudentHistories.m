function displayStudentHistories

global grv grv_fn lrv lrv_fn

load(grv_fn,'grv')
load(lrv_fn,'lrv') 

done=0;
while done==0
    if grv.areaPos==1 
        t=lrv.chrL3display;
        [~,pos]=unique(t.student_id,'last');
        t=t(pos,:);
        displayTable(t,'Latest Results ALL Students: L3',1);
        t=lrv.chrKPdisplay;
        [~,pos]=unique(t.student_id,'last');
        t=t(pos,:);
        displayTable(t,'Latest Results ALL Students: KP',1);  
    elseif grv.areaPos==2
        t=lrv.chrL3display;
        displayTable(t,'Complete Results ALL Students: L3',1);
        t=lrv.chrKPdisplay;
        displayTable(t,'Complete Results ALL Students: KP',1);
    elseif grv.areaPos==3
        t=lrv.chrL3display;
        pos=find(ismember(t.student_id,lrv.studentToShow));
        t=t(pos,:);
        displayTable(t,['Complete L3 Results For Student ' lrv.studentToShow{1}],1);
        t=lrv.chrKPdisplay;
        pos=find(ismember(t.student_id,lrv.studentToShow));
        t=t(pos,:);
        displayTable(t,['Complete KP Results For Student ' lrv.studentToShow{1}],1);
    end
    preamble=('What would you like to do now?');
    nCategories=4;
    categories=cell(nCategories,1);
    categories{1}=['Display the latest results for all students.'];
    categories{2}=['Display the complete results for all students.'];
    categories{3}=['Display the complete results for a single student.'];
    categories{4}=['Go back to the home page.'];
    answer=getUserAnswerForOptions(categories,nCategories,preamble);
    if answer==1
        disp('Okay, here are the latest results for all students.')
        grv.areaPos=1;
        lrv.studentToShow=-1;
    elseif answer==2
        disp('Okay, here are the the complete results for all students.')
        grv.areaPos=2;
        lrv.studentToShow=-1;
    elseif answer==3
        tempy=lrv.chrL3;
        student_ids=unique(tempy.student_id);
        nCategories=length(student_ids);
        preamble=('Okay, all students in the course are shown below. Which do you want to see?');
        answer=getUserAnswerForOptions(student_ids,nCategories,preamble);
        lrv.studentToShow=student_ids(answer);
        grv.areaPos=3;
    elseif answer==4
        disp('Okay you have chosen to go back to the home page.')
        grv.product_area=1000;
        grv.areaPos=0;
        clear lrv
        lrv.runtimeVarsExist=0;
        done=1;
    end
    save(grv_fn,'grv')
    save(lrv_fn,'lrv') 
end


end

