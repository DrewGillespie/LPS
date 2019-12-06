function [AstroConst] = constant(body)
    %Gives Astro Constants for Celestial Bodies
    %All Values from NASA
    %
    %Input: 1 = Universal Gravitational Constant
    %       2 = Moon
    %       3 = Earth
    %       4 - Satellite
    %
    %Output: [AstroConst] = Vector containing Astro Constants of Body 
    %       AstroConst(1) = Mass (kg)
    %       AstroConst(2) = Radius (m)
    %       AstroConst(3) = Period of Revolution (Days)
    %       AstroConst(4) = J2 
    %       AstroConst(5) = Semimajor Axis (m)
    %       AstroConst(6) = Inclination (deg)
    
    switch  body
        case 1
            AstroConst = 6.67e-11;
        case 2
            AstroConst(1) = 0.07346e24;
            AstroConst(2) = 1737.4e3;
            AstroConst(3) = 27.3217;
            AstroConst(4) = 202.7e-6;
            AstroConst(5) = 0.3844e9;
            AstroConst(6) = 5.145;
        case 3
            AstroConst(1) = 5.9724e24;
            AstroConst(2) = 6371.0e3;
            AstroConst(3) = 1;
            AstroConst(4) = 1082.63e-6;
            AstroConst(5) = 149.60e9;
            AstroConst(6) = 0;
        case 4
            AstroConst(1) = 0;
            AstroConst(2) = 0;
            AstroConst(3) = 13.3986/24;
            AstroConst(4) = 0;
            AstroConst(5) = 6609.67e3;
            AstroConst(6) = 55;
    end
end