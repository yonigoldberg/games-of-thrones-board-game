GamesOfThronesBoardGame::Application.routes.draw do
  root :to => "game#index"

  get "/game/new_game" => "game#new_game"
  get "/game/:name" => "game#show"
  get "/deck/view_top_card" => "deck#view_top_card"
    get "/deck/place_top_card_at_buttom" => "deck#place_top_card_at_buttom"
end
