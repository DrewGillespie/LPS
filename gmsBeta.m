function [beta] = gmsBeta(Total_t,f)
    n_Planes = 3;
    n_SatPP = 6;

    Gm = zeros(Total_t*f,3);
    MsP1 = zeros(n_SatPP,3,Total_t);
    MsP2 = MsP1;
    MsP3 = MsP2;

    for t = 1:Total_t*f

        Gm(t,:) = GlasgowMoon(d2s(t/f)); %Find Sun-Moon Vector Each Day at Same Time
        [MsP1(:,:,t),MsP2(:,:,t),MsP3(:,:,t)] = MoonSatSF(d2s(t/f)); %Find Moon-Sat Vector Each Day at Same Time

    end

    beta = zeros(n_SatPP,Total_t*f,n_Planes); %Calculation of Angle Variation
        for sat = 1:n_SatPP
            for t = 1:Total_t*f

                beta(sat,t,1) = acosd(dot(-Gm(t,:),MsP1(sat,:,t))/(norm(Gm(t,:))*norm(MsP1(sat,:,t))));
                beta(sat,t,2) = acosd(dot(-Gm(t,:),MsP2(sat,:,t))/(norm(Gm(t,:))*norm(MsP2(sat,:,t))));
                beta(sat,t,3) = acosd(dot(-Gm(t,:),MsP3(sat,:,t))/(norm(Gm(t,:))*norm(MsP3(sat,:,t))));

            end
        end
    
end