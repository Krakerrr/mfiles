function [p,q,r]  = convert_eulerrate_to_pqr(phidot,thetadot,psidot,roll,pitch)
sintheta = sin(pitch);
costheta = cos(pitch);
sinphi = sin(roll);
cosphi= cos(roll);

p = phidot - sintheta .*  psidot;
q = cosphi .* thetadot + sinphi .* costheta .* psidot;
r = -sinphi .* thetadot + cosphi .* costheta .* psidot;
end