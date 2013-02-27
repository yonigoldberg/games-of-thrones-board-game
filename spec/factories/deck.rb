require 'factory_girl'

FactoryGirl.define do
  factory :deck do
    deck_type_id {rand(10000)}
    game
  end
end