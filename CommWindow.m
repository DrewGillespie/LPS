%%

n_Planes = 3;
n_SatPP = 6;

Total_t = 28; %Days
f = 24*60; %Frequency of Check per day

Comm = zeros(n_SatPP,n_Planes,Total_t);

theta = gesTheta(Total_t,f); %Angle between Earth-Sat & Earth-GLA Vectors
beta = gmsBeta(Total_t,f); %Angle between GLA-Moon & Moon-Sat Vectors

[beta_Crit, theta_Crit] = crit(Total_t,f);

for plane = 1:n_Planes           
    for sat = 1:n_SatPP
            for day = 1:Total_t
                for chks = 1:f

                    if (beta(sat,day*chks,plane) < beta_Crit(day*chks)) && (theta(sat,day*chks,plane) < theta_Crit(sat,day*chks,plane))
                            Comm(sat,plane,day) = Comm(sat,plane,day) + 1;
                    end
                end
                
            end
    end
end

MaxWin = zeros(n_SatPP,n_Planes);
MinWin = MaxWin;


for plane = 1:n_Planes
        for sat = 1:n_SatPP
                MaxWin(sat,plane) = max(Comm(sat,plane,:));
                MinWin(sat,plane) = min(Comm(sat,plane,:));

        end
end
