class Board
  attr_accessor :game_status, :turn_number, :current_player, :winner, :all_players, :board_markers

  @@game_number = 1
  @@winners = []
  @@win_streak = 0


  def initialize
    # game statuses: playing, win, draw, cheat_code
    @game_status = "playing"
    @turn_number = 1
    @current_player = "player1"
    @winner = ""

    @all_players = {
      "player1" => {
        display_name: "Player 1",
        marker: "X"[0],
        moves: []
      },
      "player2" => {
        display_name: "Player 2",
        marker: "O"[0],
        moves: []
      }
    }

    @board_markers = {
      a1: " ",
      a2: " ",
      a3: " ",
      b1: " ",
      b2: " ",
      b3: " ",
      c1: " ",
      c2: " ",
      c3: " "
    }
  end



  # turn types: first_turn, new_turn, invalid_entry, already_taken
  def print_board(turn_type)
    puts
    puts
    puts "   1   2   3 "
    puts "a  #{self.board_markers[:a1]} | #{self.board_markers[:a2]} | #{self.board_markers[:a3]} "
    puts "  ___|___|___"
    puts "b  #{self.board_markers[:b1]} | #{self.board_markers[:b2]} | #{self.board_markers[:b3]} "
    puts "  ___|___|___"
    puts "c  #{self.board_markers[:c1]} | #{self.board_markers[:c2]} | #{self.board_markers[:c3]} "
    puts "     |   |   "
    puts

    if turn_type == "invalid_entry"
      puts "Invalid entry. Please try again."
      puts
    elsif turn_type == "already_taken"
      puts "Move already taken. Please try again."
      puts
    elsif turn_type == "new_turn"
      puts "Move successful!"
      puts
    end

    puts "#{self.all_players[self.current_player][:display_name]}'s turn. (Your marker is \"#{self.all_players[self.current_player][:marker]}\".)"
    puts "Please enter a move (or enter \"h\" for help): "
    input_string = gets.chomp
  end










end
