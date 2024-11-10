using .MathConstants:e

function im(f, a, b)
  h = b - a
  return h*(f((a+b)/2))
end

function it(f, a, b)
  h = b - a
  return h*(((1/2)*f(a))+((1/2)*f(b)))
end

function in_sip(f, a, b)
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

function erro_absoluto(aprox, analitico)
        return abs(aprox - analitico)
      end
      
function print_results(p_medio, trap, simp, analitico, erro_pm, erro_trap, erro_simp)
    println("Ponto médio: $p_medio\t\t | \t\tErro ponto médio: $erro_pm")
    println("--------------------------------------------------------------------------------------------------------------------------")
    println("Trapézio: $trap\t\t | \t\tErro trapézio: $erro_trap")
    println("--------------------------------------------------------------------------------------------------------------------------")
    println("Simpson: $simp\t\t | \t\tErro Simpson: $erro_simp")
    println("--------------------------------------------------------------------------------------------------------------------------")
    println("Analítico: $analitico")
end

# Usar os métodos simples do ponto médio, trapézio e Simpson, também, o valor analítico destas integrais e o erro nas aproximações dadas pelas quadraturas numéricas.
a_func(x) = e^(-x)
b_func(x) = x^2
c_func(x) = x^3
d_func(x) = x*e^(-x^2)
e_func(x) = 1 /(x^2 + 1)

p_medio = iw(a_func, im, 0, 1, 0.5)
trap = iw(a_func, it, 0, 1, 0.5)
simp = iw(a_func, in_sip, 0, 1, 0.5)
analitico = 1 - e^(-1)
erro_pm = erro_absoluto(p_medio, analitico)
erro_trap = erro_absoluto(trap, analitico)
erro_simp = erro_absoluto(simp, analitico)

println("a) f(x) = e^(-x) 0 <= x <= 1")
print_results(p_medio, trap, simp, analitico, erro_pm, erro_trap, erro_simp)

p_medio = iw(b_func, im, 0, 1, 0.5)
trap = iw(b_func, it, 0, 1, 0.5)
simp = iw(b_func, in_sip, 0, 1, 0.5)
analitico = 1/3
erro_pm = erro_absoluto(p_medio, analitico)
erro_trap = erro_absoluto(trap, analitico)
erro_simp = erro_absoluto(simp, analitico)

println("\nb) f(x) = x^2 0 <= x <= 1")
print_results(p_medio, trap, simp, analitico, erro_pm, erro_trap, erro_simp)
p_medio = iw(c_func, im, 0, 1, 0.5)
trap = iw(c_func, it, 0, 1, 0.5)
simp = iw(c_func, in_sip, 0, 1, 0.5)
analitico = 1/4
erro_pm = erro_absoluto(p_medio, analitico)
erro_trap = erro_absoluto(trap, analitico)
erro_simp = erro_absoluto(simp, analitico)

println("\nc) f(x) = x^3 0 <= x <= 1")
print_results(p_medio, trap, simp, analitico, erro_pm, erro_trap, erro_simp)

p_medio = iw(d_func, im, 0, 1, 0.5)
trap = iw(d_func, it, 0, 1, 0.5)
simp = iw(d_func, in_sip, 0, 1, 0.5)
analitico = 1 - e^(-1)
erro_pm = erro_absoluto(p_medio, analitico)
erro_trap = erro_absoluto(trap, analitico)
erro_simp = erro_absoluto(simp, analitico)

println("\nd) f(x) = x*e^(-x^2) 0 <= x <= 1")
print_results(p_medio, trap, simp, analitico, erro_pm, erro_trap, erro_simp)

p_medio = iw(e_func, im, 0, 1, 0.5)
trap = iw(e_func, it, 0, 1, 0.5)
simp = iw(e_func, in_sip, 0, 1, 0.5)
analitico = atan(1) - atan(0)
erro_pm = erro_absoluto(p_medio, analitico)
erro_trap = erro_absoluto(trap, analitico)
erro_simp = erro_absoluto(simp, analitico)

println("\ne) f(x) = 1 /(x^2 + 1) 0 <= x <= 1")
print_results(p_medio, trap, simp, analitico, erro_pm, erro_trap, erro_simp)

# Exercício 9.2.3
# f(x) = e^(4-x^2) 2 <= x <= 5
# Usando os métodos compostos do ponto médio, trapézio e Simpson. Obtenha os resultados utilizando, em cada quadratura, o número de pontos indicado.

# Funções de integração composta para os métodos: ponto médio, trapézio e Simpson

function ponto_medio_composto(f, a, b, n)
        h = (b - a) / n
        s = 0
        for i = 1:n
        s += f(a + (i - 1/2)*h)
        end
        return h*s
end
function trapezio(f, a, b, n)
        h = (b - a) / n
        soma = (f(a) + f(b)) / 2
        for i in 1:(n-1)
            xi = a + i * h
            soma += f(xi)
        end
        return h * soma
end
    
function simpson(f, a, b, n)
        if n % 2 != 0
                println("Para o método de Simpson, n deve ser par.")
                return NaN
        end
        h = (b - a) / n
        soma = f(a) + f(b)
        for i in 1:2:(n-1)
                xi = a + i * h
                soma += 4 * f(xi)
        end
        for i in 2:2:(n-2)
                xi = a + i * h
                soma += 2 * f(xi)
        end
        return (h / 3) * soma
end

ns = [3, 5, 7, 9]

func_3(x) = exp(4 - x^2)

println("\nExercício 9.2.3: ")
println("f(x) = e^(4-x^2) 2 <= x <= 5")

for n in ns
        ponto_medio_cp = ponto_medio_composto(func_3, 2, 5, n)
        trap_cp = trapezio(func_3, 2, 5, n)
        simp_cp = simpson(func_3, 2, 5, n + (n % 2)) # n deve ser par para o método de Simpson
        println("$n:\t Ponto Médio: $ponto_medio_cp\t Trapézio: $trap_cp\t Simpson: $simp_cp")
        println("--------------------------------------------------------------------------------------------------------------------------")

end
