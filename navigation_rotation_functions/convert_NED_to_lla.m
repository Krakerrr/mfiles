function [lat,lon,alt] = convert_NED_to_lla(Xned,Yned,Zned,lat0,lon0,alt0)
% converts NED vector to lla
% find NED origin
[Xecef_origin,Yecef_origin,Zecef_origin]=convert_lla_to_ecef(lat0,  lon0,  alt0);

% NED to ECEF
slat_ac = sin(lat0);
clat_ac = cos(lat0);
clon_ac = cos(lon0);
slon_ac = sin(lon0);

Xecef = Xecef_origin - Yned*slon_ac - Zned*clat_ac*clon_ac - Xned*clon_ac*slat_ac;
Yecef = Yecef_origin + Yned*clon_ac - Zned*clat_ac*slon_ac - Xned*slat_ac*slon_ac;
Zecef = Zecef_origin + Xned*clat_ac - Zned*slat_ac;

% ECEF to lla
% WGS 84 ellipsoid constants
a = single(6378137);
e = single(8.1819190842622e-2);
%calculation

lambda = atan2(Yecef,Xecef);
r = sqrt(Xecef*Xecef + Yecef*Yecef + Zecef* Zecef);
p = sqrt(Xecef*Xecef + Yecef*Yecef );
phi = atan2(p,Zecef);

for iter = 1:5
    N = a / (sqrt(1 - e * e * sin(phi) * sin(phi)));
    h = p / cos(phi) - N;
    phi = atan2((Zecef/p) , (1-e*e*N/(N+h)));
end

lat = phi;
lon = lambda;
alt = h;