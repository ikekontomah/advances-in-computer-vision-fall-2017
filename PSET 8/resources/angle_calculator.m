function get_angles= angle_calculator(x0, y0, x1, y1)
    if x1-x0 == 0
        if y1 > y0
            get_angles = pi/2.0;
        else
            get_angles= 3*pi/2.0;
        end
    else
        get_angles= atan((y1-y0)/(x1-x0));
        if x1-x0 < 0
            get_angles = get_angles + pi;
        end
        if get_angles < 0
            get_angles = get_angles + 2*pi;
        end
    end
end