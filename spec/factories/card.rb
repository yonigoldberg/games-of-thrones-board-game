require 'factory_girl'

FactoryGirl.define do
  factory :card do
    deck_type_id {rand(10000)}
    name {rand(100000).to_s(32)}
  end
end