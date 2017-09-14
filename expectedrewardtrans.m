
function [rr1] = expectedrewardtrans (r1, r2, sigz2, sig2, t, dt)
a = (sigz2*sig2)/(t+dt);
b= (sig2)/(t+dt) + sigz2;
q = a/b;
var_no_dt = (q.^2)/(sig2);
r1diff = bsxfun(@minus, r1, r1');
aa=-(r1diff.^2);
bb=2*var_no_dt*dt;
rr1=exp(aa/bb);
rr1=bsxfun(@rdivide,rr1,sum(rr1,2));
r2diff = bsxfun(@minus, r2, r2');
rr2=exp(-r2diff.^2/(2*var_no_dt*dt));