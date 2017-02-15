text = ""
line_count = 0
File.open("text.txt").each do |line|
    line_count += 1 
    text << line
end
total_characters = text.length
total_characters_nospaces = text.gsub(/\s+/, '').length 
word_count = text.split.length
sentence_count = text.split(/\.|\?|!/).length 
puts "#{line_count} number of lines, #{total_characters} number of characters, 
      #{total_characters_nospaces} number of characters without spaces,#{word_count} total words
      #{sentence_count} total sentences" 
