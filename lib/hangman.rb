class Hangman

  COUNTER = 6
  DICTIONARY_PATH = "dictionary.txt"
  @@dictionary = File.readlines(DICTIONARY_PATH)

  def self.statuses
    @@statuses = []
    (1..6).each { |index| @@statuses << File.read("hangman_#{index}.txt") }
    @@statuses
  end

  def self.import(file_name)
    File.open(file_name) do 
      |f| Marshal.load(f)
    end
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
    @status = Hangman.statuses[@count]
  end

  def guess(char)
    # accepts only the first valid character of the input string
    char = char.chr.downcase
    if ("a".."z").cover?(char) && !@guesses.include?(char)
      @guesses << char
      @count += 1 unless @word_to_guess.include?(char)
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

  def win?
    true unless self.partial_word.include?("_")
  end

  def lose?
    true if self.status.nil?
  end

  def export(file_name)
    File.open(file_name, 'wb+') do |file|
      Marshal.dump(self, file)
    end
  end


end