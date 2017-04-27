require 'csv'
product_file = Rails.root.join('db', 'product_seeds.csv')
merchant_file = Rails.root.join('db', 'merchant_seeds.csv')

# 50.times do
#   merchant_email = Faker::Name.last_name + Faker::Number.number(2) + "@betsy.com"
#   username = Faker::Color.color_name + "_" + Faker::Hipster.word + Faker::Number.number(2)
#   oauth_uid = Faker::Number.number(5)
#   oauth_provider = "github"
#   Merchant.create!(merchant_name: Faker::Name.first_name, merchant_email: merchant_email, username: username, oauth_uid: oauth_uid, oauth_provider: oauth_provider)
# end

CSV.foreach(merchant_file, headers: true, header_converters: :symbol, converters: :all, skip_blanks: false) do |row|
  data = Hash[row.headers.zip(row.fields)]
  Merchant.create!(data)
end

CSV.foreach(product_file, headers: true, header_converters: :symbol, converters: :all, skip_blanks: false) do |row|
  data = Hash[row.headers.zip(row.fields)]
  Product.create!(data)
end
