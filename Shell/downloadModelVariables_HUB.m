function [KPcontentMap,questionModelMap,adaptiveTestParameters,initialAdaptiveTestSettings,masteryCutoffs,...
          modelParameters,nChannels,outsideQuestionsToTest,finalExamQuestions,PKSserviceVersion,contentLevelsTerminology]=downloadModelVariables_HUB(product)

pathsep = getPathSeparator;
keyPaths = getAllKeyPaths_HUB;
implementationFilesLocation=[keyPaths.implementationFilesFolder product pathsep];

filename=[implementationFilesLocation 'KPcontentMap_' product '.csv'];
KPcontentMap=readtable(filename);
charColsQ=find(contains(KPcontentMap.Properties.VariableNames,'textid')==1);
opts=detectImportOptions(filename);
opts.VariableTypes(charColsQ)={'char'};
KPcontentMap=readtable(filename,opts);

filename=[implementationFilesLocation 'questionModelMap_' product '.csv'];
questionModelMap=readtable(filename);
charColsQ=find(contains(questionModelMap.Properties.VariableNames,'textid')==1);
opts=detectImportOptions(filename);
opts.VariableTypes(charColsQ)={'char'};
questionModelMap=readtable(filename,opts); 

adaptiveTestParameters=readtable([implementationFilesLocation 'adaptiveTestParameters_' product '.csv']);
initialAdaptiveTestSettings=readtable([implementationFilesLocation 'initialAdaptiveTestSettings_' product '.csv']);
masteryCutoffs=readtable([implementationFilesLocation 'masteryCutoffs_' product '.csv']);
temp=readtable([implementationFilesLocation 'modelParameters_' product '.csv']);
modelParameters=temp.modelParameters;
%NEED to CHANGE
if length(modelParameters)==18
    modelParameters(19:24)=[0 1 5 0 1 5];
end

clear temp opts

nChannels=length(strmatch('weights_',questionModelMap.Properties.VariableNames));
for i=1:nChannels
    eval(['weights(:,i)=questionModelMap.weights_' num2str(i) ';']);
    eval (['questionModelMap.weights_' num2str(i) '=[];']);
end
questionModelMap.weights=weights;
clear weights

filename=[implementationFilesLocation 'outsideQuestionsToTest_' product '.csv'];
opts=detectImportOptions(filename);
opts.VariableTypes(:)={'char'};
outsideQuestionsToTest=readtable(filename,opts);

filename=[implementationFilesLocation 'finalExamQuestions_' product '.csv'];
opts=detectImportOptions(filename);
opts.VariableTypes(:)={'char'};
finalExamQuestions=readtable(filename,opts);

filename=[implementationFilesLocation 'PKSserviceVersion_' product '.csv'];
t=readtable(filename);
PKSserviceVersion=t.version;

filename=[implementationFilesLocation 'contentLevelsTerminology_' product '.csv'];
opts=detectImportOptions(filename);
opts.VariableTypes(:)={'char'};
contentLevelsTerminology=readtable(filename,opts);
end

