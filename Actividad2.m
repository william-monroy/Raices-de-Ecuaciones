% Ejercicio 1

function Secante(fun,x0,x1,tolerancia)
    % Metodo de la secante
    clear;
    clc;

    %syms x

    fun = inline(fun)
    
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

end

% Ejercicio 2

grado = input('Ingresa el grado del Polinomio: ')
vector = []

for i=grado:-1:0
    sprintf('Ingrese el coeficiente de x^%d',i)
    coeficiente = input()
    vector = vector + [coeficiente]
end

raices = roots(vector)

disp('Raices del polinomio:', raices)


% Ejercicio 3

%  a)Usando el método de la secante encuentre una raíz de la ecuación xlog10x= 1.2

Secante("x*log10(x)=1.2",,,) % ----> Secante('funcion',x0=inicio,x1=fin,tolerancia)

%  b)Use el método de la secantepara obtener la raíz de x–cos(x)= 0

Secante("x-cos(x)=0",,,) % ----> Secante('funcion',x0=inicio,x1=fin,tolerancia)

%  c)Encuentre las raíces del polinomio p(x) = x3–4x2+ x + 6.

Secante("x.^3-4*x.^2+x+6",,,) % ----> Secante('funcion',x0=inicio,x1=fin,tolerancia)

% d)El producto de 3 enteros, espaciados 5 unidades,es 10098. Utilizando la función que resuelve polinomios, encuentre los 3 enteros.

1*x.^2 + 5*x.^1 + 10*x.^0 = 10098 % ------> Este no estoy para nada seguro pero nomas faltaria lo de resolverlo


