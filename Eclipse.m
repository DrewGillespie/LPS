Earth = constant(3);
Moon = constant(2);
Sat = constant(4);

Total_t = 365*10; %Days

f = 24; %Frequency of Check per day
a = Sat(5);   %radius of our Satellite orbit
Rm = Moon(2);   %the radius of the moon
Re = Earth(2); %Radius of Earth

n_Planes = 3;
n_SatPP = 6;

%% MoonEclipse
theta = smsTheta(Total_t,f);
D = perpD(Total_t,f);

B=acosd(Rm/a); %the edge shadow angle of moon
theta_Crit1 = 90 + B;
theta_Crit2 = 360 - theta_Crit1;
eclip = zeros(n_SatPP,n_Planes,Total_t);
  
for plane = 1:n_Planes           
    for sat = 1:n_SatPP
            for day = 1:Total_t
                for chk = 1:f
                
                    if (theta(sat,day*chk,plane) > theta_Crit1  && theta(sat,day*chk,plane) < theta_Crit2) || (D(sat,day*chk,plane) <= Re) 
                        eclip(sat,plane,day) = eclip(sat,plane,day) + 1;
                    end
                end

            end
    end
end

MaxEclip = zeros(n_SatPP,n_Planes);
MinEclip = MaxEclip;


for plane = 1:n_Planes
        for sat = 1:n_SatPP
                MaxEclip(sat,plane) = max(eclip(sat,plane,:));
                MinEclip(sat,plane) = min(eclip(sat,plane,:));

        end
end