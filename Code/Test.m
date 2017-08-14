%SIMULATIONS

%Choose between tools and dome images
Irgb = double(imread('tools.jpg'))/255.;
figure(1);
imagesc(Irgb);
disp(size(Irgb));
save(Irgb,"Image.jpg");
save(gradient_norm(Irgb),'Image - gradient norm.png');
save(1 - gradient_norm(Irgb),'Image - norm reverted.png');

%Simulation parameters
lambda = 0.10;
nb_iter = 600;

%Istotropic FTCS
%Icontour0 = isotropicFTCS(Irgb, lambda, nb_iter);
%figure(2);
%disp(size(gradient_norm(Icontour0)));
%imagesc(1-gradient_norm(Icontour0));

%Anisotropic FTCS
%Diffusion parameter
%K = 0.08;
%K = 0.001
K = 0.04;
%K = 0.01 %Tools
%K = 0.2 %Dome

%Exponential version
Icontour1 = anisotropicFTCS(Irgb, 1, K, lambda, nb_iter);
figure(3);
%disp(max(gradient_norm(Icontour1)));
imagesc(1-gradient_norm(Icontour1));

%Polynomial version
Icontour2 = anisotropicFTCS(Irgb, 2, K, lambda, nb_iter);
figure(4);
%disp(max(gradient_norm(Icontour2)));
imagesc(1-gradient_norm(Icontour2));