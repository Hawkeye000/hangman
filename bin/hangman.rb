require_relative '../lib/hangman.rb'

@hangman = Hangman.new

loop do

  if @hangman.win?
    puts "You have won!"
    break
  end

  if @hangman.lose?
    puts "\nYou have been hanged!\n\n"
    break
  end
  
  print "#{@hangman.status}\n\n"
  print "#{@hangman.partial_word}\n\n"
  puts "Letters already guessed: " + @hangman.guesses.sort.join(", ") unless @hangman.guesses.empty?
  print "Guess a letter: "
  @hangman.guess(gets.chomp)

end

