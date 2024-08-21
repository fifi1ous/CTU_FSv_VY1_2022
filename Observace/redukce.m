clc; clear; format long G
r=6380000;
s=656.665
z=99.5906
z=z/200*pi
H=897.272
vc=1.707
vs=1.596

T=[845296.5505;998014.6595]

fi=(s*sin(z)/6380000)
d=((s*sin(z-fi))/(cos(fi/2)))
h=((s*cos(z-fi/2))/(cos(fi/2)))
H1=H+vc-vs-h
do=d*(r/(r+H+vs))

R=sqrt((T(2)^2+T(1)^2))
dr=R-1298039
mjtsk=0.9999+1.22822*10^(-14)*dr^2-3.154*10^(-21)*dr^3+1.848*10^(-27)*dr^4
djstks=do*mjtsk