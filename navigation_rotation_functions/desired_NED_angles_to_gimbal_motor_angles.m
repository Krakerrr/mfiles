function [roll_motor_angle,pitch_motor_angle,yaw_motor_angle]=desired_NED_angles_to_gimbal_motor_angles...
    (desired_azimuth_NED,desired_elevation_NED,desired_roll_NED,...
    platform_roll,platform_pitch,platform_yaw,...
    roll_motor_on_off)
%% Istenilen NED acilari icin gerekli olan motor acilarini hesaplar
% Aci birimleri radyan
% roll_motor_on_off == 1 -> roll motor acik
% roll_motor_on_off == 0 -> roll motor kapali



% desired trigonometric angles
s_desired_roll  = sin(desired_roll_NED);
c_desired_roll  = cos(desired_roll_NED);
s_desired_pitch = sin(-desired_elevation_NED);
c_desired_pitch = cos(-desired_elevation_NED);
s_desired_yaw   = sin(desired_azimuth_NED);
c_desired_yaw   = cos(desired_azimuth_NED);
% platform trigonometric angles
s_platform_roll  = sin(platform_roll);
c_platform_roll  = cos(platform_roll);
s_platform_pitch = sin(platform_pitch);
c_platform_pitch = cos(platform_pitch);
s_platform_yaw   = sin(platform_yaw);
c_platform_yaw   = cos(platform_yaw);
% Transformation matrix NED to body
L11_bn = c_platform_pitch * c_platform_yaw;
L12_bn = c_platform_pitch * s_platform_yaw;
L13_bn = -s_platform_pitch;
L21_bn = s_platform_roll * s_platform_pitch * c_platform_yaw - c_platform_roll * s_platform_yaw;
L22_bn = s_platform_roll * s_platform_pitch * s_platform_yaw + c_platform_roll * c_platform_yaw;
L23_bn = s_platform_roll * c_platform_pitch;
L31_bn = c_platform_roll * s_platform_pitch * c_platform_yaw + s_platform_roll * s_platform_yaw;
L32_bn = c_platform_roll * s_platform_pitch * s_platform_yaw - s_platform_roll * c_platform_yaw;
L33_bn = c_platform_roll * c_platform_pitch;

%% Roll motor off case
if roll_motor_on_off == 0
    % roll motoru 0 iken body direction vectorunden gerekli olan motor acilarini hesaplar
    % convert desired angles to NED direction vector.
    z_vector_ned = -s_desired_pitch;
    y_vector_ned = c_desired_pitch * s_desired_yaw;
    x_vector_ned = c_desired_pitch * c_desired_yaw;
    % Body vector
    x_vector_body = L11_bn*x_vector_ned + L12_bn*y_vector_ned + L13_bn*z_vector_ned;
    y_vector_body = L21_bn*x_vector_ned + L22_bn*y_vector_ned + L23_bn*z_vector_ned;
    z_vector_body = L31_bn*x_vector_ned + L32_bn*y_vector_ned + L33_bn*z_vector_ned;
    % Motor angles
    yaw_motor_angle   = atan2(y_vector_body,x_vector_body);
    pitch_motor_angle = -asin(z_vector_body);
    roll_motor_angle  = 0;
else
%% Roll motor on case
    % Transformation matrix NED to gimbal
    L11_gn = c_desired_pitch * c_desired_yaw;
    L12_gn = c_desired_pitch * s_desired_yaw;
    L13_gn = -s_desired_pitch;
    L21_gn = s_desired_roll * s_desired_pitch * c_desired_yaw - c_desired_roll * s_desired_yaw;
    L22_gn = s_desired_roll * s_desired_pitch * s_desired_yaw + c_desired_roll * c_desired_yaw;
    L23_gn = s_desired_roll * c_desired_pitch;
    L31_gn = c_desired_roll * s_desired_pitch * c_desired_yaw + s_desired_roll * s_desired_yaw;
    L32_gn = c_desired_roll * s_desired_pitch * s_desired_yaw - s_desired_roll * c_desired_yaw;
    L33_gn = c_desired_roll * c_desired_pitch;
    % Transformation matrix body to gimbal
    L23_gb = L21_gn*L31_bn + L22_gn*L32_bn + L23_gn*L33_bn;
    L13_gb = L11_gn*L31_bn + L12_gn*L32_bn + L13_gn*L33_bn;
    L33_gb = L31_bn*L31_gn + L32_bn*L32_gn + L33_bn*L33_gn;
    L21_gb = L11_bn*L21_gn + L12_bn*L22_gn + L13_bn*L23_gn;
    L22_gb = L21_bn*L21_gn + L22_bn*L22_gn + L23_bn*L23_gn;
    % Extract motor angles from body to gimbal
    roll_motor_angle  = asin(L23_gb);
    pitch_motor_angle = atan2(-L13_gb,L33_gb);
    yaw_motor_angle   = atan2(-L21_gb,L22_gb);
end

end
