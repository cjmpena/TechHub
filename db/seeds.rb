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
    Product.create!(
      name: product['title'],
      price: product['price'],
      description: product['description'],
    )
  end

  puts 'Seeding completed successfully!'
else
  puts "Error fetching data from the API. Response code: #{response.code}"
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?