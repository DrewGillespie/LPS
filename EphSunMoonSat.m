TotalDays = 365;

n_Planes = 3;
n_SatPP = 6;

Sm = zeros(TotalDays,3);
MsP1 = zeros(n_SatPP,3,TotalDays);
MsP2 = MsP1;
MsP3 = MsP2;

for day = 1:TotalDays
    
    Sm(day,:) = SunMoon(d2s(day)); %Find Sun-Moon Vector Each Day at Same Time
    [MsP1(:,:,day),MsP2(:,:,day),MsP3(:,:,day)] = MoonSatSF(d2s(day)); %Find Moon-Sat Vector Each Day at Same Time
        
end

theta = zeros(n_SatPP,TotalDays,n_Planes); %Calculation of Angle Variation
    for sat = 1:n_SatPP
        for Day = 1:TotalDays
            
            theta(sat,Day,1) = acosd(dot(-Sm(Day,:),MsP1(sat,:,Day))/(norm(Sm(Day,:))*norm(MsP1(sat,:,Day))));
            theta(sat,Day,2) = acosd(dot(-Sm(Day,:),MsP2(sat,:,Day))/(norm(Sm(Day,:))*norm(MsP2(sat,:,Day))));
            theta(sat,Day,3) = acosd(dot(-Sm(Day,:),MsP3(sat,:,Day))/(norm(Sm(Day,:))*norm(MsP3(sat,:,Day))));
            
        end
    end
    
dTheta = zeros(n_SatPP,n_Planes); %Calculation of Theta Variation after TotalDays
for plane = 1:n_Planes
        for sat = 1:n_SatPP
            dTheta(sat,plane) =  theta(sat,365,plane)-theta(sat,1,plane);          
        end
end

t=1:TotalDays;
figure('Name','Sun-Moon Vector : Satellite Angle Variation','NumberTitle','off')
for Sat = 1:n_SatPP %Plot Angle Variations
    
    subplot(2,3,Sat)
    hold on
    plot(t,theta(Sat,:,1),'b')
    plot(t,theta(Sat,:,2),'r')
    plot(t,theta(Sat,:,3),'g'),
    xlabel('Day')
    ylabel('Theta (deg)')
    legend({'Plane 1','Plane 2','Plane3'},'Location','best','NumColumns',5);
    legend('boxoff')
    title(strcat("Satellite: ",num2str(Sat)))
   
end
