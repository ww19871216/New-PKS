function keyPaths = getAllKeyPaths_HUB

cp=pwd;
startPath=cp(1:(strfind(cp,'MATLAB')-1));

if ispc
    implementationFilesFolder=[startPath 'MATLAB\Adaptive Shell HUB\Implementation Files\'];
    studentDBfolder=[startPath 'MATLAB\Adaptive Shell HUB\Student Databases\'];
    computationShellFolderLocation=[startPath 'MATLAB\PKS Model\Implementation\Computation Shell\Files\'];
elseif ismac
    implementationFilesFolder=[startPath 'MATLAB/Adaptive Shell HUB/Implementation Files/'];
    studentDBfolder=[startPath 'MATLAB/Adaptive Shell HUB/Student Databases/'];
    computationShellFolderLocation=[keyPaths.startPath 'MATLAB/PKS Model/Implementation/Computation Shell/Files/'];
end

keyPaths.startPath=startPath;
keyPaths.implementationFilesFolder=implementationFilesFolder;
keyPaths.studentDBfolder=studentDBfolder;
keyPaths.computationShellFolderLocation=computationShellFolderLocation;

keyPaths=struct2table(keyPaths);

end

