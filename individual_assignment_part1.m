%% task1
clear all

% the SWREF-coordinates from pgAdmin
x1=568119.3818464499; y1=6495336.851465397;
x2=568375.0004826575; y2=6494200.768637806;
x3=569260.6814462327; y3=6495470.705173923;

% the distances
D1=370; D2=1020; D3=830;

% after modifying the nonlinear equations on paper to linear we can 
% express it in matrix form with A and b (Ax=b)
A = [x1-x2 y1-y2;
    x1-x3 y1-y3
    ];

b = 0.5.*[x1^2-x2^2 + y1^2-y2^2 + D2^2-D1^2;
    x1^2-x3^2 + y1^2-y3^2 + D3^2-D1^2
    ];

% solve for x and y (coordinates for mobile terminal)
xy = A\b;
disp(xy)

% plotting the circles for visualisation (using the circle function given
% on lisam
circle([x1,y1],D1,1000,'b--');
hold on
circle([x2,y2],D2,1000,'g--');
hold on
circle([x3,y3],D3,1000,'r--'); 

% plotting the reference stations for visualisation
plot(x1,y1,'ob')
hold on
plot(x2,y2,'og')
hold on
plot(x3,y3,'or')

% plotting the calculated mobile terminal
plot(xy(1),xy(2),'oblack')
hold on

axis equal

%% task2
clear all

% the SWREF-coordinates from pgAdmin
x1=568119.3818464499; y1=6495336.851465397;
x2=568375.0004826575; y2=6494200.768637806;
x3=569260.6814462327; y3=6495470.705173923;

% the distances
D1=370; D2=1020; D3=830;

% the angles
fi1=22; fi3=45;

% after modifying on paper we can express it in matrix form 
% with A and b (Ax=b)
A = [tand(fi1) -1;
    tand(fi3) -1
    ];

b = [x1*tand(fi1)-y1;
    x3*tand(fi3)-y3
    ];

% solve for x and y (coordinates for mobile terminal)
xy = A\b;
disp(xy)

% plotting the angles lines (y=kx+m) for visualisation
x = linspace(0,1000000,5000);

y_line1 = tand(fi1)*(x-x1) + y1; 
y_line3 = tand(fi3)*(x-x3) + y3;

plot(x,y_line1,'b')
hold on
plot(x,y_line3,'r')

% plotting the reference stations for visualisation
plot(x1,y1,'ob')
hold on
plot(x3,y3,'or')

% plotting the calculated mobile terminal
plot(xy(1),xy(2),'oblack')
hold on

axis equal

%% task3
clear all

% the SWREF-coordinates from pgAdmin
x1=568119.3818464499; y1=6495336.851465397;
x2=568375.0004826575; y2=6494200.768637806;
x3=569260.6814462327; y3=6495470.705173923;
x4=569356.8707778937; y4=6494581.540376374;

% the distances
D1=500; D2=1140; D3=1620; D4=1750;

% after modifying the nonlinear equations on paper to linear we can 
% express it in matrix form with A and b (Ax=b)
A = [x1-x2 y1-y2;
    x1-x3 y1-y3;
    x1-x4 y1-y4
    ];

b = 0.5.*[x1^2-x2^2 + y1^2-y2^2 + D2^2-D1^2;
    x1^2-x3^2 + y1^2-y3^2 + D3^2-D1^2;
    x1^2-x4^2 + y1^2-y4^2 + D4^2-D1^2
    ];

% estimated position for mobile terminal (kind of ToA but LS)
%Pe = [xe, ye];

Pe = ((A'*A)^(-1))*A'*b;
disp(Pe)

% plotting the circles for visualisation (using the circle function given
% on lisam
circle([x1,y1],D1,1000,'b--');
hold on
circle([x2,y2],D2,1000,'g--');
hold on
circle([x3,y3],D3,1000,'r--'); 
hold on
circle([x4,y4],D4,1000,'y--'); 

% plotting the reference stations for visualisation
plot(x1,y1,'ob')
hold on
plot(x2,y2,'og')
hold on
plot(x3,y3,'or')
hold on
plot(x4,y4,'oy')

% plotting the calculated mobile terminal
plot(Pe(1),Pe(2),'oblack')
hold on

axis equal

%% task4
clear all

syms x y

% the SWREF-coordinates from pgAdmin
x1=568119.3818464499; y1=6495336.851465397;
x2=568375.0004826575; y2=6494200.768637806;
x3=569260.6814462327; y3=6495470.705173923;

% the distances between R1&R2 and R1&R3
a=-400; b=120;

% the equations 
eq1 = a==sqrt((x-x1)^2+(y-y1)^2) - sqrt((x-x2)^2+(y-y2)^2);
eq2 = b==sqrt((x-x1)^2+(y-y1)^2) - sqrt((x-x3)^2+(y-y3)^2);

% solver used to solve
S = solve([eq1,eq2],[x,y]);
double([S.x S.y])
