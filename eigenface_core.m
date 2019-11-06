function [m A eigenfaces pr_img] = eigenface_core(database_path)
  #Step 1
  for i = 1:10
    image_path = strcat(database_path,'/',int2str(i),'.jpg');
    Im = double(rgb2gray(imread(image_path)));
    [lin, col] = size(Im);
    for j = 1:lin
      for k = 1:col
        T((j - 1) * col + k, i) = Im(j, k);
      end
    end    
  end
  #Step 2
  m = zeros(lin* col, 1);
  for i = 1:lin * col
    for j = 1:10
      m(i) += T(i, j);
    end
    m(i) = m(i)/10;
  end
  #Step 3
  A = T - m;
  #Step 4
  [W, S] = eig(transpose(A) * A);
  n = size(S, 1);
  V = [ ];
  j = 1;
  for i = 1:n
    if(S(i, i) > 1)
      V(:, j) = W(:, i); 
      j++;
    end
  end
  eigenfaces = A * V;
  #Step 5
  pr_img = transpose(eigenfaces) * A;
end