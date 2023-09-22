function [x_ecef,y_ecef,z_ecef]=convert_lla_to_ecef(lat,  lon,  alt)
    % converts lat lon altitude to X Y Z in ecef
    % WGS 84 ellipsoid constants
    a = 6378137;
    e = 8.1819190842622e-2;
    %calculation
    N = a / (sqrt(1 - e * e * sin(lat) * sin(lat)));
    x_ecef = (N + alt)*cos(lat)*cos(lon);
    y_ecef = (N + alt)*cos(lat)*sin(lon);
    z_ecef = ((1 - e * e)*N + alt)*sin(lat);
end
