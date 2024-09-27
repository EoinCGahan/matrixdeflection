A=zeros(24,24);
A(:,1:11)=GSM(:,3:13);
A(:,12:21)=GSM(:,15:24);
A(1,22)=-1;
A(2,23)=-1;
A(14,24)=-1;
newF=varyforcetruck(1,Fnodes);
gaussresult=gaussianelim(A,Fnodes)
onlydef=zeros(24,1);
onlydef(3:13,:)=gaussresult(1:11,:);
onlydef(1:2,:)=0;
onlydef(14,:)=0;
onlydef(15:24,:)=gaussresult(12:21,:)

for x = 1:length(c)
   
    cs(:,:,x) =[c(x) s(x) -c(x) -s(x)];
end

Fmem1=k*cs(:,:,1)*onlydef(1:4,:);
Fmem2=k*cs(:,:,2)*[onlydef(1:2,:);onlydef(23:24,:)];
Fmem3=k*cs(:,:,3)*[onlydef(3:4,:);onlydef(23:24,:)];
Fmem4=k*cs(:,:,4)*onlydef(3:6,:);
Fmem5=k*cs(:,:,5)*[onlydef(5:6,:);onlydef(23:24,:)];
Fmem6=k*cs(:,:,6)*onlydef(21:24,:);
Fmem7=k*cs(:,:,7)*[onlydef(5:6,:);onlydef(21:22,:)];
Fmem8=k*cs(:,:,8)*onlydef(5:8,:);
Fmem9=k*cs(:,:,9)*[onlydef(7:8,:);onlydef(21:22,:)];
Fmem10=k*cs(:,:,10)*[onlydef(7:8,:);onlydef(19:20,:)];
Fmem11=k*cs(:,:,11)*onlydef(19:22,:);
Fmem12=k*cs(:,:,12)*onlydef(17:20,:);
Fmem13=k*cs(:,:,13)*onlydef(7:10,:);
Fmem14=k*cs(:,:,14)*[onlydef(7:8,:);onlydef(17:18,:)];
Fmem15=k*cs(:,:,15)*[onlydef(9:10,:);onlydef(17:18,:)];
Fmem16=k*cs(:,:,16)*[onlydef(9:10,:);onlydef(15:16,:)];
Fmem17=k*cs(:,:,17)*onlydef(9:12,:);
Fmem18=k*cs(:,:,18)*onlydef(15:18,:);
Fmem19=k*cs(:,:,19)*[onlydef(11:12,:);onlydef(15:16,:)];
Fmem20=k*cs(:,:,20)*onlydef(11:14,:);
Fmem21=k*cs(:,:,21)*onlydef(13:16,:);

Fmem=zeros(21,1);
Fmem(1:21,:)=[Fmem1; Fmem2; Fmem3; Fmem4; Fmem5; Fmem6; Fmem7; Fmem8; Fmem9; Fmem10; Fmem11; Fmem12; Fmem13;Fmem14;Fmem15;Fmem16;Fmem17;Fmem18;Fmem19;Fmem20;Fmem21];
max(abs(Fmem));


