function run(in, trained, out)

    load(trained, '-mat');

    [test_eventid, test_inputs] = load_test_data(in);

    test_outputs = sim(net, test_inputs');

    write_submission_file(test_eventid, test_outputs', threshold, out);

    exit;

end
