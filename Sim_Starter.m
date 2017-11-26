clear all; clc; close all;

%Environmental Sim Starter
%M. McDonald 10/15/17

%initialization time:
year = 2017;
month = 3;
day = 20;
hour = 10;
minute = 29;
second = 0;
%decimal_year = year + (month./12) + (day./365) + (hour./(365.*24)) + (minute./(365.*24.*60)) + (second./(365.*24.*3600));
timevec = [year month day hour minute second];
DOY = make_doy(year,month,day);
decimal_year = year + (DOY./365) + (hour./(365.*24)) + (minute./(365.*24.*60)) + (second./(365.*24.*3600));
%initial inertial position and Velocity, represented in ECEF:
r_ECI_i = [-3802109.57; 4869235.79; 2786219.22]; % m.
v_ECI_i = [-5547.254425; -1392.277084; -5116.754279]; % m/s.
q_ab = [1 0 0 0]; %Rotation from body frame to maximum drag location.
Rab = quat2dcm(q_ab);

%Initialize to ideal attitude:
w_e = [0; 0; (7.2921150E-5)];
S_w_e = [0 w_e(3,1) -w_e(2,1); -w_e(3,1) 0 w_e(1,1); w_e(2,1) -w_e(1,1) 0];
v_ECF_i = v_ECI_i + S_w_e*r_ECI_i;

x_ECI = [1 0 0];
phi_i = acos((dot(v_ECF_i,x_ECI))./(norm(v_ECF_i).*norm(x_ECI)));
v_ECF_n_i = v_ECF_i./norm(v_ECF_i);
c = cross(x_ECI,v_ECF_n_i)';

%Converting from axis-angle to Rotation Matrix:
S_c_i = [0 c(3,1) -c(2,1);
    -c(3,1) 0 c(1,1);
    c(2,1) -c(1,1) 0];

S_c_phi_i = S_c_i.*phi_i;
Rai_i = expm(S_c_phi_i);

%Find "Ideal" Attitude for Maximum Drag:
Rbi_i = transpose(Rab)*Rai_i;
q_mi = dcm2quat(Rbi_i)';
q_i = [q_mi(2,1); q_mi(3,1); q_mi(4,1); q_mi(1,1)];
w_i = [0; 0; 0];
IC = [r_ECI_i; v_ECI_i; q_i; w_i];

Recef_i = dcmeci2ecef('IAU-2000/2006',timevec);

%spacecraft mass (assumed rigid)
ISS_m = 400000; %for verfication case study.
msc = 50; %in kg

%spacecraft inertia matrix (assumed rigid)
ISS_I = [102000000 6960000 5480000; 6960000 91000000 -590000; 5480000 -590000 164000000]; %for verfication case study
Ib =  [50 0 0; 0 50 0; 0 0 25];

%spacecraft body vectors
sc_cop = [0; 0; 0]; %[1; 0; 0]; % spacecraft center of pressure
sc_area = [1; 1; 1]; %area of each spacecraft face
m_bus = [.5; 0; 0]; %magnetic field of spacecraft bus;

%sim parameters
dt = 0.1; %in seconds
t_end = 5400;

% %initialize sim:
model = 'ES_butterfinger';
simOut = sim(model);

save('ES_SV_Data','r_ECEF','v_ECEF','w','time');