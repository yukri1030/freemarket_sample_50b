FactoryBot.define do 
  factory :user do 
      nickname {"hiro"}
      sequence(:email) { |n| "hiro#{n}@example.com"}
      password {"password"}
      password_confirmation {"password"}
      
  end 
end 
