clear all; clc; close all; 

%Verification data for Orbit_02
%M. McDonald 10/15/17

load SV_Sim_Data
load ES_SV_Data

%Position along x axis (ECEF)
%verified sims:
subplot(2,3,1);
plot(t(:,1),SV_Sim_A(:,1));
hold on;
plot(t(:,1),SV_Sim_B(:,1));
hold on;
plot(t(:,1),SV_Sim_C(:,1));
hold on;
plot(t(:,1),SV_Sim_D(:,1));
%ES_SV_Data
hold on;
plot(time(:,1),r_ECEF(:,1));
legend('A','B','C','D','actual');
xlabel('X position - meters');

subplot(2,3,2);
plot(t(:,1),SV_Sim_A(:,2));
hold on;
plot(t(:,1),SV_Sim_B(:,2));
hold on;
plot(t(:,1),SV_Sim_C(:,2));
hold on;
plot(t(:,1),SV_Sim_D(:,2));
%ES_SV_Data
hold on;
plot(time(:,1),r_ECEF(:,2));
legend('A','B','C','D','actual');
xlabel('Y position - meters');

subplot(2,3,3);
plot(t(:,1),SV_Sim_A(:,3));
hold on;
plot(t(:,1),SV_Sim_B(:,3));
hold on;
plot(t(:,1),SV_Sim_C(:,3));
hold on;
plot(t(:,1),SV_Sim_D(:,3));
%ES_SV_Data
hold on;
plot(time(:,1),r_ECEF(:,3));
legend('A','B','C','D','actual');
xlabel('Z position - meters');

subplot(2,3,4);
plot(t(:,1),w_Sim_A(:,1));
hold on;
plot(t(:,1),w_Sim_B(:,1));
hold on;
plot(t(:,1),w_Sim_C(:,1));
hold on;
plot(t(:,1),w_Sim_D(:,1));
%ES_SV_Data
hold on;
plot(time(:,1),w(:,1));
legend('A','B','C','D','actual');
xlabel('X rates rad/sec');

subplot(2,3,5);
plot(t(:,1),w_Sim_A(:,2));
hold on;
plot(t(:,1),w_Sim_B(:,2));
hold on;
plot(t(:,1),w_Sim_C(:,2));
hold on;
plot(t(:,1),w_Sim_D(:,2));
%ES_SV_Data
hold on;
plot(time(:,1),w(:,2));
legend('A','B','C','D','actual');
xlabel('Y rates rad/sec');

subplot(2,3,6);
plot(t(:,1),w_Sim_A(:,3));
hold on;
plot(t(:,1),w_Sim_B(:,3));
hold on;
plot(t(:,1),w_Sim_C(:,3));
hold on;
plot(t(:,1),w_Sim_D(:,3));
%ES_SV_Data
hold on;
plot(time(:,1),w(:,3));
legend('A','B','C','D','actual');
xlabel('Z rates rad/sec');