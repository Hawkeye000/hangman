require_relative '../lib/hangman.rb'

describe Hangman do 

  before { @hangman = Hangman.new(5..12) }

  it { should respond_to :word_to_guess }
  it { should respond_to :guess }
  it { should respond_to :print }

  it "should pick a word bounded by the range" do
    expect((5..12).cover?(@hangman.word_to_guess.length)).to be_true
  end
  
end