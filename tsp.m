global DISTANCE_M
global POPULATION_N
global POPULATION
global CITIES_POSITION
global STATS
STATS = cell(POPULATION_N + 3, 5);

CITIES = 4;
plotSize = 100;
DISTANCE_M = [
     0, 20, 42, 35;
    20,  0, 30, 34;
    42, 30,  0, 12;
    35, 34, 12,  0];
POPULATION_N = 40;

CITIES_POSITION = randi(plotSize, [CITIES, 2]);

% Generate initial POPULATION
POPULATION = zeros(POPULATION_N, CITIES);
for i = 1 : POPULATION_N
    POPULATION(i,:) = randperm(CITIES, CITIES);
end

% Random initial bestPath
bestPath = POPULATION(randi(CITIES), :);
POPULATION;

plots();
stats();

for i = 1 : 400
    stats();
    parents = reproduction();
    POPULATION = mutation(crossover(reproduction()));
end
colTitles = {'Cromosoma', 'Distancia', 'f_x', 'P_Select', 'EC', 'AC'};
colFormat = { 'char', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'};
uitable(...
    'Position', [0, 0, 500, 200],...
    'ColumnName', colTitles,...
    'ColumnFormat', colFormat,...
    'Data', STATS);
POPULATION
