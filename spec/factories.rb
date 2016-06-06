FactoryGirl.define do
  factory :link do
    url "MyString"
    title "MyString"
    read false
    user nil
  end
  factory :user do
    email "user@user.com"
    password "password"
  end
end
