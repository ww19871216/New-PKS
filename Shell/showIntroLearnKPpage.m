function showIntroLearnKPpage

global grv lrv KPcontentMap

if ismember(grv.product_area,[19 21]) && grv.areaPos==0
    introLearnKPpage{1}=' ';
    introLearnKPpage{2}=['The AI has selected the Knowledge Point ' KPcontentMap.KP_textid{lrv.KPtoLearn} ' for you to practice.'];
    introLearnKPpage{3}='Press "return" to begin practicing this Knowledge Point.';
elseif ismember(grv.product_area,[19 21]) 
    introLearnKPpage{1}=' ';
    introLearnKPpage{2}=['You were in the midst of practicing the Knowledge Point ' KPcontentMap.KP_textid{lrv.KPtoLearn} '.'];
    introLearnKPpage{3}='Press "return" to go back to practicing this Knowledge Point.';
elseif ismember(grv.product_area,23) && grv.areaPos==0
    introLearnKPpage{1}=' ';
    introLearnKPpage{2}=['You have chosen to practice the Knowledge Point ' KPcontentMap.KP_textid{lrv.KPtoLearn} '.'];
    introLearnKPpage{3}='Press "return" to begin learning this Knowledge Point.';
elseif ismember(grv.product_area,23) 
    introLearnKPpage{1}=' ';
    introLearnKPpage{2}=['You were in the midst of practicing the Knowledge Point ' KPcontentMap.KP_textid{lrv.KPtoLearn} '.'];
    introLearnKPpage{3}='Press "return" to go back to learning this Knowledge Point.';
end

for i=1:length(introLearnKPpage)-1
    disp(introLearnKPpage{i})
end
input(introLearnKPpage{end},'s');
end

