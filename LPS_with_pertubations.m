Moon = constant(2);
Sat = constant(4);
G=constant(1);
M = Moon(1);
J2 = Moon(4);
Rm = Moon(2);
Mu = G*M;
a = Sat(5);
n = sqrt(Mu/a^3);
t = 3.154e+8; %10 years in seconds
T = 3.154e+8;
Ti = 3; %Number of time intervals
i_mx = 90;
i_mn = 10;
di=1;
incl = zeros(((((i_mx-i_mn)/di)+1)*3),1);
No_sat = incl;
cntr = 0;
for x = i_mn:di:i_mx
    for t = 0:t/(Ti-1):t
    
    cntr=cntr+1;
    i = deg2rad(x);
    w = 0;
    Om_0 = 0;

    n_planes = 3; %No. Planes (m)
    n_sats = 6; %No. Sats/Plane (n)

    Om = zeros(1,n_planes);
    dOm = ((-3/2)*n*Rm^2*((J2*cos(i))/a^2))*t; 
    for p=1:n_planes
        Om(p) = Om_0 + ((2*pi/n_planes)*(p-1)+dOm); %Creates vector containing RAAN for each Plane
    end 

    if n_planes == 3
        theta_0 = [0, (2*pi/(n_sats*n_planes)), (-2*pi/(n_sats*n_planes))];
    elseif n_planes == 4
        theta_0 = [(2*pi/(n_sats*n_planes)),2*(2*pi/(n_sats*n_planes)),(-2*pi/(n_sats*n_planes)),-2*(2*pi/(n_sats*n_planes))];
    end

    theta = zeros(n_sats,n_planes);
    dtheta =((-3*n*Rm^2*J2)*(3*(sin(i)^2)-2)/(4*a^2))*t;
    for p = 1:n_planes %Creates vector containing True Anomaly for each Satellite in each Plane
        for s = 1:n_sats
            theta(s,p) = theta_0(p) + ((2*pi/n_sats)*(s-1)+dtheta); 
        end
    end

    pos = zeros(n_sats,3,n_planes); %Creates matrix of r,v vals for each sat, for each plane
    vel = zeros(n_sats,3,n_planes); %where each plane is a seperate level of multi-dim array
                                    %each level --> [rx,ry,rz] and [vx,vy,vz]
                           
    for p = 1:n_planes
        for s = 1:n_sats
            [rSat,vSat] = satellite(Moon(1),Sat(5),0,i,w,Om(p),theta(s,p));
            pos(s,:,p) = rSat; %Pos vector of [Sat No.,:,Plane No.]
            vel(s,:,p) = vSat; %Vel vector of [Sat No.,:,Plane No.]
        end
    end

    pt = mySphere(Moon(2),1e4);

    user = zeros(length(pt)); %Vector to store no. of sats visible at each point

    for u = 1:length(pt) 
        sat = 0;
            for p = 1:n_planes
                for s = 1:n_sats
                    scl = dot(pt(u,:),pos(s,:,p)); %Scalar prod of Sat-Moon, Moon-User vector
                    mag = norm(pt(u,:))*norm(pos(s,:,p)); %Product of Magnitudes of Sat-Moon, Moon-User vector
                    b = rad2deg(acos(scl/mag));
                     if b<=65
                        sat = sat+1; %If sat being check is visible, increment No. sats visible at point u
                     end
                end
            end
        user(u) = sat;  
    end 

    cnt = 0;
    for loop = 1:length(user)
        if user(loop)<4
            cnt=cnt+1;
        end
    end
    incl(cntr)=x;
    No_sat(cntr)=cnt;
    
    inclinations=[x,(t/T)*10,cnt];
    disp(inclinations);
    end
end
plot(incl(1:Ti:end),No_sat(1:Ti:end),'.','MarkerSize',30)
hold on
plot(incl(2:Ti:end),No_sat(2:Ti:end),'.','MarkerSize',30)
plot(incl(3:Ti:end),No_sat(3:Ti:end),'.g','MarkerSize',30)
legend ({'t = 0 - (Unperturbed)','t = 5 years - (Perturbed)','t = 10 years - (Perturbed)'})
xlabel('Inclination(degrees)')
ylabel('Points not visible by 4 satellites')