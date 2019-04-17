# Different types of error messages to give human-readable feedback on
# crashes at different points of play(game), such as during the phases:
# #welcome, #playing game, #endgame, #replay,




# crash_points: endgame,
def error_message(crash_point)
  puts
  puts "An error has occurred at #{crash_point}. Exiting program."
  puts
  exit
end
