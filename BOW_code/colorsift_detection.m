function colorsift_detection(opts,detector_opts,imIndex)
% compute a corners feature detector.
% input:
%           opts                    : contains information about data set
%           detector_opts           : contains information about detector to use, and detector settings 
%           detector_opts.min_scale : minimum scale detected        
%           detector_opts.max_scale : maximum scale detected
%           imIndex                 : index to image in data set described by 'opts'

image_dir=sprintf('%s/%s/',opts.localdatapath,num2string(imIndex,3));    % where detector is saved

I = read_image_db(opts,imIndex);
imnorm = I./repmat(sum(I,3),[1 1 3]);  
imopp(:,:,1) = imnorm(:,:,1) + imnorm(:,:,2) + imnorm(:,:,3);
imopp(:,:,2) = imnorm(:,:,1) - imnorm(:,:,2);
imopp(:,:,3) = imnorm(:,:,1) + imnorm(:,:,2) - 2.*imnorm(:,:,3);


im = imopp(:,:,1);
points1 = vl_sift(single(im));
points1 = points1';


im = imopp(:,:,2);
points2 = vl_sift(single(im));
points2 = points2';


im = imopp(:,:,3);
points3 = vl_sift(single(im));
points3 = points3';

points=[points1; points2; points3];

% imshow(im);
% for i=1:detector_opts.npoints
%     r=rectangle('Position',[points(i,1),points(i,2),points(i,3),points(i,3)]);
%     set(r,'edgecolor','g');
%     size(im)
% end
% display('press a key');
% pause


% save the detector results in image_dir
% the detector is saved in the following format
% [x y scale]      % Be aware that matlab codes coordinates first y and than x !

save ([image_dir,'/',detector_opts.name], 'points');
