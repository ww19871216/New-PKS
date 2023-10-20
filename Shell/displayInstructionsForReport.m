function displayInstructionsForReport

global masteryCutoffs
masteredPlusCutoff=num2str(round(100*masteryCutoffs.masteredPlusCutoff));
masteredCutoff=num2str(round(100*masteryCutoffs.masteredCutoff));
almostMasteredCutoff=num2str(round(100*masteryCutoffs.almostMasteredCutoff));
someMasteryCutoff=num2str(round(100*masteryCutoffs.someMasteryCutoff));

disp(' ')
disp('<strong>How to Interpret the Knowledge Report</strong>')
disp(' ')
disp('The top of the report shows the Overall Course Mastery by Knowledge percentage.')
disp('This is simply the average of all the Module Knowledge percentages in the course.')
disp('A similar approach is used to compute each of these Module Knowledge percentages.')
disp('This is simply the average of all the ELO Knowledge percentages in the Module.')
disp('And these ELO Knowledge percentages are simply the AI’s estimate that the student')
disp('answers correctly to a randomly chosen question from that ELO given in a test.')
disp('For example, if some ELO is rated at 83% Knowledge, the AI thinks the student has an')
disp('83% chance of answering correctly to a random question from that ELO given in a test.')
disp(' ')
disp('These Knowledge percentages are used to classify knowledge into five categories, as shown:')
disp(' ')
disp(['       ' masteredPlusCutoff '% <= Knowledge Percentage < 100%  --> <strong>Mastered+</strong>'])
disp(['       ' masteredCutoff '% <= Knowledge Percentage <  ' masteredPlusCutoff '%  --> <strong>Mastered</strong>'])
disp(['       ' almostMasteredCutoff '% <= Knowledge Percentage <  ' masteredCutoff '%  --> Almost Mastered'])
disp(['       ' someMasteryCutoff '% <= Knowledge Percentage <  ' almostMasteredCutoff '%  --> Some Mastery'])
disp(['        0% <= Knowledge Percentage <  ' someMasteryCutoff '%  --> Low Mastery'])
disp(' ')
disp('To get the most out of this report, the student is encouraged to use the following guidelines:')
disp(' ')
disp('•If the Overall Course Mastery is "<strong>Mastered+</strong>", the student can skip the entire course.')
disp(' ')
disp('•If the Overall Course Mastery is "<strong>Mastered</strong>", the student can probably skip the entire course.')
disp(' But the student may want to review the Modules with the lowest mastery levels.')
disp(' ')
disp('•For any other levels of Overall Course Mastery, the student should take the course.')
disp(' But the student may be able to skip some Modules, depending on their mastery level.')
disp(' ')
disp('To decide which Modules and ELOs should be skipped or focused on, consider the following:')
disp(' ')
disp('(1) Any Module tagged "<strong>Mastered+</strong>" can almost certainly be skipped.')
disp('    The student has sufficient knowledge of that Module.')
disp(' ')
disp('(2) Any Module tagged "<strong>Mastered</strong>" can probably be safely skipped.')
disp('    The student probably has sufficient knowledge of that Module.')
disp('    But the student may want to review the Module ELOs with the lowest mastery levels.')
disp(' ')
disp('(3) Any Module tagged "Almost Mastered" should probably be reviewed.')
disp('    The student probably needs more knowledge of at least some of the ELOs in the Module.')
disp('    The student should especially focus on the Module ELOs with the lowest mastery levels.')
disp(' ')
disp('(4) Any Module tagged with "Some Mastery" should be reviewed.')
disp('    The student definitely needs more knowledge of that Module.')
disp('    The student should especially focus on the Module ELOs with the lowest mastery levels.')
disp(' ')
disp('(5) Any Module tagged with "Low Mastery" should be carefully reviewed.')
disp('    The student definitely needs much more knowledge of that Module.')
disp(' ')

end


