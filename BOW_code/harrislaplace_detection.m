function harrislaplace_detection(opts,detector_opts,imIndex)
% compute a random feature detector. Both the position in the image and the scale are selected random.
% input:
%           opts                    : contains information about data set
%           detector_opts           : contains information about detector to use, and detector settings 
%           detector_opts.min_scale : minimum scale detected        
%           detector_opts.max_scale : maximum scale detected
%           imIndex                 : index to image in data set described by 'opts'

image_dir=sprintf('%s/%s/',opts.localdatapath,num2string(imIndex,3));    % where detector is saved

im=read_image_db(opts,imIndex);

cout= kp_harrislaplace(im);

for k=1:size(cout,1)
    points(k,2) = cout(k,1);
    points(k,1) = cout(k,2);
    points(k,3) = cout(k,3);
end

% points = zeros(size(cout,1), 3);
% 
% points(:,2) = cout(:,1);
% points(:,1) = cout(:,2);
% points(:,3) = cout(:,3);
    
% save the detector results in image_dir
% the detector is saved in the following format
% [x y scale]      % Be aware that matlab codes coordinates first y and than x !

save ([image_dir,'/',detector_opts.name], 'points');