function [beta_Crit, theta_Crit] = crit(Total_t,f)
    n_Planes = 3;
    n_SatPP = 6;

    Earth = constant(3);
    Moon = constant(2);
    Sat = constant(4);   
    
    Rso = Sat(5);   %radius of our Satellite orbit
    Rm = Moon(2);   %the radius of the moon
    Re = Earth(2); %Radius of Earth
    
    Gm = zeros(Total_t*f,3);
    EsP1 = zeros(n_SatPP,3,Total_t);
    EsP2 = EsP1;
    EsP3 = EsP2;

    for t = 1:Total_t*f
        Gm(t,:) = GlasgowMoon(d2s(t/f)); %Find Glasgow-Moon Vector Each Day at Same Time - Used for Beta
        [EsP1(:,:,t),EsP2(:,:,t),EsP3(:,:,t)] = EarthSat(d2s(t/f)); %Find Earth-Sat Vectors Each Day at Same Time - Used for Theta
    end

    beta_Crit = zeros(1,Total_t*f); %Calc Crit Angles 
    theta_Crit = zeros(n_SatPP,Total_t*f,n_Planes); %Calc Crit Angles 

        for sat = 1:n_SatPP
            for t = 1:Total_t*f

                beta_Crit(t) = acosd(Rm/Rso) + acosd(Rm/norm(Gm(t,:)));
                
                theta_Crit(sat,t,1) = acosd(Re/norm(EsP1(sat,:,t)));
                theta_Crit(sat,t,2) = acosd(Re/norm(EsP2(sat,:,t)));
                theta_Crit(sat,t,3) = acosd(Re/norm(EsP3(sat,:,t)));
                
                

            end
        end
    
end