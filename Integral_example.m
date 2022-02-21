v=@(t) 10*exp(-t.^2).*cos(2*t);
t = linspace(0,3);
s = zeros(length(t),1);
for ndx = 2:length(t)
    s(ndx) = integral(v,0,t(ndx));
end
figure(1)
AX=plotyy(t,v(t),t,s);
xlabel('time(seconds)')
ylabel(AX(1),'velocity(m/s)')
ylabel(AX(2),'position(m)')






