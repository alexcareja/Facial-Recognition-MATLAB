function [A_k S] = task4(image, k)
  
  A = double(imread(image));
  [m n] = size(A);
  miu = zeros(m, 1);
  for i = 1:m
    sum = 0;
    for j = 1:n
      sum += A(i,j);
    end
    miu(i) = sum / n;
    for j = 1:n
      A(i, j) -= miu(i);
    end
  end
  
  Z = A * (transpose(A)/(n-1));
  
  [V S] = eig(Z);
  
  W = V(:, 1:k);
  
  Y = transpose(W) * A;
  
  A_k = W*Y;
  for i = 1:n
    A_k(:,i) += miu;
  end
end