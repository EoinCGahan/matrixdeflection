function [xnext,n]=gauss_siedel(GSM,newF)
%iterative method used to solve systems of linear equations
%gauss siedel in order to check the gaussian elimination
%input
%GSM-24*24 Global stiffness matrix via direct stiffness matrix
%newF-24*1 matrix of the total x and y  forces on each node of the truss bridge
%output
%v=21*1 matrix containing the non zero deflections
%Version:1 date:12/4/2022
%author:eoin gahan
gauss_siedel_F=zeros(21,1);
gauss_siedel_F(1:11,:)=newF(3:13,:);
gauss_siedel_F(12:21,:)=newF(15:24);

gauss_siedel_A=zeros(21,21);
gauss_siedel_A(1:11,1:11)=GSM(3:13,3:13);
gauss_siedel_A(12:21,12:21)=GSM(15:24,15:24);
gauss_siedel_A(1:11,12:21)=GSM(3:13,15:24);
gauss_siedel_A(12:21,1:11)=GSM(15:24,3:13);
%itertaion limit
iteration_limit=350;




[row,column]=size(gauss_siedel_A);


Upper=zeros(row,column);
%Upper, is the upper traingular matrix of matrix A
Lower=zeros(row,column);
%lower,is the lower trimnagular matrix of matrix A

%A matrix is then split into these two triangular matrices
for r = 1:row
    for c =1:column
        if c>r
            Upper(r,c)=gauss_siedel_A(r,c);
        else
            Lower(r,c)= gauss_siedel_A(r,c);
        end
    end
end
invL=inv(Lower);
xnext=zeros(21,1);
for n=1:iteration_limit+1
    x=xnext;
    %x is current of x value
    xnext=invL*(gauss_siedel_F-Upper*x); 
    %xnext is the next value of after x 
end

disp(n)
end