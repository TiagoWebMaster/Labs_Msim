close all
dosagem = 3;
dias = 5
%Dados do enunciado
a = 0.09;
Kt = 10;
b = 1;
h = 1;

d = zeros(5,100);
d(:,1) = 0;

temp = horzcat(d(1,1),upsample(zeros(1,5)+dosagem,12),upsample(zeros(1,15)+dosagem,5));
d(1,:) = temp(1:100);
temp = horzcat(d(2,1) ,upsample(zeros(1,4)+dosagem,5),upsample(zeros(1,15)+dosagem,12));
d(2,:) = temp(1:100);
temp = horzcat(d(3,1) ,upsample(zeros(1,30)+dosagem,5));
d(3,:) = temp(1:100);
temp = horzcat(d(4,1) ,upsample(zeros(1,30)+dosagem,12));
d(4,:) = temp(1:100);


days = 100;

u = zeros(2,days);

for i = 1:5
    u = p2(dosagem, days, 0, 1, d(i,:));
    figure(i)
    Vol = zeros(1, days);
    Vol(1) = 1;
    for k = 1:length(Vol)-1
        Vol(k+1) = Vol(k) + h*(a*Vol(k)*(1-Vol(k)/Kt) - b*u(k)*Vol(k));
    end
    hold on
    yyaxis left
    xlabel('Time (days)')
    ylabel('Volume (mm^3)')
    plot(0:length(Vol)-1, Vol)
    
    yyaxis right
    ylabel('Doses')
    ylim([0 4])
    plot(0:length(Vol)-1, d(i,:))
    legend('Volume tumor','Dose de fármaco','Location','NorthEast')
    hold off
    figure(i+100)
    plot(0:1:99, u);
    xlabel('Time (days)')
    ylabel('Effect (%)') 
end