%**************************************************************************
% BOW Master script
%**************************************************************************

EVENTinit;

FID = fopen('results.txt', 'a');
fprintf(FID, '\n\n------------------');
fprintf(FID, '\nNEW MAIN EXECUTION:');
fprintf(FID, '\n------------------');
fclose(FID);


%% Final:
BOW_param('custom',5,25,256,'hoggraylbp',11,'kmeans',200,20,'hard','103_');
BOW_param('dense_grid',5,25,25,'rgbhogclbpms',11,'kmeans',200,20,'hard','104_');
BOW_param('dense_grid',5,25,25,'hoglbp',11,'kmeans',100,20,'hard','115_');
BOW_param('dense_grid',5,25,25,'rgbhogclbpms',11,'kmeans',400,20,'hard','116_');
BOW_param('dense_grid',5,25,25,'hoglbp',11,'kmeans',400,20,'hard','118_');
BOW_param('rand',5,25,256,'rgbhogclbpms',11,'kmeans',200,20,'soft','138_');
BOW_param('harris',5,25,256,'hoglbp',11,'kmeans',200,20,'soft','140_');
BOW_param('rand',5,25,256,'rgbhogclbpms',11,'kmeans',100,20,'hard','142_');

labelFilesPrefixes = {...
 '103_',...
 '104_',...
 '115_',...
 '116_',...
 '118_',...
 '138_',...
 '140_',...
 '142_'};


do_multipart_classification(labelFilesPrefixes);

FID = fopen('results.txt', 'a');
fprintf(FID, '\n\nFiles used:\n');
for i = 1:size(labelFilesPrefixes,2)
   fprintf(FID, '%s\n', labelFilesPrefixes{i});    
end
fprintf(FID, '\n------------------');
fprintf(FID, '\nEND MAIN EXECUTION');
fprintf(FID, '\n------------------');
fclose(FID);
