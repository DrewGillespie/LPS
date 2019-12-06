function [theta] = gesTheta(Total_t,f)
    n_Planes = 3;
    n_SatPP = 6;

    Eg = zeros(Total_t*f,3);
    EsP1 = zeros(n_SatPP,3,Total_t);
    EsP2 = EsP1;
    EsP3 = EsP2;

    for t = 1:Total_t*f

        Eg(t,:) = Glasgow(d2s(t/f)); %Find Sun-Moon Vector Each Day at Same Time
        [EsP1(:,:,t),EsP2(:,:,t),EsP3(:,:,t)] = EarthSat(d2s(t/f)); %Find Moon-Sat Vector Each Day at Same Time

    end

    theta = zeros(n_SatPP,Total_t*f,n_Planes); %Calculation of Angle Variation
        for sat = 1:n_SatPP
            for t = 1:Total_t*f

                theta(sat,t,1) = acosd(dot(Eg(t,:),EsP1(sat,:,t))/(norm(Eg(t,:))*norm(EsP1(sat,:,t))));
                theta(sat,t,2) = acosd(dot(Eg(t,:),EsP2(sat,:,t))/(norm(Eg(t,:))*norm(EsP2(sat,:,t))));
                theta(sat,t,3) = acosd(dot(Eg(t,:),EsP3(sat,:,t))/(norm(Eg(t,:))*norm(EsP3(sat,:,t))));

            end
        end
    
end