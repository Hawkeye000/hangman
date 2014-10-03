require_relative '../lib/hangman.rb'

def make_wrong_guess(hangman)
  hangman.guess (('a'..'z').find { |char| !hangman.word_to_guess.include?(char) \
      && !hangman.guesses.include?(char) } )
end