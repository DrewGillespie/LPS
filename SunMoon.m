function [Sm] = SunMoon(t)
%% SunMoon Vector using Days  - Sun Centered Ref Frame

Ev = SunEarth(t);
Mv = EarthMoon(t);

Sm=Ev+Mv;

end

