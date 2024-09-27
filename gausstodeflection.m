function [onlydef]=gausstodeflection(A,newF)

gaussresult=gaussianelim(A,newF);
onlydef=zeros(24,1);
onlydef(3:13,:)=gaussresult(1:11,:);
onlydef(1:2,:)=0;
onlydef(14,:)=0;
onlydef(15:24,:)=gaussresult(12:21,:);
