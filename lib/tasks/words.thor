require "thor"

#Include Rails environment
require File.expand_path('config/environment.rb')

# Need to require my custom String methods
require File.expand_path("lib/ext/string.rb")

class Words < Thor
  desc "import FILENAME", "Import words from a given text file in /lib/data"
  def import(file)
		word_list = "lib/data/#{file}"
    puts "Importing #{word_list}"
		if File.file?(word_list)
			File.open(word_list, "r") do |f|
			  f.each_line do |line|
					word = line.chomp
			    w = Word.new
					w.text = word
					w.ordered = word.alphabetize
					w.length = word.length
					w.jumble = word.jumble
					w.save!
			  end
			end
		else
			puts "File does not exist"
		end
  end


	desc "remove_dupes", "Remove duplicate entries that have the same ordered letters"
	def remove_dupes
		# Get DISTINCT ordered words
		ids = Word.group(:ordered).collect(&:id)
		gallows = Word.count - ids.length
		# Destroy words which AREN'T distinct (duplicates)
		Word.where.not(id: ids).destroy_all
		puts "Destroyed #{gallows} words. #{Word.count} remaining"
	end
end
