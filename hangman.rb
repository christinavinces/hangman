require 'csv' 

class Game
  attr_accessor :word, :board  
  def initialize
  	@contents = CSV.open '5desk.txt'
  end  
  def initialize_board()	  
    @board = ""
    
    idx1 = 0
    while idx1 < @word.length
      @board = @board + "_ "
      idx1 += 1    
    end
    @board
  end  
  def generate_random
  	arr = Array.new
  	@contents.each {|i| arr.push(i)}
    arr.sample[0]
  end  
  def update_board(guess)		
    idx2 = 0
    while idx2 < @word.length
      if @word[idx2] == guess
        @board[2*idx2] = guess
      end
      idx2 += 1
    end		
    @board
  end  
  def play	
    @word = generate_random
    puts "Start : #{initialize_board()}"
    
    guess_count = 0
    
    while guess_count < 20
      puts "Guess number #{guess_count + 1}/20"
      puts "What letter do you guess?"
      guess = gets.chomp
      puts update_board(guess)
      guess_count += 1
    end
    puts @word
  end
end

g = Game.new
g.play


