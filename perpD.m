function [D] = perpD(Total_t,f)
    n_Planes = 3;
    n_SatPP = 6;

    Se = zeros(Total_t*f,3);
    EsP1 = zeros(n_SatPP,3,Total_t);
    EsP2 = EsP1;
    EsP3 = EsP2;

    for t = 1:Total_t*f

        Se(t,:) = SunEarth(d2s(t/f)); %Find Sun-Earth Vector Each Day at Same Time
        [EsP1(:,:,t),EsP2(:,:,t),EsP3(:,:,t)] = EarthSat(d2s(t/f)); %Find Earth-Sat Vector Each Day at Same Time

    end

    alpha = zeros(n_SatPP,Total_t*f,n_Planes); %Calculation of Angle Variation
        for sat = 1:n_SatPP
            for t = 1:Total_t*f

                alpha(sat,t,1) = acosd(dot(Se(t,:),EsP1(sat,:,t))/(norm(Se(t,:))*norm(EsP1(sat,:,t))));
                alpha(sat,t,2) = acosd(dot(Se(t,:),EsP2(sat,:,t))/(norm(Se(t,:))*norm(EsP2(sat,:,t))));
                alpha(sat,t,3) = acosd(dot(Se(t,:),EsP3(sat,:,t))/(norm(Se(t,:))*norm(EsP3(sat,:,t))));

            end
        end
%         D=norm(Es)*sind(alpha)

    D = zeros(n_SatPP,Total_t*f,n_Planes); %Calculation of Angle Variation
    for plane = 1:n_Planes
        for sat = 1:n_SatPP
            for t = 1:Total_t*f

                D(sat,t,1) = norm(EsP1(sat,:,t))*sind(alpha(sat,t,1));
                D(sat,t,2) = norm(EsP2(sat,:,t))*sind(alpha(sat,t,2));
                D(sat,t,3) = norm(EsP3(sat,:,t))*sind(alpha(sat,t,3));

            end
        end
    end
    
end