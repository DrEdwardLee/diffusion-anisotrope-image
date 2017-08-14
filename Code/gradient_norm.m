function [dInorm]=gradient_norm(I)
  
[dIx, dIy] = gradient(I);
dInorm = get_luminance(dIx.^2 + dIy.^2);

end

