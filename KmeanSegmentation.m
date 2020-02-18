function [CENTS,Is,C] = KmeanSegmentation(K,I)
F = reshape(I,size(I,1)*size(I,2),3);
pixels = size(F,1);
CCENTS = F( ceil(rand(K,1)*pixels),:);
DAL   = zeros(pixels,K+2);                         
KMI   = 10;
for n = 1:KMI
   for i = 1:pixels
      for j = 1:K  
        DAL(i,j) = norm(F(i,:) - CCENTS(j,:));
      end
      [Distance, CN] = min(DAL(i,1:K));
      DAL(i,K+1) = CN;
      DAL(i,K+2) = Distance;
   end
   for i = 1:K
      CNS = (DAL(:,K+1) == i);
      CCENTS(i,:) = mean(F(CNS,:));
   end
end
[nx, ny] = size(F);
X = zeros(nx,ny);
for i = 1:K
    idx = find(DAL(:,K+1) == i); 
    X(idx,:) = repmat(CCENTS(i,:),size(idx,1),1);
end
Is = reshape(X,size(I,1),size(I,2),3);
C = reshape(DAL(:,K+1),size(I,1),size(I,2));
CENTS = CCENTS;
end

