global DISTANCE_M
CITIES = 4;
plotSize = 100;
DISTANCE_M = [
    0, 20, 42, 35;
    20,  0, 30, 34;
    42, 30,  0, 12;
    35, 34, 12,  0];
POPULATION_N = 10;

cityPositionM = randi(plotSize, [CITIES, 2]);

% Generate initial population
population = zeros(POPULATION_N, CITIES);
for i = 1 : POPULATION_N
    population(i,:) = randperm(CITIES, CITIES);
end

% Random initial bestPath
bestPath = population(randi(CITIES), :);
population;

figure('Name', 'CITIES', 'Position', [0 0 500 500]);
subplot(2,1,1);
citiesPlot = plot(cityPositionM(:,1),...
    cityPositionM(:,2),...
    'bo',...
    'MarkerFaceColor', 'b');

% Build stats table
colTitles = {'Cromosoma', 'Distancia', 'f_x', 'P_Select', 'EC', 'AC'};
colFormat = { 'char', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'};

dat = cell(POPULATION_N + 3, 5);
for i = 1 : POPULATION_N
    path = population(i,:);
    dat{i, 1} = num2str(path); % Cromosome
    dat{i, 2} = distanceForPath(path); % Distance
    dat{i, 3} = fitness(path); % f(x)
    dat{i, 4} = 0.00; % P. Select
    dat{i, 5} = 0.00; % Expected Count
    dat{i, 6} = 0; % Actual Count
end

dat{POPULATION_N + 1, 1} = 'SUM';
dat{POPULATION_N + 2, 1} = 'AVG';
dat{POPULATION_N + 3, 1} = 'MAX';
for i = 2 : 6
 dat{POPULATION_N + 1, i} = sum(cell2mat(dat(1:POPULATION_N, i)));
end
for i = 2 : 6
  dat{POPULATION_N + 2, i} = mean(cell2mat(dat(:, i)));
end
for i = 2 : 6
  dat{POPULATION_N + 3, i} = max(cell2mat(dat(:, i)));
end

uitable(...
    'Position', [0, 0, 500, 200],...
    'ColumnName', colTitles,...
    'ColumnFormat', colFormat,...
    'Data', dat);
