function [roll,pitch,yaw] = quat2euler(q0,q1,q2,q3)

w = q0;
x = q1;
y = q2;
z = q3;

dcm20 = 2 .* (x .* z - w .* y);

pitch = asin(-dcm20);

dcm21 = 2 .* (w .* x + y .* z);
dcm22 = w.*w - x.*x - y.*y + z.*z;

roll = atan2(dcm21, dcm22);

dcm10 = 2 .* (x .* y + w .* z);
dcm00 = w.*w + x.*x - y.*y - z.*z;

yaw = atan2(dcm10, dcm00);

end