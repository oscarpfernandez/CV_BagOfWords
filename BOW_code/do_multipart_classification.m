function do_multipart_classification(labelFiles)

    global global_savefile_prefix;

    EVENTinit
    load(eventopts.trainset);
    load(eventopts.testset);
    load(eventopts.labels);

    test_labels = labels(testset); % contains the labels of the testset

    totalLabels = [];
    scoreMatrix = [];
    for i=1:size(labelFiles,2);

        fileName = sprintf('./run_data/%s_labels',labelFiles{i});
        dataLabelDec = load(fileName);

        %%% Build labels matrix for all classifiers
        %%% Note: one column per classifier
        totalLabels = [totalLabels dataLabelDec.predict_label];

        %%% Max probability value per label
        scoreMatrix = [scoreMatrix  max(dataLabelDec.dec_values')'];

    end;

    scoreMatrix = -200*log( ones(size(scoreMatrix))-scoreMatrix );

    % Obtain labels with higher scores.
    finalScores = [];
    for i=1:size(eventopts.classes,1)
        suma = sum(( (totalLabels==i).*scoreMatrix )')';
        finalScores = [finalScores  suma];
    end;
    size(finalScores)
    %%% Obtain the final labels
    finalLabels = [];
    maxScores = [];
    for i=1:size(totalLabels,1)
        %%%Obtain the index where we have the final score,
        %%% the index is the class label.
        label = find(finalScores(i,:)==max(finalScores(i,:)));
        finalLabels = [finalLabels; label];
        maxScores = [maxScores; max(finalScores(i,:))]
    end 
    
    confusionMatrix = zeros(size(eventopts.classes,1), size(eventopts.classes,1));
    
    FID = fopen('results.txt', 'a');
    fprintf(FID, '\n***Confusion Matrix\n');

    
    %%% Build confusion matrix
    fprintf('\t*** Confusion Matrix\n');
    for i=1:size(eventopts.classes,1)
        fprintf('\t');
        for j=1:size(eventopts.classes,1)
            count = sum((finalLabels==j) & (test_labels==i));
            fprintf(sprintf('%d \t', count));
            fprintf(FID,sprintf('%d \t', count));
            confusionMatrix(i,j) = count;
        end
        fprintf(' --> %s \n',eventopts.classes{i});
        fprintf(FID,'\n');
    end

    tp = trace(confusionMatrix);
    total = sum(sum(confusionMatrix));
    fp = total-tp;
    accuracy = tp / total;
    fprintf('\n*** Accuracy  = %f\n', accuracy );
    fprintf(FID,'\n*** Accuracy  = %f\n', accuracy );
    fclose(FID);
    
    normalizedScores = maxScores./max(maxScores);

    save('./run_data/final_labels','finalLabels','normalizedScores');
    
end
