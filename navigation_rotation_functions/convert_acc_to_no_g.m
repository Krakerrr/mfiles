function [accx_no_g,accy_no_g,accz_no_g] = convert_acc_to_no_g(accx,accy,accz,...
    roll,pitch)
gravity = 9.81;
sin_phi   = sin(roll);      cos_phi = cos(roll);
sin_theta = sin(pitch);   cos_theta = cos(pitch);
% sin_psi   = sin(heading_rad);   cos_psi = cos(heading_rad);

accx_no_g = accx  - gravity.*sin_theta;
accy_no_g = accy  + gravity.*cos_theta.*sin_phi;
accz_no_g = accz  + gravity.*cos_theta.*cos_phi;
