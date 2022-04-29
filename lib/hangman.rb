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
    @filename
  end
  
  def savefile()
    p "Do you want to save file?"
    answer = gets.chomp
    if answer == 'y'
      p 'Filename?'
      @filename = gets.chomp
    File.open("saved_files/#{@filename}.txt",'w') {|f| f.write @player_guess,"\n", @guessword}
    else
      return  
    end 
  end 

  def openfile
    p "Do you want to open a saved file?"
    answer = gets.chomp
    if answer == 'y'
    p "Which file do you want to continue with?"
    view_saved_files
    @filename = gets.chomp
    file = File.open("saved_files/#{@filename}.txt","r")
    lines = file.readlines
    @guessword = lines[0].chop
    @player_guess = lines[1] 
    end 
  end 

  def view_saved_files
    Dir.glob('saved_files/*').each {|f| p f}
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
      return
    end 
  end 

  def play()
    generate_guess_display
    openfile
    p @guessword
    p @player_guess
    until @count == 3
    savefile()
    p "Guess Letter:"
    @letter = gets.chomp.downcase

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