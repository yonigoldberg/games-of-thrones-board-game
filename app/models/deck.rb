class Deck < ActiveRecord::Base
  attr_accessible :cards_order, :deck_type_id, :last_viewed_at, :last_viewed_by, :game
  belongs_to :game
  serialize :cards_order
  validates_presence_of :game, :deck_type_id
  after_save :populate_card_order


  def peek(peeked_by)
    unless (self.cards_order.blank?)
      card = self.cards.find {|x| x.id == self.cards_order.first}
      update_attributes(:last_viewed_by => peeked_by, :last_viewed_at => DateTime.now)
      card
    end
  end

  def cards
    Card.where({:deck_type_id => self.deck_type_id}).all
  end

  def place_top_card_at_the_buttom
    puts ("NO WAY!")
     update_attributes(:cards_order => cards_order.rotate)
  end

  private
  def populate_card_order
    if (!self.cards.blank? && cards_order.blank?)
      card_ids = Array.new
      self.cards.each do |card|
        card_ids << card.id
      end
      card_ids = card_ids.shuffle
      update_attributes(:cards_order => card_ids)
    end
  end

end
