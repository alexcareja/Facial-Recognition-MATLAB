function task2()
  
  image = "in/images/image3.gif";
  A = double(imread(image));
  [U, S, V] = svd(A);
  [m n] = size(A);
  
  #2.1
  vec = zeros(min(m,n),1);
  Vsig = zeros(1, min(m,n));
  for i=1:min(m,n)
    Vsig(i) = S(i, i);
    vec(i) = i;
  end
  plot(vec, Vsig);
  
  #2.2
  k = min(m, n);
  sum1 = 0;
  for i = 1:k
    sum1 += S(i,i);
  end
  Ksig = zeros(1, k);
  Kvec = zeros(k, 1);
  for i = 1:k
    Kvec(i) = i;
    sum2 = 0;
    for j = 1:i
      sum2 += S(j,j);
    end
    Ksig(i) = sum2 / sum1;
  end
  figure(2);
  plot(Kvec, Ksig);
  
  #2.3
  V = transpose(V);
  Kerr = zeros(1, k);
  for h = 1:k
    sum = 0;
    A_k = U(:, 1:h) * S(1:h, 1:h) * V(1:h, :);
    for i = 1:m
      for j = 1:n
        sum += (A(i,j) - A_k(i, j))^2;
      end
    end
    Kerr(h) = sum / (m * n);
  end
  figure(3);
  plot(Kvec, Kerr);
  
  #2.4
  Kcomp = zeros(1, k);
  for i = 1:k
    Kcomp(i) = i * (m + n + 1) / (m * n);
  end
  figure(4);
  plot(Kvec, Kcomp);
end