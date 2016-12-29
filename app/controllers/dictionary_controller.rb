class DictionaryController < ApplicationController


  def index
    @words = Word.where(length: [5,6]).limit(4).order("RANDOM()")
  end


end
