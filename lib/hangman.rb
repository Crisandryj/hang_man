def display_guess(guessword)
    player_guess = []
    count = 0
    until count == guessword.length
    player_guess.push('_')
    count +=1
    end
    p player_guess  
end 


contents = File.readlines('google-10000-english-no-swears.txt')

mid_size_words = contents.select{|word| word.length.between?(5,12)}

#create array with rand word generated
#create length of guess based on size of guess word

guessword = mid_size_words[rand(0..8449)].chop.split('')

p guessword

display_guess(guessword)

#let player guess word
#if letter doesn't exist in word, count strikes(3 and its over)
#if letter exist in word, display in new array

