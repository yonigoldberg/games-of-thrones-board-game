class DeckController < ApplicationController
  def view_top_card
    game_id = params[:game_id]
    deck_type_id = params[:deck_type_id]
    user_name = params[:user_name]

    if (game_id.blank? || deck_type_id.blank? || user_name.blank?)
      render :json => "missing params"
      return
    end
    deck = Deck.where({:deck_type_id => deck_type_id, :game_id => game_id}).first
    card = deck.peek(user_name)
    render :json => card
  end

  def place_top_card_at_buttom
    game_id = params[:game_id]
    deck_type_id = params[:deck_type_id]
    if (game_id.blank? || deck_type_id.blank?)
      render :nothing => false
    else
      deck = Deck.where({:deck_type_id => deck_type_id, :game_id => game_id}).first
      deck.place_top_card_at_the_buttom
      render :nothing => true
    end
  end
end
