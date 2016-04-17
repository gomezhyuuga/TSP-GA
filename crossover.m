function childrens = crossover( parents )
    %CROSSOVER Summary of this function goes here
    %   Detailed explanation goes here
    global POPULATION_N
    global POPULATION
    
    pool = parents(randperm(size(parents,1)),:); % Shuffle
    childrens = zeros(size(POPULATION));
    
    % Crossover
    for i = 1 : 2 : POPULATION_N
        parent1 = pool(i, :);
        parent2 = pool(i + 1, :);
        
        childrens(i:i + 1, :) = cross(parent1, parent2);
    end
end

