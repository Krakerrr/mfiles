function [Vn,Ve,Vd] = convert_ground_speed_to_NED(gSpeed,track,dvel)
Vn = gSpeed .* cos(track);
Ve = gSpeed .* sin(track);
Vd = dvel;