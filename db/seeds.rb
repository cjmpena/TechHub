require 'net/http'
require 'json'

url = URI.parse('https://fakestoreapi.com/products')
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = (url.scheme == 'https')

request = Net::HTTP::Get.new(url.request_uri)

response = http.request(request)

if response.code == '200'
  products_data = JSON.parse(response.body)

  products_data.each do |product|
    category_name = product['category']
    category = Category.find_or_create_by(name: category_name)

    Product.create!(
      name: product['title'],
      price: product['price'],
      description: product['description'],
      category: category
    )
  end

  puts 'Seeding completed successfully!'
else
  puts "Error fetching data from the API. Response code: #{response.code}"
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Category.create(name: 'Electronics')
Category.create(name: 'Clothing')
Category.create(name: 'Jewelry')

# Rails Console input
product = Product.find(1)
new_category = Category.find(2)
product.category = new_category
product.save

product_ids = [1, 2, 3]  
new_category_id = 4 
Product.where(id: product_ids).update_all(category_id: new_category_id)
