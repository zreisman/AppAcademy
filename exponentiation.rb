def exp(b, n)
  return 1 if n == 0
  result = 1
  n.times { |i| result *= b }
  result
end

def exp1(b, n)
  if n == 0
    return 1
  end
  b * exp1(b, n - 1)
end

def exp2(b, n)
  if n == 0
    return 1
  elsif n == 1
    return b
  end
  if n.even?
    exp(b, n / 2 ) * exp(b, n / 2)
  else
    b * (exp(b, (n-1) / 2) * exp(b, (n-1) / 2))
  end
end

p exp2(2, 256)
