function [rvect, vvect]=satellite(mBody,a,e,i,w,Om,Theta)

    G = constant(1);
    mu = G*mBody;

    %In plane position and velocity
    p = a*(1-e^2);
    r_Polar = p/(1+(e*cos(Theta)));
    ip_pos = [r_Polar*cos(Theta);r_Polar*sin(Theta);0];
    ip_vel = [(-sqrt(mu/p)*sin(Theta));(sqrt(mu/p)*(e+cos(Theta)));0];

    % 3-D Position and Velocity
    T = [-sin(Om)*cos(i)*sin(w)+cos(Om)*cos(w) -sin(Om)*cos(i)*cos(w)-cos(Om)*sin(w) sin(Om)*sin(i)
        cos(Om)*cos(i)*sin(w)+sin(Om)*cos(w) cos(Om)*cos(i)*cos(w)-sin(Om)*sin(w) -cos(Om)*sin(i)
        sin(i)*sin(w) sin(i)*cos(w) cos(i)];

    rvect = T*ip_pos; 
    vvect = T*ip_vel;
    end