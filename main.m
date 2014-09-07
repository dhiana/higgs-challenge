training = higgs_importfile('./data/training.csv');
test = higgs_importfile('./data/test.csv');

training = standardizeMissing(training, -999);
test = standardizeMissing(test, -999);

inputs = training{:,2:31};
test_inputs = test{:,2:31};

targets = double(strcmp(training.Label, 's'));

higgs_nprtool();

test_outputs = sim(net, test_inputs');

[~, rank_order] = sort(test_outputs);

RankOrder = array2table(rank_order', 'VariableNames', {'RankOrder'});

threshold = 0.5;

test_signal_index = find(test_outputs>threshold);
test_size = size(test_inputs,1);
class = zeros(test_size,1);
class(test_signal_index)=1;

class_cat = categorical(class,[0:1],{'b','s'});
class_str = cellstr(class_cat);
Class = array2table(class_str, 'VariableNames', {'Class'});

EventId = array2table(test.EventId, 'VariableNames', {'EventId'});

Result = [EventId RankOrder Class];

result_filename = strcat('./results/result-', datestr(now, 'yyyymmddHHMM'), '.csv');

writetable(Result, result_filename, 'WriteRowNames', true)
