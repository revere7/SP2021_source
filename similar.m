function [T]=similar(R,G)
R=double(R/255);
G=double(G/255);
[r c]=size(R);
[r1 c1]=size(G);
average_R=0;
column_R=zeros(r*c,1);
column_R=reshape(R',r*c,1);
average_G=0;
column_G=zeros(r1*c1,1);
column_G=reshape(G',r1*c1,1);
column_R1=zeros(r*c,1);
column_G1=zeros(r1*c1,1);
for i=1:r
for j=1:c
average_R=average_R+R(i,j);
end
end
average_R=average_R/(r*c);
for i=1:r1
for j=1:c1
average_G=average_G+G(i,j);
end
end
average_G=average_G/(r1*c1);
for i=1:r*c
column_R1(i,1)=column_R(i,1)-average_R;
end
for i=1:r1*c1
column_G1(i,1)=column_G(i,1)-average_G;
end
D=column_R1'*column_G1;
E=sqrt(column_R1'*column_R1);
F=sqrt(column_G1'*column_G1);
T=D/(E*F);
