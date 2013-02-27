require 'factory_girl'

FactoryGirl.define do
  factory :game do
    name {rand(100000).to_s(32)}
  end
end