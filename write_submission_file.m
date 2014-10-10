function write_submission_file(eventid, outputs, threshold, out)

    [~, rank_order] = sort(outputs');

    RankOrder = array2table(rank_order', 'VariableNames', {'RankOrder'});

    index = find(outputs>threshold);
    num_samples = size(outputs,1);
    class = zeros(num_samples,1);
    class(index)=1;

    class_cat = categorical(class,[0:1],{'b','s'});
    class_str = cellstr(class_cat);
    Class = array2table(class_str, 'VariableNames', {'Class'});

    EventId = array2table(eventid, 'VariableNames', {'EventId'});

    Result = [EventId RankOrder Class];

    writetable(Result, out, 'WriteRowNames', true)

end
