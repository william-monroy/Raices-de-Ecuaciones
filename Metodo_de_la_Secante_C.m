% Metodo de la secante
clear;
clc;

%syms x

fun = @(x) x.^3 + 8;
x0 = input('Ingresa la primera aproximacion: ');
x1 = input('Ingresa la primera aproximacion: ');
tolerancia = input('Ingresa la tolerancia: ');
errorCalculado = 100;

fprintf('Iteracion      X0           X1          X2      ErrorNuevo\n')

n = 1;
iteraciones = 100;

while ((n < iteraciones) && (errorCalculado > tolerancia))
    % Formula de la secante
    %x2 = x0 - ((x1 - x0)/(subs(fun,x1) - subs(fun,x0))) * subs(fun,x0);
    x2 = x0 - ((x1 - x0)/(fun(x1) - fun(x0))) * fun(x0);
    
    % Calcular error
    errorCalculado = abs(x2 - x1); % abs(subs(fun,x2))
    
    % Desplegar info
    fprintf(' %d        %5.5f       %5.5f       %5.5f       %3.3f\n',n,x0,x1,x2,errorCalculado);
    
    % Actualizar
    x0 = x1;
    x1 = x2;
    
    % Verificar el error
    if errorCalculado <= tolerancia
       fprintf('\nLa raiz encontrada es %5.4f\n',x2);
       fprintf('Numero de iteraciones %d\n',n)
       break
    end
    n = n + 1;
end
