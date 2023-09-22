function [Vbx,Vby,Vbz] = convert_ground_speed_to_body(gSpeed,track,dvel,...
    roll,pitch,heading)
[Vn,Ve,Vd] = convert_ground_speed_to_NED(gSpeed,track,dvel);


[Vbx,Vby,Vbz] = convert_NED_to_body(Vn,Ve,Vd,...
    roll,pitch,heading);


end

