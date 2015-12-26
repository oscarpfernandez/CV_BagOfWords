function do_detect(opts,detector_opts)
% function computes for all images in data set (opts) the feature points
% input:
%           opts         : contains information about data set
%           detector_opts: contains information about detector to use, and detector settings 


% if no settings available use default settings 
if ~isfield(detector_opts,'type');                  detector_opts.type='rand';             end


%% check if the detector has already been computed
try
    detector_opts2=getfield(load([opts.globaldatapath,'/',detector_opts.name,'_settings']),'detector_opts');
    if(isequal(detector_opts,detector_opts2))
        detect_flag=0;
        display('detector has already been computed for this settings');
    else
        detect_flag=1;
        display('Overwriting detector with same name, but other detector settings !!!!!!!!!!');
    end
catch
    detect_flag=1;
end


%% compute detector for all images

if(detect_flag==1)
    FID = fopen('results.txt', 'a');
    fprintf(FID, 'Detector runned\n');
    fclose(FID);
    
    display('Computing detector');
    
    load(opts.image_names);         % load image in data set
    nimages=opts.nimages;           % number of images in data set
    
    h = waitbar(0,'Detector computation...');
    for ii=1:nimages                         
        switch detector_opts.type   % select detector
            case 'rand'
                random_detection(opts,detector_opts,ii);    % random detector
            case 'custom'
                custom_detection(opts,detector_opts,ii);    % customized detector
            case 'dense_grid'
                dense_grid_detection(opts,detector_opts,ii);
            case 'sift'
                sift_detection(opts,detector_opts,ii);
            case 'harris'
                harriscorner_detection(opts,detector_opts,ii);
            case 'harrislaplace'
                harriscorner_detection(opts,detector_opts,ii);                
            otherwise
                display('A non existing detector is selected !!!!!');        
        end
        waitbar(ii/nimages,h);
    end
    
    save([opts.globaldatapath,'/',detector_opts.name,'_settings'],'detector_opts');        % save the settings of detector in opts.globaldatapath
    close(h);
end