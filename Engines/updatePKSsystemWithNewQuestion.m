function [questionPKS,questionPKSlearn,modelHistory] = updatePKSsystemWithNewQuestion(studentHistoryLastQ,modelHistory)

global questionModelMap modelParameters nChannels KPcontentMap
%First, extract the new question info.
newQindex=studentHistoryLastQ.question_index;
newQcorrectness=studentHistoryLastQ.correctness;
newQweights=questionModelMap.weights(newQindex,:);
newQcenter=questionModelMap.centerValue(newQindex);
newQisTest=studentHistoryLastQ.is_testQ;
newQ_KP=questionModelMap.KP_index(newQindex);
newQ_lesson=KPcontentMap.L3_index(newQ_KP);
newQ_unit=KPcontentMap.L2_index(newQ_KP);


%Next, compute the costParam for the Global History (all questions).
%Note that params=modelParameters(1:3) are these parameters, with params(1) being the  start (min) of the ramp, 
%params(2) is the slope for the ramp (the increment for each additional question), and params(3) is the max costParam.
params=modelParameters(1:3);
costParamComputed=params(1)+(modelHistory.Nglobal)*params(2);
costParamMax=params(3);
costParam=min(costParamComputed,costParamMax);

%Now, we compute the new student abilities for the Global History based on the new question and the student's correctness.   
%See the notes in getStudentAbilities for more, but this is the function that uses the Newton Method with the just
%computed costParam and the new questions's centers and weights, to numerically find the set of studentAbilities
%that maximize the likelihood of the student's correctness with the new question.
currentSAsGLOBAL=modelHistory.SAsBeforeQ_GLOBAL;
newSAsGLOBAL=zeros(size(currentSAsGLOBAL));
shiftsSoFar=0;
newQadj=0;
for i=1:nChannels
    [newSAsGLOBAL(i), fitDetailsForDEBUG] =getStudentAbilities(newQweights(i),newQcenter,newQadj,newQcorrectness,costParam,...
                                                               currentSAsGLOBAL(:,i),shiftsSoFar);
    %fitDetailsForDEBUG
    if i < nChannels
        shiftsSoFar=shiftsSoFar + currentSAsGLOBAL(i)*newQweights(i);
    end
    weightGlobal=min(modelHistory.Nglobal+1,modelParameters(14));
end

%Next, we check whether the new question is from a "Test environment" (is_testQ==1) or not (is_testQ==1).   
%If it is a Test question, then we must update the student abilities for the "Raw" Test history (Scenario 1).
%If it is not a Test question, then we don't have to update these abilities for the "Raw" Test history (Scenario 2).
%
%Scenario 1: 
%Note that when updating the student abilities for the Test history, newSAsTESTraw, we use a similar approach as above. 
%We first compute the costParam for the Test History (question where is_testQ==1).
%Note that params=modelParameters(6:8) are these parameters, with params(1) being the  start (min) of the ramp, 
%params(2) is the slope for the ramp (the increment for each additional question), and params(3) is the max costParam.
%We then use the exact same system as used above to compute the new student abilities.
%
%Then, once we have computed newSAsTESTraw, we mix them with the newSAsGLOBAL to get the final Test abilities, newSAsTESTfinal.
%Note that in mixing the the two set of abilities we use modelParameters(9) and modelParameters(14).
%We also use modelHistory.Nglobal and modelHistory.Ntest
%
%Scenario 2: 
%Here, the new question was not from a test, and so we don't need to update the raw Test abilities. 
%But we still need to mix the newSAsGLOBAL with the old test abilities, modelHistory.SAsBeforeQ_TESTraw.
%To do this, it is very similar to the last part of Scenario 1, but just different abilities.
if newQisTest==1 && modelParameters(26)==1
    params=modelParameters(6:8);
    costParamComputed=params(1)+(modelHistory.Ntest)*params(2);
    costParamMax=params(3);
    costParam=min(costParamComputed,costParamMax);
    currentSAsTESTraw=modelHistory.SAsBeforeQ_TESTraw;
    newSAsTESTraw=zeros(size(currentSAsTESTraw));
    shiftsSoFar=0;
    newQadj=questionModelMap.iqta(newQindex);
    for i=1:nChannels
        [newSAsTESTraw(i), fitDetailsForDEBUG] =getStudentAbilities(newQweights(i),newQcenter,newQadj,newQcorrectness,costParam,...
                                                                    currentSAsTESTraw(:,i),shiftsSoFar);
        %fitDetailsForDEBUG
        if i < nChannels
            shiftsSoFar=shiftsSoFar + currentSAsTESTraw(i)*newQweights(i);
        end
    end
    weightTest=min(modelParameters(20)*(modelHistory.Ntest+1)+modelParameters(19),modelParameters(21));
    weightTest(weightTest<0)=0;
    
    if modelParameters(27)==1
        params=modelParameters(29:31);
        costParamComputed=params(1)+(modelHistory.NtestUnit(newQ_unit))*params(2);
        costParamMax=params(3);
        costParam=min(costParamComputed,costParamMax);
        currentSAs_unitTESTraw=modelHistory.SAsBeforeQ_UnitTESTraw{newQ_unit};
        newSAs_unitTESTraw=zeros(size(currentSAs_unitTESTraw));
        shiftsSoFar=0;
        for i=1:nChannels
            [newSAs_unitTESTraw(i), fitDetailsForDEBUG] =getStudentAbilities(newQweights(i),newQcenter,newQadj,newQcorrectness,costParam,...
                                                                             currentSAs_unitTESTraw(:,i),shiftsSoFar);
            %fitDetailsForDEBUG
            if i < nChannels
                shiftsSoFar=shiftsSoFar + currentSAs_unitTESTraw(i)*newQweights(i);
            end
        end
        weightUnitTest=min(modelParameters(34)*(modelHistory.NtestUnit(newQ_unit)+1)+modelParameters(33),modelParameters(35));
        weightUnitTest(weightUnitTest<0)=0;
    end

    if modelParameters(28)==1
        params=modelParameters(15:17);
        costParamComputed=params(1)+(modelHistory.NtestLesson(newQ_lesson))*params(2);
        costParamMax=params(3);
        costParam=min(costParamComputed,costParamMax);
        currentSAs_lessonTESTraw=modelHistory.SAsBeforeQ_LessonTESTraw{newQ_lesson};
        newSAs_lessonTESTraw=zeros(size(currentSAs_lessonTESTraw));
        shiftsSoFar=0;
        for i=1:nChannels
            [newSAs_lessonTESTraw(i), fitDetailsForDEBUG] =getStudentAbilities(newQweights(i),newQcenter,newQadj,newQcorrectness,costParam,...
                                                                                currentSAs_lessonTESTraw(:,i),shiftsSoFar);
            %fitDetailsForDEBUG
            if i < nChannels
                shiftsSoFar=shiftsSoFar + currentSAs_lessonTESTraw(i)*newQweights(i);
            end
        end       
        weightLessonTest=min(modelParameters(23)*(modelHistory.NtestLesson(newQ_lesson)+1)+modelParameters(22),modelParameters(24));
        weightLessonTest(weightLessonTest<0)=0;
    end
    
    if isequal(modelParameters(26:28),[1 1 1]')
        newSAsTESTforLesson=(weightGlobal*newSAsGLOBAL+weightTest*modelParameters(9)*newSAsTESTraw ...
                             + weightLessonTest*modelParameters(18)*newSAs_lessonTESTraw ...
                             + weightUnitTest*modelParameters(32)*newSAs_unitTESTraw)...
                             ./(weightGlobal+weightTest*modelParameters(9)+weightLessonTest*modelParameters(18)+weightUnitTest*modelParameters(32));
    elseif isequal(modelParameters(26:28),[1 0 1]')
        newSAsTESTforLesson=(weightGlobal*newSAsGLOBAL+weightTest*modelParameters(9)*newSAsTESTraw ...
                             + weightLessonTest*modelParameters(18)*newSAs_lessonTESTraw) ...
                             ./(weightGlobal+weightTest*modelParameters(9)+weightLessonTest*modelParameters(18));
    elseif isequal(modelParameters(26:28),[1 1 0]')
        newSAsTESTforUnit=(weightGlobal*newSAsGLOBAL+weightTest*modelParameters(9)*newSAsTESTraw ...
                             + weightUnitTest*modelParameters(32)*newSAs_unitTESTraw)...
                             ./(weightGlobal+weightTest*modelParameters(9)+weightUnitTest*modelParameters(32));
    end
elseif modelParameters(26)==1
    weightGlobal=min(modelHistory.Nglobal+1,modelParameters(14));
    
    if modelHistory.Ntest==0
        weightTest=0;
    else
        weightTest=min(modelParameters(20)*modelHistory.Ntest+modelParameters(19),modelParameters(21));
    end
    weightTest(weightTest<0)=0;

    if modelParameters(27)==1
        if modelHistory.NtestUnit(newQ_unit)==0
            weightUnitTest=0;
        else
            weightUnitTest=min(modelParameters(34)*modelHistory.NtestUnit(newQ_unit)+modelParameters(33),modelParameters(35));
        end
        weightUnitTest(weightUnitTest<0)=0;
    end
    
    if modelParameters(28)==1
        if modelHistory.NtestLesson(newQ_lesson)==0
            weightLessonTest=0;
        else
            weightLessonTest=min(modelParameters(23)*modelHistory.NtestLesson(newQ_lesson)+modelParameters(22),modelParameters(24));
        end
        weightLessonTest(weightLessonTest<0)=0;
    end

    if isequal(modelParameters(26:28),[1 1 1]')
        newSAsTESTforLesson=(weightGlobal*newSAsGLOBAL+weightTest*modelParameters(9)*modelHistory.SAsBeforeQ_TESTraw ...
                            +weightLessonTest*modelParameters(18)*modelHistory.SAsBeforeQ_LessonTESTraw{newQ_lesson} ...
                            +weightUnitTest*modelParameters(32)*modelHistory.SAsBeforeQ_UnitTESTraw{newQ_unit})...
                            ./(weightGlobal+weightTest*modelParameters(9)+weightLessonTest*modelParameters(18)+weightUnitTest*modelParameters(32));
    elseif isequal(modelParameters(26:28),[1 0 1]')
        newSAsTESTforLesson=(weightGlobal*newSAsGLOBAL+weightTest*modelParameters(9)*modelHistory.SAsBeforeQ_TESTraw...
                            +weightLessonTest*modelParameters(18)*modelHistory.SAsBeforeQ_LessonTESTraw{newQ_lesson})...
                            ./(weightGlobal+weightTest*modelParameters(9)+weightLessonTest*modelParameters(18)); 
    elseif isequal(modelParameters(26:28),[1 1 0]')
        newSAsTESTforUnit=(weightGlobal*newSAsGLOBAL+weightTest*modelParameters(9)*modelHistory.SAsBeforeQ_TESTraw...
                            +weightUnitTest*modelParameters(32)*modelHistory.SAsBeforeQ_UnitTESTraw{newQ_unit})...
                            ./(weightGlobal+weightTest*modelParameters(9)+weightUnitTest*modelParameters(32)); 
    end
elseif modelParameters(26)==0
    weightGlobal=min(modelHistory.Nglobal+1,modelParameters(14));
end


%Next, we update the list of KPs seen by the student. 
%We also classify all question indices into those from KPs seen, and those from not seen KPs. 
if modelHistory.Nglobal==0
    modelHistory.KPsSeenSoFar=newQ_KP;
else
    modelHistory.KPsSeenSoFar=union(modelHistory.KPsSeenSoFar,newQ_KP);
end
qIndicesKPsSeen=find(ismember(questionModelMap.KP_index,modelHistory.KPsSeenSoFar)==1);
qIndicesKPsNotSeen=find(ismember(questionModelMap.KP_index,modelHistory.KPsSeenSoFar)==0);


questionPKSlearn=questionModelMap.centerValue + (newSAsGLOBAL*questionModelMap.weights')';
questionPKSlearn(qIndicesKPsSeen)=questionPKSlearn(qIndicesKPsSeen)+modelParameters(12);
questionPKSlearn(qIndicesKPsNotSeen)=questionPKSlearn(qIndicesKPsNotSeen)+modelParameters(13);
questionPKSlearn=normcdfParallel(questionPKSlearn);
questionPKSlearn(questionPKSlearn>0.993)=0.993;
questionPKSlearn=round(questionPKSlearn,4);


%Next we compute questionPKS, which is the PKS for the questions when given in a Test scenario.
%This is the primary PKS that we will use throughout the system. That is why we don't even mention "test" in the title.
%Note modelParameters(10) is a constant adjustment (before we do normcdf, so still in Z units) for questions from KPs seen.
%And modelParameters(11) is a constant adjustment (before we do normcdf, so still in Z units) for questions from KPs NOT seen.
%Finally all PKSs above 0.993 are set to 0.993 (the max PKS we allow).
if isequal(modelParameters(26:28),[1 0 0]')
    if newQisTest==1
        newSAsTESTglobal=(weightGlobal*newSAsGLOBAL+weightTest*modelParameters(9)*newSAsTESTraw)./(weightGlobal+weightTest*modelParameters(9));

    else
        newSAsTESTglobal=(weightGlobal*newSAsGLOBAL+weightTest*modelParameters(9)*modelHistory.SAsBeforeQ_TESTraw)...
                            ./(weightGlobal+weightTest*modelParameters(9));
    end
    questionPKS=questionModelMap.centerValue + questionModelMap.iqta +(newSAsTESTglobal*questionModelMap.weights')';
    
    questionPKS(qIndicesKPsSeen)=questionPKS(qIndicesKPsSeen)+modelParameters(10);
    questionPKS(qIndicesKPsNotSeen)=questionPKS(qIndicesKPsNotSeen)+modelParameters(11);
    questionPKS=normcdfParallel(questionPKS);
    questionPKS(questionPKS>0.993)=0.993;
    questionPKS=round(questionPKS,4);

    if newQisTest==1
        modelHistory.SAsBeforeQ_TESTraw=newSAsTESTraw;
        modelHistory.lastQtest=newQindex;
        modelHistory.correctnessLastQtest=newQcorrectness;
        modelHistory.Ntest=modelHistory.Ntest+1;
    end
elseif isequal(modelParameters(26:28),[1 0 1]')
    lessons=unique(KPcontentMap.L3_index);
    questionPKS=zeros(size(questionModelMap,1),1);
    for i=1:length(lessons)
        qIndicesLesson=find(ismember(questionModelMap.KP_index,KPcontentMap.KP_index(KPcontentMap.L3_index==lessons(i))));
        if i==newQ_lesson
            questionPKS(qIndicesLesson)=questionModelMap.centerValue(qIndicesLesson) + questionModelMap.iqta(qIndicesLesson)...
                                        +(newSAsTESTforLesson*questionModelMap.weights(qIndicesLesson,:)')';
        else
            if modelHistory.NtestLesson(i)==0
                weightLessonTest=0;
            else
                weightLessonTest=min(modelParameters(23)*modelHistory.NtestLesson(i)+modelParameters(22),modelParameters(24));
                weightLessonTest(weightLessonTest<0)=0;
            end
            if newQisTest==1
                tempSAs = (weightGlobal*newSAsGLOBAL + weightTest*modelParameters(9)*newSAsTESTraw ...
                           + weightLessonTest*modelParameters(18)*modelHistory.SAsBeforeQ_LessonTESTraw{i}) ...
                                ./(weightGlobal+weightTest*modelParameters(9)+weightLessonTest*modelParameters(18));
            else
                tempSAs = (weightGlobal*newSAsGLOBAL + weightTest*modelParameters(9)*modelHistory.SAsBeforeQ_TESTraw ...
                           + weightLessonTest*modelParameters(18)*modelHistory.SAsBeforeQ_LessonTESTraw{i})...
                                ./(weightGlobal+weightTest*modelParameters(9)+weightLessonTest*modelParameters(18));
            end
            questionPKS(qIndicesLesson)=questionModelMap.centerValue(qIndicesLesson) + questionModelMap.iqta(qIndicesLesson)...
                                        + (tempSAs*questionModelMap.weights(qIndicesLesson,:)')';
        end                                
    end

    questionPKS(qIndicesKPsSeen)=questionPKS(qIndicesKPsSeen)+modelParameters(10);
    questionPKS(qIndicesKPsNotSeen)=questionPKS(qIndicesKPsNotSeen)+modelParameters(11);
    questionPKS=normcdfParallel(questionPKS);
    questionPKS(questionPKS>0.993)=0.993;
    questionPKS=round(questionPKS,4);

    if newQisTest==1
        modelHistory.SAsBeforeQ_TESTraw=newSAsTESTraw;
        modelHistory.lastQtest=newQindex;
        modelHistory.correctnessLastQtest=newQcorrectness;
        modelHistory.Ntest=modelHistory.Ntest+1;
        modelHistory.SAsBeforeQ_LessonTESTraw{newQ_lesson}=newSAs_lessonTESTraw;
        modelHistory.lastQtestLesson(newQ_lesson)=newQindex;
        modelHistory.correctnessLastQtestLesson(newQ_lesson)=newQcorrectness;
        modelHistory.NtestLesson(newQ_lesson)=modelHistory.NtestLesson(newQ_lesson)+1;
    end
elseif isequal(modelParameters(26:28),[1 1 1]')
    units=unique(KPcontentMap.L2_index);
    questionPKS=zeros(size(questionModelMap,1),1);
    for i=1:length(units)
        if i==newQ_unit
            weightUnitTest=min(modelParameters(34)*(modelHistory.NtestUnit(i)+1)+modelParameters(33),modelParameters(35));
            weightUnitTest(weightUnitTest<0)=0;
            lessons=unique(KPcontentMap.L3_index(KPcontentMap.KP_index(KPcontentMap.L2_index==units(i))));
            for count=1:length(lessons)
                j=lessons(count);
                qIndicesLesson=find(ismember(questionModelMap.KP_index,KPcontentMap.KP_index(KPcontentMap.L3_index==j)));
                if j==newQ_lesson
                    questionPKS(qIndicesLesson)=questionModelMap.centerValue(qIndicesLesson) + questionModelMap.iqta(qIndicesLesson)...
                                           +(newSAsTESTforLesson*questionModelMap.weights(qIndicesLesson,:)')';
                else
                    if modelHistory.NtestLesson(j)==0
                        weightLessonTest=0;
                    else
                        weightLessonTest=min(modelParameters(23)*modelHistory.NtestLesson(j)+modelParameters(22),modelParameters(24));
                        weightLessonTest(weightLessonTest<0)=0;
                    end

                    if newQisTest==1
                        tempSAs = (weightGlobal*newSAsGLOBAL + weightTest*modelParameters(9)*newSAsTESTraw ...
                                   + weightLessonTest*modelParameters(18)*modelHistory.SAsBeforeQ_LessonTESTraw{j} ...
                                   + weightUnitTest*modelParameters(32)*newSAs_unitTESTraw) ...
                                  ./(weightGlobal+weightTest*modelParameters(9)+weightLessonTest*modelParameters(18)+weightUnitTest*modelParameters(32));
                    else
                        if modelHistory.NtestUnit(i)==0
                            weightUnitTest=0;
                        end
                        tempSAs = (weightGlobal*newSAsGLOBAL + weightTest*modelParameters(9)*modelHistory.SAsBeforeQ_TESTraw ...
                                   + weightLessonTest*modelParameters(18)*modelHistory.SAsBeforeQ_LessonTESTraw{j}...
                                   + weightUnitTest*modelParameters(32)*modelHistory.SAsBeforeQ_UnitTESTraw{i}) ...
                                  ./(weightGlobal+weightTest*modelParameters(9)+weightLessonTest*modelParameters(18)+weightUnitTest*modelParameters(32));
                    end
                    questionPKS(qIndicesLesson)=questionModelMap.centerValue(qIndicesLesson) + questionModelMap.iqta(qIndicesLesson)...
                                                + (tempSAs*questionModelMap.weights(qIndicesLesson,:)')';
                end
            end
        else  
            if modelHistory.NtestUnit(i)==0
                weightUnitTest=0;
            else
                weightUnitTest=min(modelParameters(34)*modelHistory.NtestUnit(i)+modelParameters(33),modelParameters(35));
                weightUnitTest(weightUnitTest<0)=0;
            end
            lessons=unique(KPcontentMap.L3_index(KPcontentMap.KP_index(KPcontentMap.L2_index==units(i))));
            for count=1:length(lessons)
                j=lessons(count);
                qIndicesLesson=find(ismember(questionModelMap.KP_index,KPcontentMap.KP_index(KPcontentMap.L3_index==j)));
                if modelHistory.NtestLesson(j)==0
                    weightLessonTest=0;
                else
                    weightLessonTest=min(modelParameters(23)*modelHistory.NtestLesson(j)+modelParameters(22),modelParameters(24));
                    weightLessonTest(weightLessonTest<0)=0;
                end
                if newQisTest==1
                    tempSAs = (weightGlobal*newSAsGLOBAL + weightTest*modelParameters(9)*newSAsTESTraw ...
                               + weightLessonTest*modelParameters(18)*modelHistory.SAsBeforeQ_LessonTESTraw{j} ...
                               + weightUnitTest*modelParameters(32)*modelHistory.SAsBeforeQ_UnitTESTraw{i}) ...
                              ./(weightGlobal+weightTest*modelParameters(9)+weightLessonTest*modelParameters(18)+weightUnitTest*modelParameters(32));
                else
                    tempSAs = (weightGlobal*newSAsGLOBAL + weightTest*modelParameters(9)*modelHistory.SAsBeforeQ_TESTraw ...
                               + weightLessonTest*modelParameters(18)*modelHistory.SAsBeforeQ_LessonTESTraw{j}...
                               + weightUnitTest*modelParameters(32)*modelHistory.SAsBeforeQ_UnitTESTraw{i}) ...
                              ./(weightGlobal+weightTest*modelParameters(9)+weightLessonTest*modelParameters(18)+weightUnitTest*modelParameters(32));
                end
                questionPKS(qIndicesLesson)=questionModelMap.centerValue(qIndicesLesson) + questionModelMap.iqta(qIndicesLesson)...
                                            + (tempSAs*questionModelMap.weights(qIndicesLesson,:)')';
            end
        end
    end

    questionPKS(qIndicesKPsSeen)=questionPKS(qIndicesKPsSeen)+modelParameters(10);
    questionPKS(qIndicesKPsNotSeen)=questionPKS(qIndicesKPsNotSeen)+modelParameters(11);
    questionPKS=normcdfParallel(questionPKS);
    questionPKS(questionPKS>0.993)=0.993;
    questionPKS=round(questionPKS,4);

    if newQisTest==1
        modelHistory.SAsBeforeQ_TESTraw=newSAsTESTraw;
        modelHistory.lastQtest=newQindex;
        modelHistory.correctnessLastQtest=newQcorrectness;
        modelHistory.Ntest=modelHistory.Ntest+1;
        modelHistory.SAsBeforeQ_UnitTESTraw{newQ_unit}=newSAs_unitTESTraw;
        modelHistory.lastQtestUnit(newQ_unit)=newQindex;
        modelHistory.correctnessLastQtestUnit(newQ_unit)=newQcorrectness;
        modelHistory.NtestUnit(newQ_unit)=modelHistory.NtestUnit(newQ_unit)+1;
        modelHistory.SAsBeforeQ_LessonTESTraw{newQ_lesson}=newSAs_lessonTESTraw;
        modelHistory.lastQtestLesson(newQ_lesson)=newQindex;
        modelHistory.correctnessLastQtestLesson(newQ_lesson)=newQcorrectness;
        modelHistory.NtestLesson(newQ_lesson)=modelHistory.NtestLesson(newQ_lesson)+1;
    end
elseif isequal(modelParameters(26:28),[1 1 0]')
    units=unique(KPcontentMap.L2_index);
    questionPKS=zeros(size(questionModelMap,1),1);
    for i=1:length(units)
        qIndicesUnit=find(ismember(questionModelMap.KP_index,KPcontentMap.KP_index(KPcontentMap.L2_index==units(i))));
        if i==newQ_unit
            questionPKS(qIndicesUnit)=questionModelMap.centerValue(qIndicesUnit) + questionModelMap.iqta(qIndicesUnit) ...
                                        + (newSAsTESTforUnit*questionModelMap.weights(qIndicesUnit,:)')';
        else
            if modelHistory.NtestUnit(i)==0
                weightUnitTest=0;
            else
                weightUnitTest=min(modelParameters(34)*modelHistory.NtestUnit(i)+modelParameters(33),modelParameters(35));
                weightUnitTest(weightUnitTest<0)=0;
            end
            if newQisTest==1
                tempSAs = (weightGlobal*newSAsGLOBAL + weightTest*modelParameters(9)*newSAsTESTraw ...
                           + weightUnitTest*modelParameters(32)*modelHistory.SAsBeforeQ_UnitTESTraw{i})...
                                ./(weightGlobal+weightTest*modelParameters(9)+weightUnitTest*modelParameters(32));
            else
                tempSAs = (weightGlobal*newSAsGLOBAL + weightTest*modelParameters(9)*modelHistory.SAsBeforeQ_TESTraw ...
                           + weightUnitTest*modelParameters(32)*modelHistory.SAsBeforeQ_UnitTESTraw{i})...
                                ./(weightGlobal+weightTest*modelParameters(9)+weightUnitTest*modelParameters(32));
            end
            questionPKS(qIndicesUnit)=questionModelMap.centerValue(qIndicesUnit) + questionModelMap.iqta(qIndicesUnit) ...
                                      + (tempSAs*questionModelMap.weights(qIndicesUnit,:)')';
        end                                
    end

    questionPKS(qIndicesKPsSeen)=questionPKS(qIndicesKPsSeen)+modelParameters(10);
    questionPKS(qIndicesKPsNotSeen)=questionPKS(qIndicesKPsNotSeen)+modelParameters(11);
    questionPKS=normcdfParallel(questionPKS);
    questionPKS(questionPKS>0.993)=0.993;
    questionPKS=round(questionPKS,4);

    if newQisTest==1
        modelHistory.SAsBeforeQ_TESTraw=newSAsTESTraw;
        modelHistory.lastQtest=newQindex;
        modelHistory.correctnessLastQtest=newQcorrectness;
        modelHistory.Ntest=modelHistory.Ntest+1;
        modelHistory.SAsBeforeQ_UnitTESTraw{newQ_unit}=newSAs_unitTESTraw;
        modelHistory.lastQtestUnit(newQ_unit)=newQindex;
        modelHistory.correctnessLastQtestUnit(newQ_unit)=newQcorrectness;
        modelHistory.NtestUnit(newQ_unit)=modelHistory.NtestUnit(newQ_unit)+1;
    end
else
    %Now we compute questionPKSlearn. 
    %Note modelParameters(12) is a constant adjustment (before we do normcdf, so still in Z units) for questions from KPs seen.
    %And modelParameters(13) is a constant adjustment (before we do normcdf, so still in Z units) for questions from KPs NOT seen.
    %Finally all PKSs above 0.993 are set to 0.993 (the max PKS we allow).
    
    questionPKS=questionPKSlearn;
    questionPKS(qIndicesKPsSeen)=questionPKSlearn(qIndicesKPsSeen)+modelParameters(10);
    questionPKS(qIndicesKPsNotSeen)=questionPKSlearn(qIndicesKPsNotSeen)+modelParameters(11);
    
    questionPKSlearn=normcdfParallel(questionPKSlearn);
    questionPKSlearn(questionPKSlearn>0.993)=0.993;
    questionPKSlearn=round(questionPKSlearn,4);
    
    questionPKS=normcdfParallel(questionPKS);
    questionPKS(questionPKS>0.993)=0.993;
    questionPKS=round(questionPKS,4);
end


%Lastly, we update the modelHistory with all the new info
modelHistory.SAsBeforeQ_GLOBAL=newSAsGLOBAL;
modelHistory.lastQglobal=newQindex;
modelHistory.correctnessLastQglobal=newQcorrectness;
modelHistory.Nglobal=modelHistory.Nglobal+1;

end
            
            
                
                
                
                
    


