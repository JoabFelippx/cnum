# exponential function with taylor series
function exponential(x)
    sum = 0
    for i in 0:21
        sum += x^i / factorial(big(i))
    end
    return sum
end


exp = exponential(1)
println(exp)
