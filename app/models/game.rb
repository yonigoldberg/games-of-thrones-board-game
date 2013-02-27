class Game < ActiveRecord::Base
  attr_accessible :name
  has_many :decks
  validates :name, :uniqueness => true, :presence => true
  after_save :initialize_decks

  def wilderling_deck
    decks.find {|x| x.deck_type_id == DeckType::WILDERLINGS}
  end

  private
  def initialize_decks
    decks.create(:game => self, :deck_type_id => DeckType::WILDERLINGS)
  end

end
