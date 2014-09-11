function [threshold, performance] = eval_net(net, x, t, threshold)

    y = net(x);
    signal_index = find(y>threshold);
    sample_size = size(x,1);
    class = zeros(sample_size,1);
    class(signal_index)=1;

    performance = perform(net,t,y)

end
