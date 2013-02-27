class Card < ActiveRecord::Base
  attr_accessible :deck_type_id, :name
  validates_presence_of :deck_type_id, :name
end
