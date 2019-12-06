function[GsP1,GsP2,GsP3]=GlasgowSat(t)

[MsP1,MsP2,MsP3] = MoonSatSF(t);
Gm = GlasgowMoon(t);

n_SatPP=6;
GsP1 = zeros(n_Sat,3); GsP2 = GsP1; GsP3 = GsP2;

for sat=1:n_SatPP
    
    GsP1(sat,:) = MsP1(sat,:) + Gm; 
    GsP2(sat,:) = MsP2(sat,:) + Gm;
    GsP3(sat,:) = MsP3(sat,:) + Gm;
    
end

end