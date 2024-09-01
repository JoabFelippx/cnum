#metodo ponto fixo
function fixedPointMethod(f, x0, tol, maxIter)
    x = x0
    for i = 1:maxIter # 1:maxIter = 1, 2, 3, ..., maxIter
        x = f(x)
        if abs(x - f(x)) < tol # abs = valor absoluto
            return x
        end
    end
    return x
    
end

#metodo de newton-raphson
# formula: x_n+1 = x_n - f(x_n)/f'(x_n)

function newtonRaphsonMethod(f, df, x0, tol, maxIter)
    x = x0
    if abs(f(x)) <= tol # caso o primeiro chute seja a raiz da funcao
        return x
    end
    for i = 1:maxIter
        x = x - f(x)/df(x) 
        if abs(f(x)) <= tol
            return x
        end
    end
    return x
end

#metodo da secante
# formula: x_n+1 = x_n - f(x_n)*(x_n - x_n-1)/(f(x_n) - f(x_n-1))

function secantMethod(f, x0, x1, tol, maxIter)
    if abs(f(x0)) <= tol
        return x0
    end
    for i = 1:maxIter
        x = x1 - f(x1)*(x1 - x0)/(f(x1) - f(x0))
        if abs(f(x)) <= tol
            return x
        end
        x0 = x1
        x1 = x
    end
    return x
end

maxIter = 1000 # definir um valor maximo de iteracoes

#exercicio 3.3.1

println("Exercicio 3.3.1")
g(x) = exp(x) - 2 # g(x) = x
x0 = -1.8 # chute inicial
tol = 10^(-8) # definir uma tolerancia

x = fixedPointMethod(g, x0, tol, maxIter)
println("x = ", x,'\n') # resposta esperada: x = -1.8414057

#exercicio 3.4.1
println("Exercicio 3.4.1")
f_newtonRaphson(x) = cos(x) - x^2
df_newtonRaphson(x) = -sin(x) - 2x
x0 = 1
tol = 10^(-5)

x = newtonRaphsonMethod(f_newtonRaphson, df_newtonRaphson, x0, tol, maxIter, )
println("x = ", x, '\n') # resposta esperada: x = 0.82413

#exercicio 3.6.3

println("Exercicio 3.6.3")
f_secante(x_fsec) = exp(-x_fsec^2) - 2(x_fsec)
x0 = 0.5
x1 = 1
tol = 10^(-5)

sect = secantMethod(f_secante, x0, x1, tol, maxIter)
println("x = ", sect, '\n') 

# exercicio 3.2.8 usando newton-raphson e secante
println("3.2.8 - exercício")
#3.2.8
I_r = 10^-12
V_t = ((1.38*10^-23)*(300))/(1.60*10^-19)
tol = 1e-3
maxIter = 1000

#3.2.8 - a)
R = 1e3
V = 30
f_newtonRaphson_2(x_2) = R*(I_r*(exp(x_2/V_t) - 1)) + x_2 - V
df_newtonRaphson_2(x_2) = R*(I_r/V_t)*exp(x_2/V_t) + 1
println("a)")

x0 = 0.6
x1 = 0.7

x_newtonMth = newtonRaphsonMethod(f_newtonRaphson_2, df_newtonRaphson_2, x0, tol, maxIter)
x_secantMth = secantMethod(f_newtonRaphson_2, x0, x1, tol, maxIter)
println("Newton-Raphson: x = ", x_newtonMth)
println("Secante: x = ", x_secantMth, '\n') 

#3.2.8 - b)
R = 1e3
V = 3

x0 = 0.5
x1 = 0.6

println("b)")
x_newtonMth = newtonRaphsonMethod(f_newtonRaphson_2, df_newtonRaphson_2, x0, tol, maxIter)
x_secantMth = secantMethod(f_newtonRaphson_2, x0, x1, tol, maxIter)
println("Newton-Raphson: x = ", x_newtonMth)
println("Secante: x = ", x_secantMth, '\n') 

#3.2.8 - c)
R = 1e4
V = 3

x0 = 0.45  
x1 = 0.55

x_newtonMth = newtonRaphsonMethod(f_newtonRaphson_2, df_newtonRaphson_2, x0, tol, maxIter)
x_secantMth = secantMethod(f_newtonRaphson_2, x0, x1, tol, maxIter)

println("c)")
println("Newton-Raphson: x = ", x_newtonMth)
println("Secante: x = ", x_secantMth, '\n')

#3.2.8 - d)
R = 1e3
V = 300e-3

x0 = 0.2
x1 = 0.4

x_newtonMth = newtonRaphsonMethod(f_newtonRaphson_2, df_newtonRaphson_2, x0, tol, maxIter)
x_secantMth = secantMethod(f_newtonRaphson_2, x0, x1, tol, maxIter)

println("d)")
println("Newton-Raphson: x = ", x_newtonMth)
println("Secante: x = ", x_secantMth, '\n')

#3.2.8 - e)
R = 1e3
V = -300e-3

x0 = -0.4
x1 = -0.2

x_newtonMth = newtonRaphsonMethod(f_newtonRaphson_2, df_newtonRaphson_2, x0, tol, maxIter)
x_secantMth = secantMethod(f_newtonRaphson_2, x0, x1, tol, maxIter)

println("e)")
println("Newton-Raphson: x = ", x_newtonMth)
println("Secante: x = ", x_secantMth, '\n')

#3.2.8 - f)
R = 1e3
V = -30

x0 = -30.1
x1 = -30

x_newtonMth = newtonRaphsonMethod(f_newtonRaphson_2, df_newtonRaphson_2, x0, tol, maxIter)
x_secantMth = secantMethod(f_newtonRaphson_2, x0, x1, tol, maxIter)

println("f)")
println("Newton-Raphson: x = ", x_newtonMth)
println("Secante: x = ", x_secantMth, '\n')

#3.2.8 - g)
R = 1e4
V = -30

x0 = -30.1
x1 = -30

x_newtonMth = newtonRaphsonMethod(f_newtonRaphson_2, df_newtonRaphson_2, x0, tol, maxIter)
x_secantMth = secantMethod(f_newtonRaphson_2, x0, x1, tol, maxIter)

println("g)")
println("Newton-Raphson: x = ", x_newtonMth)
println("Secante: x = ", x_secantMth, '\n')
