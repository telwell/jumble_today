class DictionaryController < ApplicationController


  def index
    @words = Word.where(date: Date.today)
  end


	def check_word
		word = Word.find(params[:wordId])
		if word.text == params[:guess]
			render json: { 'isMatch': true, 'eventId': params[:eventId] }, status: 200
		else
			render json: { 'isMatch': false }, status: 200
		end
	end


end
