require 'rspec'
require '01_arrays_and_strings.rb'

describe "Arrays and Strings" do
  describe "1.1 Uniq Chars" do
    it "returns false for a string with duplicate characters" do
      expect(uniq_chars("apple")).to be false
    end

    it "returns true for a string without duplicate characters" do
      expect(uniq_chars("man")).to be true
    end
  end

  describe "1.2 Reverse str" do
    it "returns the input string in reverse" do
      expect(reverse_str("apple")).to eql("elppa")
    end
  end

  describe "1.3 Remove dups" do
    it "removes duplicated letters in a string if they exist" do
      expect(remove_dups("apple")).to eql("aple")
      expect(remove_dups("aaabbb")).to eql("ab")
      expect(remove_dups("ababab")).to eql("ab")
      expect(remove_dups("ab")).to eql("ab")
    end
  end
end
