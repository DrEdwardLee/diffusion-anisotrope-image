function [I] = isotropicFTCS(I0, lambda, nb_iter)
  I = I0;
  for iter=1:nb_iter
    [dIx dIy laplacianI]=compute_gradient(I);
    I = I + lambda*laplacianI;
    if mod(iter,50) == 0
      save(I,['EIsotropic - t ' num2str(iter) '.png']);
      save(gradient_norm(I),['EIsotropic - t ' num2str(iter) ' gradient norm.png']);
      save(1 - gradient_norm(I),['EIsotropic - t ' num2str(iter) ' gradient norm reverted.png']);
    end
    end
    end