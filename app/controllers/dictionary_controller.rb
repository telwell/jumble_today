class DictionaryController < ApplicationController


	def index
		# http://www.setgetgo.com/randomword/ thank you!!
		# http://developer.wordnik.com/docs.html#!/words/getRandomWords_get_3
		@words = HTTParty.get("http://api.wordnik.com:80/v4/words.json/randomWords?hasDictionaryDef=true&excludePartOfSpeech=idiom,proper-noun-plural,proper-noun-posessive&minCorpusCount=600&maxCorpusCount=-1&minDictionaryCount=100&minLength=5&maxLength=5&limit=5&api_key=#{Rails.application.secrets.wordnik_key}")
	end


end
