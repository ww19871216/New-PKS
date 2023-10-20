function products = getAvailableProducts_HUB

keyPaths = getAllKeyPaths_HUB;

t = getAllSubFoldersInFolder(keyPaths.implementationFilesFolder);
products=unique(cellfun(@(x) x,t.folderName,'UniformOutput',0));
end

