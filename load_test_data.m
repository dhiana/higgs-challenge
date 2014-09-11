function [test_eventid, test_inputs] = load_test_data();

    test = higgs_importfile('./data/test.csv');
    test = standardizeMissing(test, -999);

    test_inputs = test{:,2:31};
    test_eventid = test.EventId;

end
