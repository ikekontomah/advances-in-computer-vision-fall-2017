function change_direction = get_convexity(point0, point1)
    direction_to_move = point1 - point0;
    if direction_to_move < -pi
        direction_to_move = direction_to_move + 2*pi;
    end
    if direction_to_move > 0
        change_direction= pi - direction_to_move;
    else
        change_direction= -(pi + direction_to_move);
    end
end
