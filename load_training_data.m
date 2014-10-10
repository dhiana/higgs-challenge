function [inputs, targets, weights] = load_training_data(in)

    training = higgs_importfile(in);
    training = standardizeMissing(training, -999);

    inputs = training{:,2:31};
    targets = double(strcmp(training.Label, 's'));
    weights = training.Weight;

end
