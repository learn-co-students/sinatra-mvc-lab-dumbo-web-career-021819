require 'pry'
class PigLatinizer

  attr_accessor :text
  @@vowels = %w(a e i o u)
  @@alpha = ("a".."z").to_a
  @@consonants = @@alpha - @@vowels

  def piglatinize(text)
    fragmented_sentence = text.split
    new_sentence = fragmented_sentence.map do |word|
      fragmented_word = word.split("")
      if @@vowels.include?(fragmented_word[0].downcase)
        fragmented_word = fragmented_word.join + "way"
      else
        i = 0
        consonant_holder = [] 
        while i < fragmented_word.length
          if @@consonants.include?(fragmented_word[i].downcase)
            consonant = fragmented_word.shift
            consonant_holder << consonant
          else
            break
          end
        end
        fragmented_word = (fragmented_word + consonant_holder).join + "ay"
      end
      fragmented_word
    end
    new_sentence.join(" ")
  end
end