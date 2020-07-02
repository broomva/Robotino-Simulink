clear all
clc
rr=0.04;%radio ruedas
L=0.15; %cms cuando usar ?
T=10; %tiempo
R=2; %Radio circulo
n=100; %puntos
dt=T/(n-1); %-1 para que no sea inconsistente
t=0:dt:T;

%y=sqrt(sqrt((4*t.^2) +1) - t.^2 -1);  % corazon
%x=((3/2*pi)*asin(sqrt(2)*abs(t)-1)) - (3/4);

x=R*sin(2*pi/T*t);
y=R*cos(2*pi/T*t);

%x=2*t;
%y=2*t;

%y=2*t;
%x=2*t;

theta=pi/2;
vx=2*pi/T*R*cos(2*pi/T*t);
vy=2*pi/T*R*sin(2*pi/T*t);
w=zeros(1,n);
v=[vx; vy; w];
J=1/rr*[-sin(theta) cos(theta) L; -sin(pi/3-theta) -cos(pi/3-theta) L; sin(pi/3+theta) -cos(pi/3+theta) L]
wtr=J*v;
w1=wtr(1,:);
w2=wtr(2,:);
w3=wtr(3,:);
an1=zeros(1,n);
an2=zeros(1,n);
an3=zeros(1,n);

for i=2:n-1
    an1(i)=an1(i-1)+dt*w1(i+1)
    an2(i)=an2(i-1)+dt*w2(i+1)
    an3(i)=an3(i-1)+dt*w3(i+1)
end

plot(an1)
hold on;grid on;
title ('Robotino');
xlabel('x (Tiempo)'); 
ylabel('y(cm)');
plot(an2)
hold on;grid on 
plot(an3)