require_relative '../lib/hangman.rb'
require 'yaml' 


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
  print "Guess a letter (or enter 'save' or 'load'): "

  input = gets.chomp

  if input == 'save'
    puts "Enter file name:"
    file_name = 'save/' + gets.chomp
    @hangman.export(file_name)
    break
  elsif input == 'load'
    puts "Enter file name:"
    file_name = 'save/' + gets.chomp 
    @hangman = Hangman.import(file_name)
  else
    @hangman.guess(input)
  end

end

