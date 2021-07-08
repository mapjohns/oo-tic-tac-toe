class TicTacToe
    attr_accessor :t_count, :input, :index
    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8],[6,4,2]]
    def initialize
        @board = [" "," "," "," "," "," "," "," "," "]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      end

      def input_to_index(user_input)
        user_input.to_i - 1
      end

      def move(index, current_player="X")
        @board[index] = current_player
      end

      def position_taken?(location)
        @board[location] != " " && @board[location] != ""
      end

      def valid_move?(index)
        index.between?(0,8) && !self.position_taken?(index)
      end

      def turn_count
        @t_count = 0
        @board.each do |board_item|
            if board_item != " "
                @t_count += 1
            end
        end
        #puts "It is turn #{t_count}"
        return @t_count
     end
    
     def current_player
        if turn_count % 2 == 0
            return "X"
        else
            return "O"
        end 
    end

    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      val = valid_move?(index)
      if val == false
          puts "Please try another number"
          turn
      else
          move(index,current_player)
          display_board
      end
  end
      
  def won?
    end_result = []
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
     
      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3
     
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        end_result.append("win!")
        return win_combination # return the win_combination indexes that won.
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        end_result.append("win!")
        return win_combination
      end
    end
    if end_result[0] != "win!"
      return false
    end 
  end

  def full?
    if @board.include?(" ") == true
      return false
    else 
      return true
    end
  end

  def draw?
    if won? == false && full? == true #Board not won, but full
        return true
    else 
        return false
    end
  end 

  def over?
    if draw? == true || won? != false || full? == true
      return true
    else
      return false
    end
  end 
  
  def winner
    win_comb = []
    win_comb = won?
    if win_comb == false
      return nil
    elsif @board[win_comb[0]] == 'X'
      return 'X'
    elsif @board[win_comb[0]] == 'O'
      return 'O'
    end
  end 
  
  def play
    until over? == true
        turn
    end
    if winner == 'X'
        puts "Congratulations X!"
    elsif winner == 'O'
        puts "Congratulations O!"
    else
        puts "Cat's Game!"
    end
  end

end