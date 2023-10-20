function displayStudentMastery

global lrv masteryCutoffs

masteredPlusCutoffPercentage = masteryCutoffs.masteredPlusCutoff * 100;
masteredCutoffPercentage = masteryCutoffs.masteredCutoff * 100;
almostMasteredCutoffPercentage = masteryCutoffs.almostMasteredCutoff * 100;
someMasteryCutoffPercentage = masteryCutoffs.someMasteryCutoff * 100;


delimiterText='**************************************************************************';
disp(' ')
disp('***************** COMPACT Course Mastery For Student *********************')
disp(' ')

for c=1:length(lrv.reportInfoTable{1}.nameKey)
    tempy=lrv.reportInfoTable{1}.index(c);
    if tempy < 10
        exSp=' ';
    else
        exSp=[];
    end
    spaces='   ';
    nextLevelCategoriesCovered=lrv.reportInfoTable{1}.nextLevelCategoriesCovered{c};
    masteryPercentage = lrv.reportInfoTable{1}.masteryPercentage(c);
    categoriesInNextLevel = lrv.reportInfoTable{2}.nameKey(nextLevelCategoriesCovered);
    categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{2}.masteryPercentage(nextLevelCategoriesCovered);

    nk=[lrv.reportLevelContentLabel{1}{1} ' ' lrv.reportInfoTable{1}.nameKey{c}];
    if masteryPercentage>=masteredPlusCutoffPercentage
        disp([nk ':   ' exSp num2str(masteryPercentage) '% Knowledge ---------> <strong>Mastered+</strong>'])
        for h=1:length(categoriesInNextLevel)
            if length(categoriesInNextLevel{h})==1
                exSp2='   ';
            elseif length(categoriesInNextLevel{h})==2
                exSp2='  ';
            elseif length(categoriesInNextLevel{h})==3
                exSp2=' ';
            else
                exSp2=[];
            end
            if categoriesInNextLevelMasteryPercentage(h)>=masteredPlusCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> <strong>Mastered+</strong>'])
            elseif categoriesInNextLevelMasteryPercentage(h)>=masteredCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> <strong>Mastered</strong>'])
            elseif categoriesInNextLevelMasteryPercentage(h)>=almostMasteredCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> Almost Mastered'])
            elseif categoriesInNextLevelMasteryPercentage(h)>=someMasteryCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> Some Mastery'])
            elseif categoriesInNextLevelMasteryPercentage(h)<someMasteryCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> Low Mastery'])
            end
        end
        disp(' ')
    elseif masteryPercentage>=masteredCutoffPercentage
        disp([nk ':   ' exSp num2str(masteryPercentage) '% Knowledge ---------> <strong>Mastered</strong>'])
        for h=1:length(categoriesInNextLevel)
            if length(categoriesInNextLevel{h})==1
                exSp2='   ';
            elseif length(categoriesInNextLevel{h})==2
                exSp2='  ';
            elseif length(categoriesInNextLevel{h})==3
                exSp2=' ';
            else
                exSp2=[];
            end
            if categoriesInNextLevelMasteryPercentage(h)>=masteredPlusCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> <strong>Mastered+</strong>'])
            elseif categoriesInNextLevelMasteryPercentage(h)>=masteredCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> <strong>Mastered</strong>'])
            elseif categoriesInNextLevelMasteryPercentage(h)>=almostMasteredCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> Almost Mastered'])
            elseif categoriesInNextLevelMasteryPercentage(h)>=someMasteryCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> Some Mastery'])
            elseif categoriesInNextLevelMasteryPercentage(h)<someMasteryCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> Low Mastery'])
            end
        end
        disp(' ')
     elseif masteryPercentage>=almostMasteredCutoffPercentage
        disp([nk ':   ' exSp num2str(masteryPercentage) '% Knowledge ---------> Almost Mastered'])
        for h=1:length(categoriesInNextLevel)
            if length(categoriesInNextLevel{h})==1
                exSp2='   ';
            elseif length(categoriesInNextLevel{h})==2
                exSp2='  ';
            elseif length(categoriesInNextLevel{h})==3
                exSp2=' ';
            else
                exSp2=[];
            end
            if categoriesInNextLevelMasteryPercentage(h)>=masteredPlusCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> <strong>Mastered+</strong>'])
            elseif categoriesInNextLevelMasteryPercentage(h)>=masteredCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> <strong>Mastered</strong>'])
            elseif categoriesInNextLevelMasteryPercentage(h)>=almostMasteredCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> Almost Mastered'])
            elseif categoriesInNextLevelMasteryPercentage(h)>=someMasteryCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> Some Mastery'])
            elseif categoriesInNextLevelMasteryPercentage(h)<someMasteryCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> Low Mastery'])
            end
        end
        disp(' ')
     elseif masteryPercentage>=someMasteryCutoffPercentage
        disp([nk ':   ' exSp num2str(masteryPercentage) '% Knowledge ---------> Some Mastery'])
        for h=1:length(categoriesInNextLevel)
            if length(categoriesInNextLevel{h})==1
                exSp2='   ';
            elseif length(categoriesInNextLevel{h})==2
                exSp2='  ';
            elseif length(categoriesInNextLevel{h})==3
                exSp2=' ';
            else
                exSp2=[];
            end
            if categoriesInNextLevelMasteryPercentage(h)>=masteredPlusCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> <strong>Mastered+</strong>'])
            elseif categoriesInNextLevelMasteryPercentage(h)>=masteredCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> <strong>Mastered</strong>'])
            elseif categoriesInNextLevelMasteryPercentage(h)>=almostMasteredCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> Almost Mastered'])
            elseif categoriesInNextLevelMasteryPercentage(h)>=someMasteryCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> Some Mastery'])
            elseif categoriesInNextLevelMasteryPercentage(h)<someMasteryCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> Low Mastery'])
            end
        end
        disp(' ')
     elseif masteryPercentage<someMasteryCutoffPercentage
        disp([nk ':   ' exSp num2str(masteryPercentage) '% Knowledge ---------> Low Mastery'])
        for h=1:length(categoriesInNextLevel)
            if length(categoriesInNextLevel{h})==1
                exSp2='   ';
            elseif length(categoriesInNextLevel{h})==2
                exSp2='  ';
            elseif length(categoriesInNextLevel{h})==3
                exSp2=' ';
            else
                exSp2=[];
            end
            if categoriesInNextLevelMasteryPercentage(h)>=masteredPlusCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> <strong>Mastered+</strong>'])
            elseif categoriesInNextLevelMasteryPercentage(h)>=masteredCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> <strong>Mastered</strong>'])
            elseif categoriesInNextLevelMasteryPercentage(h)>=almostMasteredCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> Almost Mastered'])
            elseif categoriesInNextLevelMasteryPercentage(h)>=someMasteryCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> Some Mastery'])
            elseif categoriesInNextLevelMasteryPercentage(h)<someMasteryCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> Low Mastery'])
            end
        end
        disp(' ')
    end
end
disp(delimiterText)
pause(2)

disp(' ')
disp(' ')
disp('***************** ALL OPEN Course Mastery For Student ********************')
disp(' ')

for c=1:length(lrv.reportInfoTable{1}.nameKey)
    tempy=lrv.reportInfoTable{1}.index(c);
    if tempy < 10
        exSp=' ';
    else
        exSp=[];
    end
    if class(lrv.reportInfoTable{1}.nextLevelCategoriesCovered)=="cell" || ...
       (class(lrv.reportInfoTable{1}.nextLevelCategoriesCovered)=="double" && ~(all(lrv.reportInfoTable{1}.nextLevelCategoriesCovered)==-1))
        nextLevelCategoriesCovered=lrv.reportInfoTable{1}.nextLevelCategoriesCovered{c};
    else
        nextLevelCategoriesCovered=-1;
    end
    masteryPercentage = lrv.reportInfoTable{1}.masteryPercentage(c);

    nk=[lrv.reportLevelContentLabel{1}{1} ' ' lrv.reportInfoTable{1}.nameKey{c}];
    if masteryPercentage>=masteredPlusCutoffPercentage
        disp([nk ': ' exSp num2str(masteryPercentage) '% Knowledge ---------> <strong>Mastered+</strong>'])
        displayMasteryFromSecondLevel(nextLevelCategoriesCovered)
    elseif masteryPercentage>=masteredCutoffPercentage
        disp([nk ': ' exSp num2str(masteryPercentage) '% Knowledge ---------> <strong>Mastered</strong>'])
        displayMasteryFromSecondLevel(nextLevelCategoriesCovered)
        disp(' ')
     elseif masteryPercentage>=almostMasteredCutoffPercentage
        disp([nk ': ' exSp num2str(masteryPercentage) '% Knowledge ---------> Almost Mastered'])
        displayMasteryFromSecondLevel(nextLevelCategoriesCovered)
        disp(' ')
     elseif masteryPercentage>=someMasteryCutoffPercentage
        disp([nk ': ' exSp num2str(masteryPercentage) '% Knowledge ---------> Some Mastery'])
        displayMasteryFromSecondLevel(nextLevelCategoriesCovered)
        disp(' ')
     elseif masteryPercentage<someMasteryCutoffPercentage
        disp([nk ': ' exSp num2str(masteryPercentage) '% Knowledge ---------> Low Mastery'])
        displayMasteryFromSecondLevel(nextLevelCategoriesCovered)
        disp(' ')
    end
end    

disp(delimiterText)
disp(' ')
end

