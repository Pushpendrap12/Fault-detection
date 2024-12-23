clc
clear

lineLength = 80; %km

tFinal = 0.5;
tStepMax = 0.05;
time_of_fault = 0.3;

m = 50/200;
lineLength1 = m*lineLength;
lineLength2 = (1-m)*lineLength;

sim('Fault_ckt.slx')

%%
t = ans.tout;
Va = ans.simout.Data(:,1);
Vb = ans.simout.Data(:,2);
Vc = ans.simout.Data(:,3);

Ia = ans.simout1.Data(:,1);
Ib = ans.simout1.Data(:,2);
Ic = ans.simout1.Data(:,3);

M(:,1) = t;
M(:,2) = Va;
M(:,3) = Vb;
M(:,4) = Vc;

M(:,5) = Ia;
M(:,6) = Ib;
M(:,7) = Ic;

size(M)
%%
hold on
%plot(t1,Va,Vb, Vc);
subplot(3,1,1);   plot(t,Va)
subplot(3,1,2);   plot(t,Vb)
subplot(3,1,3);   plot(t,Vc)
%%

subplot(3,1,1);   plot(t,Ia)
subplot(3,1,2);   plot(t,Ib)
subplot(3,1,3);   plot(t,Ic)


%%
filename = ['test_data_LLL.csv'];
csvwrite(filename,M,1)
