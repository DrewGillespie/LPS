function [Se] = SunEarth(t)
%% SunEarth Vector using Days - Sun Centered Ref Frame

Earth = constant(3);

Re = Earth(5); %Radius of the earth's orbit
Pe = 365;  %Period of the earth around sun in days
omegaE = 360/d2s(Pe); %Angular velocity in degrees/s
beta=omegaE*t;

Xe=Re*cosd(beta);
Ye=Re*sind(beta);
Ze=0;
Se=[Xe,Ye,Ze];

end