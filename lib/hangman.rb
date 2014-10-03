class Hangman

  COUNTER = 6
  DICTIONARY_PATH = "dictionary.txt"
  @@dictionary = File.readlines(DICTIONARY_PATH)

  def self.statuses
    @@statuses = []
    (1..6).each { |index| @@statuses << File.read("hangman_#{index}.txt") }
    @@statuses
  end

  def initialize(word_length = (5..12))
    # word_length is passed as a range which picks how long the word can be
    possible_words = []
    @@dictionary.each { |word| possible_words << word if word_length.include?(word.length) }
    @word_to_guess = possible_words[rand(0...possible_words.length)].chomp.downcase
    @count = 0
    @guesses = []
    @status = Hangman.statuses[0]
  end

  def word_to_guess
    @word_to_guess
  end

  def guesses
    @guesses
  end

  def count 
    @count
  end

  def status
    @status
  end

  def guess(char)
    char = char.chr.downcase
    if ("a".."z").cover?(char)
      @guesses << char
      @count = @guesses.length
    end
  end

  def partial_word
    feedback = Array.new(@word_to_guess.length, "_")
    guesses.each do |guess| 
      correct_pos = (0...@word_to_guess.length).find_all { |i| @word_to_guess[i, 1] == guess }
      correct_pos.each { |i| feedback[i] = guess }
    end
    feedback.join(" ")
  end

end