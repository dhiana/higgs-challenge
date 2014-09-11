[inputs, targets, weights] = load_training_data();

net_config = config_net(10, 'trainlm', 'mse');

[net, tr] = train(net_config, inputs', targets');

outputs = net(inputs');

[threshold, ams] = choose_threshold(outputs, targets, weights)

performance = eval_net(net, inputs', targets', threshold);

[test_eventid, test_inputs] = load_test_data();

test_outputs = sim(net, test_inputs');

write_submission_file(test_eventid, test_outputs', threshold);
