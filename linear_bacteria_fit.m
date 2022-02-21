%Bacteria growth rate example
c = [0.5 0.8 1.5 2.5 4];
k = [1.0 2.5 5.1 7.3 9.1];
%Linear Regression of transformed model
p = polyfit(1./c.^2,1./k,1);
kmax1 = 1/p(2)
cs1 = p(1)*kmax1
kmod = @(c) kmax1*c.^2./(cs1+c.^2);
%Fit quality
Sr = sum((k-kmod(c)).^2);
St = sum((k-mean(c)).^2);
r_squared1 = 1-Sr/St
Syx = sqrt(Sr/(length(k)-2))
%plot results
cm = 0:0.1:5;
plot(c,k,'ko',cm,kmod(cm),'b-')
xlabel('concentration (mg/L)')
ylabel('growth rate (number/day)')
legend('data','linear regression')
title('Bacteria Growth Rate Model')


