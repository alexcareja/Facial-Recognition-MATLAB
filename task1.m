function A_k = task1(image, k)
  
  A = double(imread(image));
  [U, S, V] = svd(A);
  V = transpose(V);
  A_k = U(:, 1:k) * S(1:k, 1:k) * V(1:k, :);
end