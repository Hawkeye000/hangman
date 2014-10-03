require_relative '../lib/hangman.rb'

@hangman = Hangman.new

loop do
  print "#{@hangman.status}\n\n"
  print "#{@hangman.partial_word}\n\n"
  print "Guess a letter: "
  @hangman.guess(gets.chomp)
end

