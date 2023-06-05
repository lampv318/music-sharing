FactoryBot.define do
  factory :user do
    name { 'username' }
    sequence :email do |n|
      "example+#{n}@gmail.com"
    end
    password { 'password' }
    password_confirmation { 'password' }
  end
end
