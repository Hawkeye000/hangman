require_relative '../lib/hangman.rb'

@hangman = Hangman.new

puts @hangman.word_to_guess
puts @hangman.status
