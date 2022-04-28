contents = File.readlines('google-10000-english-no-swears.txt')

mid_size_words = contents.select{|word| word.length.between?(5,12)}

p mid_size_words[rand(0..8449)]

#create array with rand word generated
#create length of guess based on size of guess word





#let player guess word
#if letter doesn't exist in word, count strikes(3 and its over)
#if letter exist in word, display in new array

