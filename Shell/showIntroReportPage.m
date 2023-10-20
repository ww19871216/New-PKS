function showIntroReportPage

global grv

if grv.product_area==2 && grv.areaPos==0
    introReportPage{1}=' ';
    introReportPage{2}='You have finished the Initial Comprehensive Test!';
    introReportPage{3}=' ';
    introReportPage{4}='Press "return" to see a knowledge report based on this test performance.';

elseif ismember(grv.product_area,[4 18 30]) && grv.areaPos==0
    introReportPage{1}=' ';
    introReportPage{2}='You have finished the Adaptive Quiz!';
    introReportPage{3}=' ';
    introReportPage{4}='Press "return" to see a knowledge report of the quiz content.';

elseif ismember(grv.product_area,[6 28]) && grv.areaPos==0
    introReportPage{1}=' ';
    introReportPage{2}='You have finished the Comprehensive Adaptive TEST that resets you Knowledge State!';
    introReportPage{3}=' ';
    introReportPage{4}='Press "return" to see a knowledge report based on this test performance.';

elseif grv.product_area==8 && grv.areaPos==0
    introReportPage{1}=' ';
    introReportPage{2}='You have completed and submitted this part of the course!';
    introReportPage{3}=' ';
    introReportPage{4}='Press "return" to see a knowledge report from this recent work.';

elseif grv.product_area==10 && grv.areaPos==0
    introReportPage{1}=' ';
    introReportPage{2}='You have completed and submitted the Final Exam!';
    introReportPage{3}=' ';
    introReportPage{4}='Press "return" to see a knowledge report based on your Final Exam performance.';
elseif ismember(grv.product_area,[11 12])
    introReportPage{1}=' ';
    introReportPage{2}='Thank you, the requested knowledge report is ready.';
    introReportPage{3}=' ';
    introReportPage{4}='Press "return" to see the report.';
elseif grv.product_area==14 && grv.areaPos==0
    introReportPage{1}=' ';
    introReportPage{2}='You have finished the Comprehensive Adaptive FINAL!';
    introReportPage{3}=' ';
    introReportPage{4}='Press "return" to see a knowledge report based on your FINAL performance.';
elseif grv.product_area==16 && grv.areaPos==0
    introReportPage{1}=' ';
    introReportPage{2}='You have finished the Comprehensive Adaptive QUIZ!';
    introReportPage{3}=' ';
    introReportPage{4}='Press "return" to see an updated knowledge report of the entire course content.';
if ismember(grv.product_area,[32 34]) && grv.areaPos==0
    introReportPage{1}=' ';
    introReportPage{2}='You have finished the Test!';
    introReportPage{3}=' ';
    introReportPage{4}='Press "return" to see a knowledge report based on this test performance.';
elseif ismember(grv.product_area,[2 4 6 8 10 14 16 18 28 30 32 34])
    introReportPage=cell(0);
end

if ~isempty(introReportPage)
    for i=1:length(introReportPage)-1
        disp(introReportPage{i})
    end
    input(introReportPage{end},'s');
end
end

