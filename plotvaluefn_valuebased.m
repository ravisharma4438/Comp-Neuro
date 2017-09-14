
function plotvaluefn_valuebased (sigz2, sig2, c, T)
dr = 0.4;
dt=0.005;
[r1, r2, r_num] = discretereward (dr);
[Vd, Ve] = computevalues_valuebased (r1, r2, dt, T, sigz2, sig2, c);
V = bsxfun(@max, Vd, Ve);
Vtzero = V(:,:,1);

%Vd surface
%surf(r1,r2,Vd)
%title("Vd surface")
%ylabel("r1")
%xlabel("r2")
%zlabel("Value")

%Vtzero surface
%surf(r1,r2,Vtzero) 
%title("t=0 Value surface")
%ylabel("r1")
%xlabel("r2")
%zlabel("Value")

%plotting both surfaces at same time 
surf(r1,r2,Vtzero)
%hold on
%surf(r1,r2,Vd)
%hold off


%code involved in ultimately plotting (r1-r2)/2 against V
p=r1.-r2(1);
for i = 2:length(r1) %assumption that r1 and r2 are same length
  nxt=r1.-r2(i);
  p=cat(2,p,nxt);
end
p = p./2;
w=reshape(Vd,[1, length(r1)*length(r2)]);
v=reshape(Vtzero,[1, length(r1)*length(r2)]);

a=[];
for i=816:50:2601 %hard coding r1+r2=6 case and dr=0.4 case for now
  b=i;
  a=cat(2,a,b);
end

p(1:1000);
a;
p(a);
w(a);

%Vd plot for r1+r2=6
%plot(p(a),w(a))
%title("Vd plot for r1+r2=6")
%xlabel("(r1-r2)/2")
%ylabel("Value")

%Vtzero plot for r1+r2=6
%plot(p(a),v(a))
%title("t=0 Value plot for r1+r2=6")
%xlabel("(r1-r2)/2")
%ylabel("Value")




%nxt=r1.-r2(2);
%p=cat(2,p,nxt);
%nxt=r1.-r2(3);
%p=cat(2,p,nxt);
%%make nxt, concatenate p


%plotting both Vd and V plots at the same time for r1+r2=6
%plot(p(a),w(a))
%title("Vd and t=0 Value plot for r1+r2=6")
%xlabel("(r1-r2)/2")
%ylabel("Value")
%hold on;
%plot(p(a),v(a))
%hold off;


x=zeros(length(r1)+length(r2));

endfunction
