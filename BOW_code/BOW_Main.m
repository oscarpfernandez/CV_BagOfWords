%**************************************************************************
% BOW Master script
%**************************************************************************

EVENTinit;

FID = fopen('results.txt', 'a');
fprintf(FID, '\n\n------------------');
fprintf(FID, '\nNEW MAIN EXECUTION:');
fprintf(FID, '\n------------------');
fclose(FID);

%% Yashin:
%BOW_param('rand',5,25,200,'rgb',11,'rand',100,10,'1nn','0_rand_rgb_rand_');
%BOW_param('harris',5,25,196,'sift',11,'kmeans',200,20,'1nn','1_harris_sift_');
%BOW_param('sift',5,25,196,'sift',11,'kmeans',200,20,'1nn','2_sift_');
%BOW_param('rand',5,25,196,'rgbhog',11,'kmeans',200,20,'1nn','3_rand_rgbhog_');
% BOW_param('rand',5,25,196,'rgb',11,'kmeans',100,20,'1nn','4_rand_rgb_');
%BOW_param('dense_grid',5,25,16,'rgbhoglbp',11,'kmeans',200,20,'1nn','5_dense_rgbhoglbp_');
%BOW_param('harrislaplace',5,25,16,'colorsift',11,'kmeans',200,20,'1nn','6_harlap_colorsift_');
%BOW_param('dense_grid',5,25,25,'rgbhoglbp',11,'kmeans',200,20,'1nn','7_dense_rgbhoglbp_');
%BOW_param('sift',5,25,25,'rgblbp',11,'kmeans',200,20,'1nn','8_sift_rgblbp_');
%BOW_param('harrislaplace',5,25,25,'lbp',11,'kmeans',200,20,'1nn','9_harlap_lbp_');
%BOW_param('harrislaplace',5,25,16,'sift',11,'kmeans',500,100,'1nn','9_1_harlap_colorsift_');
%BOW_param('dense_grid',5,25,25,'hoggraylbp',11,'kmeans',200,20,'1nn','9_2_dense_hoggraylbp_');
%BOW_param('harrislaplace',5,25,25,'hoggraylbp',11,'kmeans',200,20,'1nn','9_3_harlap_hoggraylbp_');
%BOW_param('custom',5,25,144,'rgb',11,'emgm',200,20,'soft','9_4_harlap_hoggraylbp_');
%BOW_param('custom',5,25,144,'rgbhoglbp',11,'emgm',100,20,'soft','9_5_custom_rgbhoglbp_');


%% Ricard:
% BOW_param('dense_grid',5,25,25,'rgb',11,'kmeans',200,20,'1nn','10_dense_grid_');
% BOW_param('dense_grid',5,25,25,'lbp',11,'kmeans',200,20,'1nn','10_dense_grid_');
% BOW_param('dense_grid',5,25,25,'rgblbp',11,'kmeans',200,20,'1nn','10_dense_grid_');
% BOW_param('dense_grid',5,25,25,'rgbhog',11,'kmeans',200,20,'1nn','10_dense_grid_');
% BOW_param('dense_grid',5,25,25,'hoglbp',11,'kmeans',200,20,'1nn','10_dense_grid_');
% BOW_param('dense_grid',5,25,25,'rgbhoglbp',11,'kmeans',200,20,'1nn','10_dense_grid_');
% BOW_param('dense_grid',5,25,25,'sift',11,'kmeans',200,20,'1nn','10_dense_grid_');
% BOW_param('dense_grid',5,25,25,'colorsift',11,'kmeans',200,20,'1nn','10_dense_grid_');


%% Naoufal:
% BOW_param('custom',5,25,25,'rgb',11,'kmeans',200,20,'hard','20_custom_');
% BOW_param('custom',5,25,25,'lbp',11,'kmeans',200,20,'hard','20_custom_');
% BOW_param('custom',5,25,25,'rgblbp',11,'kmeans',200,20,'hard','20_custom_');
% BOW_param('custom',5,25,25,'rgbhog',11,'kmeans',200,20,'hard','20_custom_');
% BOW_param('custom',5,25,25,'hoglbp',11,'kmeans',200,20,'hard','20_custom_');
% BOW_param('custom',5,25,25,'rgbhoglbp',11,'kmeans',200,20,'soft','20_custom_');
% BOW_param('custom',5,25,25,'sift',11,'kmeans',200,20,'soft','20_custom_');
% BOW_param('custom',5,25,25,'colorsift',11,'kmeans',200,20,'soft','20_custom_');

%% Oscar:
% BOW_param('harris',5,25,25,'rgbhoglbp',11,'kmeans',200,20,'1nn','30_harris_');
% BOW_param('harris',5,25,25,'sift',11,'kmeans',200,20,'1nn','30_harris_');
% BOW_param('harris',5,25,25,'colorsift',11,'kmeans',200,20,'1nn','30_harris_');
% BOW_param('harrislaplace',5,25,25,'rgbhoglbp',11,'kmeans',200,20,'1nn','30_harris_');
% BOW_param('harrislaplace',5,25,25,'sift',11,'kmeans',200,20,'1nn','30_harris_');
% BOW_param('harrislaplace',5,25,25,'colorsift',11,'kmeans',200,20,'1nn','30_harris_');
% BOW_param('sift',5,25,25,'rgbhoglbp',11,'kmeans',200,20,'1nn','30_harris_');
% BOW_param('sift',5,25,25,'sift',11,'kmeans',200,20,'1nn','30_harris_');
% BOW_param('sift',5,25,25,'colorsift',11,'kmeans',200,20,'1nn','30_harris_');

%%

%% Final:
% BOW_param('dense_grid',5,25,25,'rgb',11,'kmeans',200,20,'hard','100_');
% BOW_param('custom',5,25,256,'rgb',11,'kmeans',200,20,'hard','101_');
% BOW_param('dense_grid',5,25,25,'hoggraylbp',11,'kmeans',200,20,'hard','102_');
% BOW_param('custom',5,25,256,'hoggraylbp',11,'kmeans',200,20,'hard','103_');
% BOW_param('dense_grid',5,25,25,'rgbhogclbpms',11,'kmeans',200,20,'hard','104_');
% BOW_param('dense_grid',5,25,25,'hogclbpms',11,'kmeans',200,20,'hard','105_');
% BOW_param('dense_grid',5,25,25,'hoglbp',11,'kmeans',200,20,'hard','106_');


% BOW_param('dense_grid',5,25,25,'sift',11,'kmeans',200,20,'hard','110_');
% BOW_param('dense_grid',5,25,25,'sift',11,'kmeans',200,20,'hard','111_');
% BOW_param('dense_grid',5,25,25,'sift',11,'kmeans',200,20,'hard','112_');
% 
% BOW_param('dense_grid',5,25,25,'rgbhogclbpms',11,'kmeans',100,20,'hard','113_');
% BOW_param('dense_grid',5,25,25,'hogclbpms',11,'kmeans',100,20,'hard','114_');
% BOW_param('dense_grid',5,25,25,'hoglbp',11,'kmeans',100,20,'hard','115_');
% BOW_param('dense_grid',5,25,25,'rgbhogclbpms',11,'kmeans',400,20,'hard','116_');
% BOW_param('dense_grid',5,25,25,'hogclbpms',11,'kmeans',400,20,'hard','117_');
% BOW_param('dense_grid',5,25,25,'hoglbp',11,'kmeans',400,20,'hard','118_');
% 
% BOW_param('dense_grid',5,25,25,'rgb',11,'emgm',200,20,'soft','119_');
% BOW_param('custom',5,25,256,'rgb',11,'emgm',200,20,'soft','120_');

% BOW_param('rand',5,25,256,'rgbhogclbpms',11,'kmeans',200,20,'soft','138_');
% BOW_param('sift',5,25,256,'hogclbpms',11,'kmeans',200,20,'soft','139_');
% BOW_param('harris',5,25,256,'hoglbp',11,'kmeans',200,20,'soft','140_');
% BOW_param('harrislaplace',5,25,256,'rgbhogclbpms',11,'kmeans',200,20,'soft','141_');
% 
% BOW_param('rand',5,25,256,'rgbhogclbpms',11,'kmeans',100,20,'hard','142_');
% BOW_param('sift',5,25,256,'hogclbpms',11,'kmeans',100,20,'hard','143_');
% BOW_param('harris',5,25,256,'hoglbp',11,'kmeans',100,20,'hard','144_');
% BOW_param('harrislaplace',5,25,256,'rgbhogclbpms',11,'kmeans',400,20,'hard','145_');



%% Eliminados
% % BOW_param('dense_grid',5,25,25,'harris',11,'kmeans',200,20,'hard','107_');
% % BOW_param('dense_grid',5,25,25,'harris',11,'kmeans',200,20,'hard','108_');
% % BOW_param('dense_grid',5,25,25,'harris',11,'kmeans',200,20,'hard','109_');

% % BOW_param('dense_grid',5,25,25,'harris',11,'emgm',200,20,'soft','126_');
% % BOW_param('dense_grid',5,25,25,'harris',11,'emgm',200,20,'soft','127_');
% % BOW_param('dense_grid',5,25,25,'harris',11,'emgm',200,20,'soft','128_');

%% Eliminados por pesados
% % BOW_param('dense_grid',5,25,25,'hoggraylbp',11,'emgm',200,20,'soft','121_');
% % BOW_param('custom',5,25,256,'hoggraylbp',11,'emgm',200,20,'soft','122_');
% % BOW_param('dense_grid',5,25,25,'rgbhogclbpms',11,'emgm',200,20,'soft','123_');
% % BOW_param('dense_grid',5,25,25,'hogclbpms',11,'emgm',200,20,'soft','124_');
% % BOW_param('dense_grid',5,25,25,'hoglbp',11,'emgm',200,20,'soft','125_');
% % 
% % 
% % BOW_param('dense_grid',5,25,25,'sift',11,'emgm',200,20,'soft','129_');
% % BOW_param('dense_grid',5,25,25,'sift',11,'emgm',200,20,'soft','130_');
% % BOW_param('dense_grid',5,25,25,'sift',11,'emgm',200,20,'soft','131_');
% % 
% % BOW_param('dense_grid',5,25,25,'rgbhogclbpms',11,'emgm',100,20,'soft','132_');
% % BOW_param('dense_grid',5,25,25,'hogclbpms',11,'emgm',100,20,'soft','133_');
% % BOW_param('dense_grid',5,25,25,'hoglbp',11,'emgm',100,20,'soft','134_');
% % BOW_param('dense_grid',5,25,25,'rgbhogclbpms',11,'emgm',400,20,'soft','135_');
% % BOW_param('dense_grid',5,25,25,'hogclbpms',11,'emgm',400,20,'soft','136_');
% % BOW_param('dense_grid',5,25,25,'hoglbp',11,'emgm',400,20,'soft','137_');


% labelFilesPrefixes = { '100_',...
%  '101_',...
%  '102_',...
%  '103_',...
%  '104_',...
%  '105_',...
%  '106_',...
%  '110_',...
%  '111_',...
%  '112_',...
%  '113_',...
%  '114_',...
%  '115_',...
%  '116_',...
%  '117_',...
%  '118_',...
%  '119_',...
%  '120_',...   
%  '138_',...
%  '139_',...
%  '140_',...
%  '141_',...
%  '142_',...
%  '143_',...
%  '144_',...
%  '145_'};

%  '107_',...
%  '108_',...
%  '109_',...
%  '126_',...
%  '127_',...
%  '128_',...

%  '121_',...
%  '122_',...
%  '123_',...
%  '124_',...
%  '125_',...
%  '129_',...
%  '130_',...
%  '131_',...
%  '132_',...
%  '133_',...
%  '134_',...
%  '135_',...
%  '136_',...
%  '137_',...
 

labelFilesPrefixes = {...
 '140_',...
 '118_',...%'106_',...%'105_',...%'117_',...%'114_',...%'113_',...
 '116_',...
 '138_',...
 '104_',...
 '142_',...%'102_',...
 '103_',...
 '115_'
 };


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
