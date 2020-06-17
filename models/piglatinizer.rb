require 'pry'
class PigLatinizer

  def initialize
    @original_input
  end

  def piglatinize_word(word)
    initial_cluster = word.split(/[aeiou]/).first
    if ['a','e','i','o','u','A','E','I','O','U'].include?(word[0])
      "#{word}way"
    else
      "#{word[(initial_cluster.length)..-1]}#{initial_cluster}ay"
    end
  end

  def split_sentence(sentence)
    sentence.split(' ')
  end

  def piglatinize(sentence)
    split_sentence(sentence).map do |word|
      piglatinize_word(word)
    end.join(' ')
  end

end
