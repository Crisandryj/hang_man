contents = File.readlines('google-10000-english-no-swears.txt')

mid_size_words = contents.select{|word| word.length.between?(5,12)}

p mid_size_words[rand(0..8449)]