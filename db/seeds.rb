# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.new
u.email = "615760433@qq.com"

u.password = "dmy067"
u.password_confirmation = "dmy067"

u.is_admin = true
u.save

products = ["真皮沙发", "办公椅子", "办公桌"]

products_description = ["头层牛皮，柔软透气有弹性", "保护好您的腰颈", "提高办公效率"]

products_prices = [2999, 598, 1590]

create_jobs = for i in 1..3 do
Product.create!([title: products[i - 1], description: products_description[i - 1], quantity: rand(0..10), price: products_prices[i - 1]])
end
puts "3 products created."
