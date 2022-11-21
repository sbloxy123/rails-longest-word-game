class GamesController < ApplicationController

  def new
    @letters = []
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @letters = params[:letters]
    @word = params[:word]
    @result = api_check(@word)
    @check = letter_check(@word)

  end

  def api_check(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    word_sterialised = URI.open(url).read
    @dictionary_word = JSON.parse(word_sterialised)
    @dictionary_word['found']
  end

  def letter_check(word)
    word.split('').each do |letter|
      @letters.include?(letter) ? @ran = true : @ran = false
    end
    @ran
  end

  @win = ""

  if @result && @check == true
    @win = 'you win'
  else
    @win = 'you lose'
  end

end
