
function LBP_descriptor(opts,descriptor_opts,imIndex)
% compute a RGB feature descriptor. 
% input:
%           opts                          : contains information about data set
%           descriptor_opts               : contains information about the descriptor used
%           imIndex                       : index to image in data set described by 'opts'

image_dir=sprintf('%s/%s/',opts.localdatapath,num2string(imIndex,3));             % location detector
points=getfield(load(sprintf('%s/%s',image_dir,descriptor_opts.detector_name)),'points');

im=read_image_db(opts,imIndex);
im=int8(im);

descriptors=[];

for i=1:1:size(points,1)
    patch = imcrop( im,[points(i,1),points(i,2),points(i,3),points(i,3)]);
    patch = imresize(patch, [descriptor_opts.patch_size descriptor_opts.patch_size]);
    patch=rgb2gray(patch);
    
    LBP=lbp(patch);
    
    descriptors=[descriptors; LBP];
end           

% save the descriptor results in image_dir
% the descriptor is saved in a p x n matrix, with p the number of descriptors and n the length of the feature vector (i.e. 3 for RGB)
image_dir=sprintf('%s/%s/',opts.localdatapath,num2string(imIndex,3)); % location descriptor
save ([image_dir,'/',descriptor_opts.name], 'descriptors');           % save the descriptors
