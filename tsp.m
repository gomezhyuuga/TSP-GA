global DISTANCE_M
global POPULATION_N
global POPULATION
global CITIES_POSITION
global STATS
global BEST_PATH
global PLOT_TITLE
global PLOT_SIZE
global PATH_PLOT

STATS = cell(POPULATION_N + 3, 5);
CITIES = 10;

PLOT_SIZE = 20
POPULATION_N = 40;

% Generate map position of cities and distances
CITIES_POSITION = PLOT_SIZE * rand(2, CITIES);
DISTANCE_M = zeros(CITIES);
for i = 1 : CITIES - 1
    position1 = CITIES_POSITION(:, i);
    for j = i + 1 : CITIES
        position2 = CITIES_POSITION(:, j);
        dist = position1 - position2;
        distSq = sqrt(dist' * dist);
        DISTANCE_M(i, j) = distSq;
        DISTANCE_M(j, i) = distSq;
    end
end

% Generate initial POPULATION
POPULATION = zeros(POPULATION_N, CITIES);
for i = 1 : POPULATION_N
    POPULATION(i,:) = randperm(CITIES, CITIES);
end

% Random initial bestPath
BEST_PATH = POPULATION(randi(CITIES), :);
POPULATION;

plots();
stats();
global TABLE

colTitles = {'Cromosoma', 'Distancia', 'f_x', 'P_Select', 'EC', 'AC'};
colFormat = { 'char', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'};

TABLE = uitable(...
    'Units', 'normalized',...
    'Position', [0, 0, 1.0, 0.5],...
    'ColumnName', colTitles,...
    'ColumnFormat', colFormat,...
    'Data', STATS);

for i = 1 : 20
    stats();
    parents = reproduction();
    POPULATION = mutation(crossover(reproduction()));
    BEST_PATH = findBest();
    
    % Avoid update plots several times
    if mod(i, 3) == 0
        pause(0.5);
        set(PLOT_TITLE, 'string', {[ 'BEST PATH: ' num2str(BEST_PATH)];...
             ['DISTANCE = ' num2str(distanceForPath(BEST_PATH))]});
        set(TABLE, 'Data', STATS);
        set(PATH_PLOT,...
            'XData', [CITIES_POSITION(1, BEST_PATH) CITIES_POSITION(1, BEST_PATH(1))],...
            'YData', [CITIES_POSITION(2, BEST_PATH) CITIES_POSITION(2, BEST_PATH(1))])
    end
end

POPULATION
