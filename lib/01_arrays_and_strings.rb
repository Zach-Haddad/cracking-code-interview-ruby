# Implement an algorithm to determine if a string has all
# unique characters. What if you can not use additional data structures?

def uniq_chars(str)
  # O(n) with hashmap
  tally = Hash.new(0)
  str.each_char { |chr| tally[chr] += 1 }
  tally.none? { |_, v| v > 1 }
end

def uniq_chars_ii(str)
  # O(n) optimized
  letters = Hash.new(false)
  str.each_char do |chr|
    return false if letters[chr]
    letters[chr] = true
  end
  true
end

def uniq_chars_iii(str)
  # without additional data structure --> o(nlog(n)) with quicksort
  str.chars.sort.each_with_index do |chr, i|
    next if i == str.length - 1
    return false if chr == str[i + 1]
  end
  true
end

# Write code to reverse a C-Style String. (C-String means that
# “abcd” is represented as  five characters, including the null character.)

def reverse_str(str)
  # o(n) time, o(n) space where n is length of input str
  res = ""
  (str.length - 1).downto(0) do |i|
    res += str[i]
  end
  res
end

# Design an algorithm and write code to remove the duplicate characters
# in a string without using any additional buffer. NOTE: One or
# two additional variables are fine. An extra copy of the array is not.

def remove_dups(str)
  found = Hash.new(false)
  str.each_char { |chr| found[chr] = true }
  found.select { |_, v| v }.keys.join
end

# Write a method to decide if two strings are anagrams or not.

def anagrams?(str1, str2)
  make_tally(str1) == make_tally(str2)
end

def make_tally(str)
  tally = Hash.new(0)
  str.each_char { |chr| tally[chr] += 1 }
  tally
end

# Write a method to replace all spaces in a string with ‘%20’.

def replace_spaces(str)
  str.gsub(/[ ]/, '%20')
end
