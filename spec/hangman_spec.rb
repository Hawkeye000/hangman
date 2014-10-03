require_relative '../lib/hangman.rb'
require_relative 'spec_helper.rb'

describe Hangman do 

  before { @hangman = Hangman.new(5..12) }

  it { should respond_to :word_to_guess }
  it { should respond_to :guess }
  it { should respond_to :guesses }
  it { should respond_to :count }
  it { should respond_to :status }
  it { should respond_to :partial_word}

  it "should pick a word bounded by the range" do
    expect((5..12).cover?(@hangman.word_to_guess.length)).to be_true
  end

  describe "guessing" do

    it "should only add single characters to guesses" do
      @hangman.guess('abc')
      expect(@hangman.guesses).to include('a')
    end

    it "should not add the other characters" do
      @hangman.guess('abc')
      expect(@hangman.guesses).to_not include('b')
    end

    it "should not care about case and store in lowercase" do
      @hangman.guess('B')
      expect(@hangman.guesses).to include('b')
    end

    it "should increment the count if the letter is not in the word" do
      make_wrong_guess(@hangman)
      expect(@hangman.count).to eq(1)
    end
  end

  describe "providing feedback" do

    it "should contain the letter after making a valid guess" do
      @hangman.guess(@hangman.word_to_guess[0])
      expect(@hangman.partial_word.include?(@hangman.word_to_guess[0])).to be_true
    end

    it "should know when the player has won" do
      @hangman.word_to_guess.each_char { |char| @hangman.guess(char) }
      expect(@hangman.win?).to be_true
    end

    it "should display a status based on the wrong letters" do
      2.times do 
        make_wrong_guess(@hangman)
      end
      expect(@hangman.status).to eq(Hangman.statuses[@hangman.count])
    end

    it "should know the player lost after 6 wrong guesses" do
      6.times do
        make_wrong_guess(@hangman)
      end
      expect(@hangman.lose?).to be_true
    end

  end
  
end