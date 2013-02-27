GamesOfThronesBoardGame::Application.routes.draw do
  root :to => "game#index"

  get "/game/new_game" => "game#new_game"
  get "/game/:name" => "game#show"
  get "/deck/view_top_card" => "deck#view_top_card"
end
