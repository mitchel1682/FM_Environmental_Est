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
r_ECEF_i = [-4292653.41; 955168.47; 5139356.57]; % m.
v_ECEF_i = [109.649663; -7527.726490; 1484.521489]; % m/s.
euler_i = deg2rad([0 -11.6 0]);

Recef_i = dcmeci2ecef('IAU-2000/2006',timevec);
r_ECI_i = transpose(Recef_i)*r_ECEF_i;
v_ECI_i = transpose(Recef_i)*v_ECEF_i;
q_mi = (angle2quat(euler_i(1,1),euler_i(1,2), euler(1,3)))';
q_i = [q_mi(2,1); q_mi(3,1); q_mi(4,1); q_mi(1,1)];
w_i = [0; 0; 0];
IC = [r_ECI_i; v_ECI_i; q_i; w_i];

%spacecraft mass (assumed rigid)
ISS_m = 400000; %for verfication case study.
msc = 50; %in kg

%spacecraft inertia matrix (assumed rigid)
ISS_I = [102000000 6960000 5480000; 6960000 91000000 -590000; 5480000 -590000 164000000]; %for verfication case study
Ib =  [50 0 0; 0 50 0; 0 0 25];

%spacecraft body vectors
sc_cop = [1; 0; 0]; % spacecraft center of pressure
sc_area = [1; 1; 1]; %area of each spacecraft face
m_bus = [.5; 0; 0]; %magnetic field of spacecraft bus;

%sim parameters
dt = 0.01; %in seconds
t_end = 5;

%initialize sim:
model = 'ES_abbazabba';
simOut = sim(model);

save('ES_SV_Data','r_ECEF','v_ECEF','w','time');