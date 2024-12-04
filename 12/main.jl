# Trabalho 2
# Aluno 1: Joab Felippe de Souza Lima
# Aluno 2: Állefe Amorim

using LinearAlgebra

# Primeira questão
# Usando o método da interpolação polinomial

matrixSystem_1(x) = [
    1 x[1] x[1]^2 x[1]^3;
    1 x[2] x[2]^2 x[2]^3;
    1 x[3] x[3]^2 x[3]^3;
    1 x[4] x[4]^2 x[4]^3
] # Matrix of the system

solveSystem(x, y) = matrixSystem_1(x) \ y # Solve the system

# Datas given by the problem 
temperatues = [4.9; 3.3; 3.0; 2.0]
length = [1.5; 2.0; 2.2; 3.0]
new_length = [1.75; 2.5; 2.75; 3.2]

coefficients = solveSystem(length, temperatues) # Coefficients of the polynomial

func1_polynomial(x) = coefficients[1] + coefficients[2]*x + coefficients[3]*x^2 + coefficients[4]*x^3 # Polynomial function

# Calculate the new temperatures
new_temperatures = [func1_polynomial(x) for x in new_length]

println("Question 1 results: ")
println("New temperatures: ") 

for i in new_temperatures
    print(round(i, digits=2), " ")
end

# Segunda questão
# Usando o método da interpolação polinomial

matrixSystem_2(x) = [
    1 x[1] x[1]^2 x[1]^3;
    1 x[2] x[2]^2 x[2]^3;
    1 x[3] x[3]^2 x[3]^3;
    1 x[4] x[4]^2 x[4]^3;
] # Matrix of the system

time = [0.2; 0.5; 0.7; 1]
currente = [0.8187; 1.5815; 1.9354; 2.2905]
new_time = [0.3; 0.9]

solveSystem(x, y) = matrixSystem_2(x) \ y # Solve the system

coefficients = solveSystem(time, currente) # Coefficients of the polynomial

func2_polynomial(x) = coefficients[1] + coefficients[2]*x + coefficients[3]*x^2 + coefficients[4]*x^3 # Polynomial function

new_currente = [func2_polynomial(x) for x in new_time]

println("\n\nQuestion 2 results: ")
println("New currente: ")
for i in new_currente
    print(round(i, digits=6), " ")
end

# Terceira questão
# Usando o método de quadrados mínimos

# curve adjustment

function curve_adjustment(b, x, y)
    V_transpose = transpose(b(x))
    a = inv(V_transpose*b(x))*(V_transpose*y)
    return a
end

# Data given by the problem
temp_autumn = [38; 40; 42; 44; 46]
cent_autumn = [1.0; 1.25; 1.5; 1.75; 2.0]

temp_winter = [40; 44; 48; 52; 56]
cent_winter = [1; 1.5; 2; 2.5; 3]

temp_spring = [36; 39; 42; 45; 48]
cent_spring = [1; 1.15; 1.3; 1.45; 1.6]

matrixSystem_3(x) = [
    1 x[1];
    1 x[2];
    1 x[3];
    1 x[4];
    1 x[5];
] # Matrix of the system

# Function to adjust
answer_autumn = curve_adjustment(matrixSystem_3, cent_autumn, temp_autumn)
answer_winter = curve_adjustment(matrixSystem_3, cent_winter, temp_winter)
answer_spring = curve_adjustment(matrixSystem_3, cent_spring, temp_spring)

println("\n\nQuestion 3 results: ")
println("Autumn: f(x) = ", round(answer_autumn[2], digits=2), "x + ", round(answer_autumn[1], digits=2))
println("Winter: f(x) = ", round(answer_winter[2], digits=2), "x + ", round(answer_winter[1], digits=2))
println("Spring: f(x) = ", round(answer_spring[2], digits=2), "x + ", round(answer_spring[1], digits=2))

# Quarta questão
# Usando o método de quadrados mínimos

# data given by the problem
voltage = [5.1; 10.3; 15.2; 20.1; 24.7; 30.5]
current = [0.5; 1.1; 1.5; 2.2; 2.5; 3.1]

matrixSystem_4(x) = [
    1 x[1];
    1 x[2];
    1 x[3];
    1 x[4];
    1 x[5];
    1 x[6];
] # Matrix of the system

# Function to adjust
answer_question4 = curve_adjustment(matrixSystem_4, current, voltage)

println("\n\nQuestion 4 results: ")
println("f(x) = ", round(answer_question4[2], digits=7), "x + ", round(answer_question4[1], digits=8))

# Quinta questão
# Usando o método da difença finita progressiva

diff_progressive(f, x, h) = (f(x + h) - f(x))/h
diff_regresive(f, x, h) = (f(x) - f(x - h))/h
diff_central(f, x, h) = (f(x + h) - f(x - h))/(2*h)

matrixSystem_5(x) = [
    1 x[1];
    1 x[2];
    1 x[3];
    1 x[4];
    1 x[5];
] # Matrix of the system


# Data given by the problem
time = [0.0; 0.1; 0.2; 0.3; 0.4]
current = [0.00; 0.82; 1.36; 1.60; 1.73]

# Function to adjust
coefficients_current = curve_adjustment(matrixSystem_5, time, current)

funCurrent(x) = coefficients_current[2]*x + coefficients_current[1]

# Calculate the voltage
R = 5
L = 0.1
h = 0.001
voltage = L*diff_progressive(funCurrent, 0.5, h) + R*funCurrent(0.5)

println("\n\nQuestion 5 results: ")
println("Voltage: ", round(voltage, digits=5))

# Sexta questão
# 6 - Refaça a tarefa anterior, sabendo que a corrente está crescendo em função quadrática do tempo.

matrixSystem_6(x) = [
    1 x[1] x[1]^2;
    1 x[2] x[2]^2;
    1 x[3] x[3]^2;
    1 x[4] x[4]^2;
    1 x[5] x[5]^2;
] # Matrix of the system

# Function to adjust
coefficients_current = curve_adjustment(matrixSystem_6, time, current)

funCurrent(x) = coefficients_current[3]*x^2 + coefficients_current[2]*x + coefficients_current[1]

# Calculate the voltage
voltage = L*diff_regresive(funCurrent, 0.5, h) + R*funCurrent(0.5)

println("\n\nQuestion 6 results: ")
println("Voltage: ", round(voltage, digits=5))

# Sétima questão
# 7 - Refaça a tarefa anterior, sabendo que a corrente está crescendo em função cúbica do tempo.

matrixSystem_7(x) = [
    1 x[1] x[1]^2 x[1]^3;
    1 x[2] x[2]^2 x[2]^3;
    1 x[3] x[3]^2 x[3]^3;
    1 x[4] x[4]^2 x[4]^3;
    1 x[5] x[5]^2 x[5]^3;
] # Matrix of the system

# Function to adjust
coefficients_current = curve_adjustment(matrixSystem_7, time, current)

funCurrent(x) = coefficients_current[4]*x^3 + coefficients_current[3]*x^2 + coefficients_current[2]*x + coefficients_current[1]

voltage = L*diff_central(funCurrent, 0.5, h) + R*funCurrent(0.5)

println("\n\nQuestion 7 results: ")
println("Voltage: ", round(voltage, digits=5))


function ponto_medio(f, a, b)
    h = b - a
    return h*(f((a+b)/2))
end

function trapezio(f, a, b)
    h = b - a
    return h*(((1/2)*f(a))+((1/2)*f(b)))
end

function simpson(f, a, b)
    h = (b - a) / 2
    return h*(((1/3)*f(a))+((4/3)*f((a+b)/2))+((1/3)*f(b)))
end

function iw(f, i, a, b, t)
    s = 0
    c = a
    d = a + t
    while d <= b
        s += i(f, c, d)
        c = d
        d += t
    end
    return s
end

# Oitava questão
# Usar o método das regras de ponto médio.
h_1 = 1e-5
P(r) = 3(1-(r/4))^(1/7)
# Q(r) 2pi integral de 0 a r de P(r)dr

Q(r) = 2*pi*iw(P, ponto_medio, 0, r, h_1)



println("\n\nQuestion 8 results: ")
println("Q(1.25): ",  round(Q(1.25), digits=6))
println("Q(2.55): ",  round(Q(2.55), digits=6))
println("Q(3.15): ",  round(Q(3.15), digits=6))
println("Q(3.95): ",  round(Q(3.95), digits=6))

# Nona questão
# Usar o método das regras de trapézio.

Q(r) = 2*pi*iw(P, trapezio, 0, r, h_1)

println("\n\nQuestion 9 results: ")
println("Q(1.25): ",  round(Q(1.25), digits=6))
println("Q(2.55): ",  round(Q(2.55), digits=6))
println("Q(3.15): ",  round(Q(3.15), digits=6))
println("Q(3.95): ",  round(Q(3.95), digits=6))

# Décima questão
# Usar o método das regras de Simpson.

Q(r) = 2*pi*iw(P, simpson, 0, r, h_1)

println("\n\nQuestion 10 results: ")
println("Q(1.25): ",  round(Q(1.25), digits=6))
println("Q(2.55): ",  round(Q(2.55), digits=6))
println("Q(3.15): ",  round(Q(3.15), digits=6))
println("Q(3.95): ",  round(Q(3.95), digits=6))
