FactoryBot.define do
  factory :student do
    first_name { 'John' }
    last_name  { 'Doe' }
    email { "My@String.com" }
    age { 123456 }
  end
end 