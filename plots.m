function plots( )
    %PLOTS Summary of this function goes here
    %   Detailed explanation goes here
    global CITIES_POSITION
    figure('Name', 'CITIES', 'Position', [0 0 500 500]);
    subplot(2,1,1);
    plot(CITIES_POSITION(:,1),...
        CITIES_POSITION(:,2),...
        'bo',...
        'MarkerFaceColor', 'b');
end

