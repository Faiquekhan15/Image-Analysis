function hough = houghTransform(Image, Line_Angle, min_pix_on_line)
%--REG TO GRAY-%
    Image = rgb2gray(Image);
%---Edge detection using canny--------%
    Image = edge(Image(:, :, 1), 'canny');
%-----IMAGE_SIZE-----------------------%
    [row, col] = size(Image);
%--------------------pythagoras theorem-----------------------%
%--------------------squareroot(prep^2+base^2)=hypotenuse-----------------------%
    Max_Reigion_of_interest = sqrt(row ^ 2 + col ^ 2);
    Max_Reigion_of_interest = ceil(Max_Reigion_of_interest);
    hspace = zeros(1, Max_Reigion_of_interest);
    for x = 1:row
        for y = 1:col
            if 1 == Image(x, y)
                %---------------Where ROL REPRESENTS (of_a_line)-------%
                ROI = x * cosd(Line_Angle) + y * sind(Line_Angle);
                % finding rho value for respective x-y coordinates
                ROI = round(ROI);
                 %populating hspace matrix
                hspace(1, ROI) = hspace(1, ROI) + 1;
            end
        end
    end
    for ROI = 1: Max_Reigion_of_interest
        if hspace(ROI) >= min_pix_on_line
            res = Identified_line(Image, ROI, Line_Angle);
        end
    end
    hough = res;
end