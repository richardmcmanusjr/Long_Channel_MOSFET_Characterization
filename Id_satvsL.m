%% Id_sat vs L
% Author: Richard McManus
clear;
clc;
clf;

W = 20e-6;
W_L = 10;
vsat = 1e7;
tox = 2e-9;
u = 250;
LMax = 5e-6;
epsilon_o = 8.85e-14;
k = 3.9;
C = (epsilon_o*k)/(tox*1e2);
numPoints = 1000;
L = linspace(0,LMax*1e2,numPoints);
IdSat = zeros(0,numPoints);
VDS_sat = zeros(0,numPoints);

hold on;
for i = 1:2
    if i == 1
        Vov = 1;
    else
        Vov = 2.6;
    end
    for count = 1:numPoints
        VDS_sat(count) = (2*Vov)/(((1+(2*u*Vov)/(vsat*L(count)))^0.5)+1);
        curr_VDS_sat = VDS_sat(count);
        W = W_L*L(count);
        IdSat(count) = ((W*C*u)/(L(count) + (u*curr_VDS_sat)/vsat))*(Vov - (curr_VDS_sat/2))*curr_VDS_sat;
    end
     plot(L*1e4, IdSat*1e3, 'DisplayName', "Vov = " + Vov);
%     plot(L*1e4, VDS_sat);

end
grid on;
hold off;
legend('Location','northwest');
xlabel("L (um)");
ylabel("Id_s_a_t (mA)")

%{

V = V/((cm^2/(v*s))/(cm/s * cm))^0.5
A = ((cm*C*(cm^2/(v*s)))/(cm + (cm^2/(v*s))*V/(cm/s))*(V^2)
A = cm^3*C/(v*s)/(cm)*V^2
A = cm^2*C*V*s
%}


