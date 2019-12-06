function [Plane1,Plane2,Plane3] = SunSat(t)
%% SunSat Vector using Days - Sun Centered Ref Frame

Ev = SunEarth(t);
Mv = EarthMoon(t);
[MsP1,MsP2,MsP3] = MoonSatSF(t);

n_Sat = 6;
Xp1 = zeros(n_Sat,1); Yp1 = Xp1; Zp1 = Yp1;
Xp2 = zeros(n_Sat,1); Yp2 = Xp2; Zp2 = Yp2;
Xp3 = zeros(n_Sat,1); Yp3 = Xp3; Zp3 = Yp3;

for sat=1:n_Sat

    Xp1(sat)= Ev(1)+Mv(1)+MsP1(sat,1); 
    Yp1(sat)= Ev(2)+Mv(2)+MsP1(sat,2); 
    Zp1(sat)= Ev(3)+Mv(3)+MsP1(sat,3);

    Xp2(sat)= Ev(1)+Mv(1)+MsP2(sat,1); 
    Yp2(sat)= Ev(2)+Mv(2)+MsP2(sat,2); 
    Zp2(sat)= Ev(3)+Mv(3)+MsP2(sat,3);

    Xp2(sat)= Ev(1)+Mv(1)+MsP3(sat,1); 
    Yp2(sat)= Ev(2)+Mv(2)+MsP3(sat,2); 
    Zp2(sat)= Ev(3)+Mv(3)+MsP3(sat,3);

end


Plane1 = [Xp1(:),Yp1(:),Zp1(:)];
Plane2 = [Xp2(:),Yp2(:),Zp2(:)];
Plane3 = [Xp3(:),Yp3(:),Zp3(:)];

end