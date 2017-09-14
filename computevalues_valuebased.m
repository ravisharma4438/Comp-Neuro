function [Vd, Ve] = computevalues_valuebased (r1, r2, dt, T, sigz2, sig2, c)

plane1=zeros(length(r1),length(r2));
for i=1:length(r1)
  plane1(i,1)=r1(i);
end

for i=2:length(r2)
  for j=1:length(r1)
    plane1(j,i)=plane1(j,1);
  end
end

plane2=zeros(length(r1),length(r2));
for i=1:length(r2)
  plane2(1,i)=r2(i);
end

for i=2:length(r1)
  for j=1:length(r2)
    plane2(i,j)=plane2(1,j);
  end
end

Vd=max(plane1,plane2);

ts=0:dt:T;
N=length(ts);

Ve=NaN(length(r1),length(r2),N); %last "page" is T
for i = N:-1:1
  if i == N
    Vt1 = Vd;
  else
    Vt1 = max(Vd, Ve(:, :, i+1));
    %Vt1 like Vmax for previous time step
  end
  rr1= expectedrewardtrans (r1, r2, sigz2, sig2, ts(i), dt);
  Ve(:, :, i) = rr1 * Vt1 * rr1' - c * dt;
end
%will maximize Ve with Vd at each time point in plotvaluefn_valuebased
