
function [features, valid_points] = FeatureExtractor(folderName)
    %here, to get the images from  the folder, I used "dir" and "fullfile"
    %build in function. These functions basically:
    %dir: dir NAME lists the files in a folder.
    %fullfile: Build full file name from parts.It takes second input as
    %"fileSeperator". In my case, it is "jpg"
    files = dir(fullfile(folderName, "*.jpg"));

    %here, I used "numel" build in function to get number of elements in my
    %folder. In my case, it is 10.
    numberOfImages = numel(files);

    %As I explained in main, I created 10x1 cell for features and valid_pnt
    %In this way, I can store every one of the images features and
    %valid_points in 1 cell, so that I can then use them in feature match
    features = cell(numberOfImages, 1); 
    valid_points = cell(numberOfImages, 1);
    
    %  Generate SIFT features (key points) for all read images
    for i = 1:numberOfImages
        % I Read the image
        imagePath = fullfile(folderName, files(i).name);
        image = imread(imagePath);

        %detecting sift features of the image using "detectSIFTFeatures"
        sift = detectSIFTFeatures(image);

        %here, I save every one of the extracted features into the features 
        % and valid_points cell arrays, using "extractFeatures" build in
        %function
        [features{i}, valid_points{i}] = extractFeatures(image, sift);
        
    end 
end

   