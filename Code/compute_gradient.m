function [dIx dIy laplacianI]=compute_gradient(I)
  

[a,b,c] = size(I);
[dIx dIy useless] = gradient(I);
[dIxx dIyx useless] = gradient(dIx);
[dIxy dIyy useless] = gradient(dIy);
laplacianI = dIxx + dIyy;

end

