FactoryGirl.define do
  factory :link do
    url 'www.google.com'
    title 'Google'
  end

  factory :user do
    email 'julsfelic@example.com'
    password 'password'
    password_confirmation 'password'
  end
end
