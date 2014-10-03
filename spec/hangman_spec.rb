require_relative '../lib/hangman.rb'

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

    before { @hangman.guess('a') }
    before { @hangman.guess('B') }

    it "should only add single characters to guesses" do
      expect(@hangman.guesses).to include('a')
    end

    it "should not care about case and store in lowercase" do
      expect(@hangman.guesses).to include('b')
    end

    it "@count should equal the number of guesses" do
      expect(@hangman.count).to eq(@hangman.guesses.length)
    end
  end

  describe "providing feedback" do

    before {"aeiouy".each_char { |x| @hangman.guess(x) } }

    it "should contain at least one vowel" do
      expect("aeiouy".split(//).any? { |char| @hangman.partial_word.include?(char) }).to be_true
    end
  end
  
end