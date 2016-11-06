FactoryGirl.define do
  factory :user do
    name "zhuzhu"
    email SecureRandom.uuid+'@126.com'
    password "123456"
    
  end
end
