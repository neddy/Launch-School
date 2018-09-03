def set_superior_moves
  self.superior_moves = Move::INFERIOR_MOVES.map do |mv, _|
                          superior_mvs = []
                          Move::INFERIOR_MOVES.each do |k, v|
                           superior_mvs << k if v.include?(mv)
                          end
                          [mv, superior_mvs]
                        end
  self.superior_moves = superior_moves.to_h
end


# class HumanMovesHistory
#   attr_accessor :value
#   def initialize(move_history)
#     set_human_history(move_history)
#     # @value = move_history.last_two_human_moves
#   end
#
#   def set_human_history(move_history)
#     previous_moves = move_history.human_moves.map(&:to_s)
#     outcome = move_history.winners.map do |winner|
#                 if winner == move_history.human.name
#                   'won'
#                 elsif winner == move_history.computer.name
#                   'lost'
#                 else
#                   'tie'
#                 end
#               end
#     @value = previous_moves.zip(outcome).reverse
#   end
#
#   def won_last_two?
#     return false if value.size <= 1
#     value[0][1] == 'won' && value[1][1] == 'won'
#   end
#
#   def won_last?
#     value[0][1] == 'won'
#   end
#
#   def lost_last?
#     value[0][1] == 'lost'
#   end
#
#   def tie_last?
#     value[0][1] == 'tie'
#   end
#
#   def last_move
#     value[0][0]
#   end
# end


# INFERIOR_MOVES = {
#     'rock' => ['scissors', 'lizard'],
#     'paper' => ['rock', 'spock'],
#     'scissors' => ['paper', 'lizard'],
#     'lizard' => ['spock', 'paper'],
#     'spock' => ['scissors', 'rock']
#   }
#
# SUPERIOR_MOVES = {
#   "rock"=>["paper", "spock"],
#   "paper"=>["scissors", "lizard"],
#   "scissors"=>["rock", "spock"],
#   "lizard"=>["rock", "scissors"],
#   "spock"=>["paper", "lizard"]
# }
# def counter_moves(expected_mvs)
#   counter_mvs_hsh = SUPERIOR_MOVES.select do |mv, _|
#                       expected_mvs[0] == mv || expected_mvs[1] == mv
#                     end
#   counter_mvs = counter_mvs_hsh.values.flatten.uniq
#   counter_mvs.reject do |mv|
#     expected_mvs.any? { |e_mv| INFERIOR_MOVES[e_mv].include?(mv) }
#   end
# end
#
# combos =  SUPERIOR_MOVES.keys.combination(2).to_a
#
# combos.each do |pair|
#   p counter_moves(pair)
# end

# p counter_moves(['lizard', 'scissors'])


# elsif middle == ''
  # puts left.rjust(WIDTH / 2) + right.ljust(WIDTH / 2)
