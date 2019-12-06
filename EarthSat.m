function [EsP1,EsP2,EsP3] = EarthSat(t)
%% EarthSat Vector using Days - Earth Centered Ref Frame

[MsP1,MsP2,MsP3] = MoonSatSF(t);
Em = EarthMoon(t);

n_Sat = 6;
EsP1 = zeros(n_Sat,3); EsP2 = EsP1; EsP3 = EsP2;

for sat=1:n_Sat

    EsP1(sat,:) = MsP1(sat,:) + Em; 
    EsP2(sat,:) = MsP2(sat,:) + Em;
    EsP3(sat,:) = MsP3(sat,:) + Em;

end

end