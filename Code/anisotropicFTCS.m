
function [I] = anisotropicFTCS(I0, ind, K, lambda, nb_iter)
  I = I0;
  for iter=1:nb_iter
    [dIx dIy laplacianI] = compute_gradient(I);
    if ind==1
      c = exp(-(dIx.^2 + dIy.^2)/K^2);
    else
      c = 1./(1.+(dIx.^2 + dIy.^2)/K^2);
    end
    [dcx dcy laplacianc] = compute_gradient(c);
    I = I + lambda*( c.*laplacianI + dcx.*dIx + dcy.*dIy);
    if mod(iter,50) == 0
      save(I,['EAnisotropic ' num2str(ind) ' - t ' num2str(iter) '.png']);
      save(gradient_norm(I),['EAnisotropic ' num2str(ind) ' - t ' num2str(iter) ' gradient norm.png']);
      save(1 - gradient_norm(I),['EAnisotropic ' num2str(ind) ' - t ' num2str(iter) ' gradient norm reverted.png']);
    end
  end