% Computing DFT using DFT Matrix

clc; clear all; close all;
n=1024;
w=exp(-i*2*pi/n);
DFT=zeros(n,n);

% Slow  
for i=1:n
    for j=1:n
        DFT(i,j)=w^((i-1)*(j-1));
    end
end

% Fast
[I,J]=meshgrid(1:n,1:n);
DFT=w.^((i-1)*(j-1));
imagesc(real(DFT));