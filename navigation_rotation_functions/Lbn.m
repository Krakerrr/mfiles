function Lned2body=Lbn(phi,theta,psi)
% estimates rotation matrix from NED to body
L1 = [cos(psi) sin(psi) 0;
    -sin(psi) cos(psi) 0;
    0  0 1];
L2 = [cos(theta) 0 -sin(theta);
    0 1 0;
    sin(theta) 0 cos(theta)];
L3 = [1  0 0;
    0 cos(phi) sin(phi);
    0 -sin(phi) cos(phi)];
Lned2body = L3*L2*L1;
end