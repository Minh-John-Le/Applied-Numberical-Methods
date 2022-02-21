%Bacteria growth rate example
c = [0.5 0.8 1.5 2.5 4];
k = [1.0 2.5 5.1 7.3 9.1];
kmodel = @(c,kmax,cs) kmax*c.^2./(cs+c.^2);
%Linear Regression of transformed model
p = polyfit(1./c.^2,1./k,1);
kmax1 = 1/p(2);
cs1 = p(1)*kmax1;
%Fit quality
Sr = sum((k-kmodel(c,kmax1,cs1)).^2);
St = sum((k-mean(k)).^2);
r_squared1 = 1-Sr/St
Syx_1 = sqrt(Sr/(length(k)-2))
%Nonlinear Regression using fminsearch
bac_res = @(a,ci,ki) sum((ki-kmodel(ci,a(1),a(2))).^2);
options = optimset('TolX',1e-8,'TolFun',1e-8);
a = fminsearch(bac_res,[1,1],options,c,k);
kmax2 = a(1);
cs2 = a(2);
%Fit quality
Sr2 = sum((k-kmodel(c,kmax2,cs2)).^2);
r_squared2 = 1-Sr2/St
Syx_2 = sqrt(Sr2/(length(k)-2))

%Nonlinear Regression using lsqcurvefit
bac_model = @(a,ci) kmodel(ci,a(1),a(2));
[a2,Sr3] = lsqcurvefit(bac_model,[1 1],c,k,[],[],options);
kmax3 = a2(1);
cs3 = a2(2);
%Fit quality
r_squared3 = 1-Sr3/St
Syx_3 = sqrt(Sr3/(length(k)-2))

%plot results
cm = 0:0.1:5;
figure(1); hold on
plot(c,k,'ko',cm,kmodel(cm,kmax1,cs1),'r-')
plot(cm,kmodel(cm,kmax2,cs2),'b--',cm,kmodel(cm,kmax3,cs3),'g-.')
xlabel('concentration (mg/L)')
ylabel('growth rate (number/day)')
legend('data','linear regression','nonlinear regression with fminsearch','lsqcurvefit')
title('Three Curve Fitting Approaches')
