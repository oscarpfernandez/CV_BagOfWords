function custom_detection(opts,detector_opts,imIndex)
% compute a random feature detector. Both the position in the image and the scale are selected random.
% input:
%           opts                    : contains information about data set
%           detector_opts           : contains information about detector to use, and detector settings 
%           detector_opts.min_scale : minimum scale detected        
%           detector_opts.max_scale : maximum scale detected
%           imIndex                 : index to image in data set described by 'opts'

image_dir=sprintf('%s/%s/',opts.localdatapath,num2string(imIndex,3));    % where detector is saved

im=read_image_db(opts,imIndex);

% figure,imshow(im/255)

points=zeros(detector_opts.npoints,3);

steps=sqrt(detector_opts.npoints);

imsize= size (im);
hstep= ceil(imsize(2)/steps)-1;
vstep= ceil(imsize(1)/steps)-1;
k=1;



for i=0:1:steps-1
    for j=0:1:steps-1
        points(k,1)= hstep*j;
        points(k,2)= vstep*i;
        if (hstep<vstep)
            points(k,3)=hstep;
        else
            points(k,3)=vstep;
        end
        k=k+1;
    end
end

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