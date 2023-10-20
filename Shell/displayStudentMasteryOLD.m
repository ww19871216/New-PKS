function displayStudentMastery(subContentAreaName)

global lrv masteryCutoffs

masteredPlusCutoffPercentage = masteryCutoffs.masteredPlusCutoff * 100;
masteredCutoffPercentage = masteryCutoffs.masteredCutoff * 100;
almostMasteredCutoffPercentage = masteryCutoffs.almostMasteredCutoff * 100;
someMasteryCutoffPercentage = masteryCutoffs.someMasteryCutoff * 100;
delimiterText='**************************************************************************';
disp(' ')
disp('***************** COMPACT Course Mastery For Student *********************')
disp(' ')

if lrv.resultsProduct.masteryPercentage>=0
    coursePercentage=lrv.resultsProduct.masteryPercentage;
    nk=['Product ' lrv.resultsProduct.nameKey{1}];
    if coursePercentage>=masteredPlusCutoffPercentage
        cmText=([nk ' ' num2str(coursePercentage) '% Knowledge ---------> <strong>Mastered+</strong>']);
    elseif coursePercentage>=masteredCutoffPercentage
        cmText=([nk ' ' num2str(coursePercentage) '% Knowledge ---------> <strong>Mastered</strong>']);
    elseif coursePercentage>=almostMasteredCutoffPercentage
        cmText=([nk ' ' num2str(coursePercentage) '% Knowledge ---------> Almost Mastered']);
    elseif coursePercentage>=someMasteryCutoffPercentage
        cmText=([nk ' ' num2str(coursePercentage) '% Knowledge ---------> Some Mastery']);
    elseif coursePercentage<someMasteryCutoffPercentage
        cmText=([nk ' ' num2str(coursePercentage) '% Knowledge ---------> Low Mastery']);
    end
    disp(cmText)
    disp(' ')
end

for c=1:length(lrv.resultsModule.nameKey)
    i=lrv.resultsModule.L3_index(c);
    if i < 10
        exSp=' ';
    else
        exSp=[];
    end
    masteryPercentage=lrv.resultsModule.masteryPercentage(c);
    nk=['Module ' lrv.resultsModule.nameKey{c}];
    if masteryPercentage>=masteredPlusCutoffPercentage
        disp([nk ':   ' exSp num2str(masteryPercentage) '% Knowledge ---------> <strong>Mastered+</strong>'])
    elseif masteryPercentage>=masteredCutoffPercentage
        disp([nk ':   ' exSp num2str(masteryPercentage) '% Knowledge ---------> <strong>Mastered</strong>'])
    elseif masteryPercentage>=almostMasteredCutoffPercentage
        disp([nk ':   ' exSp num2str(masteryPercentage) '% Knowledge ---------> Almost Mastered'])
    elseif masteryPercentage>=someMasteryCutoffPercentage
        disp([nk ':   ' exSp num2str(masteryPercentage) '% Knowledge ---------> Some Mastery'])
    elseif masteryPercentage<someMasteryCutoffPercentage
        disp([nk ':   ' exSp num2str(masteryPercentage) '% Knowledge ---------> Low Mastery'])
    end
end
disp(' ')
disp(delimiterText)
pause(2)

disp(' ')
disp(' ')
disp('***************** ALL OPEN Course Mastery For Student ********************')
disp(' ')
if lrv.resultsProduct.masteryPercentage>=0
    disp(cmText)
end
disp(' ')
%Now we go through each L3 category and for each one, both compute and display the mastery statistics.
for c=1:length(lrv.resultsModule.nameKey)
    i=lrv.resultsModule.L3_index(c);
    if i < 10
        exSp=' ';
    else
        exSp=[];
    end
    spaces='   ';
    KPindicesForCategory=lrv.resultsModule.KPindicesForModule{c};
    masteryPercentage = lrv.resultsModule.masteryPercentage(c);
    KPsInCategory = lrv.resultsKP.nameKey(KPindicesForCategory);

    masteryKPsPercentage = lrv.resultsKP.masteryPercentage(KPindicesForCategory);
    
    %Display Mastery for the L3 category in compact way.
    nk=['Module ' lrv.resultsModule.nameKey{c}];
    if masteryPercentage>=masteredPlusCutoffPercentage
        disp([nk ':   ' exSp num2str(masteryPercentage) '% Knowledge ---------> <strong>Mastered+</strong>'])
        for h=1:length(KPsInCategory)
            if length(KPsInCategory{h})==1
                exSp2='   ';
            elseif length(KPsInCategory{h})==2
                exSp2='  ';
            elseif length(KPsInCategory{h})==3
                exSp2=' ';
            else
                exSp2=[];
            end
            if masteryKPsPercentage(h)>=masteredPlusCutoffPercentage
                disp([spaces subContentAreaName ' ' KPsInCategory{h} ': ' exSp2 num2str(masteryKPsPercentage(h)) '% Knowledge --> <strong>Mastered+</strong>'])
            elseif masteryKPsPercentage(h)>=masteredCutoffPercentage
                disp([spaces subContentAreaName ' ' KPsInCategory{h} ': ' exSp2 num2str(masteryKPsPercentage(h)) '% Knowledge --> <strong>Mastered</strong>'])
            elseif masteryKPsPercentage(h)>=almostMasteredCutoffPercentage
                disp([spaces subContentAreaName ' ' KPsInCategory{h} ': ' exSp2 num2str(masteryKPsPercentage(h)) '% Knowledge --> Almost Mastered'])
            elseif masteryKPsPercentage(h)>=someMasteryCutoffPercentage
                disp([spaces subContentAreaName ' ' KPsInCategory{h} ': ' exSp2 num2str(masteryKPsPercentage(h)) '% Knowledge --> Some Mastery'])
            elseif masteryKPsPercentage(h)<someMasteryCutoffPercentage
                disp([spaces subContentAreaName ' ' KPsInCategory{h} ': ' exSp2 num2str(masteryKPsPercentage(h)) '% Knowledge --> Low Mastery'])
            end
        end
        disp(' ')
    elseif masteryPercentage>=masteredCutoffPercentage
        disp([nk ':   ' exSp num2str(masteryPercentage) '% Knowledge ---------> <strong>Mastered</strong>'])
        for h=1:length(KPsInCategory)
            if length(KPsInCategory{h})==1
                exSp2='   ';
            elseif length(KPsInCategory{h})==2
                exSp2='  ';
            elseif length(KPsInCategory{h})==3
                exSp2=' ';
            else
                exSp2=[];
            end
            if masteryKPsPercentage(h)>=masteredPlusCutoffPercentage
                disp([spaces subContentAreaName ' ' KPsInCategory{h} ': ' exSp2 num2str(masteryKPsPercentage(h)) '% Knowledge --> <strong>Mastered+</strong>'])
            elseif masteryKPsPercentage(h)>=masteredCutoffPercentage
                disp([spaces subContentAreaName ' ' KPsInCategory{h} ': ' exSp2 num2str(masteryKPsPercentage(h)) '% Knowledge --> <strong>Mastered</strong>'])
            elseif masteryKPsPercentage(h)>=almostMasteredCutoffPercentage
                disp([spaces subContentAreaName ' ' KPsInCategory{h} ': ' exSp2 num2str(masteryKPsPercentage(h)) '% Knowledge --> Almost Mastered'])
            elseif masteryKPsPercentage(h)>=someMasteryCutoffPercentage
                disp([spaces subContentAreaName ' ' KPsInCategory{h} ': ' exSp2 num2str(masteryKPsPercentage(h)) '% Knowledge --> Some Mastery'])
            elseif masteryKPsPercentage(h)<someMasteryCutoffPercentage
                disp([spaces subContentAreaName ' ' KPsInCategory{h} ': ' exSp2 num2str(masteryKPsPercentage(h)) '% Knowledge --> Low Mastery'])
            end
        end
        disp(' ')
     elseif masteryPercentage>=almostMasteredCutoffPercentage
        disp([nk ':   ' exSp num2str(masteryPercentage) '% Knowledge ---------> Almost Mastered'])
        for h=1:length(KPsInCategory)
            if length(KPsInCategory{h})==1
                exSp2='   ';
            elseif length(KPsInCategory{h})==2
                exSp2='  ';
            elseif length(KPsInCategory{h})==3
                exSp2=' ';
            else
                exSp2=[];
            end
            if masteryKPsPercentage(h)>=masteredPlusCutoffPercentage
                disp([spaces subContentAreaName ' ' KPsInCategory{h} ': ' exSp2 num2str(masteryKPsPercentage(h)) '% Knowledge --> <strong>Mastered+</strong>'])
            elseif masteryKPsPercentage(h)>=masteredCutoffPercentage
                disp([spaces subContentAreaName ' ' KPsInCategory{h} ': ' exSp2 num2str(masteryKPsPercentage(h)) '% Knowledge --> <strong>Mastered</strong>'])
            elseif masteryKPsPercentage(h)>=almostMasteredCutoffPercentage
                disp([spaces subContentAreaName ' ' KPsInCategory{h} ': ' exSp2 num2str(masteryKPsPercentage(h)) '% Knowledge --> Almost Mastered'])
            elseif masteryKPsPercentage(h)>=someMasteryCutoffPercentage
                disp([spaces subContentAreaName ' ' KPsInCategory{h} ': ' exSp2 num2str(masteryKPsPercentage(h)) '% Knowledge --> Some Mastery'])
            elseif masteryKPsPercentage(h)<someMasteryCutoffPercentage
                disp([spaces subContentAreaName ' ' KPsInCategory{h} ': ' exSp2 num2str(masteryKPsPercentage(h)) '% Knowledge --> Low Mastery'])
            end
        end
        disp(' ')
     elseif masteryPercentage>=someMasteryCutoffPercentage
        disp([nk ':   ' exSp num2str(masteryPercentage) '% Knowledge ---------> Some Mastery'])
        for h=1:length(KPsInCategory)
            if length(KPsInCategory{h})==1
                exSp2='   ';
            elseif length(KPsInCategory{h})==2
                exSp2='  ';
            elseif length(KPsInCategory{h})==3
                exSp2=' ';
            else
                exSp2=[];
            end
            if masteryKPsPercentage(h)>=masteredPlusCutoffPercentage
                disp([spaces subContentAreaName ' ' KPsInCategory{h} ': ' exSp2 num2str(masteryKPsPercentage(h)) '% Knowledge --> <strong>Mastered+</strong>'])
            elseif masteryKPsPercentage(h)>=masteredCutoffPercentage
                disp([spaces subContentAreaName ' ' KPsInCategory{h} ': ' exSp2 num2str(masteryKPsPercentage(h)) '% Knowledge --> <strong>Mastered</strong>'])
            elseif masteryKPsPercentage(h)>=almostMasteredCutoffPercentage
                disp([spaces subContentAreaName ' ' KPsInCategory{h} ': ' exSp2 num2str(masteryKPsPercentage(h)) '% Knowledge --> Almost Mastered'])
            elseif masteryKPsPercentage(h)>=someMasteryCutoffPercentage
                disp([spaces subContentAreaName ' ' KPsInCategory{h} ': ' exSp2 num2str(masteryKPsPercentage(h)) '% Knowledge --> Some Mastery'])
            elseif masteryKPsPercentage(h)<someMasteryCutoffPercentage
                disp([spaces subContentAreaName ' ' KPsInCategory{h} ': ' exSp2 num2str(masteryKPsPercentage(h)) '% Knowledge --> Low Mastery'])
            end
        end
        disp(' ')
     elseif masteryPercentage<someMasteryCutoffPercentage
        disp([nk ':   ' exSp num2str(masteryPercentage) '% Knowledge ---------> Low Mastery'])
        for h=1:length(KPsInCategory)
            if length(KPsInCategory{h})==1
                exSp2='   ';
            elseif length(KPsInCategory{h})==2
                exSp2='  ';
            elseif length(KPsInCategory{h})==3
                exSp2=' ';
            else
                exSp2=[];
            end
            if masteryKPsPercentage(h)>=masteredPlusCutoffPercentage
                disp([spaces subContentAreaName ' ' KPsInCategory{h} ': ' exSp2 num2str(masteryKPsPercentage(h)) '% Knowledge --> <strong>Mastered+</strong>'])
            elseif masteryKPsPercentage(h)>=masteredCutoffPercentage
                disp([spaces subContentAreaName ' ' KPsInCategory{h} ': ' exSp2 num2str(masteryKPsPercentage(h)) '% Knowledge --> <strong>Mastered</strong>'])
            elseif masteryKPsPercentage(h)>=almostMasteredCutoffPercentage
                disp([spaces subContentAreaName ' ' KPsInCategory{h} ': ' exSp2 num2str(masteryKPsPercentage(h)) '% Knowledge --> Almost Mastered'])
            elseif masteryKPsPercentage(h)>=someMasteryCutoffPercentage
                disp([spaces subContentAreaName ' ' KPsInCategory{h} ': ' exSp2 num2str(masteryKPsPercentage(h)) '% Knowledge --> Some Mastery'])
            elseif masteryKPsPercentage(h)<someMasteryCutoffPercentage
                disp([spaces subContentAreaName ' ' KPsInCategory{h} ': ' exSp2 num2str(masteryKPsPercentage(h)) '% Knowledge --> Low Mastery'])
            end
        end
        disp(' ')
    end
end
disp(delimiterText)
disp(' ')
end

