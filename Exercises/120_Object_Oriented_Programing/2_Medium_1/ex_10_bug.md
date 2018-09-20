```ruby
  def straight?
    return false if @rank_count.any? { |_, count| count > 1 }

    @cards.min.value == @cards.max.value - 4 || ace_low_straight? # New || condition
  end

  def ace_low_straight? # New method
    return false if @rank_count.any? { |_, count| count > 1 }
    
    sorted_cards = @cards.sort
    if sorted_cards[0].rank == 2 && sorted_cards[4].rank == 'Ace'
      sorted_cards[0].value == sorted_cards[3].value - 3
    else
      false
    end
  end
```
