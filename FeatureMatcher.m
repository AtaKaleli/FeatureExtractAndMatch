function FeatureMatcher(image1,image2,features1,features2, valid_points1,valid_points2)

%here, I used "matchFeatures" build in function to match the features of
%two images taken as input with their properties(calculated in FeatureExtractor function)

%I used "unique" "true" property, which leads for only the true matches
%will be generated.
[indexPairs, matchMetric] = matchFeatures(features1, features2,"Unique",true);


% I created matched keypoints using the valid_points of images
matchedPoints1 = valid_points1(indexPairs(:, 1));
matchedPoints2 = valid_points2(indexPairs(:, 2));

%After that, as I asked to do "Display the top ten matched key points", I
%used "selectStrongest" build in function, which takes the top N strongest
%matched points based on the metrices(distances) of two images. Here, I
%selected the number property as 10, but due to sometimes computer detects 
% the same matching points more then ones, it occurs a duplicated matched points
%in the matchedPoints arrays. So I talked this issue with Meryem hoca and
%she said there will be no problem. If you want to see exatcly 10 matched
%points, maybe you can give a try with selectStrongest with 11 or 12.
strongestMatchedPoints1 = selectStrongest(matchedPoints1, 10);
strongestMatchedPoints2 = selectStrongest(matchedPoints2, 10);



%I plot the matches using showMatchedFeatures build in function. I
%displayed the distance plot table in each figure. So I have total 8
%figures, it contains one matching result and one top100 distance plotting
%result.
figure;
subplot(2,1,1);
showMatchedFeatures(image1, image2, strongestMatchedPoints1, strongestMatchedPoints2,"montage");

%sort the distances(matchMetric) in ascending order to plot the matching distance for 
% the top 100 matched key points
sortedMatchMetric=sort(matchMetric);

%ploting the top100 matched keypoints
X = 1:100;
Y = sortedMatchMetric(1:100);
subplot(2,1,2);
plot(X,Y,"LineWidth",2,"Color",[.6 0 0]);
xlabel("Indices of key points");                  
ylabel("Matching Distance");                 
title("Matching Distance for the Top 100 Matched KP");              

end