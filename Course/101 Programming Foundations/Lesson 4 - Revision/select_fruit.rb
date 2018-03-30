def select_fruit(hsh)
  fruit = {}
  hsh.each do |k, v|
    if v == 'Fruit'
      fruit[k] = v
    end
  end
    fruit
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

fruit = select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

puts fruit.inspect
