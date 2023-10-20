function updatePKSsystemWithQuestionBatch

global questionModelMap KPcontentMap modelParameters nChannels
global grv_fn lrv_fn grv lrv


if isempty(grv.studentHistory)
    studentQuestionN=0;
    dataSetNumber=1;
elseif lrv.startNewDataSetWithBatch==1
    [grv.questionPKS,grv.questionPKSlearn,grv.modelHistory] = initializePKSsystem;
    dataSetNumber=max(grv.studentHistory.dataSetNumber) + 1;
    studentQuestionN=max(grv.studentHistory.studentQuestionN);
else
    dataSetNumber=max(grv.studentHistory.dataSetNumber);
    studentQuestionN=max(grv.studentHistory.studentQuestionN);
end

pos=find(ismember(lrv.batchHistory.question_textid,questionModelMap.question_textid)==0);
lrv.batchHistory(pos,:)=[];

batchQindex=zeros(size(lrv.batchHistory.question_textid));
for i=1:length(lrv.batchHistory.question_textid)
    batchQindex(i)=questionModelMap.question_index(ismember(questionModelMap.question_textid,lrv.batchHistory.question_textid(i)));
end
batchQcorrectness=lrv.batchHistory.correctness;
batchQisTest=lrv.batchHistory.is_testQ;
batchQ_KP=questionModelMap.KP_index(batchQindex);
batchQ_lessson=KPcontentMap.L3_index(batchQ_KP);
batchQ_unit=KPcontentMap.L2_index(batchQ_KP);

Nbatch=length(batchQindex);
PKSbeforeQ=zeros(Nbatch,1);
lessons=unique(KPcontentMap.L3_index);
units=unique(KPcontentMap.L2_index);
for h=1:Nbatch
    if batchQisTest(h)==1
        PKSbeforeQ(h)=grv.questionPKS(batchQindex(h));
    else
        PKSbeforeQ(h)=grv.questionPKSlearn(batchQindex(h));
    end
    params=modelParameters(1:3);
    costParamComputed=params(1)+(grv.modelHistory.Nglobal)*params(2);
    costParamMax=params(3);
    costParam=min(costParamComputed,costParamMax);

    currentSAsGLOBAL=grv.modelHistory.SAsBeforeQ_GLOBAL;
    newSAsGLOBAL=zeros(size(currentSAsGLOBAL));
    shiftsSoFar=0;
    newQadj=0;
    for i=1:nChannels
        newSAsGLOBAL(i)=getStudentAbilities(questionModelMap.weights(batchQindex(h),i),questionModelMap.centerValue(batchQindex(h)),...
                                                           newQadj,batchQcorrectness(h),costParam,currentSAsGLOBAL(:,i),shiftsSoFar);
        %fitDetailsForDEBUG
        if i < nChannels
            shiftsSoFar=shiftsSoFar + currentSAsGLOBAL(i)*questionModelMap.weights(batchQindex(h),i);
        end
        weightGlobal=min(grv.modelHistory.Nglobal+1,modelParameters(14));
    end

    if batchQisTest(h)==1 && modelParameters(26)==1
        params=modelParameters(6:8);
        costParamComputed=params(1)+(grv.modelHistory.Ntest)*params(2);
        costParamMax=params(3);
        costParam=min(costParamComputed,costParamMax);
        currentSAsTESTraw=grv.modelHistory.SAsBeforeQ_TESTraw;
        newSAsTESTraw=zeros(size(currentSAsTESTraw));
        shiftsSoFar=0;
        newQadj=questionModelMap.iqta(batchQindex(h));
        for i=1:nChannels
            newSAsTESTraw(i)=getStudentAbilities(questionModelMap.weights(batchQindex(h),i),questionModelMap.centerValue(batchQindex(h)),...
                                                                newQadj,batchQcorrectness(h),costParam,currentSAsTESTraw(:,i),shiftsSoFar);
            %fitDetailsForDEBUG
            if i < nChannels
                shiftsSoFar=shiftsSoFar + currentSAsTESTraw(i)*questionModelMap.weights(batchQindex(h),i);
            end
        end
        weightTest=min(modelParameters(20)*(grv.modelHistory.Ntest+1)+modelParameters(19),modelParameters(21));
        weightTest(weightTest<0)=0;
        
        if modelParameters(27)==1
            params=modelParameters(29:31);
            costParamComputed=params(1)+(grv.modelHistory.NtestUnit(batchQ_unit(h)))*params(2);
            costParamMax=params(3);
            costParam=min(costParamComputed,costParamMax);

            currentSAs_unitTESTraw=grv.modelHistory.SAsBeforeQ_UnitTESTraw{batchQ_unit(h)};
            newSAs_unitTESTraw=zeros(size(currentSAs_unitTESTraw));
            shiftsSoFar=0;
            for i=1:nChannels
                newSAs_unitTESTraw(i) =getStudentAbilities(questionModelMap.weights(batchQindex(h),i),questionModelMap.centerValue(batchQindex(h)),...
                                                                                 newQadj,batchQcorrectness(h),costParam,currentSAs_unitTESTraw(:,i),shiftsSoFar);
                %fitDetailsForDEBUG
                if i < nChannels
                    shiftsSoFar=shiftsSoFar + currentSAs_unitTESTraw(i)*questionModelMap.weights(batchQindex(h),i);
                end
            end
            weightUnitTest=min(modelParameters(34)*(grv.modelHistory.NtestUnit(batchQ_unit(h))+1)+modelParameters(33),modelParameters(35));
            weightUnitTest(weightUnitTest<0)=0;  
        end
        
        if modelParameters(28)==1
            params=modelParameters(15:17);
            costParamComputed=params(1)+(grv.modelHistory.NtestLesson(batchQ_lessson(h)))*params(2);
            costParamMax=params(3);
            costParam=min(costParamComputed,costParamMax);
            currentSAs_lessonTESTraw=grv.modelHistory.SAsBeforeQ_LessonTESTraw{batchQ_lessson(h)};
            newSAs_lessonTESTraw=zeros(size(currentSAs_lessonTESTraw));   
            shiftsSoFar=0;
            for i=1:nChannels
                newSAs_lessonTESTraw(i) =getStudentAbilities(questionModelMap.weights(batchQindex(h),i),questionModelMap.centerValue(batchQindex(h)),...
                                                                                 newQadj,batchQcorrectness(h),costParam,currentSAs_lessonTESTraw(:,i),shiftsSoFar);
                %fitDetailsForDEBUG
                if i < nChannels
                    shiftsSoFar=shiftsSoFar + currentSAs_lessonTESTraw(i)*questionModelMap.weights(batchQindex(h),i);
                end
            end
            weightLessonTest=min(modelParameters(23)*(grv.modelHistory.NtestLesson(batchQ_lessson(h))+1)+modelParameters(22),modelParameters(24));
            weightLessonTest(weightLessonTest<0)=0;
        end
        
        if isequal(modelParameters(26:28),[1 1 1]')
            newSAsTESTforLesson=(weightGlobal*newSAsGLOBAL + weightTest*modelParameters(9)*newSAsTESTraw ...
                                +weightLessonTest*modelParameters(18)*newSAs_lessonTESTraw...
                                +weightUnitTest*modelParameters(32)*newSAs_unitTESTraw)...
                                ./(weightGlobal+weightTest*modelParameters(9)+weightLessonTest*modelParameters(18)+weightUnitTest*modelParameters(32));
        elseif isequal(modelParameters(26:28),[1 0 1]')
            newSAsTESTforLesson=(weightGlobal*newSAsGLOBAL + weightTest*modelParameters(9)*newSAsTESTraw ...
                                +weightLessonTest*modelParameters(18)*newSAs_lessonTESTraw)...
                                ./(weightGlobal+weightTest*modelParameters(9)+weightLessonTest*modelParameters(18));
        elseif isequal(modelParameters(26:28),[1 1 0]')
            newSAsTESTforUnit=(weightGlobal*newSAsGLOBAL + weightTest*modelParameters(9)*newSAsTESTraw ...
                                +weightUnitTest*modelParameters(32)*newSAs_unitTESTraw)...
                                ./(weightGlobal+weightTest*modelParameters(9)+weightUnitTest*modelParameters(32));
        end
    elseif modelParameters(26)==1
        weightGlobal=min(grv.modelHistory.Nglobal+1,modelParameters(14));
        
        if grv.modelHistory.Ntest==0
            weightTest=0;
        else
            weightTest=min(modelParameters(20)*grv.modelHistory.Ntest+modelParameters(19),modelParameters(21));
            weightTest(weightTest<0)=0;
        end

        
        if modelParameters(27)==1
            if grv.modelHistory.NtestUnit(batchQ_unit(h))==0
                weightUnitTest=0;
            else            
                weightUnitTest=min(modelParameters(34)*grv.modelHistory.NtestUnit(batchQ_unit(h))+modelParameters(33),modelParameters(35));
                weightUnitTest(weightUnitTest<0)=0;
            end

        end
        
        if modelParameters(28)==1
            if grv.modelHistory.NtestLesson(batchQ_lessson(h))==0
                weightLessonTest=0;
            else    
                weightLessonTest=min(modelParameters(23)*grv.modelHistory.NtestLesson(batchQ_lessson(h))+modelParameters(22),modelParameters(24));
                weightLessonTest(weightLessonTest<0)=0;
            end
        end
        
        if isequal(modelParameters(26:28),[1 1 1]')
            newSAsTESTforLesson=(weightGlobal*newSAsGLOBAL + weightTest*modelParameters(9)*grv.modelHistory.SAsBeforeQ_TESTraw ...
                    +weightLessonTest*modelParameters(18)*grv.modelHistory.SAsBeforeQ_LessonTESTraw{batchQ_lessson(h)}...
                    +weightUnitTest*modelParameters(32)*grv.modelHistory.SAsBeforeQ_UnitTESTraw{batchQ_unit(h)})...
                    ./(weightGlobal+weightTest*modelParameters(9)+weightLessonTest*modelParameters(18)+weightUnitTest*modelParameters(32));
        elseif isequal(modelParameters(26:28),[1 0 1]')
            newSAsTESTforLesson=(weightGlobal*newSAsGLOBAL + weightTest*modelParameters(9)*grv.modelHistory.SAsBeforeQ_TESTraw ...
                                +weightLessonTest*modelParameters(18)*grv.modelHistory.SAsBeforeQ_LessonTESTraw{batchQ_lessson(h)})...
                                ./(weightGlobal+weightTest*modelParameters(9)+weightLessonTest*modelParameters(18));
        elseif isequal(modelParameters(26:28),[1 1 0]')
            newSAsTESTforUnit=(weightGlobal*newSAsGLOBAL + weightTest*modelParameters(9)*grv.modelHistory.SAsBeforeQ_TESTraw ...
                                +weightUnitTest*modelParameters(32)*grv.modelHistory.SAsBeforeQ_UnitTESTraw{batchQ_unit(h)})...
                                ./(weightGlobal+weightTest*modelParameters(9)+weightUnitTest*modelParameters(32));
        end
    elseif modelParameters(26)==0
        weightGlobal=min(grv.modelHistory.Nglobal+1,modelParameters(14));
    end

    if grv.modelHistory.Nglobal==0
        grv.modelHistory.KPsSeenSoFar=batchQ_KP(h);
    else
        grv.modelHistory.KPsSeenSoFar=union(grv.modelHistory.KPsSeenSoFar,batchQ_KP(h));
    end
    qIndicesKPsSeen=find(ismember(questionModelMap.KP_index,grv.modelHistory.KPsSeenSoFar)==1);
    qIndicesKPsNotSeen=find(ismember(questionModelMap.KP_index,grv.modelHistory.KPsSeenSoFar)==0);

    grv.questionPKSlearn=questionModelMap.centerValue + (newSAsGLOBAL*questionModelMap.weights')';
    grv.questionPKSlearn(qIndicesKPsSeen)=grv.questionPKSlearn(qIndicesKPsSeen)+modelParameters(12);
    grv.questionPKSlearn(qIndicesKPsNotSeen)=grv.questionPKSlearn(qIndicesKPsNotSeen)+modelParameters(13);
    grv.questionPKSlearn=normcdfParallel(grv.questionPKSlearn);
    grv.questionPKSlearn(grv.questionPKSlearn>0.993)=0.993;
    grv.questionPKSlearn=round(grv.questionPKSlearn,4);

    
    if isequal(modelParameters(26:28),[1 0 0]')
        if batchQisTest(h)==1            
            newSAsTESTglobal = (weightGlobal*newSAsGLOBAL + weightTest*modelParameters(9)*newSAsTESTraw)./(weightGlobal+weightTest*modelParameters(9));
        else
            newSAsTESTglobal = (weightGlobal*newSAsGLOBAL + weightTest*modelParameters(9)*grv.modelHistory.SAsBeforeQ_TESTraw)...
                            ./(weightGlobal+weightTest*modelParameters(9));
        end
        grv.questionPKS=questionModelMap.centerValue + questionModelMap.iqta + (newSAsTESTglobal*questionModelMap.weights')';
        
        grv.questionPKS(qIndicesKPsSeen)=grv.questionPKS(qIndicesKPsSeen)+modelParameters(10);
        grv.questionPKS(qIndicesKPsNotSeen)=grv.questionPKS(qIndicesKPsNotSeen)+modelParameters(11);
        grv.questionPKS=normcdfParallel(grv.questionPKS);
        grv.questionPKS(grv.questionPKS>0.993)=0.993;
        grv.questionPKS=round(grv.questionPKS,4);
        
        if batchQisTest(h)==1
            grv.modelHistory.SAsBeforeQ_TESTraw=newSAsTESTraw;
            grv.modelHistory.lastQtest=batchQindex(h);
            grv.modelHistory.correctnessLastQtest=batchQcorrectness(h);
            grv.modelHistory.Ntest=grv.modelHistory.Ntest+1;
        end
    elseif isequal(modelParameters(26:28),[1 0 1]')
        for i=1:length(lessons)
            qIndicesLesson=find(ismember(questionModelMap.KP_index, KPcontentMap.KP_index(KPcontentMap.L3_index==lessons(i))));    
            if i==batchQ_lessson(h)
                grv.questionPKS(qIndicesLesson)=questionModelMap.centerValue(qIndicesLesson) + questionModelMap.iqta(qIndicesLesson) + (newSAsTESTforLesson*questionModelMap.weights(qIndicesLesson,:)')';
            else
                if grv.modelHistory.NtestLesson(i)==0
                    weightLessonTest=0;
                else
                    weightLessonTest=min(modelParameters(23)*grv.modelHistory.NtestLesson(i)+modelParameters(22),modelParameters(24));
                    weightLessonTest(weightLessonTest<0)=0;
                end

                if batchQisTest(h)==1            
                    tempSAs = (weightGlobal*newSAsGLOBAL + weightTest*modelParameters(9)*newSAsTESTraw + weightLessonTest*modelParameters(18)*grv.modelHistory.SAsBeforeQ_LessonTESTraw{i})...
                                    ./(weightGlobal+weightTest*modelParameters(9)+weightLessonTest*modelParameters(18));
                else
                    tempSAs = (weightGlobal*newSAsGLOBAL + weightTest*modelParameters(9)*grv.modelHistory.SAsBeforeQ_TESTraw + weightLessonTest*modelParameters(18)*grv.modelHistory.SAsBeforeQ_LessonTESTraw{i})...
                                    ./(weightGlobal+weightTest*modelParameters(9)+weightLessonTest*modelParameters(18));
                end
                grv.questionPKS(qIndicesLesson)=questionModelMap.centerValue(qIndicesLesson) + questionModelMap.iqta(qIndicesLesson) + (tempSAs*questionModelMap.weights(qIndicesLesson,:)')';
            end                                
        end
        
        grv.questionPKS(qIndicesKPsSeen)=grv.questionPKS(qIndicesKPsSeen)+modelParameters(10);
        grv.questionPKS(qIndicesKPsNotSeen)=grv.questionPKS(qIndicesKPsNotSeen)+modelParameters(11);
        grv.questionPKS=normcdfParallel(grv.questionPKS);
        grv.questionPKS(grv.questionPKS>0.993)=0.993;
        grv.questionPKS=round(grv.questionPKS,4);
        
        if batchQisTest(h)==1
            grv.modelHistory.SAsBeforeQ_TESTraw=newSAsTESTraw;
            grv.modelHistory.lastQtest=batchQindex(h);
            grv.modelHistory.correctnessLastQtest=batchQcorrectness(h);
            grv.modelHistory.Ntest=grv.modelHistory.Ntest+1;
            grv.modelHistory.SAsBeforeQ_LessonTESTraw{batchQ_lessson(h)}=newSAs_lessonTESTraw;
            grv.modelHistory.lastQtestLesson(batchQ_lessson(h))=batchQindex(h);
            grv.modelHistory.correctnessLastQtestLesson(batchQ_lessson(h))=batchQcorrectness(h);
            grv.modelHistory.NtestLesson(batchQ_lessson(h))=grv.modelHistory.NtestLesson(batchQ_lessson(h))+1;
        end
    elseif isequal(modelParameters(26:28),[1 1 1]')
        for i=1:length(units)
            if i==batchQ_unit(h)
                weightUnitTest=min(modelParameters(34)*(grv.modelHistory.NtestUnit(i)+1)+modelParameters(33),modelParameters(35));
                weightUnitTest(weightUnitTest<0)=0;
                lessons=unique(KPcontentMap.L3_index(KPcontentMap.KP_index(KPcontentMap.L2_index==units(i))));
                for count=1:length(lessons)
                    j=lessons(count);
                    qIndicesLesson=find(ismember(questionModelMap.KP_index,KPcontentMap.KP_index(KPcontentMap.L3_index==j)));
                    if j==batchQ_lessson(h)
                        grv.questionPKS(qIndicesLesson)=questionModelMap.centerValue(qIndicesLesson) + questionModelMap.iqta(qIndicesLesson)...
                                                    +(newSAsTESTforLesson*questionModelMap.weights(qIndicesLesson,:)')';         
                    else
                        if grv.modelHistory.NtestLesson(j)==0
                            weightLessonTest=0;
                        else
                            weightLessonTest=min(modelParameters(23)*grv.modelHistory.NtestLesson(j)+modelParameters(22),modelParameters(24));
                            weightLessonTest(weightLessonTest<0)=0;
                        end
                        if batchQisTest(h)==1
                            tempSAs = (weightGlobal*newSAsGLOBAL + weightTest*modelParameters(9)*newSAsTESTraw ...
                                       + weightLessonTest*modelParameters(18)*grv.modelHistory.SAsBeforeQ_LessonTESTraw{j} ...
                                       + weightUnitTest*modelParameters(32)*newSAs_unitTESTraw) ...
                                      ./(weightGlobal+weightTest*modelParameters(9)+weightLessonTest*modelParameters(18)+weightUnitTest*modelParameters(32));
                        else
                            if grv.modelHistory.NtestUnit(i)==0
                                weightUnitTest=0;
                            end
                            tempSAs = (weightGlobal*newSAsGLOBAL + weightTest*modelParameters(9)*grv.modelHistory.SAsBeforeQ_TESTraw ...
                                       + weightLessonTest*modelParameters(18)*grv.modelHistory.SAsBeforeQ_LessonTESTraw{j}...
                                       + weightUnitTest*modelParameters(32)*grv.modelHistory.SAsBeforeQ_UnitTESTraw{i}) ...
                                      ./(weightGlobal+weightTest*modelParameters(9)+weightLessonTest*modelParameters(18)+weightUnitTest*modelParameters(32));
                        end
                        grv.questionPKS(qIndicesLesson)=questionModelMap.centerValue(qIndicesLesson) + questionModelMap.iqta(qIndicesLesson)...
                                                    + (tempSAs*questionModelMap.weights(qIndicesLesson,:)')';
                    end
                end
            else
                if grv.modelHistory.NtestUnit(i)==0
                    weightUnitTest=0;
                else
                    weightUnitTest=min(modelParameters(34)*grv.modelHistory.NtestUnit(i)+modelParameters(33),modelParameters(35));
                    weightUnitTest(weightUnitTest<0)=0;
                end
                lessons=unique(KPcontentMap.L3_index(KPcontentMap.KP_index(KPcontentMap.L2_index==units(i))));
                for count=1:length(lessons)
                    j=lessons(count);
                    qIndicesLesson=find(ismember(questionModelMap.KP_index,KPcontentMap.KP_index(KPcontentMap.L3_index==j)));
                    if grv.modelHistory.NtestLesson(j)==0
                        weightLessonTest=0;
                    else
                        weightLessonTest=min(modelParameters(23)*grv.modelHistory.NtestLesson(j)+modelParameters(22),modelParameters(24));
                        weightLessonTest(weightLessonTest<0)=0;
                    end
                    if batchQisTest(h)==1
                        tempSAs = (weightGlobal*newSAsGLOBAL + weightTest*modelParameters(9)*newSAsTESTraw ...
                                   + weightLessonTest*modelParameters(18)*grv.modelHistory.SAsBeforeQ_LessonTESTraw{j} ...
                                   + weightUnitTest*modelParameters(32)*grv.modelHistory.SAsBeforeQ_UnitTESTraw{i}) ...
                                  ./(weightGlobal+weightTest*modelParameters(9)+weightLessonTest*modelParameters(18)+weightUnitTest*modelParameters(32));
                    else
                        tempSAs = (weightGlobal*newSAsGLOBAL + weightTest*modelParameters(9)*grv.modelHistory.SAsBeforeQ_TESTraw ...
                                   + weightLessonTest*modelParameters(18)*grv.modelHistory.SAsBeforeQ_LessonTESTraw{j}...
                                   + weightUnitTest*modelParameters(32)*grv.modelHistory.SAsBeforeQ_UnitTESTraw{i}) ...
                                  ./(weightGlobal+weightTest*modelParameters(9)+weightLessonTest*modelParameters(18)+weightUnitTest*modelParameters(32));
                    end
                    grv.questionPKS(qIndicesLesson)=questionModelMap.centerValue(qIndicesLesson) + questionModelMap.iqta(qIndicesLesson)...
                                                + (tempSAs*questionModelMap.weights(qIndicesLesson,:)')';
                end
            end
        end
        
        grv.questionPKS(qIndicesKPsSeen)=grv.questionPKS(qIndicesKPsSeen)+modelParameters(10);
        grv.questionPKS(qIndicesKPsNotSeen)=grv.questionPKS(qIndicesKPsNotSeen)+modelParameters(11);
        grv.questionPKS=normcdfParallel(grv.questionPKS);
        grv.questionPKS(grv.questionPKS>0.993)=0.993;
        grv.questionPKS=round(grv.questionPKS,4);
        
        if batchQisTest(h)==1
            grv.modelHistory.SAsBeforeQ_TESTraw=newSAsTESTraw;
            grv.modelHistory.lastQtest=batchQindex(h);
            grv.modelHistory.correctnessLastQtest=batchQcorrectness(h);
            grv.modelHistory.Ntest=grv.modelHistory.Ntest+1;
            grv.modelHistory.SAsBeforeQ_LessonTESTraw{batchQ_lessson(h)}=newSAs_lessonTESTraw;
            grv.modelHistory.lastQtestLesson(batchQ_lessson(h))=batchQindex(h);
            grv.modelHistory.correctnessLastQtestLesson(batchQ_lessson(h))=batchQcorrectness(h);
            grv.modelHistory.NtestLesson(batchQ_lessson(h))=grv.modelHistory.NtestLesson(batchQ_lessson(h))+1;
            grv.modelHistory.SAsBeforeQ_UnitTESTraw{batchQ_unit(h)}=newSAs_unitTESTraw;
            grv.modelHistory.lastQtestUnit(batchQ_unit(h))=batchQindex(h);
            grv.modelHistory.correctnessLastQtestUnit(batchQ_unit(h))=batchQcorrectness(h);
            grv.modelHistory.NtestUnit(batchQ_unit(h))=grv.modelHistory.NtestUnit(batchQ_unit(h))+1;
        end   
    elseif isequal(modelParameters(26:28),[1 1 0]')
        for i=1:length(units)
            qIndicesUnit=find(ismember(questionModelMap.KP_index, KPcontentMap.KP_index(KPcontentMap.L2_index==units(i))));    
            if i==batchQ_unit(h)
                grv.questionPKS(qIndicesUnit)=questionModelMap.centerValue(qIndicesUnit) + questionModelMap.iqta(qIndicesUnit) ...
                                              +(newSAsTESTforUnit*questionModelMap.weights(qIndicesUnit,:)')';
            else
                if grv.modelHistory.NtestUnit(i)==0
                    weightUnitTest=0;
                else
                    weightUnitTest=min(modelParameters(34)*grv.modelHistory.NtestUnit(i)+modelParameters(33),modelParameters(35));
                    weightUnitTest(weightUnitTest<0)=0;
                end

                if batchQisTest(h)==1            
                    tempSAs = (weightGlobal*newSAsGLOBAL + weightTest*modelParameters(9)*newSAsTESTraw ...
                              +weightUnitTest*modelParameters(32)*grv.modelHistory.SAsBeforeQ_UnitTESTraw{i})...
                              ./(weightGlobal+weightTest*modelParameters(9)+weightUnitTest*modelParameters(32));
                else
                    tempSAs = (weightGlobal*newSAsGLOBAL + weightTest*modelParameters(9)*grv.modelHistory.SAsBeforeQ_TESTraw ...
                              +weightUnitTest*modelParameters(32)*grv.modelHistory.SAsBeforeQ_UnitTESTraw{i})...
                              ./(weightGlobal+weightTest*modelParameters(9)+weightUnitTest*modelParameters(32));
                end
                grv.questionPKS(qIndicesUnit)=questionModelMap.centerValue(qIndicesUnit) + questionModelMap.iqta(qIndicesUnit) ...
                                              +(tempSAs*questionModelMap.weights(qIndicesUnit,:)')';
            end                                
        end
        
        grv.questionPKS(qIndicesKPsSeen)=grv.questionPKS(qIndicesKPsSeen)+modelParameters(10);
        grv.questionPKS(qIndicesKPsNotSeen)=grv.questionPKS(qIndicesKPsNotSeen)+modelParameters(11);
        grv.questionPKS=normcdfParallel(grv.questionPKS);
        grv.questionPKS(grv.questionPKS>0.993)=0.993;
        grv.questionPKS=round(grv.questionPKS,4);
        
        if batchQisTest(h)==1
            grv.modelHistory.SAsBeforeQ_TESTraw=newSAsTESTraw;
            grv.modelHistory.lastQtest=batchQindex(h);
            grv.modelHistory.correctnessLastQtest=batchQcorrectness(h);
            grv.modelHistory.Ntest=grv.modelHistory.Ntest+1;
            grv.modelHistory.SAsBeforeQ_UnitTESTraw{batchQ_unit(h)}=newSAs_unitTESTraw;
            grv.modelHistory.lastQtestUnit(batchQ_unit(h))=batchQindex(h);
            grv.modelHistory.correctnessLastQtestUnit(batchQ_unit(h))=batchQcorrectness(h);
            grv.modelHistory.NtestUnit(batchQ_unit(h))=grv.modelHistory.NtestUnit(batchQ_unit(h))+1;
        end
    else
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
    
    grv.modelHistory.SAsBeforeQ_GLOBAL=newSAsGLOBAL;
    grv.modelHistory.lastQglobal=batchQindex(h);
    grv.modelHistory.correctnessLastQglobal=batchQcorrectness(h);
    grv.modelHistory.Nglobal=grv.modelHistory.Nglobal+1;
end

currentMeanPKSforKPs=computeMeanPKSForKPs;

newStudentReportHistory=initializeStudentReportHistory;
grv.studentReportHistory=[grv.studentReportHistory; newStudentReportHistory];
if lrv.startNewDataSetWithBatch==1
    KPsCoveredByTest=KPcontentMap.KP_index';
else
    KPsCoveredByTest=unique(questionModelMap.KP_index(batchQindex));
end
KPsCovered0_1=zeros(1, size(KPcontentMap,1));
KPsCovered0_1(KPsCoveredByTest)=1;
%grv.studentReportHistory(end,4:end)=num2cell(KPsCovered0_1);
grv.studentReportHistory(end,5:end)=num2cell(KPsCovered0_1);
grv.studentReportHistory.product_area(end-1:end)=grv.product_area;
grv.studentReportHistory.correctnessChanged(end-1:end)=lrv.correctnessChanged;
dt=clock;
dt=getCiscoFormattedTime(dt);

grv.studentReportHistory.studentQuestionN(end-1:end)=studentQuestionN+Nbatch;
grv.studentReportHistory.timeStamp(end-1:end)={dt};
%grv.studentReportHistory(end-1,4:end)=num2cell(currentMeanPKSforKPs');
grv.studentReportHistory(end-1,5:end)=num2cell(currentMeanPKSforKPs');
grv.studentReportHistory(end-1:end,4)={lrv.correctnessChanged};

studentQuestionN=(studentQuestionN+1:studentQuestionN+Nbatch)';
question_index=batchQindex;
question_textid=questionModelMap.question_textid(question_index);
correctness=batchQcorrectness;
is_testQ=batchQisTest;
dataSetNumber=dataSetNumber*ones(Nbatch,1);
product_area=grv.product_area*ones(Nbatch,1);
areaPos=grv.areaPos*ones(Nbatch,1);
correctnessChanged=zeros(Nbatch,1);
% new added lines
is_IDontKnow=zeros(Nbatch,1);
currentQhist=table(studentQuestionN,question_index,question_textid,correctness,is_testQ,dataSetNumber,PKSbeforeQ,product_area,areaPos,correctnessChanged,is_IDontKnow);
grv.studentHistory=[grv.studentHistory; currentQhist];
if lrv.goToReportingAfterBatch==1
    grv.product_area=grv.product_area(1)+1;
else
    grv.product_area=1000;
end
grv.areaPos=0;

lrv=[];
lrv.runtimeVarsExist=0;
save(grv_fn,'grv')
save(lrv_fn,'lrv')

end
            
            
                
                
                
                
    


