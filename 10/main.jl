using .MathConstants:e
using Interpolations
using LinearAlgebra

dp(f,x,h) = (f(x+h)-f(x))/h
dr(f,x,h) = (f(x)-f(x-h))/h
dc(f,x,h) = (f(x+h)-f(x-h))/(2*h)

h1 = 10^-2
h2 = 10^-3

dot_x = 2

f_1(x) = sin(x)
f_2(x) = e^(-x)

# Progressiva ordem 1
resposta_h1 = dp(f_1, dot_x, h1)
resposta_h2 = dp(f_1, dot_x, h2)

println("f'(x) onde f(x) = sin(x) e x = 2 para h = 10^-2 e h = 10^-3: ")

println("Progressiva ordem 1: ")
println("h = 10^-2: ", resposta_h1)
println("h = 10^-3: ", resposta_h2)

# Regressiva ordem 1
resposta_h1 = dr(f_1, dot_x, h1)
resposta_h2 = dr(f_1, dot_x, h2)

println("Regressiva ordem 1: ")
println("h = 10^-2: ", resposta_h1)
println("h = 10^-3: ", resposta_h2)

# Central ordem 2
resposta_h1 = dc(f_1, dot_x, h1)
resposta_h2 = dc(f_1, dot_x, h2)

println("Central ordem 2: ")
println("h = 10^-2: ", resposta_h1)
println("h = 10^-3: ", resposta_h2)

# Valor exato
println("Valor exato: cos(2) = ", cos(dot_x))

println("f'(x) onde f(x) = e^-x e x = 1 para h = 10^-2 e h = 10^-3: ")
resposta_h1 = dp(f_2, 1, h1)
resposta_h2 = dp(f_2, 1, h2)

println("Progressiva ordem 1: ")
println("h = 10^-2: ", resposta_h1)
println("h = 10^-3: ", resposta_h2)

resposta_h1 = dr(f_2, 1, h1)
resposta_h2 = dr(f_2, 1, h2)

println("Regressiva ordem 1: ")
println("h = 10^-2: ", resposta_h1)
println("h = 10^-3: ", resposta_h2)

resposta_h1 = dc(f_2, 1, h1)
resposta_h2 = dc(f_2, 1, h2)

println("Central ordem 2: ")
println("h = 10^-2: ", resposta_h1)
println("h = 10^-3: ", resposta_h2)

println("Valor exato: -e^-1 = ", -e^(-1))

# Exercício 8.1.4

println("\nExercício 8.1.4: ")
vi = [0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0]
vo = [0.0, 1.05, 1.83, 2.69, 3.83, 4.56, 5.49, 6.56, 6.11, 7.06, 8.29]

itp = LinearInterpolation(vi, vo, extrapolation_bc = Line())

# Calcule as derivadas para vi = 1 e vi = 4.5
h = 0.5  # Passo entre os pontos

# vi = 1
dp_vi1 = dp(itp, 1.0, h)
dr_vi1 = dr(itp, 1.0, h)
dc_vi1 = dc(itp, 1.0, h)

# vi = 4.5
dp_vi4_5 = dp(itp, 4.5, h)
dr_vi4_5 = dr(itp, 4.5, h)
dc_vi4_5 = dc(itp, 4.5, h)

# Ajuste da função v_o = a1*v_i + a3*v_i^3 usando mínimos quadrados
V = [vi vi.^3]  # Matriz de design para a regressão
b = vo  # Vetor de saída
coeffs = V \ b  # Resolve o sistema para os coeficientes a1 e a3
a1, a3 = coeffs

# Derivada analítica para v_o = a1*v_i + a3*v_i^3
function deriv_analytical(x)
    return a1 + 3 * a3 * x^2
end

# Cálculo das derivadas analíticas nos pontos vi = 1 e vi = 4.5
analytical_vi1 = deriv_analytical(1.0)
analytical_vi4_5 = deriv_analytical(4.5)

# Exibir resultados
println("Resultados para vi = 1:")
println("dp (ponto e próximo) = $dp_vi1")
println("dr (ponto e anterior) = $dr_vi1")
println("dc (central) = $dc_vi1")
println("Analítico = $analytical_vi1")

println("\nResultados para vi = 4.5:")
println("dp (ponto e próximo) = $dp_vi4_5")
println("dr (ponto e anterior) = $dr_vi4_5")
println("dc (central) = $dc_vi4_5")
println("Analítico = $analytical_vi4_5")
