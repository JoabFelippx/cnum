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

println("3.2.1 - exercício")
#3.2.1
f(x) = sqrt(x) - cos(x)
tol = 1e-4
a, b = 0, 1
println(bisection(a, b, f, tol), '\n')

println("3.2.2 - exercício")
#3.2.2
f(x) = 5*sin(x^2) - exp(x/10)
tol = 1e-5
a, b = 0.4, 0.5
println(bisection(a, b, f, tol))

tol = 1e-5
a, b = 1.7, 1.8
println(bisection(a, b, f, tol))

tol = 1e-5
a, b = 2.5, 2.6
println(bisection(a, b, f, tol), '\n')


println("3.2.8 - exercício")
#3.2.8
I_r = 10^-12
V_t = ((1.38*10^-23)*(300))/(1.60*10^-19)
tol = 1e-3
a, b = -80, 10


println("3.2.8 - a)")
#3.2.8 - a)
R = 10^3
V = 30
f(x) = R*(I_r*(exp(x/V_t) - 1)) + x -V

println(bisection(a, b, f, tol), '\n')

println("3.2.8 - b)")
#3.2.8 - b)
R = 10^3
V = 3
println(bisection(a, b, f, tol), '\n')

println("3.2.8 - c)")
#3.2.8 - c)
R = 10^4
V = 3
println(bisection(a, b, f, tol), '\n')

println("3.2.8 - d)")
#3.2.8 - d)
R = 10^3
V = 300*10^-3
println(bisection(a, b, f, tol), '\n')

println("3.2.8 - e)")
#3.2.8 - e)
R = 10^3
V = -300*10^-3
println(bisection(a, b, f, tol), '\n')

println("3.2.8 - f)")
#3.2.8 - f)
R = 10^3
V = -30
println(bisection(a, b, f, tol), '\n')

println("3.2.8 - g)")
#3.2.8 - g)
R = 10^4
V = -30
println(bisection(a, b, f, tol), '\n')
