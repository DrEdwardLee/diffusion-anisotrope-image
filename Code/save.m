function save(I,filename)
  I = I - min(I(:));
  I = I/max(I(:));
  imwrite(I,filename);