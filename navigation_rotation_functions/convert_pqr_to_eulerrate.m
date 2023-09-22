function [phidot,thetadot,psidot]  = convert_pqr_to_eulerrate(p,q,r,phi,theta)



sectheta = sec(theta);
tantheta = tan(theta);
sinphi = sin(phi);
cosphi= cos(phi);



phidot   = p + q.*sinphi.*tantheta + r.*cosphi.*tantheta ;
thetadot = q.*cosphi - r.*sinphi;
psidot   = q.*sectheta.*sinphi + r.*cosphi.*sectheta ;

end