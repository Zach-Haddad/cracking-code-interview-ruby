# 10.4
# Write a method to implement *, - , / operations. You should use only the + operator.
def my_mult(num1, num2)
  res = 0
  num2.times{ res += num1 }
  res
end

def my_sub(num1, num2) #num1 - num2
  res = 0
  while num2 < num1
    res += 1
    num2 += 1
  end
  res
end

def my_div(num1, num2) #num1/num2
  res = 0
  count = 0

  while count < num1
    res += 1
    count += num2
  end

  if count != num1
    res -= 1 #backtrack
    count -= num2
    rem = my_sub(num1, count)
  end

  "#{res} remainder #{rem}"
end

p my_div(10, 3)
