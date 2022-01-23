clear
close all;
open_system('P3_sim');

warning('off', 'Simulink:Solver:ZeroCrossingNotBracketedDueToSmallSignalValues');

%set_param('P1_sim', 'ZeroCrossAlgorithm','Nonadaptive');

set_param('P3_sim', 'ZeroCrossAlgorithm','Adaptive');
set_param('P3_sim', 'StopTime','25');
set_param('P3_sim/coef_restituicao1','Gain', '-0.95');
set_param('P3_sim/coef_restituicao2','Gain', '-0.6');
set_param('P3_sim/v0_z','Value','0');
set_param('P3_sim/v0_y','Value','2');
set_param('P3_sim/z0','Value','10');
set_param('P3_sim/y0','Value','0');

out=sim('P3_sim', 'SaveTime', 'on', 'SaveState', 'on');    
ti = out.tout;
zi = out.z;
yi = out.y;

% figure(1)
% plot(yi.data,zi.data);
% legend('Trajectória')
% axis([0 25 0 12])
% xlabel('Y [m]')
% ylabel('Z [m]')

figure(1)
hold on
set(gca,'Xlim',[0 25])
curve=animatedline;
for ii=1:length(yi)
    pause(2)
    plot(yi(ii).data,zi(ii).data);
    pause(2)
end
hold off

% figure(2)
% plot(zi.Time,zi.data);
% axis([0 16 0 14])
% pause(0.1)
% 
% figure(3)
% plot(yi.Time,yi.data);
% axis([0 16 0 14])
% pause(0.1)




