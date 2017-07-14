# Write a method to generate the nth Fibonacci number.
# assume 0, 1, 1, 2, 3 .. etc

def fib_rec(n)
  return "invalid input" if n <= 0
  base = [0, 1]
  return base[n - 1] if n <= 2

  fib_rec(n - 1) + fib_rec(n - 2)
end

# Write a method that returns all subsets of a set.

def rec_subsets(arr)
  return [ [] ] if arr.empty?
  last = rec_subsets(arr[0..-2])
  last + last.map { |subarr| subarr + [arr.last] }
end
