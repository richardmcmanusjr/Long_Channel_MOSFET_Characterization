%% Vds_sat vs L
% Author: Richard McManus
clear;
clc;
clf;

u = 250e-4;
vsat = 10^5;
VdsMax = 5;
numPoints = 1000;
Lmax = 5e-6;
L = linspace(0,Lmax,numPoints);
spacing = VdsMax/numPoints;
VDSsat = zeros(numPoints);
maxVov = 4;
minVov = 1;
stepsVov = 1;
numVov = (maxVov-minVov)/stepsVov + 1;
Vov = linspace(minVov,maxVov,numVov);
legendStrings = "Vov = " + string(Vov);

hold on;
for i = 1:length(Vov)
    curr_Vov = Vov(i);
    for count = 1:numPoints
        VDSsat(count) = (vsat/u)*L(count)*((1+(2*u*(curr_Vov))/(vsat*L(count)))^0.5-1);
        %VDSsat(count) = 2*Vov/(((1+(2*u*(Vov))/(vsat*L(count)))^0.5)+1);
    end
    plot(L*1e6, VDSsat, 'DisplayName', "Vov =" + curr_Vov);
end
hold off;
legend('Location','northwest');
xlabel("L (um)");
ylabel("Vds_s_a_t (V)")


