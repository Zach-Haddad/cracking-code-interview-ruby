# 1.1
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

# 1.2
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

# 1.3
# Design an algorithm and write code to remove the duplicate characters
# in a string without using any additional buffer. NOTE: One or
# two additional variables are fine. An extra copy of the array is not.

def remove_dups(str)
  found = Hash.new(false)
  str.each_char { |chr| found[chr] = true }
  found.select { |_, v| v }.keys.join
end

# 1.4
# Write a method to decide if two strings are anagrams or not.

def anagrams?(str1, str2)
  make_tally(str1) == make_tally(str2)
end

def make_tally(str)
  tally = Hash.new(0)
  str.each_char { |chr| tally[chr] += 1 }
  tally
end

# 1.5
# Write a method to replace all spaces in a string with ‘%20’.

def replace_spaces(str)
  str.gsub(/[ ]/, '%20')
end

# 1.7
# Write an algorithm such that if an element
# in an MxN matrix is 0, its entire row and column is set to 0.

def set_zeroes(matrix)
  marked_rows = []
  marked_cols = []

  matrix.each_with_index do |row_arr, row_idx|
    row_arr.each_with_index do |cell, col_idx|
      if cell == 0
        marked_rows << row_idx unless marked_rows.include?(row_idx)
        marked_cols << col_idx unless marked_cols.include?(col_idx)
      end
    end
  end

  matrix.each_with_index do |row_arr, row_idx|
    row_arr.each_with_index do |_, col_idx|
      if marked_rows.include?(row_idx) || marked_cols.include?(col_idx)
        matrix[row_idx][col_idx] = 0
      end
    end
  end

  matrix
end

# 1.8
# Assume you have a method isSubstring which checks if one word is a
# substring of another. Given two strings, s1 and s2, write code to
# check if s2 is a rotation of s1 using only one call to isSubstring
# (i.e., “waterbottle” is a rotation of “erbottlewat”).

def is_rotation?(str1, str2)
  return false if str1.length != str2.length
  (str1*2).include?(str2)
end
