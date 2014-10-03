class Hangman

  COUNTER = 6
  DICTIONARY_PATH = "dictionary.txt"
  @@dictionary = File.readlines(DICTIONARY_PATH)

  def initialize(word_length = (5..12))
    # word_length is passed as a range which picks how long the word can be
    possible_words = []
    @@dictionary.each { |word| possible_words << word if word_length.include?(word.length) }
    @word_to_guess = possible_words[rand(0...possible_words.length)]
    @count = 0
    @guesses = []
  end

  def word_to_guess
    @word_to_guess
  end

  def guess
  end

  def print 
  end
end