require 'byebug'

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @game_over = false
    @seq = []
  end

  def play  
   
    until @game_over
     take_turn
      system('clear')
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless @game_over
      round_success_message
    end 

  end


  def show_sequence
    add_random_color
      @seq.each do |color| 
        puts color
        sleep 1
        system('clear')
        sleep 1
      end 
  end


  def require_sequence
     puts "Please enter the first letter of the colors you saw in order!"
     @seq.each do |color| 
      user_guess = gets.chomp 

        if color[0] != user_guess
          @game_over = true 
          break 
        end 
     end 

      sleep 0.25
  end

  def add_random_color
      new_color = COLORS.sample
      seq.push(new_color)
  end

  def round_success_message
    puts "That was correct! Here is the next squence:"
    sleep 2 
  end


  def game_over_message
    puts "Game over! You made it #{@seq.length - 1} round(s)!"
  end

  def reset_game
    @seq = []
    @game_over = false
    play
  end
end



simon = Simon.new 

simon.play