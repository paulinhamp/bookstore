FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    category
    publisher
    authors { [create(:author)] }
  end
end