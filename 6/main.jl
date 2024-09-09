using LinearAlgebra
using .MathConstants:e

#5.1.2, 5.1.5, 5.1.10, 5.1.12

#método de newton para sistemas não lineares
function fixedpoint(a, g, error=1e-8)
    x = g(a)
    while norm(x-a) > error
        a = x
        x = g(a)
    end
    return x
end

g(x) = x - inv(jacobian(x))*F(x)

#5.1.2
F(x) = [
        2*x[1] - x[2] - cos(x[1]);
        -x[1] + 2*x[2] - x[3] - cos(x[2]);
        -x[2] + x[3] - cos(x[3])
        ]

jacobian(x) = [
                2 + sin(x[1]) -1 0;
                -1 2 + sin(x[2]) -1;
                0 -1 1 + sin(x[3])
                ]

a = [1.0; 1.0; 1.0]
resposta = fixedpoint(a, g)
println("5.1.2: ", resposta)

b = [-0.5; -2; -3]
resposta = fixedpoint(b, g)
println("5.1.2: ", resposta)

c = [-2; -3; -4]
resposta = fixedpoint(c, g)
println("5.1.2: ", resposta)

d = [0; 0; 0]
resposta = fixedpoint(d, g)
println("5.1.2: ", resposta)

#5.1.5
F(x) = [ 
        6*x[1]-2*x[2]+e^(x[3])-2 ;
        sin(x[1])-x[2]+x[3];
        sin(x[1])+2*x[2]+3*x[3]-1 
        ]

jacobian(x) = [ 
                6 -2 e^(x[3]) ;
                -cos(x[1]) -1 1 ;
                -cos(x[1]) 2 3
                ]

x = [0; 0; 0]
resposta = fixedpoint(x, g, 1e-5)
println("5.1.5: ", resposta)

#5.1.10
F(x) = [ 
        (1/8)*((x[1])^2) + (1/5)*((x[2]-1)^2) - 1;
        atan(x[1]) + x[1] - x[2] - x[2]^3
        ]

jacobian(x) = [ 
                x[1]/4 (1/5)*(2*x[2])-2;
                ((x[1]^2)+2)/((x[1]^2)+1) -3*x[2]^2-1 
            ]

a = [-1; -1]
resposta = fixedpoint(a, g)
println("5.1.10: ", resposta)

b = [3; 1]
resposta = fixedpoint(b, g)
println("5.1.10: ", resposta)

#5.1.12
C1(x) = (10+(0.3*x)+((10^-4)*(x^2))+(3.4*(10^-9)*(x^4)))
C2(x) = (50+(0.25*x)+(2*(10^-4)*(x^2))+(4.3*(10^-7)*(x^3)))
C3(x) = (500+(0.19*x)+(5*(10^-4)*(x^2))+(1.1*(10^-7)*(x^4)))
C(x,y,z) = C1(x) + C2(y) + C3(z)
E(x,y,z) = x+y+z-1500
L(x,y,z,k) = C(x,y,z)-(k*E(x,y,z))
Lx(x,k) = (0.3+(2*(10^-4)*x)+(4*3.4*(10^-9)*(x^3)))-k
Ly(y,k) = (0.25+(4*(10^-4)*y)+(3*4.3*(10^-7)*(y^2)))-k
Lz(z,k) = (0.19+(2*5*(10^-4)*z)+(4*1.1*(10^-7)*(z^3)))-k

F(x) = [ (x[1]+x[2]+x[3]-1500) ;
        ((0.3+(2*(10^-4)*x[1])+(4*3.4*(10^-9)*(x[1]^3)))-x[4]) ;
        ((0.25+(4*(10^-4)*x[2])+(3*4.3*(10^-7)*(x[2]^2)))-x[4]) ;
        ((0.19+(2*5*(10^-4)*x[3])+(4*1.1*(10^-7)*(x[3]^3)))-x[4]) ]

jacobian(x) = [ (1) (1) (1) (0) ;
        ((2*(10^-4))+(3*4*3.4*(10^-9)*(x[1]^2))) (0) (0) (-1) ;
        (0) ((4*(10^-4))+(2*3*4.3*(10^-7)*(x[2]))) (0) (-1) ;
        (0) (0) ((2*5*(10^-4))+(3*4*1.1*(10^-7)*(x[3]^2))) (-1) ]

x = [500 ; 500 ; 500 ; 1]
resposta = fixedpoint(x, g)
println(resposta)
