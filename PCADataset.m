I = []
for i = 1:80
    num = i;
    importImage = strcat('Dataset/',int2str(i),'.pgm');
    eval('importedImage=imread(importImage);');
    %importedImageGray = rgb2gray(importedImage);
    %subplot(ceil(sqrt(80)),ceil(sqrt(80)),i) 
    [m, n] = size(importedImage);
    %imshow(importedImage)
    temp = reshape(importedImage, m*n, 1);
    tempD = double(temp)
    I = [I  tempD];
end


mu=mean(I,2);

[row, colms]= size(I);
I1=I- repmat(mu, 1, colms);

C=cov(I');
[v, lam]= eig(C);

dlam=diag(lam);

ind=find(dlam>0.0001);

W=v(:, 5761:5832);

Y=W'*I1;

size(Y)

v1 = v(:,5832)

for m = 1:71
    subplot(ceil(sqrt(72)), ceil(sqrt(72)),m)
    imshow(reshape(v(:,5761+m),81,72), [])
end

