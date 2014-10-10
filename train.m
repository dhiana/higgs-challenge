function train(in, out)

    k_neurons = 14;

    [inputs, targets, weights] = load_training_data(in);

    net_config = config_net(k_neurons, 'trainlm', 'mse');

    [net, tr] = train(net_config, inputs', targets');

    outputs = net(inputs');

    [threshold, ams] = choose_threshold(outputs, targets, weights)

    save(out, 'net', 'threshold', '-mat');

end
