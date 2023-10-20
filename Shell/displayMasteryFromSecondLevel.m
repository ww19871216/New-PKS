function displayMasteryFromSecondLevel(nextLevelCategoriesCovered)

global lrv masteryCutoffs


masteredPlusCutoffPercentage = masteryCutoffs.masteredPlusCutoff * 100;
masteredCutoffPercentage = masteryCutoffs.masteredCutoff * 100;
almostMasteredCutoffPercentage = masteryCutoffs.almostMasteredCutoff * 100;
someMasteryCutoffPercentage = masteryCutoffs.someMasteryCutoff * 100;

spaces='    ';

for c=1:length(lrv.reportInfoTable{1}.nameKey)
    if nextLevelCategoriesCovered==-1
        return
    else
        for h=1:length(lrv.reportInfoTable{1}.nextLevelCategoriesCovered{c})
            categoriesInNextLevel = lrv.reportInfoTable{2}.nameKey(lrv.reportInfoTable{1}.nextLevelCategoriesCovered{c});
            categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{2}.masteryPercentage(lrv.reportInfoTable{1}.nextLevelCategoriesCovered{c});

            if length(categoriesInNextLevel{h})==1
                exSp2='   ';
            elseif length(categoriesInNextLevel{h})==2
                exSp2='  ';
            elseif length(categoriesInNextLevel{h})==3
                exSp2=' ';
            else
                exSp2=[];
            end
            if class(lrv.reportInfoTable{2}.nextLevelCategoriesCovered)=="cell" || ...
               (class(lrv.reportInfoTable{2}.nextLevelCategoriesCovered)=="double" && ~(all(lrv.reportInfoTable{2}.nextLevelCategoriesCovered)==-1))
                nextLevelCategoriesCovered=lrv.reportInfoTable{2}.nextLevelCategoriesCovered{h};
            else
                nextLevelCategoriesCovered=-1;
            end
            masteryPercentage = lrv.reportInfoTable{2}.masteryPercentage(h);

            if masteryPercentage>=masteredPlusCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> <strong>Mastered+</strong>'])
                if nextLevelCategoriesCovered==-1
                    return
                else
                    for j=1:length(lrv.reportInfoTable{2}.nextLevelCategoriesCovered{h})
                        categoriesInNextLevel = lrv.reportInfoTable{3}.nameKey(lrv.reportInfoTable{2}.nextLevelCategoriesCovered{h});
                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{3}.masteryPercentage(lrv.reportInfoTable{2}.nextLevelCategoriesCovered{h});
                        if length(categoriesInNextLevel{j})==1
                            exSp2='   ';
                        elseif length(categoriesInNextLevel{j})==2
                            exSp2='  ';
                        elseif length(categoriesInNextLevel{j})==3
                            exSp2=' ';
                        else
                            exSp2=[];
                        end

                        if class(lrv.reportInfoTable{3}.nextLevelCategoriesCovered)=="cell" || ...
                           (class(lrv.reportInfoTable{3}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{3}.nextLevelCategoriesCovered)==-1)
                            nextLevelCategoriesCovered=lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j};
                        else
                            nextLevelCategoriesCovered=-1;
                        end
                        masteryPercentage = lrv.reportInfoTable{3}.masteryPercentage(j);

                        if masteryPercentage>=masteredPlusCutoffPercentage
                             disp([spaces spaces lrv.reportLevelContentLabel{3}{1} ' ' categoriesInNextLevel{j} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(j)) '% Knowledge --> <strong>Mastered+</strong>'])
                             if size(lrv.reportInfoTable,1)>=4
                                 if nextLevelCategoriesCovered==-1
                                    return
                                 else
                                     for m=1:length(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j})
                                        categoriesInNextLevel = lrv.reportInfoTable{4}.nameKey(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        if length(categoriesInNextLevel{m})==1
                                            exSp2='   ';
                                        elseif length(categoriesInNextLevel{m})==2
                                            exSp2='  ';
                                        elseif length(categoriesInNextLevel{m})==3
                                            exSp2=' ';
                                        else
                                            exSp2=[];
                                        end

                                        if class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="cell" || ...
                                           (class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)==-1)
                                            nextLevelCategoriesCovered=lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m};
                                        else
                                            nextLevelCategoriesCovered=-1;
                                        end
                                        masteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(m);

                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered+</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=masteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Almost Mastered'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Some Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Low Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        end
                                    end
                                 end
                             end
                        elseif masteryPercentage>=masteredCutoffPercentage
                            disp([spaces spaces lrv.reportLevelContentLabel{3}{1} ' ' categoriesInNextLevel{j} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(j)) '% Knowledge --> <strong>Mastered</strong>'])
                            if size(lrv.reportInfoTable,1)>=4
                                 if nextLevelCategoriesCovered==-1
                                    return
                                 else
                                     for m=1:length(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j})
                                        categoriesInNextLevel = lrv.reportInfoTable{4}.nameKey(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        if length(categoriesInNextLevel{m})==1
                                            exSp2='   ';
                                        elseif length(categoriesInNextLevel{m})==2
                                            exSp2='  ';
                                        elseif length(categoriesInNextLevel{m})==3
                                            exSp2=' ';
                                        else
                                            exSp2=[];
                                        end

                                        if class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="cell" || ...
                                           (class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)==-1)
                                            nextLevelCategoriesCovered=lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m};
                                        else
                                            nextLevelCategoriesCovered=-1;
                                        end
                                        masteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(m);

                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered+</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=masteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Almost Mastered'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Some Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Low Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        end
                                    end
                                 end
                             end
                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                            disp([spaces spaces lrv.reportLevelContentLabel{3}{1} ' ' categoriesInNextLevel{j} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(j)) '% Knowledge --> Almost Mastered'])
                            if size(lrv.reportInfoTable,1)>=4
                                 if nextLevelCategoriesCovered==-1
                                    return
                                 else
                                     for m=1:length(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j})
                                        categoriesInNextLevel = lrv.reportInfoTable{4}.nameKey(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        if length(categoriesInNextLevel{m})==1
                                            exSp2='   ';
                                        elseif length(categoriesInNextLevel{m})==2
                                            exSp2='  ';
                                        elseif length(categoriesInNextLevel{m})==3
                                            exSp2=' ';
                                        else
                                            exSp2=[];
                                        end

                                        if class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="cell" || ...
                                           (class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)==-1)
                                            nextLevelCategoriesCovered=lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m};
                                        else
                                            nextLevelCategoriesCovered=-1;
                                        end
                                        masteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(m);

                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered+</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=masteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Almost Mastered'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Some Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Low Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        end
                                    end
                                 end
                             end
                        elseif masteryPercentage>=someMasteryCutoffPercentage
                            disp([spaces spaces lrv.reportLevelContentLabel{3}{1} ' ' categoriesInNextLevel{j} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(j)) '% Knowledge --> Some Mastery'])
                            if size(lrv.reportInfoTable,1)>=4
                                 if nextLevelCategoriesCovered==-1
                                    return
                                 else
                                     for m=1:length(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j})
                                        categoriesInNextLevel = lrv.reportInfoTable{4}.nameKey(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        if length(categoriesInNextLevel{m})==1
                                            exSp2='   ';
                                        elseif length(categoriesInNextLevel{m})==2
                                            exSp2='  ';
                                        elseif length(categoriesInNextLevel{m})==3
                                            exSp2=' ';
                                        else
                                            exSp2=[];
                                        end

                                        if class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="cell" || ...
                                           (class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)==-1)
                                            nextLevelCategoriesCovered=lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m};
                                        else
                                            nextLevelCategoriesCovered=-1;
                                        end
                                        masteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(m);

                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered+</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=masteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Almost Mastered'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Some Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Low Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        end
                                    end
                                 end
                             end
                        elseif masteryPercentage<someMasteryCutoffPercentage
                            disp([spaces spaces lrv.reportLevelContentLabel{3}{1} ' ' categoriesInNextLevel{j} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(j)) '% Knowledge --> Low Mastery'])
                            if size(lrv.reportInfoTable,1)>=4
                                 if nextLevelCategoriesCovered==-1
                                    return
                                 else
                                     for m=1:length(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j})
                                        categoriesInNextLevel = lrv.reportInfoTable{4}.nameKey(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        if length(categoriesInNextLevel{m})==1
                                            exSp2='   ';
                                        elseif length(categoriesInNextLevel{m})==2
                                            exSp2='  ';
                                        elseif length(categoriesInNextLevel{m})==3
                                            exSp2=' ';
                                        else
                                            exSp2=[];
                                        end

                                        if class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="cell" || ...
                                           (class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)==-1)
                                            nextLevelCategoriesCovered=lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m};
                                        else
                                            nextLevelCategoriesCovered=-1;
                                        end
                                        masteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(m);

                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered+</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=masteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Almost Mastered'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Some Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Low Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        end
                                    end
                                 end
                             end
                        end
                    end
                end       
            elseif masteryPercentage>=masteredCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> <strong>Mastered</strong>'])
                if nextLevelCategoriesCovered==-1
                    return
                else
                    for j=1:length(lrv.reportInfoTable{2}.nextLevelCategoriesCovered{h})
                        categoriesInNextLevel = lrv.reportInfoTable{3}.nameKey(lrv.reportInfoTable{2}.nextLevelCategoriesCovered{h});
                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{3}.masteryPercentage(lrv.reportInfoTable{2}.nextLevelCategoriesCovered{h});
                        if length(categoriesInNextLevel{j})==1
                            exSp2='   ';
                        elseif length(categoriesInNextLevel{j})==2
                            exSp2='  ';
                        elseif length(categoriesInNextLevel{j})==3
                            exSp2=' ';
                        else
                            exSp2=[];
                        end

                        if class(lrv.reportInfoTable{3}.nextLevelCategoriesCovered)=="cell" || ...
                           (class(lrv.reportInfoTable{3}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{3}.nextLevelCategoriesCovered)==-1)
                            nextLevelCategoriesCovered=lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j};
                        else
                            nextLevelCategoriesCovered=-1;
                        end
                        masteryPercentage = lrv.reportInfoTable{3}.masteryPercentage(j);

                        if masteryPercentage>=masteredPlusCutoffPercentage
                             disp([spaces spaces lrv.reportLevelContentLabel{3}{1} ' ' categoriesInNextLevel{j} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(j)) '% Knowledge --> <strong>Mastered+</strong>'])
                             if size(lrv.reportInfoTable,1)>=4
                                 if nextLevelCategoriesCovered==-1
                                    return
                                 else
                                     for m=1:length(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j})
                                        categoriesInNextLevel = lrv.reportInfoTable{4}.nameKey(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        if length(categoriesInNextLevel{m})==1
                                            exSp2='   ';
                                        elseif length(categoriesInNextLevel{m})==2
                                            exSp2='  ';
                                        elseif length(categoriesInNextLevel{m})==3
                                            exSp2=' ';
                                        else
                                            exSp2=[];
                                        end

                                        if class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="cell" || ...
                                           (class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)==-1)
                                            nextLevelCategoriesCovered=lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m};
                                        else
                                            nextLevelCategoriesCovered=-1;
                                        end
                                        masteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(m);

                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered+</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=masteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Almost Mastered'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Some Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Low Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        end
                                    end
                                 end
                             end
                        elseif masteryPercentage>=masteredCutoffPercentage
                            disp([spaces spaces lrv.reportLevelContentLabel{3}{1} ' ' categoriesInNextLevel{j} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(j)) '% Knowledge --> <strong>Mastered</strong>'])
                            if size(lrv.reportInfoTable,1)>=4
                                 if nextLevelCategoriesCovered==-1
                                    return
                                 else
                                     for m=1:length(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j})
                                        categoriesInNextLevel = lrv.reportInfoTable{4}.nameKey(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        if length(categoriesInNextLevel{m})==1
                                            exSp2='   ';
                                        elseif length(categoriesInNextLevel{m})==2
                                            exSp2='  ';
                                        elseif length(categoriesInNextLevel{m})==3
                                            exSp2=' ';
                                        else
                                            exSp2=[];
                                        end

                                        if class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="cell" || ...
                                           (class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)==-1)
                                            nextLevelCategoriesCovered=lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m};
                                        else
                                            nextLevelCategoriesCovered=-1;
                                        end
                                        masteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(m);

                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered+</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=masteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Almost Mastered'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Some Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Low Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        end
                                    end
                                 end
                             end
                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                            disp([spaces spaces lrv.reportLevelContentLabel{3}{1} ' ' categoriesInNextLevel{j} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(j)) '% Knowledge --> Almost Mastered'])
                            if size(lrv.reportInfoTable,1)>=4
                                 if nextLevelCategoriesCovered==-1
                                    return
                                 else
                                     for m=1:length(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j})
                                        categoriesInNextLevel = lrv.reportInfoTable{4}.nameKey(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        if length(categoriesInNextLevel{m})==1
                                            exSp2='   ';
                                        elseif length(categoriesInNextLevel{m})==2
                                            exSp2='  ';
                                        elseif length(categoriesInNextLevel{m})==3
                                            exSp2=' ';
                                        else
                                            exSp2=[];
                                        end

                                        if class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="cell" || ...
                                           (class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)==-1)
                                            nextLevelCategoriesCovered=lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m};
                                        else
                                            nextLevelCategoriesCovered=-1;
                                        end
                                        masteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(m);

                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered+</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=masteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Almost Mastered'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Some Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Low Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        end
                                    end
                                 end
                             end
                        elseif masteryPercentage>=someMasteryCutoffPercentage
                            disp([spaces spaces lrv.reportLevelContentLabel{3}{1} ' ' categoriesInNextLevel{j} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(j)) '% Knowledge --> Some Mastery'])
                            if size(lrv.reportInfoTable,1)>=4
                                 if nextLevelCategoriesCovered==-1
                                    return
                                 else
                                     for m=1:length(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j})
                                        categoriesInNextLevel = lrv.reportInfoTable{4}.nameKey(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        if length(categoriesInNextLevel{m})==1
                                            exSp2='   ';
                                        elseif length(categoriesInNextLevel{m})==2
                                            exSp2='  ';
                                        elseif length(categoriesInNextLevel{m})==3
                                            exSp2=' ';
                                        else
                                            exSp2=[];
                                        end

                                        if class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="cell" || ...
                                           (class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)==-1)
                                            nextLevelCategoriesCovered=lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m};
                                        else
                                            nextLevelCategoriesCovered=-1;
                                        end
                                        masteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(m);

                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered+</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=masteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Almost Mastered'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Some Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Low Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        end
                                    end
                                 end
                             end
                        elseif masteryPercentage<someMasteryCutoffPercentage
                            disp([spaces spaces lrv.reportLevelContentLabel{3}{1} ' ' categoriesInNextLevel{j} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(j)) '% Knowledge --> Low Mastery'])
                            if size(lrv.reportInfoTable,1)>=4
                                 if nextLevelCategoriesCovered==-1
                                    return
                                 else
                                     for m=1:length(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j})
                                        categoriesInNextLevel = lrv.reportInfoTable{4}.nameKey(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        if length(categoriesInNextLevel{m})==1
                                            exSp2='   ';
                                        elseif length(categoriesInNextLevel{m})==2
                                            exSp2='  ';
                                        elseif length(categoriesInNextLevel{m})==3
                                            exSp2=' ';
                                        else
                                            exSp2=[];
                                        end

                                        if class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="cell" || ...
                                           (class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)==-1)
                                            nextLevelCategoriesCovered=lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m};
                                        else
                                            nextLevelCategoriesCovered=-1;
                                        end
                                        masteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(m);

                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered+</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=masteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Almost Mastered'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Some Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Low Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        end
                                    end
                                 end
                             end
                        end
                    end
                end   
            elseif masteryPercentage>=almostMasteredCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> Almost Mastered'])
                if nextLevelCategoriesCovered==-1
                    return
                else
                    for j=1:length(lrv.reportInfoTable{2}.nextLevelCategoriesCovered{h})
                        categoriesInNextLevel = lrv.reportInfoTable{3}.nameKey(lrv.reportInfoTable{2}.nextLevelCategoriesCovered{h});
                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{3}.masteryPercentage(lrv.reportInfoTable{2}.nextLevelCategoriesCovered{h});
                        if length(categoriesInNextLevel{j})==1
                            exSp2='   ';
                        elseif length(categoriesInNextLevel{j})==2
                            exSp2='  ';
                        elseif length(categoriesInNextLevel{j})==3
                            exSp2=' ';
                        else
                            exSp2=[];
                        end

                        if class(lrv.reportInfoTable{3}.nextLevelCategoriesCovered)=="cell" || ...
                           (class(lrv.reportInfoTable{3}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{3}.nextLevelCategoriesCovered)==-1)
                            nextLevelCategoriesCovered=lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j};
                        else
                            nextLevelCategoriesCovered=-1;
                        end
                        masteryPercentage = lrv.reportInfoTable{3}.masteryPercentage(j);

                        if masteryPercentage>=masteredPlusCutoffPercentage
                             disp([spaces spaces lrv.reportLevelContentLabel{3}{1} ' ' categoriesInNextLevel{j} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(j)) '% Knowledge --> <strong>Mastered+</strong>'])
                             if size(lrv.reportInfoTable,1)>=4
                                 if nextLevelCategoriesCovered==-1
                                    return
                                 else
                                     for m=1:length(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j})
                                        categoriesInNextLevel = lrv.reportInfoTable{4}.nameKey(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        if length(categoriesInNextLevel{m})==1
                                            exSp2='   ';
                                        elseif length(categoriesInNextLevel{m})==2
                                            exSp2='  ';
                                        elseif length(categoriesInNextLevel{m})==3
                                            exSp2=' ';
                                        else
                                            exSp2=[];
                                        end

                                        if class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="cell" || ...
                                           (class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)==-1)
                                            nextLevelCategoriesCovered=lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m};
                                        else
                                            nextLevelCategoriesCovered=-1;
                                        end
                                        masteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(m);

                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered+</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=masteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Almost Mastered'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Some Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Low Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        end
                                    end
                                 end
                             end
                        elseif masteryPercentage>=masteredCutoffPercentage
                            disp([spaces spaces lrv.reportLevelContentLabel{3}{1} ' ' categoriesInNextLevel{j} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(j)) '% Knowledge --> <strong>Mastered</strong>'])
                            if size(lrv.reportInfoTable,1)>=4
                                 if nextLevelCategoriesCovered==-1
                                    return
                                 else
                                     for m=1:length(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j})
                                        categoriesInNextLevel = lrv.reportInfoTable{4}.nameKey(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        if length(categoriesInNextLevel{m})==1
                                            exSp2='   ';
                                        elseif length(categoriesInNextLevel{m})==2
                                            exSp2='  ';
                                        elseif length(categoriesInNextLevel{m})==3
                                            exSp2=' ';
                                        else
                                            exSp2=[];
                                        end

                                        if class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="cell" || ...
                                           (class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)==-1)
                                            nextLevelCategoriesCovered=lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m};
                                        else
                                            nextLevelCategoriesCovered=-1;
                                        end
                                        masteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(m);

                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered+</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=masteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Almost Mastered'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Some Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Low Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        end
                                    end
                                 end
                             end
                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                            disp([spaces spaces lrv.reportLevelContentLabel{3}{1} ' ' categoriesInNextLevel{j} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(j)) '% Knowledge --> Almost Mastered'])
                            if size(lrv.reportInfoTable,1)>=4
                                 if nextLevelCategoriesCovered==-1
                                    return
                                 else
                                     for m=1:length(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j})
                                        categoriesInNextLevel = lrv.reportInfoTable{4}.nameKey(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        if length(categoriesInNextLevel{m})==1
                                            exSp2='   ';
                                        elseif length(categoriesInNextLevel{m})==2
                                            exSp2='  ';
                                        elseif length(categoriesInNextLevel{m})==3
                                            exSp2=' ';
                                        else
                                            exSp2=[];
                                        end

                                        if class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="cell" || ...
                                           (class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)==-1)
                                            nextLevelCategoriesCovered=lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m};
                                        else
                                            nextLevelCategoriesCovered=-1;
                                        end
                                        masteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(m);

                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered+</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=masteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Almost Mastered'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Some Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Low Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        end
                                    end
                                 end
                             end
                        elseif masteryPercentage>=someMasteryCutoffPercentage
                            disp([spaces spaces lrv.reportLevelContentLabel{3}{1} ' ' categoriesInNextLevel{j} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(j)) '% Knowledge --> Some Mastery'])
                            if size(lrv.reportInfoTable,1)>=4
                                 if nextLevelCategoriesCovered==-1
                                    return
                                 else
                                     for m=1:length(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j})
                                        categoriesInNextLevel = lrv.reportInfoTable{4}.nameKey(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        if length(categoriesInNextLevel{m})==1
                                            exSp2='   ';
                                        elseif length(categoriesInNextLevel{m})==2
                                            exSp2='  ';
                                        elseif length(categoriesInNextLevel{m})==3
                                            exSp2=' ';
                                        else
                                            exSp2=[];
                                        end

                                        if class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="cell" || ...
                                           (class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)==-1)
                                            nextLevelCategoriesCovered=lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m};
                                        else
                                            nextLevelCategoriesCovered=-1;
                                        end
                                        masteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(m);

                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered+</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=masteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Almost Mastered'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Some Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Low Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        end
                                    end
                                 end
                             end
                        elseif masteryPercentage<someMasteryCutoffPercentage
                            disp([spaces spaces lrv.reportLevelContentLabel{3}{1} ' ' categoriesInNextLevel{j} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(j)) '% Knowledge --> Low Mastery'])
                            if size(lrv.reportInfoTable,1)>=4
                                 if nextLevelCategoriesCovered==-1
                                    return
                                 else
                                     for m=1:length(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j})
                                        categoriesInNextLevel = lrv.reportInfoTable{4}.nameKey(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        if length(categoriesInNextLevel{m})==1
                                            exSp2='   ';
                                        elseif length(categoriesInNextLevel{m})==2
                                            exSp2='  ';
                                        elseif length(categoriesInNextLevel{m})==3
                                            exSp2=' ';
                                        else
                                            exSp2=[];
                                        end

                                        if class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="cell" || ...
                                           (class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)==-1)
                                            nextLevelCategoriesCovered=lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m};
                                        else
                                            nextLevelCategoriesCovered=-1;
                                        end
                                        masteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(m);

                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered+</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=masteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Almost Mastered'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Some Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Low Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        end
                                    end
                                 end
                             end
                        end
                    end
                end    
            elseif masteryPercentage>=someMasteryCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> Some Mastery'])
                if nextLevelCategoriesCovered==-1
                    return
                else
                    for j=1:length(lrv.reportInfoTable{2}.nextLevelCategoriesCovered{h})
                        categoriesInNextLevel = lrv.reportInfoTable{3}.nameKey(lrv.reportInfoTable{2}.nextLevelCategoriesCovered{h});
                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{3}.masteryPercentage(lrv.reportInfoTable{2}.nextLevelCategoriesCovered{h});
                        if length(categoriesInNextLevel{j})==1
                            exSp2='   ';
                        elseif length(categoriesInNextLevel{j})==2
                            exSp2='  ';
                        elseif length(categoriesInNextLevel{j})==3
                            exSp2=' ';
                        else
                            exSp2=[];
                        end

                        if class(lrv.reportInfoTable{3}.nextLevelCategoriesCovered)=="cell" || ...
                           (class(lrv.reportInfoTable{3}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{3}.nextLevelCategoriesCovered)==-1)
                            nextLevelCategoriesCovered=lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j};
                        else
                            nextLevelCategoriesCovered=-1;
                        end
                        masteryPercentage = lrv.reportInfoTable{3}.masteryPercentage(j);

                        if masteryPercentage>=masteredPlusCutoffPercentage
                             disp([spaces spaces lrv.reportLevelContentLabel{3}{1} ' ' categoriesInNextLevel{j} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(j)) '% Knowledge --> <strong>Mastered+</strong>'])
                             if size(lrv.reportInfoTable,1)>=4
                                 if nextLevelCategoriesCovered==-1
                                    return
                                 else
                                     for m=1:length(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j})
                                        categoriesInNextLevel = lrv.reportInfoTable{4}.nameKey(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        if length(categoriesInNextLevel{m})==1
                                            exSp2='   ';
                                        elseif length(categoriesInNextLevel{m})==2
                                            exSp2='  ';
                                        elseif length(categoriesInNextLevel{m})==3
                                            exSp2=' ';
                                        else
                                            exSp2=[];
                                        end

                                        if class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="cell" || ...
                                           (class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)==-1)
                                            nextLevelCategoriesCovered=lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m};
                                        else
                                            nextLevelCategoriesCovered=-1;
                                        end
                                        masteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(m);

                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered+</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=masteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Almost Mastered'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Some Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Low Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        end
                                    end
                                 end
                             end
                        elseif masteryPercentage>=masteredCutoffPercentage
                            disp([spaces spaces lrv.reportLevelContentLabel{3}{1} ' ' categoriesInNextLevel{j} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(j)) '% Knowledge --> <strong>Mastered</strong>'])
                            if size(lrv.reportInfoTable,1)>=4
                                 if nextLevelCategoriesCovered==-1
                                    return
                                 else
                                     for m=1:length(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j})
                                        categoriesInNextLevel = lrv.reportInfoTable{4}.nameKey(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        if length(categoriesInNextLevel{m})==1
                                            exSp2='   ';
                                        elseif length(categoriesInNextLevel{m})==2
                                            exSp2='  ';
                                        elseif length(categoriesInNextLevel{m})==3
                                            exSp2=' ';
                                        else
                                            exSp2=[];
                                        end

                                        if class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="cell" || ...
                                           (class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)==-1)
                                            nextLevelCategoriesCovered=lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m};
                                        else
                                            nextLevelCategoriesCovered=-1;
                                        end
                                        masteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(m);

                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered+</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=masteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Almost Mastered'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Some Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Low Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        end
                                    end
                                 end
                             end
                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                            disp([spaces spaces lrv.reportLevelContentLabel{3}{1} ' ' categoriesInNextLevel{j} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(j)) '% Knowledge --> Almost Mastered'])
                            if size(lrv.reportInfoTable,1)>=4
                                 if nextLevelCategoriesCovered==-1
                                    return
                                 else
                                     for m=1:length(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j})
                                        categoriesInNextLevel = lrv.reportInfoTable{4}.nameKey(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        if length(categoriesInNextLevel{m})==1
                                            exSp2='   ';
                                        elseif length(categoriesInNextLevel{m})==2
                                            exSp2='  ';
                                        elseif length(categoriesInNextLevel{m})==3
                                            exSp2=' ';
                                        else
                                            exSp2=[];
                                        end

                                        if class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="cell" || ...
                                           (class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)==-1)
                                            nextLevelCategoriesCovered=lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m};
                                        else
                                            nextLevelCategoriesCovered=-1;
                                        end
                                        masteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(m);

                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered+</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=masteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Almost Mastered'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Some Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Low Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        end
                                    end
                                 end
                             end
                        elseif masteryPercentage>=someMasteryCutoffPercentage
                            disp([spaces spaces lrv.reportLevelContentLabel{3}{1} ' ' categoriesInNextLevel{j} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(j)) '% Knowledge --> Some Mastery'])
                            if size(lrv.reportInfoTable,1)>=4
                                 if nextLevelCategoriesCovered==-1
                                    return
                                 else
                                     for m=1:length(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j})
                                        categoriesInNextLevel = lrv.reportInfoTable{4}.nameKey(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        if length(categoriesInNextLevel{m})==1
                                            exSp2='   ';
                                        elseif length(categoriesInNextLevel{m})==2
                                            exSp2='  ';
                                        elseif length(categoriesInNextLevel{m})==3
                                            exSp2=' ';
                                        else
                                            exSp2=[];
                                        end

                                        if class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="cell" || ...
                                           (class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)==-1)
                                            nextLevelCategoriesCovered=lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m};
                                        else
                                            nextLevelCategoriesCovered=-1;
                                        end
                                        masteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(m);

                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered+</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=masteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Almost Mastered'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Some Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Low Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        end
                                    end
                                 end
                             end
                        elseif masteryPercentage<someMasteryCutoffPercentage
                            disp([spaces spaces lrv.reportLevelContentLabel{3}{1} ' ' categoriesInNextLevel{j} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(j)) '% Knowledge --> Low Mastery'])
                            if size(lrv.reportInfoTable,1)>=4
                                 if nextLevelCategoriesCovered==-1
                                    return
                                 else
                                     for m=1:length(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j})
                                        categoriesInNextLevel = lrv.reportInfoTable{4}.nameKey(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        if length(categoriesInNextLevel{m})==1
                                            exSp2='   ';
                                        elseif length(categoriesInNextLevel{m})==2
                                            exSp2='  ';
                                        elseif length(categoriesInNextLevel{m})==3
                                            exSp2=' ';
                                        else
                                            exSp2=[];
                                        end

                                        if class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="cell" || ...
                                           (class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)==-1)
                                            nextLevelCategoriesCovered=lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m};
                                        else
                                            nextLevelCategoriesCovered=-1;
                                        end
                                        masteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(m);

                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered+</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=masteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Almost Mastered'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Some Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Low Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        end
                                    end
                                 end
                             end
                        end
                    end
                end    
            elseif masteryPercentage<someMasteryCutoffPercentage
                disp([spaces lrv.reportLevelContentLabel{2}{1} ' ' categoriesInNextLevel{h} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(h)) '% Knowledge --> Low Mastery'])
                if nextLevelCategoriesCovered==-1
                    return
                else
                    for j=1:length(lrv.reportInfoTable{2}.nextLevelCategoriesCovered{h})
                        categoriesInNextLevel = lrv.reportInfoTable{3}.nameKey(lrv.reportInfoTable{2}.nextLevelCategoriesCovered{h});
                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{3}.masteryPercentage(lrv.reportInfoTable{2}.nextLevelCategoriesCovered{h});
                        if length(categoriesInNextLevel{j})==1
                            exSp2='   ';
                        elseif length(categoriesInNextLevel{j})==2
                            exSp2='  ';
                        elseif length(categoriesInNextLevel{j})==3
                            exSp2=' ';
                        else
                            exSp2=[];
                        end

                        if class(lrv.reportInfoTable{3}.nextLevelCategoriesCovered)=="cell" || ...
                           (class(lrv.reportInfoTable{3}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{3}.nextLevelCategoriesCovered)==-1)
                            nextLevelCategoriesCovered=lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j};
                        else
                            nextLevelCategoriesCovered=-1;
                        end
                        masteryPercentage = lrv.reportInfoTable{3}.masteryPercentage(j);

                        if masteryPercentage>=masteredPlusCutoffPercentage
                             disp([spaces spaces lrv.reportLevelContentLabel{3}{1} ' ' categoriesInNextLevel{j} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(j)) '% Knowledge --> <strong>Mastered+</strong>'])
                             if size(lrv.reportInfoTable,1)>=4
                                 if nextLevelCategoriesCovered==-1
                                    return
                                 else
                                     for m=1:length(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j})
                                        categoriesInNextLevel = lrv.reportInfoTable{4}.nameKey(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        if length(categoriesInNextLevel{m})==1
                                            exSp2='   ';
                                        elseif length(categoriesInNextLevel{m})==2
                                            exSp2='  ';
                                        elseif length(categoriesInNextLevel{m})==3
                                            exSp2=' ';
                                        else
                                            exSp2=[];
                                        end

                                        if class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="cell" || ...
                                           (class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)==-1)
                                            nextLevelCategoriesCovered=lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m};
                                        else
                                            nextLevelCategoriesCovered=-1;
                                        end
                                        masteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(m);

                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered+</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=masteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Almost Mastered'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Some Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Low Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        end
                                    end
                                 end
                             end
                        elseif masteryPercentage>=masteredCutoffPercentage
                            disp([spaces spaces lrv.reportLevelContentLabel{3}{1} ' ' categoriesInNextLevel{j} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(j)) '% Knowledge --> <strong>Mastered</strong>'])
                            if size(lrv.reportInfoTable,1)>=4
                                 if nextLevelCategoriesCovered==-1
                                    return
                                 else
                                     for m=1:length(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j})
                                        categoriesInNextLevel = lrv.reportInfoTable{4}.nameKey(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        if length(categoriesInNextLevel{m})==1
                                            exSp2='   ';
                                        elseif length(categoriesInNextLevel{m})==2
                                            exSp2='  ';
                                        elseif length(categoriesInNextLevel{m})==3
                                            exSp2=' ';
                                        else
                                            exSp2=[];
                                        end

                                        if class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="cell" || ...
                                           (class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)==-1)
                                            nextLevelCategoriesCovered=lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m};
                                        else
                                            nextLevelCategoriesCovered=-1;
                                        end
                                        masteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(m);

                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered+</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=masteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Almost Mastered'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Some Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Low Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        end
                                    end
                                 end
                             end
                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                            disp([spaces spaces lrv.reportLevelContentLabel{3}{1} ' ' categoriesInNextLevel{j} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(j)) '% Knowledge --> Almost Mastered'])
                            if size(lrv.reportInfoTable,1)>=4
                                 if nextLevelCategoriesCovered==-1
                                    return
                                 else
                                     for m=1:length(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j})
                                        categoriesInNextLevel = lrv.reportInfoTable{4}.nameKey(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        if length(categoriesInNextLevel{m})==1
                                            exSp2='   ';
                                        elseif length(categoriesInNextLevel{m})==2
                                            exSp2='  ';
                                        elseif length(categoriesInNextLevel{m})==3
                                            exSp2=' ';
                                        else
                                            exSp2=[];
                                        end

                                        if class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="cell" || ...
                                           (class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)==-1)
                                            nextLevelCategoriesCovered=lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m};
                                        else
                                            nextLevelCategoriesCovered=-1;
                                        end
                                        masteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(m);

                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered+</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=masteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Almost Mastered'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Some Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Low Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        end
                                    end
                                 end
                             end
                        elseif masteryPercentage>=someMasteryCutoffPercentage
                            disp([spaces spaces lrv.reportLevelContentLabel{3}{1} ' ' categoriesInNextLevel{j} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(j)) '% Knowledge --> Some Mastery'])
                            if size(lrv.reportInfoTable,1)>=4
                                 if nextLevelCategoriesCovered==-1
                                    return
                                 else
                                     for m=1:length(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j})
                                        categoriesInNextLevel = lrv.reportInfoTable{4}.nameKey(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        if length(categoriesInNextLevel{m})==1
                                            exSp2='   ';
                                        elseif length(categoriesInNextLevel{m})==2
                                            exSp2='  ';
                                        elseif length(categoriesInNextLevel{m})==3
                                            exSp2=' ';
                                        else
                                            exSp2=[];
                                        end

                                        if class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="cell" || ...
                                           (class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)==-1)
                                            nextLevelCategoriesCovered=lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m};
                                        else
                                            nextLevelCategoriesCovered=-1;
                                        end
                                        masteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(m);

                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered+</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=masteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Almost Mastered'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Some Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Low Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        end
                                    end
                                 end
                             end
                        elseif masteryPercentage<someMasteryCutoffPercentage
                            disp([spaces spaces lrv.reportLevelContentLabel{3}{1} ' ' categoriesInNextLevel{j} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(j)) '% Knowledge --> Low Mastery'])
                            if size(lrv.reportInfoTable,1)>=4
                                 if nextLevelCategoriesCovered==-1
                                    return
                                 else
                                     for m=1:length(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j})
                                        categoriesInNextLevel = lrv.reportInfoTable{4}.nameKey(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(lrv.reportInfoTable{3}.nextLevelCategoriesCovered{j});
                                        if length(categoriesInNextLevel{m})==1
                                            exSp2='   ';
                                        elseif length(categoriesInNextLevel{m})==2
                                            exSp2='  ';
                                        elseif length(categoriesInNextLevel{m})==3
                                            exSp2=' ';
                                        else
                                            exSp2=[];
                                        end

                                        if class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="cell" || ...
                                           (class(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{4}.nextLevelCategoriesCovered)==-1)
                                            nextLevelCategoriesCovered=lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m};
                                        else
                                            nextLevelCategoriesCovered=-1;
                                        end
                                        masteryPercentage = lrv.reportInfoTable{4}.masteryPercentage(m);

                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered+</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=masteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> <strong>Mastered</strong>'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Almost Mastered'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Some Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                            disp([spaces spaces spaces lrv.reportLevelContentLabel{4}{1} ' ' categoriesInNextLevel{m} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(m)) '% Knowledge --> Low Mastery'])
                                            if size(lrv.reportInfoTable,1)>=5
                                                 if nextLevelCategoriesCovered==-1
                                                    return
                                                 else
                                                     for n=1:length(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m})
                                                        categoriesInNextLevel = lrv.reportInfoTable{5}.nameKey(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        categoriesInNextLevelMasteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(lrv.reportInfoTable{4}.nextLevelCategoriesCovered{m});
                                                        if length(categoriesInNextLevel{n})==1
                                                            exSp2='   ';
                                                        elseif length(categoriesInNextLevel{n})==2
                                                            exSp2='  ';
                                                        elseif length(categoriesInNextLevel{n})==3
                                                            exSp2=' ';
                                                        else
                                                            exSp2=[];
                                                        end

                                                        if class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="cell" || ...
                                                           (class(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)=="double" && ~all(lrv.reportInfoTable{5}.nextLevelCategoriesCovered)==-1)
                                                            nextLevelCategoriesCovered=lrv.reportInfoTable{5}.nextLevelCategoriesCovered{n};
                                                        else
                                                            nextLevelCategoriesCovered=-1;
                                                        end
                                                        masteryPercentage = lrv.reportInfoTable{5}.masteryPercentage(n);

                                                        if masteryPercentage>=masteredPlusCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered+</strong>'])
                                                        elseif masteryPercentage>=masteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> <strong>Mastered</strong>'])
                                                        elseif masteryPercentage>=almostMasteredCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Almost Mastered'])
                                                        elseif masteryPercentage>=someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Some Mastery'])
                                                        elseif masteryPercentage<someMasteryCutoffPercentage
                                                            disp([spaces spaces spaces spaces lrv.reportLevelContentLabel{5}{1} ' ' categoriesInNextLevel{n} ': ' exSp2 num2str(categoriesInNextLevelMasteryPercentage(n)) '% Knowledge --> Low Mastery'])
                                                        end
                                                    end
                                                 end
                                            end
                                        end
                                    end
                                 end
                             end
                        end
                    end
                end   
            end
        end
        disp(' ')
    end
end 

end

