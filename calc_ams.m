function ams = calc_ams(solution, submission, weights)
    s = 0.0;
    b = 0.0;

    numEvents = size(solution);

    br = 10.0;

    for i=1:numEvents
        if submission(i) == 1 % only events predicted to be signal are scored
            if solution(i) == 1
                s = s + weights(i);
            end
            if solution(i) == 0
                b = b + weights(i);
            end
        end
    end

    radicand = 2 *( (s+b+br) * log (1.0 + s/(b+br))-s);
    ams = sqrt(radicand);

end
