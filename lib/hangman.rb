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
      @count = 0
    end
  

  def generate_guess_display()
    count = 0
    until count == @guessword.length
    @player_guess.push('_')
    count +=1
    end
  end 

  def gameover?(count)
    if @count == 3
      p "GAMEOVER"
    end 
  end 

  def play()
    generate_guess_display

    until @count == 3
    p "Guess Letter:"
    @letter = gets.chomp.downcase

    p @guessword

    if !@guessword.include?(@letter)
      @count +=1
    end 

    @guessword.each_with_index do |l,index|  
      if l == @letter
        @player_guess[index] = l
      else 
        gameover?(@count)
      end 
    end 
    p @player_guess
    end 

  end 

end 


game = Hangman.new(Player)
game.play