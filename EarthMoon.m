function [Em] = EarthMoon(t)
%% EarthMoon Vector using Days - Earth Centered Ref Frame

Moon = constant(2);

i=Moon(6);
Rm = Moon(5);   %Radius of the moon's orbit
Pm = Moon(3);   %Period of the moon around the earth in days
omegaM = 360/(Pm*86400); %Angular velocity in degrees/day
alpha=omegaM*t;

Xm=Rm*cosd(alpha)*cosd(i);
Ym=Rm*sind(alpha);
Zm=Rm*cosd(alpha)*sind(i);
Em=[Xm,Ym,Zm];

end