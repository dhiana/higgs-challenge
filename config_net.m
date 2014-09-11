function net = config_net(hiddenLayerSize, trainFcn, performFcn)

    net = patternnet(hiddenLayerSize);

    % Adds support for NaN values
    net.input.processFcns = {'mapminmax', 'fixunknowns', 'processpca'};

    net.trainFcn = trainFcn;
    net.performFcn = performFcn;

    % Setup Division of Data for Training, Validation, Testing
    net.divideParam.trainRatio = 70/100;
    net.divideParam.valRatio = 15/100;
    net.divideParam.testRatio = 15/100;

end
