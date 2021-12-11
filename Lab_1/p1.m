%Constantes e Vetor d como definido no enunciado%
d = upsample(zeros(1,60)+3,6); 
h=1;
K12 = 0.3 * 3600;
K21 = 0.2455 * 3600;
K10 = 0.0643 * 3600;
V1 = 3110;
V2 = 3110;
delta = 1000;
c1 = zeros(1,359);
c2 = zeros(1,359);
%condições iniciais%
c1(1) = 1;
c2(1) = 2;

d = d*(1/V1)*delta;
for k = 1:length(c1)
    c1(k+1) = c1(k * h)+ h*(((1/V1)*(-K12-K10))*c1(k) + (1/V1)*K21*c2(k) + d(k));
    c2(k+1) = c2(k * h)+ h*(((1/V2)*(K12))*c1(k) + (-1/V2)*K21*c2(k));
end
gg = plot(1:1:360,c1,1:1:360,c2,1:1:360,d);
figure(1)

set(gg,'LineWidth',1.5)
%set(c2,'LineWidth',1.5,'Color','red')


