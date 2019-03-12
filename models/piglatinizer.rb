

class PigLatinizer

  def piglatinize(string)
    each_word = string.split(" ")
    each_word.map! do |word|
      translate(word)
    end
    word = each_word.join(" ")
    return word
  end

  def translate(word)
    word_by_letter = word.scan(/./)
    if (word_by_letter[0].downcase == "a" || word_by_letter[0].downcase == "e" ||
    word_by_letter[0].downcase == "i" || word_by_letter[0].downcase == "o" ||
    word_by_letter[0].downcase == "u")
      word_by_letter.push("way")
      word = word_by_letter.join("")
    else
      until word_by_letter[0].downcase == "a" || word_by_letter[0].downcase == "e" ||
        word_by_letter[0].downcase ==  "i" ||
        word_by_letter[0].downcase ==  "o" || word_by_letter[0].downcase ==  "u"

        first_consonants = []
        first_consonants << word_by_letter.shift
        word_by_letter << first_consonants
        word_by_letter.flatten!
        word = word_by_letter.join("")
      end
      word = word + "ay"
    end
    return word
  end

  # sumn_split == "something".split("")
  # => ["s", "o", "m", "e", "t", "h", "i", "n", "g"]

  # pseudocode:
  # 1. group together the first elements that are all vowels
  # ex: "If the first and second elements are both vowels, group them together"
  # q: "Can you do that when you split the method?"
  ######################################################

  # replaced_vowels = sumn_split.map do |letter|
  #   letter.gsub(/[aeiou]/, '')
  # end
  # => ["s", "", "m", "", "t", "h", "", "n", "g"]

  # replaced_vowels = sumn_split.map do |letter|
  #   letter.gsub(/[bcdfghjklmnpqrstvwxyz]/, '')
  # end
  # => ["", "o", "", "e", "", "", "i", "", ""]



end
