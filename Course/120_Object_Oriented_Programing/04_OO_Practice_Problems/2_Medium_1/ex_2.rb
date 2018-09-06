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

#answer
# An `attr_writer` is missing for `@quantity`.
# We could eihter add `attr_writer :quantity`
# or we could remove `:quantity` from the `attr_reader` definition, and then add `attr_accessor :quantity` on the next line.
# If we added a `attr_writer` or `attr_accessor` we would need to prefix `quantity` wiht `self`
# We could also access the instance variable directly to update the quantity
