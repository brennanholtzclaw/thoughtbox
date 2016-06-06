FactoryGirl.define do

  sequence :url, %w(1 2 3 4 5 6).cycle do |number|
    "http://www.example.com/#{number}"
  end

  sequence :title, %w(1 2 3 4 5 6).cycle do |number|
    "Link Title #{number}"
  end

  factory :link do
    url
    title
    read false
    user nil
  end

  factory :user do
    email "user@user.com"
    password "password"

    factory :user_with_links do
      links { create_list(:link, 3) }
    end
  end
end
