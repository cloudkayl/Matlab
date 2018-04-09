%% Cylindrical contact lens
% This script calculates the volume of a contact lens(cylindrical)

% end section

%% Author Information
% name: Ayush Rout
% email: axr6077@rit.edu
% date: 23 Feb, 2018
% end section

%% Initialization
load("contactLensData");

% Dx = x2-x1, x3-x2, ... cause x is unevenly 
% spaced
Dx = x(2:1:end) - x(1:1:end-1); 

% Trapezoid coefficients
c = 2 * ones(1,length(x));
c(1) = 1;
c(end) = 1;

ReimannLeft = x(1:1:end-1);
ReimannRight = x(2:1:end);

yBackLeft = yBack(1:1:end-1);
yBackRight = yBack(2:1:end);

yFrontLeft = yFront(1:1:end-1);
yFrontRight = yFront(2:1:end);
%% Calculation of Volume
LeftReimannSum = Dx.*ReimannLeft.*yBackLeft;
RightReimannSum = Dx.*ReimannRight.*yBackRight;
Volume1 = 0.5*2*pi*(sum(LeftReimannSum)+sum(RightReimannSum));

LeftReimannSum1 = Dx.*ReimannLeft.*yFrontLeft;
RightReimannSum1 = Dx.*ReimannRight.*yFrontRight;
Volume2 = 0.5*pi*(sum(LeftReimannSum1) + sum(RightReimannSum1));

% scatterplot
figure;
s1 = scatter(ReimannRight, yFrontLeft);
hold on;
s2 = scatter(ReimannRight, yBackRight);
title("ReimannRight plot");
figure;
s3 = scatter(ReimannLeft, yFrontLeft);
hold on;
s4 = scatter(ReimannLeft, yBackRight);
title("ReimannLeft plot");

%% RESULTS
% Volume 1 = 275.6362 cubic units
% Volume 2 = 123.6570 cubic units 