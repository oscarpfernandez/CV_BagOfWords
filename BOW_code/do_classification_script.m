FID = fopen('results.txt', 'a');
fprintf(FID, 'Classification runned\n');
fclose(FID);

%% classification script using SVM
% The classification is done in a script which makes it a easier to change. However feel free to make it into a function
% as the other stages above.

% load the BOW representations, the labels, and the train and test set
load(eventopts.trainset);
load(eventopts.testset);
load(eventopts.labels);
load([eventopts.globaldatapath,'/',assignment_opts.name])

train_labels    = labels(trainset);          % contains the labels of the trainset
train_data      = BOW(:,trainset)';          % contains the train data
[train_labels,sindex]=sort(train_labels);    % we sort the labels to ensure that the first label is '1', the second '2' etc
train_data=train_data(sindex,:);
test_labels     = labels(testset);           % contains the labels of the testset
test_data       = BOW(:,testset)';           % contains the test data

%% here you should of course use crossvalidation !
cc=50;
options=sprintf('-t 0 -c %f -b 1',cc);

%Optimitzaci� Oscar
% cc=1;
% gamma=0.5;
% options=sprintf('-t 0 -c %f -g %f -b 1',cc, gamma);
% 
% libsvmwrite('training.dat', train_labels, sparse(train_data));

model=svmtrain(train_labels,train_data,options);

[predict_label, accuracy , dec_values] = svmpredict(test_labels,test_data, model,'-b 1');


