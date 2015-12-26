%% Script to perform BOW-based image classification
% code credit: Fahad Shabaz Khan inspired on VOC-challenge code of Mark Everingham.

%% initialize the settings
display('*********** start BOW *********')

EVENTinit
detect_opts=[];descriptor_opts=[];vocabulary_opts=[];assignment_opts=[];

FID = fopen('results.txt', 'a');
fprintf(FID, '\n\nNEW EXECUTION:\n');
fclose(FID);

tic

%% detector
tdetector = tic;
%detect_opts.type='rand';                    % name detector
 detect_opts.type='custom';                  % name detector
% detect_opts.type='dense_grid';               % name detector
%detect_opts.type='sift';               % name detector
%detect_opts.type='harris';                  % name detector
%detect_opts.type='harrislaplace';                  % name detector
detect_opts.min_scale=5;                    % minimal scale of feature points
detect_opts.max_scale=15;                   % maximal scale of feature points
% detect_opts.npoints=200;                    % number of feature points
detect_opts.npoints=25;%81;%25;%625;%196                    % number of feature points
detect_opts.name=['DET',detect_opts.type];  % name which is used to save the detector information

do_detect(eventopts,detect_opts);
tdetector = toc(tdetector);

%% descriptor
tdescriptor = tic;
% descriptor_opts.type='rgb';                                                      % name descriptor
% descriptor_opts.type='lbp';                                                      % name descriptor
%descriptor_opts.type='rgblbp';                                                      % name descriptor
%descriptor_opts.type='rgbhog';                                                      % name descriptor
%descriptor_opts.type='hoglbp';                                                      % name descriptor
% descriptor_opts.type='hogclbpms';                                                      % name descriptor
%descriptor_opts.type='rgbhoglbp';                                                      % name descriptor
descriptor_opts.type='rgbhogclbpms';                                                      % name descriptor
%descriptor_opts.type='sift';                                                      % name descriptor
%descriptor_opts.type='colorsift';                                                      % name descriptor
descriptor_opts.detector_name=detect_opts.name;                                  % name detector (input)
descriptor_opts.name=['DES',descriptor_opts.type,descriptor_opts.detector_name]; % output name (combines detector and descrtiptor name)
descriptor_opts.patch_size=11;                                                   % normalized patch size

do_descriptor(eventopts,descriptor_opts);
tdescriptor = toc(tdescriptor);

%% vocabulary
tvocabulary = tic;
%vocabulary_opts.type='rand';                            % name vocabulary method
vocabulary_opts.type='kmeans';
% vocabulary_opts.type='emgm';
vocabulary_opts.force=0;                                % force=1 forces the vocabulary to be recomputed even when it already exists
vocabulary_opts.size=100;                               % number of visual words in vocabulary
%vocabulary_opts.size=200;
%vocabulary_opts.sample_rate=10;                         % number of points sampled from each image on which to apply vocabulary method
vocabulary_opts.sample_rate=20;
vocabulary_opts.descriptor_name=descriptor_opts.name;   % name of descriptors (input)
vocabulary_opts.name=['VOC',vocabulary_opts.type,descriptor_opts.name,num2str(vocabulary_opts.size)];  % output name

do_vocabulary(eventopts,vocabulary_opts);
tvocabulary = toc(tvocabulary);

%% assignment
tassignment = tic;

if(vocabulary_opts.type=='emgm')
    assignment_opts.type='soft';
else
    assignment_opts.type='hard';                                 % name of assignment method
end

assignment_opts.descriptor_name=descriptor_opts.name;       % name of descriptor (input)
assignment_opts.vocabulary_name=vocabulary_opts.name;       % name of vocabulary (voc)
assignment_opts.name=['BOW_',descriptor_opts.type];         % name of assignment output

do_assignment(eventopts,assignment_opts);
tassignment = toc(tassignment);

%% Classification
tclassification = tic;
do_classification_script
tclassification = toc(tclassification);

%% Show results
%% Inicializamos fichero de resutados:
FID = fopen('results.txt', 'a');
fprintf(FID, 'Detector = %s / min_scale = %f / max_scale = %f / npoints = %f\n', detect_opts.type, detect_opts.min_scale, detect_opts.max_scale, detect_opts.npoints);
fprintf(FID, 'Descriptor = %s / patch_size = %f\n', descriptor_opts.type, descriptor_opts.patch_size);
fprintf(FID, 'Vocabulary = %s / force = %f / size = %f / sample_rate = %f\n', vocabulary_opts.type, vocabulary_opts.force, vocabulary_opts.size, vocabulary_opts.sample_rate);
fprintf(FID, 'Assignment = %s\n', assignment_opts.type);
fprintf(FID, '\nRESULTS:\n');

fclose(FID);

teval = tic;
for ii=1:eventopts.nclasses
    [rec,prec,ap]=do_eval(eventopts,ii,dec_values(:,ii));
    APM(ii)=ap;
    pause;
end
teval = toc(teval);

%Average Precission:
FID = fopen('results.txt', 'a');
fprintf(FID, 'AP Total = %.3f; \n',mean(APM));
fclose(FID);

ttotal = toc;

%% Times
FID = fopen('results.txt', 'a');
fprintf(FID, '\nTIMES:\n');
fprintf(FID, 'TDetector = %f\n', tdetector);
fprintf(FID, 'TDescriptor = %f\n', tdescriptor);
fprintf(FID, 'TVocabulary = %f\n', tvocabulary);
fprintf(FID, 'TAssignment = %f\n', tassignment);
fprintf(FID, 'TClassification = %f\n', tclassification);
fprintf(FID, 'TEval = %f\n', teval);
fprintf(FID, 'Total Time = %f\n', ttotal);
fclose(FID);

show_results_script                                        % comment if not needed