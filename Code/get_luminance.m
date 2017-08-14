function I=get_luminance(Irgb)
    [a,b,c] = size(Irgb);
    if c==3
      I=0.2126*Irgb(:,:,1)+0.7152*Irgb(:,:,2)+0.0722*Irgb(:,:,3);
      end
end