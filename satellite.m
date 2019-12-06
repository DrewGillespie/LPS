function [rvect, vvect]=satellite(mBody,a,e,i,w,Om,Theta)

    G = constant(1);
    mu = G*mBody;

    %In plane position and velocity
    p = a*(1-e^2);
    r_Polar = p/(1+(e*cosd(Theta)));
    ip_pos = [r_Polar*cosd(Theta);r_Polar*sind(Theta);0];
    ip_vel = [(-sqrt(mu/p)*sind(Theta));(sqrt(mu/p)*(e+cosd(Theta)));0];

    % 3-D Position and Velocity
    T = [-sind(Om)*cosd(i)*sind(w)+cosd(Om)*cosd(w) -sind(Om)*cosd(i)*cosd(w)-cosd(Om)*sind(w) sind(Om)*sind(i)
        cosd(Om)*cosd(i)*sind(w)+sind(Om)*cosd(w) cosd(Om)*cosd(i)*cosd(w)-sind(Om)*sind(w) -cosd(Om)*sind(i)
        sind(i)*sind(w) sind(i)*cosd(w) cosd(i)];

    rvect = T*ip_pos; 
    vvect = T*ip_vel;
    end