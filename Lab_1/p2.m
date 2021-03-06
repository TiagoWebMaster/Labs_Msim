%Função p2
%   Variáveis de entrada:
%       -dosagem: dose (em mg) administrada        
%       -dias: Período de tempo a observar (em dias)
%       -dias_entre_dosagem: Período de tempo entre cada toma do fármaco (em dias)
%       -flag: Toma o valor 1 caso seja necessário representar graficamente
%       -d: variável como definida no enunciado (para p5 passar como argumento um array não nulo)
%       os vários valores de u e 0 se fôr apenas preciso calcular o valor
%       de u
%    Variável de saída:
%       Array de floats correspondente ao parâmetro u como definido no
%       enunciado


function [u] = p2(dosagem,dias,dias_entre_dosagem,flag,d)
            
    c2 = zeros(1,dias);
    [~,c2] = p1_vers2(0,0,dosagem,dias,dias_entre_dosagem,d);

    u = zeros(1,dias);
    if (flag ==1)
       for x=1:10:100
            [~,c2] = p1_vers2(0,0,x,dias,dias_entre_dosagem,d);
            for i= 1:length(u)
                u(i) = c2(i)/(7.1903+c2(i));
            end
            xlabel('Time (Days)')
            ylabel('U(Days)') 
            %plot(1:1:dias,u);
            hold on
       end
    else
        for i= 1:length(u)
            u(i) = c2(i)/(7.1903+c2(i));
        end
    end
   
     
    %plot(1:1:Num_dias,u(:));
end
   