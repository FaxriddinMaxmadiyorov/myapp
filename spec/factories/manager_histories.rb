FactoryBot.define do
  factory :manager_history do
    joining_date { "2022-07-12" }
    total_experience { "MyString" }
    manager { nil }
  end
end
