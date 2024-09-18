# Aluno 1: Állefe Amorim
# Aluno 2: Gustavo Assis
# Aluno 3: Joab Felippe



using LinearAlgebra

#método de newton para sistemas não lineares
function fixedpoint(a, g, error=1e-8)
        x = g(a)
        while norm(x-a) > error
            a = x
            x = g(a)
        end
        return x
    end

# bissecção
function bisection(a, b, f, tol)
        if f(a) * f(b) > 0
            # Caso não haja mudança de sinal no intervalo
            error("f(a) and f(b) must have opposite signs")
        end
        while b - a > tol
            c = (a + b) / 2
            if f(c) == 0
                return c
            elseif f(a) * f(c) < 0
                b = c
            else
                a = c
            end
        end
        return (a + b) / 2
    end
    
# gauss-seidel
function gaussSeidel(A, B, k, error)
        n = size(B,1)
        X = zeros(n)
        K = zeros(n)
        for l = 1:k
        for i = 1:n
            count = [0.0 0.0]
            for j = 1:i-1
            count[1] += A[i,j]*K[j]
            end
            for j = i+1:n
            count[2] += A[i,j]*X[j]
            end
            K[i] = (B[i]-count[1]-count[2])/A[i,i]
        end
        if norm(X-K) < error
            break
        end
        X = copy(K)
        end
        return X
end 


# 1 - Para economizar energia elétrica, um agricultor implantou um sistema de painel solar na fazenda para alimentar uma bomba d'água, que faz a irrigação das plantações. A placa negra utilizada fica exposta ao sol e ao vento. Dessa forma, para gerar eletricidade, a irradiação solar E (em Wm-2) sobre a placa tem que ser maior que a perda de calor por radiação e por condução, dado a temperatura atmosférica K (em Kelvin). Sabendo que para determinar a temperatura da placa para alcançar esse desequilíbrio é dado pela equação:

# E = 5,67.10-8 T4 + 0,4(T - K)

# Determine a temperatura mínima da placa, dada a medição da irradiação e da temperatura do ar, sabendo que o valor médio diário é E=500,125 e K=272,975.
# Sugestão: usar métodos da bissecção ou ponto fixo.
# Resposta aproximada: T = 304,56801011987010952


E = 500.125
K = 272.975

f(x) = 5.67e-8*x^4 + 0.4*(x - K) - E

a, b = -0.1, 500
tol = 1e-10

resposta = bisection(a, b, f, tol)
println("Questão 1")
println("Resposta aproximada utilizando o método da bissecção: T = ", resposta, "\n")


# 2 - Calcule o comprimento do cabo (C) entre duas torres de transmissão (cabo catenária). A distância entre as torres é de d = 500m. A flecha máxima permitida é fmax = 50m. Flecha é a distância vertical entre uma reta que liga os dois pontos de fixação. A flecha (f) depende do comprimento do vão (d) e da tração (C) aplicada ao cabo. O seu modelo matemático pode ser:

# f = C[cosh(d/2C)-1]
# Sugestão: usar métodos da bissecção ou ponto fixo.
# Resposta aproximada: C = 633,1621m

d = 500
fmax = 50

g(x) = x*(cosh(d/(2*x))-1) - fmax

a, b = 0.1, 1000
tol = 1e-10

resposta = bisection(a, b, g, tol)
println("Questão 2")
println("Resposta aproximada utilizando o método da bissecção: C = ", resposta, "\n")


# 3 - Um retificador de meia onda a diodo alimenta uma carga indutiva resistiva (f = 1 kHz, L = 100 mH e R = 1 kΩ). Encontre o ângulo para o qual a corrente Id no diodo se anula. Considere o seguinte modelo matemático:

# Id = sen(b - a) + sen(a).e[-b/tan(a)]
# tan(a) = 2π.f.L / R
# Sugestão: usar métodos da bissecção ou ponto fixo.
# Resposta aproximada: b = 212,2284º

freq = 1e3
L = 100e-3
R = 1e3
tan = 2*pi*freq*L/R     
a_v = atan(tan)

f(x) = sin(x - a_v) + sin(a_v)*exp(-x/tan)
deg2rad(degrees) = degrees * π / 180
rad2deg(radians) = radians * 180 / π

a_degtorad = deg2rad(114) # 2 radianos
b_degtorad = deg2rad(286) # 5 radianos

tol = 1e-10
resposta = bisection(a_degtorad, b_degtorad, f, tol)

println("Questão 3")
println("Resposta aproximada utilizando o método da bissecção: b = ", rad2deg(resposta), "°", "\n")

# 4 - Em um grande hospital, para se evitar intermitência no sistema elétrico dos diversos equipamentos médicos, instalou-se três reatores de alta performance em série, com tensão nominal R em função da potência máxima P de operação dos enrolamentos de controle:

# 17.R1 - 2.R2 - 3.R3 = P1 = 500
# -5.R1 + 21.R2 - 2.R3 = P2 = 200
# -5.R1 - 5.R2 + 22.R3 = P3 = 30
# Obtenha as tensões nominais de cada reator.
# Sugestão: usar o método de Gauss-Seidel.
# Resposta aproximada: R1=33,996314 R2=18,892827 R3=13,383896

A = [17 -2 -3; -5 21 -2; -5 -5 22]
B = [500; 200; 30]

k = 100
error_vl = 1e-10
resposta = gaussSeidel(A, B, k, error_vl)
println("Questão 4")
println("Resposta aproximada utilizando o método de Gauss-Seidel: R1 = ", resposta[1], " R2 = ", resposta[2], " R3 = ", resposta[3], "\n")

# 5 - Determine o valor da corrente no resistor R3, sabendo que V1 = V2 = 100 V e R1 = R2 = R3 = 10 Ω.
# Sugestão: usar o método de Gauss-Seidel.
# Resposta aproximada: IR3 = 6,6667A

# 20x1 + 10x2 = 100
# 10x1 + 20x2 = 100

R1 = R2 = R3 = 10
V1 = V2 = 100

A = [20 10; 
     10 20]
B = [100; 100]

k = 100
error_vl = 1e-10

I1, I2 = gaussSeidel(A, B, k, error_vl)

IR3 = (V1 - I1*R1)/R3
println("Questão 5")
println("Resposta aproximada utilizando o método de Gauss-Seidel: IR3 = ", IR3, "\n")

# 6 - Calcule as tensões para os nós, tendo por referência o nó 6. O circuito pode ser equacionado da seguinte maneira:
# {0; 6; 0; 2; -3} = [6 -3 -3 0 0; -3 6 0 -3 0; -3 0 6 -1 -2; 0 -3 -1 5 0; 0 0 -2 3] {V1; V2; V3; V4; V5}

A = [
        6 -3 -3 0 0; 
        -3 6 0 -3 0; 
        -3 0 6 -1 -2; 
        0 -3 -1 5 0; 
        0 0 -2 0 3]
B = [0; 6; 0; 2; -3]

k = 100
error_vl = 1e-10
resposta = gaussSeidel(A, B, k, error_vl)
println("Questão 6")
println("Resposta aproximada utilizando o método de Gauss-Seidel: V1 = ", resposta[1], " V2 = ", resposta[2], " V3 = ", resposta[3], " V4 = ", resposta[4], " V5 = ", resposta[5], "\n")



# 7 - Num sistema de energia solar, um vetor de equilíbrio energético E, na placa absorvente e na placa de vidro, segue o seguinte sistema de equações não lineares nas temperaturas (K/m²) absolutas da placa absorvente (T1) e da placa de vidro (T2):
# (T41+ 0,06823.T1)−(T42+ 0,05848.T2) = E1
# (T41+ 0,05848.T1)−(2.T42+ 0,11696.T2) = E2
# Calcule o valor aproximado das temperaturas de equilíbrio, sabendo que os valores de equilíbrio energético foram medidos experimentalmente em E1=0,01753 E2=0,00254.
# Sugestão: usar o método de Newton-Raphson.
# Resposta aproximada: T1=0,30543 T2=0,185261


h(x) = x - inv(jacobian(x))*F(x)

F(x) = [x[1]^4 + 0.06823*x[1] - x[2]^4 - 0.05848*x[2] - 0.01753;
        x[1]^4 + 0.05848*x[1] - 2*x[2]^4 - 0.11696*x[2] - 0.00254]

jacobian(x) = [4*x[1]^3 + 0.06823 -4*x[2]^3 - 0.05848;
               4*x[1]^3 + 0.05848 -8*x[2]^3 - 0.11696]

x = [0.5, 0.5]
resposta = fixedpoint(x, h)
println("Questão 7")
println("Resposta aproximada utilizando o método de Newton-Raphson: T1 = ", resposta[1], " T2 = ", resposta[2], "\n")
