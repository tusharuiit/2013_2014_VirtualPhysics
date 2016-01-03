#!/usr/bin/env python3
# Author Dirk Zimmer (c) 2011

from math import *

#Setting the parameters
MS = 250.0  	#mass of the motocycle [kg]
MP = 70.0 	#mass of the swing [kg]
R = 2.5 	#Radius of the swing [m]
G = -9.81	#Gravity acceleration

phi0 = 1.25 	#Initial elongation [rad]

h = 0.001 	#time-step of forward Euler integration [s]
tStop = 5 	#stop time [s]

#Setting the initial values
s = 0
v = 0
phi = phi0
w = 0
time = 0

#open file for ouput
fh = open("out.dat","w")

#perform time-integration
while time < tStop:
	fz = MP*R*w*w;
	a = (sin(phi)*fz-cos(phi)*sin(phi)*MP*G)/(MS+MP*(1-cos(phi)*cos(phi)));
	z = (sin(phi)*G - cos(phi)*a)/R;
	
	dv_dt = a
	ds_dt = v
	dw_dt = z
	dphi_dt = w

	v += h*dv_dt
	s += h*ds_dt
	w += h*dw_dt
	phi += h*dphi_dt
	
	time += h
	print(time,"\t",v,"\t",w,fh)

print("See out.dat for simulation result")

fh.close()
