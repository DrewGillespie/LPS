function [Plane1,Plane2,Plane3] = MoonSatSF(t)
%% MoonSat Vector - Moon Centered Ref Frame

Moon = constant(2);
Sat = constant(4);

G = constant(1);    %gravitational constant
M = Moon(1);    %mass of the moon

R=Sat(5);   %radius of our orbit
Om = [0,120,240]; %Right ascension of the ascending node for each plane
i=Sat(6);
Ts=2*pi*sqrt(R^3/(G*M)); %the period of the satellites counts by seconds
Va=360/Ts;           %the angular velocity of the satellites in days


n_Plane = 3;
n_Sat = 6;

offst = [0, (360/(n_Sat*n_Plane)), (-360/(n_Sat*n_Plane))]; %Offset initial anomaly for each plane so sats don't collide

X = zeros(n_Sat,n_Plane); Y = X; Z = Y; %Allocate sizes of storage matrices

for plane = 1:n_Plane
    for sat=1:n_Sat
                theta=Va*t+ offst(plane)+(sat-1)*60; %Gets position of sat at time t
                [pos, ~]=satellite(M,R,0,i,0,Om(plane),theta);

                X(sat,plane)= pos(1); Y(sat,plane)= pos(2); Z(sat,plane)= pos(3); %Store MoonSat Vector for Current Satellite in current Plane at each time      
    end
end

Plane1 = [X(:,1),Y(:,1),Z(:,1)];
Plane2 = [X(:,2),Y(:,2),Z(:,2)];
Plane3 = [X(:,3),Y(:,3),Z(:,3)];

end

