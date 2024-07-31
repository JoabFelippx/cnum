v = 1 
println(v)

f(x) = x^2 + x + 1

z = f(2)
println(z)

function fx(x, a, b, c)
  y(n) = a*n^2 + b*n + c
  return y(x)
end

z = fx(1, 2, 3, 4)

println(z)


function zeros(a, b, c)
  if a != 0
    x1 = (-b + sqrt(complex(b^2 - 4*a*c))) / (2*a)
    x2 = (-b - sqrt(complex(b^2 - 4*a*c))) / (2*a)
    
    return [x1 x2]
  else

    if b != 0
      return -c/b
    else
      return "Error"
    end
  end
end

zero_func = zeros(1, 2, 3)

println(zero_func)

return

