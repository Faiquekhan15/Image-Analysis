function res = Identified_line(Image, rol, Line_Angle)
    [row, col] = size(Image);% finding size_of_image
    for x = 1:row
        y = (rol - x * cosd(Line_Angle) / sind(Line_Angle));% finding y coordinate
        y = round(y);% ceiling
        if y > 0 && y <= col
            Image(x, y) = 1;
        end
    end
    for y = 1:col
        x = (rol - y * sind(Line_Angle) / cosd(Line_Angle));% finding x coordinate
        x = round(x);
        if x > 0 && x <= row
            Image(x, y) = 1;
        end
    end
    res=Image;
end