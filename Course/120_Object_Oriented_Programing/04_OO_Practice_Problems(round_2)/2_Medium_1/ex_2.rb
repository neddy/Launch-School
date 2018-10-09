# ex_2.rb
# Alyssa created the following code to keep track of items for a shopping cart application she's writing:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

# Alan looked at the code and spotted a mistake. "This will fail when update_quantity is called", he says.
#
# Can you spot the mistake and how to address it?

#ANS

# This will fail as the local variable `quantity` is being referenced on line 11, rather than the instance variable `@quantity`. There are two ways to fix this, we could add `@` to the start of line 11, to turn `quantity` into `@quantity`. Or we could move `:quantity` from the `attr_reader` line to a new line begining with `attr_accessor`, thus creating a setter method for `quantity`, we would then need to reference the setter method with `self` prefixed to `quantity`.
