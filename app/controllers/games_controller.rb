class GamesController < ApplicationController
  def new
    @letters = Array('A'..'Z').sample(10)
  end

  def score
    @word = (params[:word] || "").upcase
    @letters = params[:letters].split
    if can_form_word?(@word, @letters)
      @resultat = "Sorry,le mot ne peut pas être créé à partir de la grille d’origine."


    elsif valid_word_in_english?(@word)
      @resultat = `Le mot #{@word} est valide d’après la grille, mais ce n’est pas un mot anglais valide.`

    else
      @resultat = `Le mot #{@word} est valide d’après la grille et est un mot anglais valide.`
    end
    raise
  end

  private

  def valid_word_in_english?(word)
    url = "https://dictionary.lewagon.com/:word"
  end

  def can_form_word?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end
end
