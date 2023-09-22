function [target_azimuth,target_elevation] = estimateTargetAnglesFrom2LLA(target_lat,target_lon,target_alt,...
    platform_lat,platform_lon,platform_alt)

% convert target lla to NED (origin platform pos)
[Xned_target,Yned_target,Zned_target] = convert_lla_to_NED(target_lat,target_lon,target_alt,...
    platform_lat,platform_lon,platform_alt);
ned_mag_target = sqrt(Xned_target.* Xned_target + Yned_target.*Yned_target + Zned_target.*Zned_target);
% estimate target angles
target_azimuth =wrapTo2Pi( atan2(Yned_target,Xned_target));
target_elevation = asin(Zned_target/ned_mag_target);
end