function [Em] = EarthMoon(t)
%% EarthMoon Vector using Days - Earth Centered Ref Frame

Moon = constant(2);

i=Moon(6);
Rm = Moon(5);   %Radius of the moon's orbit
Pm = Moon(3);   %Period of the moon around the earth in days
omegaM = 360/d2s(Pm); %Angular velocity in degrees/s
alpha=omegaM*t;

ip_Moon = [Rm*cosd(alpha);Rm*sind(alpha);0];

quat = quaternion([0,0,i],'eulerd','ZYX','point');
rotatMat= rotmat(quat,'point');

ECent = rotatMat*ip_Moon;

Em=[ECent(1),ECent(2),ECent(3)];

end

