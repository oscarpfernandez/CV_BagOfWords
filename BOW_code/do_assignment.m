function []=do_assignment(opts,assignment_opts)
% assign feature points to visual vocabulary
% input:
%           opts                            : contains information about data set
%           assignment_opts                 : contains information about assignment method
%           assignment_opts.type            : the asssignment method which is used
%           assignment_opts.descriptor_name : name of vocabulary  (voc)
%           assignment_opts.vocabulary_name : name of descriptors (input)

% if no settings available use default settings 
if ~isfield(assignment_opts,'type');               assignment_opts.type='1nn';                     end
if ~isfield(assignment_opts,'vocabulary_name');    assignment_opts.vocabulary_name='Unknown';      end
if ~isfield(assignment_opts,'descriptor_name');    assignment_opts.descriptor_name='Unknown';      end
if ~isfield(assignment_opts,'name');               assignment_opts.name=strcat(assignment_opts.type,assignment_opts.vocabulary_name); end


FID = fopen('results.txt', 'a');
fprintf(FID, 'Assignment runned\n');
fclose(FID);
    
    
%% check if assignment already exists
try
    assignment_opts2=getfield(load([opts.globaldatapath,'/',assignment_opts.name,'_settings']),'assignment_opts');
    if(isequal(assignment_opts,assignment_opts2))
        display('Recomputing assignments for this settings');
    else
        display('Overwriting assignment with same name, but other Assignment settings !!!!!!!!!!');
    end
end

%% load data set information and vocabulary
load(opts.image_names);
nimages=opts.nimages;
vocabulary=getfield(load([opts.globaldatapath,'/',assignment_opts.vocabulary_name]),'voc');
vocabulary_size=size(vocabulary,1);

if (assignment_opts.type=='soft')
    vocabulary_opts=getfield(load([opts.globaldatapath,'/',assignment_opts.vocabulary_name,'_settings']),'vocabulary_opts');
    vocabulary_size=vocabulary_opts.size;
end

%% apply assignment method to data set
BOW=[];
%h = waitbar(0,'Assignin vocabulary to images...');
isOpen = matlabpool('size') > 0;
if (~isOpen)
matlabpool
end
parfor ii=1:nimages
    disp(sprintf('Computing Assigment for image number: %d', ii));
    image_dir=sprintf('%s/%s/',opts.localdatapath,num2string(ii,3));                    % location where detector is saved
    points=getfield(load([image_dir,assignment_opts.descriptor_name]),'descriptors');
    switch assignment_opts.type                                                         % select assignment method
        case 'hard'
            [minz index]=min(distance(points,vocabulary),[],2);
            BOW(:,ii)=hist(index,(1:vocabulary_size));
        case 'soft'
            BOWaux(:,ii)=zeros(vocabulary_size,1);
            %sP=size(points)
            %sM=size(vocabulary.Mu)
            %sS=size(vocabulary.Sigma)
            %h1 = waitbar(0,sprintf('Computing image %d...',ii));
            BOWaux=zeros(vocabulary_size,size(points,1));
            for j=1:size(points,1)
%                prob = mvnpdf(points(j,:), vocabulary.Mu', vocabulary.Sigma).*vocabulary.Priors';
%                 sP=size(points)
%                 sM=size(vocabulary.Mu)
%                 sPri=size(vocabulary.Priors)
                prob = mvnpdf(points(j,:), vocabulary.Mu', vocabulary.Sigma).*vocabulary.Priors';
                if(sum(prob))
                    BOWaux(:,j)=prob./sum(prob);
                end
               % size(BOWaux(:,j))
               % pause
               % waitbar(j/size(points,1),h1);
            end
            BOW(:,ii)= sum(BOWaux,2);
           % close(h1)
        otherwise
            display('A non existing assignment method is selected !!!!!');
    end
    %waitbar(ii/nimages,h);
end
%close(h);

BOW=normalize(BOW,1);                                                                      % normalize the BOW histograms to sum-up to one.
save ([opts.globaldatapath,'/',assignment_opts.name],'BOW');                               % save the BOW representation in opts.globaldatapath
save ([opts.globaldatapath,'/',assignment_opts.name,'_settings'],'assignment_opts');