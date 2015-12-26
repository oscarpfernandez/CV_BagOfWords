function harriscorner_detection(opts,detector_opts,imIndex)
% compute a random feature detector. Both the position in the image and the scale are selected random.
% input:
%           opts                    : contains information about data set
%           detector_opts           : contains information about detector to use, and detector settings 
%           detector_opts.min_scale : minimum scale detected        
%           detector_opts.max_scale : maximum scale detected
%           imIndex                 : index to image in data set described by 'opts'

image_dir=sprintf('%s/%s/',opts.localdatapath,num2string(imIndex,3));    % where detector is saved

im=read_image_db(opts,imIndex);
im=uint8(im);

% im=uint8(im);
[cout, marketcout] = corner(im,[],[],[],0.2);

% figure, imshow(marketcout)

for k=1:size(cout,1)
    dim=rand(1,1);
    dim=ceil(dim*(detector_opts.max_scale-detector_opts.min_scale)+detector_opts.min_scale);
    points(k,2)=cout(k,1)-dim;
    points(k,1)=cout(k,2)-dim;
    points(k,3)=2*dim;
end

% 
% imshow(marketcout);
% for i=1:size(cout,1)
% %     [i,points(i,1),points(i,2),points(i,3),points(i,3)]
%     r=rectangle('Position',[points(i,1),points(i,2),points(i,3),points(i,3)]);
%     set(r,'edgecolor','g');
% %     size(im)
% end
% display('press a key');
% pause


% save the detector results in image_dir
% the detector is saved in the following format
% [x y scale]      % Be aware that matlab codes coordinates first y and than x !

save ([image_dir,'/',detector_opts.name], 'points');