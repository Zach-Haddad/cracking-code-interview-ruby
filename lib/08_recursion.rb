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

# Write a method to compute all permutations of a string.

def rec_permutations(string)
  return [''] if string.empty?

  (0...string.size).flat_map { |i|
    chr, rest = string[i], string[0...i] + string[i + 1..-1]
    rec_permutations(rest).map { |substr|
      chr + substr
    }
  }
end

# Imagine a robot sitting on the upper left hand corner of an NxN grid.
# The robot can only move in two directions: right and down.
# How many possible paths are there for the robot?
#

def num_paths(n, point = [0, 0])
  return 1 if point == [ n - 1, n - 1 ]
  return 0 if point.any? { |coord| coord >= n }

  up = point.dup
  down = point.dup

  up[1] += 1
  down[0] += 1

  num_paths(n, up) + num_paths(n, down)
end
