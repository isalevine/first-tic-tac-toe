def win_conditions(board_instance)
  board = board_instance

  player_moves_array = board.all_players[board.current_player][:moves]
  move_check_array = player_moves_array.join("").split("")


  def diagonal_check(player_moves_array)
    if player_moves_array.include?("a1".to_sym) && player_moves_array.include?("b2".to_sym) && player_moves_array.include?("c3".to_sym)
      3
    elsif player_moves_array.include?("c1".to_sym) && player_moves_array.include?("b2".to_sym) && player_moves_array.include?("a3".to_sym)
      3
    else
      0
    end
  end


  victory_conditions = [
    move_check_array.count("a"),
    move_check_array.count("b"),
    move_check_array.count("c"),
    move_check_array.count("1"),
    move_check_array.count("2"),
    move_check_array.count("3"),
  ]

  victory_diagonal = diagonal_check(player_moves_array)

  if victory_conditions.include?(3) || victory_diagonal == 3
    board.winner = board.all_players[board.current_player][:display_name]
    win_message("win", board)
  end

end
