using LinearAlgebra

#Interpolation
P(x) = [
    1 x[1] x[1]^2 x[1]^3;
    1 x[2] x[2]^2 x[2]^3;
    1 x[3] x[3]^2 x[3]^3;
    1 x[4] x[4]^2 x[4]^3
] # Matrix of the system

solve_system(x, y) = P(x) \ y # Solve the system

# Exer - 6.1.1
# (-2, -47), (0, -3), (1, 4), (2, 41) -- (x, y)

a = [-2; 0; 1; 2]
b = [-47; -3; 4; 41]

solution = solve_system(a, b) # Solve the system

println(solution) # Print the result

println("The polynomial is: $(solution[1]) + $(solution[2])x + $(solution[3])x^2 + $(solution[4])x^3")

# Exer - 6.1.2
# (−1,1.25)(0.5,0.5)(1,1.25)(1.25,1.8125) - (x, y)

a = [-1; 0.5; 1; 1.25]
b = [1.25; 0.5; 1.25; 1.8125]

solution = solve_system(a, b) # Solve the system
println(solution) # Print the result

println("The polynomial is: $(solution[1]) + $(solution[2])x + $(solution[3])x^2 + $(solution[4])x^3")
