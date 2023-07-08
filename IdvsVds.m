%% Id vs Vds Plotter
% Author: Richard McManus
clear;
clc;
clf;

W = 10e-6;
L = 1e-6;
tox = 4e-9;
lamda = 0.01;
u = 500;
Vt = 0.25;
VdsMax = 5;
epsilon_o = 8.85e-14;
k = 3.9;
C = (epsilon_o*k)/(tox*1e2);
numPoints = 10000;
Vds = linspace(0,VdsMax,numPoints);
spacing = VdsMax/numPoints;
Id = zeros(0,numPoints);
maxVgs = 4;
minVgs = 1;
stepsVgs = 1;
numVgs = (maxVgs-minVgs)/stepsVgs + 1;
Vgs = linspace(minVgs,maxVgs,numVgs);
legendStrings = "Vgs = " + string(Vgs);

hold on;
for i = 1:length(Vgs)
    curr_Vgs = Vgs(i);
    for count = 1:numPoints
        if Vds(count) < curr_Vgs - Vt
            Id(count) = ((W*C*u)/L)*(curr_Vgs - Vt - (Vds(count)/2))*Vds(count);
        else
            Id(count) = 0.5*((W*C*u)/L)*((curr_Vgs - Vt)^2)*(1+(lamda*((Vds(count))-(curr_Vgs - Vt))));
        end
    end
    plot(Vds, 1000*Id, 'DisplayName', legendStrings(i));
end
grid on;
hold off;
legend('Location','northwest');
xlabel("Vds (V)");
ylabel("Id (mA)")
