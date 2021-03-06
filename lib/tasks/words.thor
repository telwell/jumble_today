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
    distinct_ordered = Word.select('ordered').group('ordered').having('count(*) = 1').collect(&:ordered)
    gallows = Word.count - distinct_ordered.length
    # Destroy words which AREN'T distinct (duplicates)
    Word.where.not(ordered: distinct_ordered).destroy_all
    puts "Destroyed #{gallows} words. #{Word.count} remaining"
  end


  desc "jumble", "Create a new Jumble to be used"
  def jumble
    words = Word.where(length: [5,6]).limit(4).order("RANDOM()")
    j = Jumble.new
    words.each do |word|
      j.words << word
    end
    j.save
  end
end
