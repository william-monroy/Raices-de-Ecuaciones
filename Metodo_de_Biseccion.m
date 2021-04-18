% Metodo de Biseccion

%Pedir datos iniciales al usuario
f = input('Ingresa la funcion: ', 's')

a = input('Ingresa el valor de a: ')
b = input('Ingresa el valor de b: ')
tolerancia = input('Ingresa el valor de la tolerancia: ')

fprintf('\nMetodo de Biseccion\n\n');

disp(f)
x = a;
fa = eval(f);
x = b;
fb = eval(f); 

if (fa*fb) > 0
    fprintf('\n\nno existe raiz en el intervalo\n');
else
    iteraciones = 0;
    while iteraciones < 100
        x = a;
        fa = eval(f)
        x = b;
        fb = eval(f)
        puntoMedio = (a+b)/2;
        x = puntoMedio;
        fPuntoMedio = eval(f);
        errorAct = abs(fPuntoMedio);

        if errorAct < tolerancia
            fprintf('\n\nla raiz es: %d')
            disp(puntoMedio)
            break
        end

        if (fa*fPuntoMedio)<0 %Solucion izquierda
            b = puntoMedio;
        elseif (fa*fPuntoMedio)==0
            fprintf('\n\nLa raiz encontrada es', puntoMedio);
            fprintf('\nen %d iteraciones \n')
            break
        else
            a = puntoMedio;
        end

        iteraciones = iteraciones + 1;
    end
end