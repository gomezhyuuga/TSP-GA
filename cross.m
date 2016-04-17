function childrens = cross( parent1, parent2 )
    %CROSS Summary of this function goes here
    %   Detailed explanation goes here
    % Get crossover point
    child1  = zeros(size(parent1));
    child2  = zeros(size(parent2));
    
    point = randi([2, length(parent1) - 1]);

    % Preserve first point genes
    child1(:, 1:point) = parent1(:, 1:point);
    child2(:, 1:point) = parent2(:, 1:point);

    % PMX
    p1 = parent1;
    p2 = parent2;
    for j = 1 : point
        index = find(p2 == p1(j));
        p2(index) = p2(j);
        p2(j) = p1(j);
    end
    child1(1, point + 1:length(child1)) = p2(1, point + 1:length(child1));
    p1 = parent1;
    p2 = parent2;
    for j = 1 : point
        % Only do the swap if the genes are not equal
        % because if so, it will produce repeated cities in the cromosome
        if p1(j) ~= p2(j)
            index = find(p1 == p2(j));
            p1(index) = p1(j);
            p1(j) = p2(j);
        end
    end
    child2(1, point + 1:length(child2)) = p2(1, point + 1:length(child2));
    
    childrens = [ child1; child2 ];
end

