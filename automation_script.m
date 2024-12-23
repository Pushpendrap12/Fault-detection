clc
clear

lineLength = 80; %km

tFinal = 0.5;
tStepMax = 0.05;
time_of_fault = 0.25;

for i = 1:50
    i
    m = (i)/52;
    lineLength1 = m*lineLength;
    lineLength2 = (1-m)*lineLength;

    sim('Fault_ckt.slx')

    M(:,1) = ans.tout;
    M(:,2) = ans.simout.Data(:,1);
    M(:,3) = ans.simout.Data(:,2);
    M(:,4) = ans.simout.Data(:,3);

    M(:,5) = ans.simout1.Data(:,1);
    M(:,6) = ans.simout1.Data(:,2);
    M(:,7) = ans.simout1.Data(:,3);
    size(M)

    filename = string(i)
    csvwrite(filename,M, 1)

    clear M
end


