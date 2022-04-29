 require './lib/player.rb'
 
 class Hangman
    @@contents = File.readlines('google-10000-english-no-swears.txt')
    @@mid_size_words = @@contents.select{|word| word.length.between?(5,12)}
    @@count = 0 

    attr_accessor :guessword

    def initialize(player_class)
      @player = player_class.new('Jon',self)
      @Letter
      @player_guess = []
      @guessword = @@mid_size_words[rand(0..8449)].chop.split('')
    end 
  

  def display_guess()
    count = 0
    until count == @guessword.length
    @player_guess.push('_')
    count +=1
    end
    p @player_guess  
  end 

  def gameover?(count)
    if count == 3
      p "GAMEOVER"
    end 
  end 

  def hangman()
    p "Guess Letter:"
    @letter = gets.chomp.downcase
    @guessword.each_with_index do |l,index|  
      if l == @letter
        @player_guess[index] = l
        display_guess(@guessword,@player_guess)
      end 
    end 
  end 

end 


game = Hangman.new(Player)
p game.guessword