
function [ output_args ] = colorSIFT_descriptor( opts, descriptor_opts, imIndex )
%SIFT_DESCRIPTOR Summary of this function goes here
%   Detailed explanation goes here

image_dir=sprintf('%s/%s/',opts.localdatapath,num2string(imIndex,3));             % location detector

points=getfield(load(sprintf('%s/%s',image_dir,descriptor_opts.detector_name)),'points');
points=points';

% If we don't have information on the orientation of the patches, just use
% 0
if (size(points,1)==3)
    points(4,:) = 0;
end

I = read_image_db(opts,imIndex);
imnorm = I./repmat(sum(I,3),[1 1 3]);  
imopp(:,:,1) = imnorm(:,:,1) + imnorm(:,:,2) + imnorm(:,:,3);
imopp(:,:,2) = imnorm(:,:,1) - imnorm(:,:,2);
imopp(:,:,3) = imnorm(:,:,1) + imnorm(:,:,2) - 2.*imnorm(:,:,3);

I=imopp(:,:,1);
[Ix, Iy] = vl_grad(I);
mod = sqrt(Ix.^2 + Iy.^2);
ang = atan2(Iy,Ix);
grd = shiftdim(cat(3,mod,ang),2);
grd = single(grd);
descriptors_o1 = vl_siftdescriptor(grd, points);
descriptors_o1 = double(descriptors_o1');

I=imopp(:,:,2);
[Ix, Iy] = vl_grad(I);
mod = sqrt(Ix.^2 + Iy.^2);
ang = atan2(Iy,Ix);
grd = shiftdim(cat(3,mod,ang),2);
grd = single(grd);
descriptors_o2 = vl_siftdescriptor(grd, points);
descriptors_o2 = double(descriptors_o2');

I=imopp(:,:,3);
[Ix, Iy] = vl_grad(I);
mod = sqrt(Ix.^2 + Iy.^2);
ang = atan2(Iy,Ix);
grd = shiftdim(cat(3,mod,ang),2);
grd = single(grd);
descriptors_o3 = vl_siftdescriptor(grd, points);
descriptors_o3 = double(descriptors_o3');
   
totaldescriptor = [descriptors_o1 descriptors_o2 descriptors_o3];
    
descriptors = totaldescriptor;


% save the descriptor results in image_dir
% the descriptor is saved in a p x n matrix, with p the number of descriptors and n the length of the feature vector (i.e. 3 for RGB)
image_dir=sprintf('%s/%s/',opts.localdatapath,num2string(imIndex,3)); % location descriptor
save ([image_dir,'/',descriptor_opts.name], 'descriptors');           % save the descriptors


end