% modelar o efeito de R com uma equação diferencial
%
%               R'(t) = a/c(t) , u < 0.2
%               R'(t) = 0 ,               u > 0.2   

clear 
close all

% parametros
h=1;
dias = 100;
a = 0.09;
Kt = 10;
b = 1;

% pre-alocar os vetores
R = zeros(1, dias);
u1 = zeros(1,dias);
u2 = zeros(1,dias);
Vol = zeros(1, dias);

figure(1)
% calculo de c2
c2 = zeros(1,dias);
[~,c2] = p1_vers2(0,0,5,dias,10,[]);
%plot(0:1:dias-1, c2, 'y')
hold on 
% calculo de u (sem efeito da resistencia)
for i= 1:length(u1)
    u1(i) = c2(i)/(7.1903+c2(i));
end
plot(0:1:dias-1,u1, 'g');

% calculo de r
R(1) = 0.1;
for i= 1:length(R)-1
    if u1(i) < 0.3
        R(i+1) = R(i*h) + h*(0.05*R(i));
    else
        R(i+1) = R(i);
    end
end
plot(0:1:dias-1,R, 'r');

% u com o efeito de r
for i= 1:length(u2)
    u2(i) = u1(i) * 1/(1+R(i));
end
plot(0:1:dias-1,u2, 'b');


% Volume do tumor
figure(2)
Vol1(1) = 1;
for k = 1:length(Vol)-1
   Vol1(k+1) = Vol1(k) + h*(a*Vol1(k)*(1-Vol1(k)/Kt) - b*u1(k)*Vol1(k));
end
plot(0:length(Vol1)-1, Vol1)
hold on
Vol2(1) = 1;
for k = 1:length(Vol)-1
   Vol2(k+1) = Vol2(k) + h*(a*Vol2(k)*(1-Vol2(k)/Kt) - b*u2(k)*Vol2(k));
end
plot(0:length(Vol1)-1, Vol2)



% % efeito elevado
% % figure(1)
% % u1 = p2(20, dias, 5);
% % hold on
% % R(1) = 0;
% % for k = 1:length(R)-1
% %     if u1(k) < 0.3
% %         R(k+1) = R(k) + h*(a*u1(k) + b*R(k));
% %     else
% %         R(k+1) = (1+c)*R(k);
% %     end
% % end
% % plot(0:length(R)-1, R);
% % 
% % efeito reduzido
% % figure(2)
% % u2 = p2(10, dias, 10);
% % hold on
% % R(1) = 0;
% % for k = 1:length(R)-1
% %     if u2(k) < 0.3
% %         R(k+1) = R(k) + h*(a*u2(k) + b*R(k));
% %     else
% %         R(k+1) = (1+c)*R(k);
% %     end
% % end
% % plot(0:length(R)-1, R);


