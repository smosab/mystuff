# Focus on hashes, arrays, math and select
require 'pry'

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
  { name: "Dell Inspiron", price: 450 }
]

query = {
  price_min: 240,
  price_max: 280,
  q: "thinkpad"
}

query2 = {
  price_min: 300,
  price_max: 450,
  q: 'dell'
}


#  def pull_product(query)

#    PRODUCTS.select do |h|
#      h[:price].between?(query[:price_min],query[:price_max]) &&
#      h[:name].downcase.include?(query[:q])
#    end

#  end

# p pull_product(query)
# p pull_product(query2)

PRODUCTS[0][:name][" "]

PRODUCTS[0][:name][0..7]

PRODUCTS[0][:name].scan(/\w+/)[0]

PRODUCTS.select do |h|
  h[:Make] = h[:name].scan(/\w+/)[0]
end

bm.each_key do |k|
  bm[k] = "some value"
end


# binding.pry