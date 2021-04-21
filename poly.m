coef1 = input('Coeficiente x^2: ');
coef2 = input('Coeficiente x: ');
coef3 = input('Coeficiente de c: ');

polinomio = [coef1, coef2, coef3];

raices = roots(polinomio)

deriv = polyder(polinomio)

pol = poly(raices)
