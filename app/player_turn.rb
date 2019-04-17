def player_turn(player, board, turn_type="")

  # print current board and prompt input
  if turn_type == "invalid_entry"
    input_string = board.print_board("invalid_entry")
  elsif turn_type == "already_taken"
    input_string = board.print_board("already_taken")
  elsif board.turn_number == 1
    input_string = board.print_board("first_turn")
  else
    input_string = board.print_board("new_turn")
  end


  valid_input_array = board.board_markers.keys

  # help
  if input_string.downcase == "h" || input_string.downcase == "help" || input_string.downcase == "readme"
    readme(board)
    player_turn(player, board)

  # quit
elsif input_string.downcase == "q" || input_string.downcase == "quit" || input_string.downcase == "exit"
    exit

  # empty string/nil/enter will repeat turn
  elsif input_string == ""
    player_turn(player,board)

  # easter egg
  elsif input_string.downcase.include?("isa") && input_string.downcase.include?("you look cute today")
    board.winner = board.all_players[board.current_player][:display_name]
    board.game_status = "cheat_code"



  # correct input - matches a key in the board.board_markers Hash
  elsif valid_input_array.include?(input_string.downcase.to_sym) || valid_input_array.include?(input_string.downcase.reverse.to_sym)

    # format input => output symbol
    if valid_input_array.include?(input_string.downcase.to_sym)
      input_symbol = input_string.downcase.to_sym
    elsif valid_input_array.include?(input_string.downcase.reverse.to_sym)
      input_symbol = input_string.downcase.reverse.to_sym
    end


    if check_markers(input_symbol, board) == "move_successful"
      place_marker(input_symbol, player, board)
    elsif check_markers(input_symbol, board) == "already_taken"
      player_turn(player, board, "already_taken")
    end




  # all other inputs - invalid entry, reprint board & ask for new input
  else
    player_turn(player, board, "invalid_entry")
  end


end



def check_markers(input_symbol, board)
  if board.board_markers[input_symbol] == " "
    "move_successful"
  elsif board.board_markers[input_symbol] == board.all_players["player1"][:marker] || board.board_markers[input_symbol] == board.all_players["player2"][:marker]
    "already_taken"
  else
    error_message("player_turn.rb - check_markers(input_symbol, board) method - unexpected value in board.board_markers")
  end
end




def place_marker(input_symbol, player, board)
  board.board_markers[input_symbol] = board.all_players[player][:marker]
  board.all_players[player][:moves] << input_symbol
  win_conditions(board)

  #if win_conditions is NOT met, CONTINUE game:
  board.turn_number += 1
  if board.turn_number.odd?
    board.current_player = "player1"
  elsif board.turn_number.even?
    board.current_player = "player2"
  end
  player_turn(board.current_player, board)
end
