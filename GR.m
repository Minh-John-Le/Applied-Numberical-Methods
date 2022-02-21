%Variable names are left intentially vague.  
%Try to figure out what each command in this file is doing...
clear all
x(1) = 0;
x(2) = 1;
ndx = 3;
stop_criterion = 100;
while x(end) < stop_criterion
    x(ndx) = x(ndx-1) + x(ndx-2);
    ndx = ndx + 1;
end
x(end) = [];
y = x(3:end)./x(2:end-1);

%Write results to data files for scorelator grading

save A1.dat x -ASCII
save A2.dat y -ASCII
    