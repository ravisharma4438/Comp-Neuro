function [r1, r2, r_num] = discretereward (dr)
%input step size. Output will be discretized reward vectors from -10 to 10,
%with the given step size dictating how many steps there will be.
r_num=(20/dr)+1;
r1=linspace(-10,10,r_num);
r2=linspace(-10,10,r_num);
