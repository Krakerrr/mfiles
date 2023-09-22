function [Xned,Yned,Zned] = convert_lla_to_NED(lat,lon,alt,lat0,lon0,alt0)
%% all angles are radians
%% case1
[pos_target_x_ecef,pos_target_y_ecef,pos_target_z_ecef]=convert_lla_to_ecef(lat,  lon,  alt);
[Xecef_origin,Yecef_origin,Zecef_origin]=convert_lla_to_ecef(lat0,  lon0,  alt0);
% NED origin to target vector in ECEF
Pecef_ac2t = [ pos_target_x_ecef - Xecef_origin ; pos_target_y_ecef - Yecef_origin ; pos_target_z_ecef - Zecef_origin ];

% ECEF to NED
slat_ac = sin(lat0);
clat_ac = cos(lat0);
clon_ac = cos(lon0);
slon_ac = sin(lon0);
R = [-slat_ac*clon_ac, -slon_ac -clon_ac*clat_ac;
    -slat_ac*slon_ac clon_ac -clat_ac*slon_ac;
    clat_ac 0 -slat_ac];
Postion_NED = transpose(R) * Pecef_ac2t;

Xned = Postion_NED(1);
Yned = Postion_NED(2);
Zned = Postion_NED(3);
end