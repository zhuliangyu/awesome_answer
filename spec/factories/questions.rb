FactoryGirl.define do

  factory :question do
    title Faker::Lorem.sentence
    body Faker::Lorem.sentence
    # association :user,factory: :user
    
  end
end
