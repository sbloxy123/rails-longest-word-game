class GamesController < ApplicationController

  def new
    @letters = []
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @letters = params[:letters]
    @word = params[:word]
    @result = api_check(@word)
    @announce = ""
  end

  def api_check(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    word_sterialised = URI.open(url).read
    @dictionary_word = JSON.parse(word_sterialised)
    return @dictionary_word["found"]
  end

  def letter_check
    @word.split('').each do |letter|
      if @letters.include?(letter)
        @letter_check
      end
    end
  end

  def announce(result)
    @result && letter_check ? @announce = "you win" : @announce = "you lose"
  end

end
