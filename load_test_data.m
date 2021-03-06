function [test_eventid, test_inputs] = load_test_data(in);

    test = higgs_importfile(in);
    test = standardizeMissing(test, -999);

    test_inputs = test{:,2:31};
    test_eventid = test.EventId;

end
