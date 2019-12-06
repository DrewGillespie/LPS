function [theta] = smsTheta(Total_t,f)
    n_Planes = 3;
    n_SatPP = 6;

    Sm = zeros(Total_t*f,3);
    MsP1 = zeros(n_SatPP,3,Total_t);
    MsP2 = MsP1;
    MsP3 = MsP2;

    for t = 1:Total_t*f

        Sm(t,:) = SunMoon(d2s(t/f)); %Find Sun-Moon Vector Each Day at Same Time
        [MsP1(:,:,t),MsP2(:,:,t),MsP3(:,:,t)] = MoonSatSF(d2s(t/f)); %Find Moon-Sat Vector Each Day at Same Time

    end

    theta = zeros(n_SatPP,Total_t*f,n_Planes); %Calculation of Angle Variation
        for sat = 1:n_SatPP
            for t = 1:Total_t*f

                theta(sat,t,1) = acosd(dot(-Sm(t,:),MsP1(sat,:,t))/(norm(Sm(t,:))*norm(MsP1(sat,:,t))));
                theta(sat,t,2) = acosd(dot(-Sm(t,:),MsP2(sat,:,t))/(norm(Sm(t,:))*norm(MsP2(sat,:,t))));
                theta(sat,t,3) = acosd(dot(-Sm(t,:),MsP3(sat,:,t))/(norm(Sm(t,:))*norm(MsP3(sat,:,t))));

            end
        end
    
end