def fibonacci(n)

  return 0 if n == 0
  return 1 if n == 1


  fibonacci(n-1) +fibonacci(n-2)

end

p fibonacci(0)
p fibonacci(1)
p fibonacci(2)
p fibonacci(3)
p fibonacci(4)
p fibonacci(5)
p fibonacci(6)
p fibonacci(7)
p fibonacci(8)
