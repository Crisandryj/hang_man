player_guess = []
def display_guess(guessword,array)
  count = 0
  until count == guessword.length
  array.push('_')
  count +=1
  end
  p array  
end 


def guess_letter

end 

contents = File.readlines('google-10000-english-no-swears.txt')

mid_size_words = contents.select{|word| word.length.between?(5,12)}

#create array with rand word generated
#create length of guess based on size of guess word

guessword = mid_size_words[rand(0..8449)].chop.split('')

p guessword

display_guess(guessword,player_guess)




#let player guess letter
p "Guess Letter:"
letter = gets.chomp.downcase

# display guess

count = 0
p count

guessword.each_with_index do |l,index|  
  if l == letter
    player_guess[index] = l
  end 
end 

if !guessword.include?(letter)
  count +=1
end 


p player_guess
p count



#if letter doesn't exist in word, count count(3 and its over)
#if letter exist in word, display in new array

