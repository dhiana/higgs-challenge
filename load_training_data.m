function [inputs, targets, weights] = load_training_data()

    training = higgs_importfile('./data/training.csv');
    training = standardizeMissing(training, -999);

    inputs = training{:,2:31};
    targets = double(strcmp(training.Label, 's'));
    weights = training.Weight;

end
