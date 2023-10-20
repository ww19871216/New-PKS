function showInstructionsReportPage

    
instructionsPage{1}=' ';
instructionsPage{2}='Please make sure to print out the instructions.';
instructionsPage{3}=' ';
instructionsPage{4}='Then, press "return" to exit this reporting area.';

for i=1:length(instructionsPage)-1
    disp(instructionsPage{i})
end
input(instructionsPage{end},'s');

end

