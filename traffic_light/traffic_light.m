function traffic_light()
    clc;
    state = 0;
    % draw a rectangle %
    rec = rectangle('position', [-7 0 14 60]);
    rec.FaceColor = 'black';
    rec.Curvature = 0.8;
    rec.LineWidth = 3;
    rec.EdgeColor = [0.5 0.5 0.5];
    xlim([-40 40]);
    ylim([-60 60]);    
    hold on;
    axis off;
    
    % draw the base %
    col_rec = rectangle('position', [-1 -40 2 40]);
    col_rec.FaceColor = 'black';
    base_rec = rectangle('position', [-15 -44 30 4]);
    base_rec.FaceColor = [0.2 0.2 0.5];
    base_rec.EdgeColor = 'blue';
    base_rec.LineWidth = 2;
    
    % draw the circles %
    red_cerc = rectangle('position', [-4 42 8 15], 'Curvature', [1 1]);
    red_cerc.FaceColor = [0.5 0.5 0.5];
    yellow_cerc = rectangle('position', [-4 22 8 15], 'Curvature', [1 1]);
    yellow_cerc.FaceColor = [0.5 0.5 0.5];
    green_cerc = rectangle('position', [-4 2 8 15], 'Curvature', [1 1]);
    green_cerc.FaceColor = [0.5 0.5 0.5];
    
    while true
        rectangle('position', [-1 -40 2 40]);
        if state == 0
            state = 1;
            red_cerc.FaceColor = 'red';
            yellow_cerc.FaceColor = [0.5 0.5 0.5];
            green_cerc.FaceColor = [0.5 0.5 0.5];
            pause(1);
        elseif state == 1
            state = 2;
            red_cerc.FaceColor = [0.5 0.5 0.5];
            yellow_cerc.FaceColor = 'yellow';
            green_cerc.FaceColor = [0.5 0.5 0.5];
            pause(1);
        elseif state == 2
            state = 0;
            red_cerc.FaceColor = [0.5 0.5 0.5];
            yellow_cerc.FaceColor = [0.5 0.5 0.5];
            green_cerc.FaceColor = 'green';
            pause(1);
        else
            break;
        end
    end
end