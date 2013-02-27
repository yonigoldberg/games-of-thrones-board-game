class DeckController < ApplicationController
  def view_top_card
    game_id = params[:game_id]
    deck_type_id = params[:deck_type_id]
    user_name = params[:user_name]
    place_top_card_at_buttom = params[:place_top_card_at_buttom] == 'true' ? true : false



    if (game_id.blank? || deck_type_id.blank? || user_name.blank?)
      render :json => "missing params"
      return
    end

    deck = Deck.where({:deck_type_id => deck_type_id, :game_id => game_id}).first

    card = deck.peek(user_name)
    if (place_top_card_at_buttom == true)
      deck.place_top_card_at_the_buttom
    end
    render :json => card
  end
end
