def game(board_instance)
  board = board_instance


  # playing game - the player_turn method should loop until win_conditions returns true
  player_turn(board.current_player, board)




  # endgame
  # HOTFIX (CHANGE ASAP): will re-execute player_turn if game_status == "playing"
  if board.game_status == "playing"
    player_turn(board.current_player, board)
  else board.game_status
    win_message(board.game_status, board)
  end

  # replay

  # quit
  puts goodbye_message

end




# conditions: win, draw, cheat_code
def win_message(condition, board)
  if condition == "draw"
    puts
    puts "Stalemate. I think an AI might have something to say about this..."
  elsif condition == "cheat_code"
    puts
    puts "Aww, thanks! Okay, I declare you the winner, #{board.winner}. :)"
  elsif condition == "win"
    puts
    puts "Congratulations, #{board.winner}! You are the winner!"
  end
  replay_prompt
end


def welcome_message
  puts
  puts "Welcome to Isa's Tic Tac Toe game!"
  puts
  puts "This game was created to answer one question:"
  puts "Do I know enough Ruby to make Tic Tac Toe?"
  puts "Let's find out..."
  puts
  puts "(Press enter to continue)"
  puts
  gets.chomp
end


def replay_prompt
  puts
  puts "Would you like to play again? (y/n)"
  replay_input = gets.chomp.downcase
  if replay_input == "y"
    board = Board.new
    game(board)
  elsif replay_input == "n"
    goodbye_message
    exit
  else
    replay_prompt
  end
end


def goodbye_message
  puts
  puts "Thanks for playing! Goodbye! <3"
  puts
end
