
%angles between members
theta=[0 pi/4 pi/2 0 3*pi/4 pi pi/2 0 3*pi/4 pi/2 pi pi 0 pi/4 pi/2 pi/4 0 pi pi/2 0 3*pi/4 ];
%corresponding members to angles
member=[1 2;1 12;2 12;2 3;3 12;11 12;3 11;3 4;4 11;4 10;11 10;9 10;4 5;4 9;5 9;5 8;5 6;8 9;6 8;6 7;7 8];


c=cos(theta);
s=sin(theta);

for x = 1:length(c)
    %c is a vector with length 21 so 21 matrices will be created
    Kij(:,:,x) =[c(x).^2 c(x)*s(x) -c(x).^2 -c(x)*s(x);c(x)*s(x) s(x).^2 -c(x)*s(x) -s(x).^2;-c(x).^2 -c(x)*s(x) c(x).^2 c(x)*s(x);-c(x)*s(x) -s(x).^2 c(x)*s(x) s(x).^2];
end
%ACCOUNT FOR DIFFERENCES IN LENGTH OF some MEMBERS
Kij(:,:,[2,5,9,14,16,21])=Kij(:,:,[2,5,9,14,16,21])/1.414;
%KIJREAL is the basis for the large matrix(primary stiffness matrix)
E=210*10^9;
A=0.0144;
L=4.5;
k=(E*A/L);

Kij=k*Kij;
%memberposition=zeros(21,4);

GSM=zeros(24,24);

numberofmembers=21;
for n=1:numberofmembers
m1=member(n,1);
m2=member(n,2);
a=2*m1-1;
b=2*m2-1;
Kij11=GSM(a:a+1,a:a+1)+Kij(1:2,1:2,n);
Kij12=GSM(a:a+1,b:b+1)+Kij(1:2,3:4,n);
Kij21=GSM(b:b+1,a:a+1)+Kij(3:4,1:2,n);
Kij22=GSM(b:b+1,b:b+1)+Kij(3:4,3:4,n);

GSM(a:a+1,a:a+1)=Kij11;
GSM(a:a+1,b:b+1)=Kij12;
GSM(b:b+1,a:a+1)=Kij21;
GSM(b:b+1,b:b+1)=Kij22;
end
indices=find(abs(GSM)<0.000001);
GSM(indices)=0;
