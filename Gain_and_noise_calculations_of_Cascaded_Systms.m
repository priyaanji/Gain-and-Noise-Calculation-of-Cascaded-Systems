clc
x=input('No of stages,x:');

% Enter gain of all amplifiers in array format 
g=input('enter gain of all amplifiers in array format:');

%enter noise figure of 1st amplifier
nf1=input ('enter noise fig of 1st amplifier :');
noisefactor=0;
gn=1;
TOTAL_GAIN=0;
for i=1:x
 TOTAL_GAIN=TOTAL_GAIN+g(i);
end

for i=2:x
    a=g(i-1);
    b(i-1)=[a];
end    
 
for i=1:(x-1)
    b(i);  
end
for i=1:(x-1)
   noisefigure=input('enter noise figure of next amplifier:');
   N=noisefigure-1;
   gn=gn*b(i);
   NF=N/gn;
   noisefactor=noisefactor+NF;
end

%total noise factor of the cascaded system is
TOTAL_NOISEFACTOR=nf1+noisefactor;
 
T1=input ('enter noise temp of 1st amplifier:');
noisetemp=0;
gn=1;
for i=2:x
    a=g(i-1);
    b(i-1)=[a];
end 
for i=1:(x-1)
    b(i);  
end
for i=1:(x-1)
   T=input('enter noise temp of next amplifier:');
   gn=gn*b(i);
   NT=T/gn;
   noisetemp=noisetemp+NT;
end
%total noise temp of the cascaded system is
TOTAL_TEMPERATURE=T1+noisetemp;

%results
TOTAL_GAIN
TOTAL_NOISEFACTOR
TOTAL_TEMPERATURE
