class DictionaryController < ApplicationController
	

  def index
    # Get the most recent Jumble
    @jumble = Jumble.last
  end


	def check_word
		word = Word.find(params[:wordId])
		if word.text == params[:guess]
			render json: { 'isMatch': true, 'eventId': params[:eventId] }, status: 200
		else
			render json: { 'isMatch': false }, status: 200
		end
	end


	def check_victory
		check = params[:check]
		jumble = Jumble.find(params[:jumbleId])
		words = jumble.words.pluck(:text)
		respond_to do |format|
	    if check.sort == words.sort
				current_user.jumbles << jumble if user_signed_in?
				@type = "success"
				@msg = "You got it!"
				@msg += " You've solved #{current_user.jumbles.count} jumbles!" if user_signed_in?
				format.js {
					render :template => "dictionary/victory.js.erb",
					:layout => false
				}
	    else
				@type = "error"
				@msg = "Oops! There was an error. Refresh and unjumble again."
				format.js {
					render :template => "dictionary/victory.js.erb",
					:layout => false
				}
	    end
	  end
	end


end
