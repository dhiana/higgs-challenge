function [threshold, ams] = choose_threshold(outputs, targets, weights)

    range = 1000;

    for i=1:range
        class = zeros(size(weights,1),1);
        class(find(outputs>i/range))=1;
        amss(i)=calc_ams(targets, class, weights);
    end

    [ams, idx] = max(amss);
    threshold = idx/range;

end
