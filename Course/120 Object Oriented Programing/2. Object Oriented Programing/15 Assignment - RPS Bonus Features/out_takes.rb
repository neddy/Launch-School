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
