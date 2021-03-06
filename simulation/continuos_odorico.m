clear all
% Simulation example

%load ../data/glicerina/dados3.mat
%load ../data/glicerina/glicerina.mat
%M=length(volume)

p=[ 1;
    0.12;
    1;
    100000]



t0=0
h=1/8

M=2000

U=zeros(M,1);

U(1)=1/h*2;

U(500)=1/h*2;

U(1000)=1/h*2;

f=bio_f_odorico(p);
fd=bio_discretize_euler(f,t0,h,U')

g=bio_g_odorico(p);

xi=[0;0;0.2;1.1]


[x1]=bio_discrete(fd,xi,M);



[q]=g(x1);

figure(1)
plot(x1')

figure(2)
plot(q)

