# loadable readme for when 'h' or 'help' is entered for input_string


def readme(board)
  puts
  puts "h, help, readme   -   display list of commands and game credits"
  puts "q, quit, exit     -   quit game"
  puts
  puts "valid moves:"
  puts "enter coordinates to place your marker (#{board.all_players["player1"][:marker]} or #{board.all_players["player2"][:marker]})."
  puts "use any combination of ♪ a/b/c ♫ and ♪ 1/2/3 ♫"
  puts "(examples: a1, 2b, C3 - any order and capitalization work!)"
  puts
  # easter egg: cheat_code is "Isa, you look cute today!" => automatic win!
  puts "Also, it couldn't hurt to tell the creator that they look cute today! <3"
  puts
  puts "Created by: Isa Levine, February 22 - 24 2019"
  puts "Current version: 0.1.1, March 3 2019"
  puts
  puts "Press enter to return to game."
  input = gets.chomp
end
