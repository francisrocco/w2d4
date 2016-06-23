require 'byebug'
def first_anagram(string)

  return [string] if string.length == 1
  string_arr = string.chars
  anagrams = []
  letter = string_arr.shift
  sub_anagrams = first_anagram(string[1..-1])
  string.length.times do |insertion_point|
    sub_anagrams.each do |sub_anagram|
      temp_anagram = sub_anagram.dup
      anagrams << temp_anagram.insert(insertion_point, letter)
    end

  end
  anagrams
end

def anagram?(first_string, second_string)
  anagrams = first_anagram(first_string)
  anagrams.each do |word|
    return true if word == second_string
  end
  false
end


def faster_anagram?(first_string, second_string)

  second_string_chars = second_string.chars
  first_string.chars.each do |letter|
    if second_string_chars.include? letter
      second_string_chars.delete_at(second_string_chars.find_index(letter))
    else
      return false
    end
  end
  second_string_chars.empty?
end


def fastest_anagram?(first_string, second_string) # NOTE is actually faster

  first_string.downcase.chars.sort == second_string.downcase.chars.sort

end


def hash_anagram?(first_string, second_string)
  first_hash = Hash.new(0)
  first_string.chars.each do |letter|
    first_hash[letter] += 1
    # first_hash[letter]    s = first_hash[letter] + 1
  end

  second_hash = Hash.new {0}
  second_string.chars.each do |letter|
    second_hash[letter] += 1
  end

  first_hash == second_hash

end
