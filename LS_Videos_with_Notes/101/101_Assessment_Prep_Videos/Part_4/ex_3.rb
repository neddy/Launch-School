# Understand The Problem
# Query array of hashes with set criteria and return subset of array mathcing search query.
# Query has two parts:
# 1. Min and Max price
# 2. Search string to be used to search product names

# Data
# I: hash
# O: array of hashes
# A: Array of hashes

# Algorithm
# Load products constant to array
#
# select elements with name matching search query string using sub string matching, ignoring case
#
# Select elements with price above minimum
#
# Select elements wiht price below max


PRODUCTS = [
  { name: "Thinkpad x210", price: 220 },
  { name: "Thinkpad x220", price: 250 },
  { name: "Thinkpad x250", price: 979 },
  { name: "Thinkpad x230", price: 300 },
  { name: "Thinkpad x230", price: 330 },
  { name: "Thinkpad x230", price: 350 },
  { name: "Thinkpad x240", price: 700 },
  { name: "Macbook Leopard", price: 300 },
  { name: "Macbook Air", price: 700 },
  { name: "Macbook Pro", price: 600 },
  { name: "Macbook", price: 1449 },
  { name: "Dell Latitude", price: 200 },
  { name: "Dell Latitude", price: 650 },
  { name: "Dell Inspiron", price: 300 },
  { name: "Dell Inspiron", price: 450 },

]

query = {
  price_min: 240,
  price_max: 280,
  q: "thinkpad"
}

query2 = {
  price_min: 240,
  price_max: 450,
  q: "dell"
}

require 'pry'

def search(query)
  selected_products = PRODUCTS.select do |product|
    product[:name].downcase.match?(query[:q])
  end
  selected_products.select! do |product|
    product[:price] >= query[:price_min]
  end
  selected_products.select! do |product|
    product[:price] <= query[:price_max]
  end
  selected_products
end



p search(query)
# [ { name: "Thinkpad x220", price: 250 } ]

p search(query2)
# [ { name: "Dell Inspiron", price: 300},
#   { name: "Dell Inspiron", price: 450}]
