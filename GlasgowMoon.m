function[Gm]=GlasgowMoon(t)

Em=EarthMoon(t);
Eg = Glasgow(t);

Gm=Em-Eg;

end

