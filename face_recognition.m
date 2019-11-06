function[min_dist output_img_index] = face_recognition(image_path,m,A,eigenfaces,pr_img)
  #Step 1
  Im = double(rgb2gray(imread(image_path)));
  [lin, col] = size(Im);
  for j = 1:lin
    for k = 1:col
      T((j - 1) * col + k, 1) = Im(j, k);
    end
  end    
  #Step 3
  A_prime = T - m;
  #Step 7
  PrTestImg = transpose(eigenfaces) * A_prime;
  #Step 8
  n = size(pr_img, 2);
  min_dist = norm(pr_img(:,1) - PrTestImg);
  output_img_index = 1;
  for i = 2:n
    norma = norm(pr_img(:, i) - PrTestImg);
    if(norma < min_dist)
      min_dist = norma;
      output_img_index = i;
    end
  end
end