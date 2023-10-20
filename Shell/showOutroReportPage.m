function showOutroReportPage

global grv

disp(' ')
if grv.product_area==2
    outroReportPage{1}=' ';
    outroReportPage{2}='Please make sure to print the report.';
    outroReportPage{3}=' ';
    outroReportPage{4}='Then, press "return" to see how to use this report to learn more efficiently.';
else
    outroReportPage{1}=' ';
    outroReportPage{2}='Note that you can print this report if necessary.';
    outroReportPage{3}=' ';
    outroReportPage{4}='Press "return" to exit this reporting area.';
end

for i=1:length(outroReportPage)-1
    disp(outroReportPage{i})
end
input(outroReportPage{end},'s');
end

