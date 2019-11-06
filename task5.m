function task5()
  
  image = "in/images/image3.gif";
  A = double(imread(image));
  A_copy = A;
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
  Z = transpose(A)./ sqrt(n-1);
  [U, S, V] = svd(Z);
  #[m n] = size(Z);
  k = min(m, n);
  
  #5.1
  vec = zeros(k, 1);
  Vsig = zeros(1, k);
  for i = 1:k
    Vsig(i) = S(i, i);
    vec(i) = i;
  end
  plot(vec, Vsig);
  
  #5.2
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
  
  #5.3
  V = transpose(V);
  Kerr = zeros(1, k);
  for h = 1:k
    sum = 0;
    W = V(:, 1:h);
    Y = transpose(W) * A;
    A_k = W*Y;
    #A_k += miu;
    for i = 1:n
      A_k(:,i) += miu;
    end
    for i = 1:m
      for j = 1:n
        sum += (A_copy(i, j) - A_k(i, j))^2;
      end
    end
    Kerr(h) = sum / (m * n);
  end
  figure(3);
  plot(Kvec, Kerr);
  
  #5.4
  Kcomp = zeros(1, k);
  for i = 1:k
    Kcomp(i) = 2 * (i + 1) / n;
  end
  figure(4);
  plot(Kvec, Kcomp);
end