function[Eg]=Glasgow(t)
%% Glasgow Vector using Days - Earth Centered Fixed Ref Frame

    % t=0 when Earth-rot frame X aligned with Vernal Equinox
    
    Earth = constant(3);
    Rg = Earth(2); %radius earth to glasgow
    Va=360/(Earth(3)*86400); %angular velocity glasgow degree/s
    alpha=Va*t; %angle travelled by glasgow
    
    [Xg,Yg,Zg] = sph2cart(-4.2518,55.8642,Rg);
    
    rot = [23.44,alpha,0]; %XZY  
    GLA = [Xg,Yg,Zg];
    
    Eg=rot2fix(GLA,rot); %Earth-Glasgow Position vector in Earth-Cent Ref frame
    
end

